#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""「禁止用空串表示 null」的**最后一道**:真调接口,数回包里有多少个 `"字段": ""`。

## 为什么它是最后一道

前面两道都是静态的,各有各的盲区:

    gen_nullq.py   库里有 NULL 行、而 Go 是裸类型  → 读路径把 NULL 摊平
    gen_emptyq.py  Go 是指针的列、库里却有空串     → 写入侧从来没写过 NULL

**两道都绿,客户端照样能收到空串。** 2026-09-03 实测过一次:
`hi_ai_plugin_version` 129 行里 108 行 logo 是 NULL、**零个空串**(gen_emptyq 绿),
Go 那侧老老实实是 `*string`(gen_nullq 绿),
而 `MarketDirectory.SearchListings` 回包里 92 个 `"logo": ""` ——
真因是 SQL 里一句 `COALESCE(b.logo,'')`,presence 在**库和 Go 之间**就没了,
静态审计看的是两头,看不见中间这一手。

判据只能是**客户端真正收到什么**。

## 判据

grpc-gateway 用默认 marshaler(`EmitUnpopulated=false`)—— absent 的字段
**根本不会出现在 JSON 里**。所以回包里出现 `"x": ""`,只可能是服务端显式发了空串,
也就是「有一个值,它是空的」。那正是这轮要消灭的东西。

## ⚠️ 空回包不算通过

`{"agents": []}` 里当然没有空串 —— 它什么也没验到。
每条都数**扫过多少个字符串叶子**,为 0 就报「没验」,不报 ✓。
(不这么写的话,一个权限不对、或这个账号名下本来就没数据的接口,
会永远显示绿色,而它一次都没跑过。)

## 路由从哪来

**从 `http/*.yaml` 自动列举**,不手写清单 —— 手写的那份第一版八条里七条路由写错,
回的是 `code 5`,被当成"接口没成功"跳过,于是一片绿而整条链没验到。
自动列举还能跟着 proto 长:新加的 List/Get 接口自动进来。

