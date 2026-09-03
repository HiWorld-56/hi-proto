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
    # ⚠️ 带分页的 req 一定要给 pagination —— `buf.validate` 标了 required,
    #    不给会得到 `field Pagination is required`,而那会被算成"接口没成功"跳过,
    #    也就是**这条路由根本没验到**,却不显示为失败。
    "plugin/list_versions": '{"agent":"{agent}","uuid":"{plugin}","pagination":{"page":1,"limit":20}}',
    "plugin/get": '{"agent":"{agent}","uuid":"{plugin}"}',
    "training/get_file": '{"agent":"{agent}","uuid":"{plugin}"}',
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
    """回 (空串位置列表, 扫过的字符串叶子数)。

    🔴 **字符串可能直接是数组的元素**,不一定挂在某个键下面。
    proto 里 `repeated string` 一大堆(`models` / `langs` / `list` / `tags` / dids …),
    它们在 JSON 里长这样:

        {"models": ["gpt-4.1", "ministral-3"]}

    第一版只在 dict 分支里数字符串,数组分支直接把元素递归下去 ——
    而递归进去的是个 `str`,两个 isinstance 都不匹配,于是**什么都没数到**。
    后果有两个,第二个才要命:

      ① `Model.ListLlms` 这类回包被误报成"空回包、没验",而它明明有数据;
      ② **`repeated string` 里的空串永远发现不了** —— `{"tags": ["", "x"]}`
         一路绿灯。而那正是这条脚本要抓的东西。

    (2026-09-03 发现:31 条"空回包"里有 6 条是这么来的,不是账号没数据。)
    """
    bad, seen = [], 0
    if isinstance(o, str):
        # 走到这儿说明它是数组的元素(dict 的值在下面那支里就地处理了)。
        # 位置用 path 本身,已经带着 `[i]` 下标。
        seen += 1
        if o == "" and path.rsplit(".", 1)[-1].split("[")[0] not in ALLOW:
            bad.append(path.lstrip("."))
    elif isinstance(o, dict):
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
    made_agent = False
    if not ph["agent"]:
        ph["agent"] = pick("club", "agent/create_assistant",
                           '{"name":"smk-emptyprobe"}', "data", "base", "did")
        if ph["agent"]:
            made_agent = True   # ⚠️ 只删**自己建的**,别动这个账号原有的机器人
            print("  夹具:这个账号名下没有机器人,现建了一台 smk-emptyprobe(跑完收走)")
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
        # apikey:`ApiKey.List` 空着就等于没验。建一把是免费的。
        call("club", "post", "api_key/create", '{"agent":"%s"}' % ph["agent"])
        # 挂牌:`Market.ListMyListings` / `MarketDirectory.ListAgentListings` 两条
        # 都要有自己的挂牌才出数据 —— 而**市场那条读路径正是 92 个空串出过的地方**
        # (PluginDisplay 把 logo/summary 摊平那次)。这两条不能一直"没验"。
        #
        # ⚠️ **空壳挂不了牌**:服务端会说「这个插件还没有激活版本(空壳),不能挂牌」。
        #    所以得先发一版。用 lua 包是因为它**发版即就绪**,不用等交叉编译。
        #
        # ⚠️ 草稿(status=1)就够:`ListMyListings` 出让方自己看,草稿/挂牌中/隐藏都出
        #    (唯独不出已下架)。不上架就不会进公开搜索,也就不会打扰别人。
        pkg = os.environ.get("PKG", "")
        if not pkg:
            try:
                pkg = subprocess.run(
                    [sys.executable, os.path.join(os.path.dirname(os.path.abspath(__file__)),
                                                  "build_luapkg.py")],
                    capture_output=True, text=True, timeout=120,
                    env={**os.environ, "MINIO_HOST": os.environ.get("MINIO_HOST", "192.168.1.65:9000")},
                ).stdout.strip().splitlines()[-1]
            except Exception:
                pkg = ""
        if ph.get("plugin") and pkg.startswith("https://"):
            call("club", "post", "plugin/create_version",
                 '{"agent":"%s","version":{"uuid":"%s","version":"1.0.0","url":"%s"}}'
                 % (ph["agent"], ph["plugin"], pkg))
            ph["listing_mine"] = pick("club", "market/create_listing",
                                      '{"agent":"%s","plugin_uuid":"%s","settle_mode":1}'
                                      % (ph["agent"], ph["plugin"]),
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

    # ── 清理 ────────────────────────────────────────────────────────────────
    #
    # 🔴 **自己造的夹具要自己收走。** 这个脚本原来一条清理都没有,
    #    每跑一次就在开发环境留一个 smk-emptyprobe 机器人 + 一个插件壳 + 一个挂牌。
    #    2026-09-03 清出来三个,全是它留的 —— 而它每次都报"0 失败"。
    #
    # 顺序有依赖:挂牌不下架就删不掉壳,壳不删就删不掉机器人。
    if made_agent and ph.get("agent"):
        if ph.get("listing_mine"):
            call("club", "post", "market/set_listing_status",
                 '{"uuid":"%s","status":4}' % ph["listing_mine"])
        if ph.get("plugin"):
            call("club", "post", "plugin/delete_shell",
                 '{"agent":"%s","uuid":"%s"}' % (ph["agent"], ph["plugin"]))
        r = call("club", "post", "agent/delete", '{"agent":"%s"}' % ph["agent"])
        try:
            done = json.loads(r).get("code") == 0
        except Exception:
            done = False
        print(f"  {G}✓{N} 清理:收走了自己造的机器人 smk-emptyprobe" if done
              else f"  {Y}—{N} 清理没做干净(下次跑会多一个 smk-emptyprobe):{r[:120]}")

    for f in fails:
        print(f"  {R}✗{N} {f}")
    # 空回包按**原因**归类。平铺 22 行没法行动 ——
    # 而这些原因是三类完全不同的东西:有的这辈子也覆盖不到(结构性),
    # 有的只要换个跑法就能覆盖(接着别的 smoke 跑),有的得专门造夹具。
    if blanks:
        why = {
            "① hi.ai 自己那一面:club 用户 token 在那边什么都不拥有(结构性,换夹具也没用)": [],
            "② 要资金/交易流水才有数据 —— **接在 smoke-market.sh 后面、用它的卖家 token 跑**就能覆盖": [],
            "③ 要商户身份": [],
            "④ 要聊天记录 / 训练文件 / 用量": [],
            "⑤ 与时机有关(此刻没人在线 / 这个账号链上没资产)": [],
            "⑥ 其它": [],
        }
        k = list(why)
        for b in blanks:
            n = b.split(" ——")[0]
            if n.startswith("ai:"):
                why[k[0]].append(n)
            elif any(x in n for x in ("Trade.", "Market.ListTransactions", "Market.ListReceivedRequests", "Ledger.")):
                why[k[1]].append(n)
            elif "Merchant" in n:
                why[k[2]].append(n)
            elif any(x in n for x in ("Chat.GetHistory", "Training.", "GetUsage", "AgentBench")):
                why[k[3]].append(n)
            elif any(x in n for x in ("ListOnline", "Assets.")):
                why[k[4]].append(n)
            else:
                why[k[5]].append(n)
        print(f"  {Y}—{N} 没验(空回包):接口回了 code 0,但**回包里一个字符串字段都没有**,")
        print(f"       也就是这一条什么都没查到。按原因分:")
        for reason, items in why.items():
            if items:
                print(f"       {reason}")
                for i in items:
                    print(f"           {i}")
    for s in skips:
        print(f"  {Y}—{N} 没验:{s}")
    print(f"\n  {G}✓{N} {ok} 条真的扫到了字段且没有空串")
    print(f"结果:通过 {G}{ok}{N},失败 {R}{bad}{N},空回包 {Y}{blank}{N},跳过 {Y}{skip}{N}")
    print(f"       ——「空回包」与「跳过」都是**没验**,不是通过。"
          f"今天挖到的两个真 bug 都出在**有数据**的路由上,")
    print(f"         所以没验的那些正是同类 bug 还可能藏着的地方。")
    sys.exit(1 if bad else 0)


main()