用法:  CLUB_TOKEN=... CLUB_DID=... python3 empty_in_resp.py
"""
import json
import os
import re
import subprocess
import sys

HTTP_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "http")
CAC = os.environ.get("CAC", "").split()
# 三个网关的 token 不通用:club 的那把在 hi.club / hi.ai 都认(同一套 JWT),
# 但 hi-did 自成一套 —— 拿 club token 去调它会得到「ExtendToken不存在」,
# 那是**没验**,不是通过。DID_TOKEN 由 .66 的 /tmp/didtok 生成,没给就整片报没验。
TOKENS = {
    "club": os.environ.get("CLUB_TOKEN") or "",
    "ai": os.environ.get("AI_TOKEN") or os.environ.get("CLUB_TOKEN") or "",
    "did": os.environ.get("DID_TOKEN") or "",
}
APIS = {
    "club": os.environ.get("CLUB_API", "https://hiclub-http-api.hi.lan/api/v1"),
    "ai": os.environ.get("AI_API", "https://hiai-http-api.hi.lan/api/v1"),
    "did": os.environ.get("DID_API", "https://hidid-http-api.hi.lan/api/v1"),
}
G, R, Y, N = "\033[32m", "\033[31m", "\033[33m", "\033[0m"

# 白名单:确实允许为空串的键。**每加一条都要写清为什么** ——
# 不写理由的白名单,下一轮没人敢删,而它会一直盖着一个真问题。
ALLOW = set()

# 只读接口的判据:方法名。写接口一律不碰(这条脚本会被反复跑)。
READ_RE = re.compile(r"\.(List|Get|Search|Query|Detail|Latest)\w*$")

# 需要额外参数的路由:body 模板,`{agent}` 会被替换成调用者名下的一台机器人。
# 填不出来的就让它自然 skip,别硬造 —— 造出来的 id 查不到,同样什么都没验到。
BODIES = {
    # club / ai
    "api_key/list": '{"agent":"{agent}","pagination":{"page":1,"limit":50}}',
    "plugin/list": '{"agent":"{agent}","pagination":{"page":1,"limit":50}}',
    "plugin/list_versions": '{"agent":"{agent}","uuid":"{plugin}"}',
    "plugin/get": '{"agent":"{agent}","uuid":"{plugin}"}',
    "agent/get": '{"agent":"{agent}"}',
    "agent/get_usage": '{"agent":"{agent}"}',
    "permission/list": '{"agents":["{agent}"]}',
    "permission/get": '{"agent":"{agent}"}',
    "permission/list_by_type": '{"agent":"{agent}","type":1}',
    "training/list_files": '{"agent":"{agent}","pagination":{"page":1,"limit":50}}',
    "market_directory/list_agent_listings": '{"agent":"{agent}","pagination":{"page":1,"limit":50}}',
    "market_directory/get_listing": '{"uuid":"{listing}"}',
    "chat/get_history": '{"agent":"{agent}","pagination":{"page":1,"limit":20}}',
    "agent_bench/list": '{"agent":"{agent}","pagination":{"page":1,"limit":50}}',
    "agent_bench/list_history": '{"agent":"{agent}","pagination":{"page":1,"limit":20}}',
    "market/list_payments": '{"order":"","pagination":{"page":1,"limit":50}}',
    # GET 路由:值是 **query string**(gateway 把 GET 的参数放 URL 上,没有 body)
    "get:agent/get": 'agent={agent}',
    "get:plugin/get": 'agent={agent}&uuid={plugin}',
    "get:release/latest": 'product=hiclub&platform=android',
    "get:trade/get": 'uuid={trade}',
    # did
    "assets/list": '{"currency":"cny","pagination":{"page":1,"limit":50}}',
    "assets/get": '{"did":"{did}"}',
    "release/latest": '{"product":"hiclub","platform":"android"}',
    "merchant/list_users": '{"pagination":{"page":1,"limit":50}}',
}
DEFAULT_POST = '{"pagination":{"page":1,"limit":50}}'


def routes():
    """(api, 方法, 路径尾, selector) —— 从 yaml 现列,不手写。"""
    out = []
    for f, api in (("club.yaml", "club"), ("ai.yaml", "ai"), ("did.yaml", "did")):
        p = os.path.join(HTTP_DIR, f)
        if not os.path.isfile(p):
            print(f"  {Y}—{N} {api}: 没验(找不到 {f},要在 hi-proto 仓里跑)")
            continue
        txt = open(p, encoding="utf-8").read()
        for sel, verb, path in re.findall(r"- selector: ([\w.]+)\n\s+(post|get): (\S+)", txt):
            if READ_RE.search(sel):
                out.append((api, verb, path.replace("/api/v1/", ""), sel))
    return out


def call(api, verb, tail, body):
    url = APIS[api] + "/" + tail
    cmd = ["curl", "-s", "-m", "30"] + CAC + ["-X", verb.upper(), url,
           "-H", "Content-Type: application/json", "-H", "Authorization: Bearer " + TOKENS[api]]
    if verb == "post":
        cmd += ["-d", body]
    try:
        return subprocess.run(cmd, capture_output=True, text=True, timeout=45).stdout
    except subprocess.TimeoutExpired:
        return ""


def scan(o, path=""):
    """回 (空串键列表, 扫过的字符串叶子数)。"""
    bad, seen = [], 0
    if isinstance(o, dict):
        for k, v in o.items():
            if isinstance(v, str):
                seen += 1
                if v == "" and k not in ALLOW:
                    bad.append((path + "." + k).lstrip("."))
            else:
                b, s = scan(v, path + "." + k)
                bad += b
                seen += s
    elif isinstance(o, list):
        for i, v in enumerate(o):
            b, s = scan(v, path + "[%d]" % i)
            bad += b
            seen += s
    return bad, seen


def main():
    if not TOKENS["club"]:
        sys.exit("需要 CLUB_TOKEN(.66 的 /tmp/tokgen 生成;hi.club 与 hi.ai 都认它)")
    rs = routes()
    print(f"══════ 读路径回包:不许出现 \"字段\": \"\" ══════")
    print(f"  从 http/*.yaml 列出 {len(rs)} 条只读路由\n")

    # 占位符**从线上现取**,不硬造 —— 造出来的 id 查不到,同样什么都没验到,
    # 而且会以「记录不存在」的样子被当成"接口没成功"跳过,看不出是夹具的问题。
    ph = {"did": os.environ.get("CLUB_DID", "")}

    def pick(api, route, body, *path):
        try:
            d = json.loads(call(api, "post", route, body))
            for k in path:
                d = d[k] if not isinstance(k, int) else d[k]
            return d
        except Exception:
            return ""

    ph["agent"] = pick("club", "agent/list", '{"pagination":{"page":1,"limit":1}}',
                       "data", "agents", 0, "base", "did")
    # 🔴 **拿不到就自己造一个。**
    #
    # 原来是"这个账号名下没有机器人 → 那二十几条全部跳过"。于是覆盖面**取决于
    # 拿到的是哪个测试账号** —— 同一个脚本,换个 token 就从 26 条掉到 10 条,
    # 而两次都显示"0 失败"。**跳过不是通过**,但一堆跳过同样会让人以为验过了。
    #
    # 建一个软件助手是免费且幂等的(重复跑只是多几台 smk- 开头的),
    # 比"等着某个账号碰巧有数据"可靠得多。
    if not ph["agent"]:
        ph["agent"] = pick("club", "agent/create_assistant",
                           '{"name":"smk-emptyprobe"}', "data", "base", "did")
        if ph["agent"]:
            print("  夹具:这个账号名下没有机器人,现建了一台 smk-emptyprobe")
    if ph.get("agent"):
        ph["plugin"] = pick("club", "plugin/list",
                            '{"agent":"%s","pagination":{"page":1,"limit":1}}' % ph["agent"],
                            "data", "list", 0, "uuid")
        # 插件壳同理:建一个空壳就够让 Plugin.Get / ListVersions 有东西可查。
        # (不发版本 —— 那要传包,而这条脚本只验读路径。)
        if not ph["plugin"]:
            ph["plugin"] = pick("club", "plugin/create_shell",
                                '{"agent":"%s","name":"smk-emptyprobe"}' % ph["agent"],
                                "data", "uuid")
    try:
        d = json.loads(call("club", "post", "market_directory/search_listings",
                            '{"pagination":{"page":1,"limit":1}}'))
        ph["listing"] = d["data"]["list"][0]["uuid"]
    except Exception:
        pass
    print("  夹具:" + ", ".join(f"{k}={v[:16]}…" for k, v in sorted(ph.items()) if v) or "  夹具:一个都没取到")
    print()

    ok = bad = skip = blank = 0
    fails, blanks, skips = [], [], []
    for api, verb, tail, sel in sorted(rs):
        if not TOKENS[api]:
            skip += 1
            skips.append(f"{api}:{sel} —— 没给 {api.upper()}_TOKEN,整片没验")
            continue
        tmpl = BODIES.get(("get:" + tail) if verb == "get" else tail)
        if tmpl:
            need = [k for k in ("agent", "plugin", "listing", "did", "trade") if "{%s}" % k in tmpl]
            missing = [k for k in need if not ph.get(k)]
            if missing:
                skip += 1
                skips.append(f"{api}:{sel} —— 夹具取不到 {'/'.join(missing)},没验")
                continue
            body = tmpl
            for k in need:
                body = body.replace("{%s}" % k, ph[k])
            if verb == "get":
                tail, body = tail + "?" + body, ""
        else:
            if verb == "get":
                body = ""
            else:
                body = DEFAULT_POST
        raw = call(api, verb, tail, body)
        try:
            d = json.loads(raw)
        except Exception:
            skip += 1
            skips.append(f"{api}:{sel} —— 回包不是 JSON:{raw[:80]!r}")
            continue
        if d.get("code") != 0:
            skip += 1
            skips.append(f"{api}:{sel} —— code {d.get('code')}: {str(d.get('message'))[:70]}")
            continue
        b, seen = scan(d.get("data"))
        if b:
            bad += 1
            fails.append(f"{api}:{sel} —— {len(b)} 个:" + " ".join(sorted(set(b))[:8]))
        elif seen == 0:
            blank += 1
            blanks.append(f"{api}:{sel} —— 回包里一个字符串字段都没有")
        else:
            ok += 1

    for f in fails:
        print(f"  {R}✗{N} {f}")
    for b in blanks:
        print(f"  {Y}—{N} 没验(空回包):{b}")
    for s in skips:
        print(f"  {Y}—{N} 没验:{s}")
    print(f"\n  {G}✓{N} {ok} 条真的扫到了字段且没有空串")
    print(f"结果:通过 {G}{ok}{N},失败 {R}{bad}{N},空回包 {Y}{blank}{N},跳过 {Y}{skip}{N}")
    sys.exit(1 if bad else 0)


main()
