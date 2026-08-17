#!/usr/bin/env python3
"""hiclub-web 的路由与字段核对。

## 为什么单独有这么一个东西

hi-proto 的消费方里,**只有 hiclub-web 是手写 HTTP 客户端** ——
Go / Rust / Dart 都由 CI 从 proto 生成,proto 一改,下游编译期就炸。
web 那边是人肉 `postRequest('/api/v1/xxx', { a, b })`,于是:

  · **路由改名** → 404。还算看得见(虽然要跑到那个页面才看得见);
  · **字段改名** → 路由还在、请求照发、字段静默变空。
    这一类**探测路由根本发现不了** —— 2026-08-16 实测:路由维度只有 5 处过期,
    字段维度一大片(`bot_did`/`file_ids`/`id` → `agent`/`uuids`/`uuid`),
    而且同一个仓里 `memory` 页早改了、`train` 页没改,并存了很久没人发现。

所以这个脚本把这几件事都查:
  1. web 里出现的 `/api/v1/...` 字面量,在**本工程连的那个服务**的 yaml 里存不存在;
  2. 路径存在、但在**别的服务**(连错网关 —— 网关只会回 code:5,前端看到的是一片空);
  3. 少了前导 `/` 的写法(能跑,但这类曾经整片逃过本检查);
  4. 调用点传的对象字面量,key 在对应请求消息里存不存在。

## 为什么要分服务(2026-08-17 加)

一个 web 工程只连一个网关,而 **70 条路径在 ai/club/did 里同名**。
原来三份 yaml 合成一张表查,两头都出错:
  · hidid-web 调 `agent/list` —— ai.yaml 里有,放过;而 hi-did 网关根本没有 agent
    这个 service,实测 code:5。hiai-web 的 `trade_manage/list` 同理(那在 club)。
  · hiai-web 的 `api_key/list` 被拿 **club 的**消息去比,报「传了 user」;
    真问题却是 hi.ai 的 ApiKey.List 收扁平 `hi.Pagination`、没有 agent 这一维。
服务由目录名(hiai-web / hiclub-web / hidid-web)或 `.env*` 里的 VUE_APP_URL 端口推断,
也可以 `--service=ai|club|did` 显式指定。认不出来会**明确说自己退回了合表查**。

## 只报不拦

与 check_impl 同理:正常工作流是先改 proto 再跟消费方,硬失败会卡死每次改名的第一次推送。
而且第 2 项用的是正则,天然有取不准的时候(拼接出来的 key、展开的变量),
**宁可漏报也不要误拦** —— 一个会误拦的检查,第一次误拦之后就会被人加 `|| true` 绕过去,
那它就彻底没用了。

用法:
    python3 codegen/check_web_routes.py <web 工程检出目录> [--service=ai|club|did] [--warn]
"""
import json
import os
import re
import subprocess
import sys
import tempfile

HIPROTO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# 路径字面量:'/api/v1/xxx/yyy'
# ⚠️ 前导 `/` 必须是**可选**的。axios 的 baseURL 会把 'api/v1/x' 和 '/api/v1/x' 拼成
#    同一个地址,两种写法都能跑;但原来的正则只认带斜杠的那种,于是不带斜杠的调用
#    **一条都查不到,检查还一直报绿**。2026-08-17 实测:hiai-web 有 5 条这么写的,
#    其中 plugin_endpoint/get|set 那组接口在三份 yaml 里压根不存在,一直没被发现。
#    统一按 /api/v1/... 归一后再去查表,并单独提示把斜杠补上(见 no_slash)。
PATH_RE = re.compile(r"""['"](/?api/v1/[a-zA-Z0-9_/]+)['"]""")
# 调用点:postRequest('/api/v1/x', { a: 1, 'b': 2, c })  —— 只吃**同一行**的对象字面量,
# 跨行的放过(见上面"宁可漏报")。
CALL_RE = re.compile(
    r"""(?:post|get|put|delete)Request\(\s*['"](/?api/v1/[a-zA-Z0-9_/]+)['"]\s*,\s*\{([^{}]*)\}""",
    re.IGNORECASE,
)
KEY_RE = re.compile(r"""['"]?([A-Za-z_][A-Za-z0-9_]*)['"]?\s*:""")
# api 层几乎都是 `export const foo = (data) => { return postRequest('/path', data) }` 透传,
# 真正的对象字面量在**调用点**(`foo({ bot_did: x })`)。只查 *Request( 的话,
# 这个仓里几乎一条都查不到 —— 检查会一直绿,而绿得毫无意义。所以再跟一跳。
# 响应侧:`row.settle_mode` / `record.expire_at` 这类读法。
# 网关吐的是 **camidCase**,snake_case 一律取到 undefined —— 而且**不报错**,
# 只是那一格显示成空/默认值。2026-08-16 实测:市场页整页(标题/结算/价格/状态)
# 和授权页都栽在这上面,而请求侧的字段核对一个都发现不了(那查的是发出去的 key)。
RESP_RE = re.compile(
    r"""\b(row|record|item|detail|d)\.([a-z][a-z0-9]*(?:_[a-z0-9]+)+)\b""")

EXPORT_RE = re.compile(
    r"""export\s+const\s+([A-Za-z_][A-Za-z0-9_]*)\s*=\s*\([^)]*\)\s*=>\s*\{?\s*(?:return\s+)?"""
    r"""(?:post|get|put|delete)Request\(\s*['"](/?api/v1/[a-zA-Z0-9_/]+)['"]""",
    re.IGNORECASE,
)


def norm(path):
    """'api/v1/x' 与 '/api/v1/x' 归一 —— axios 拼出来是同一个地址。"""
    return path if path.startswith("/") else "/" + path


# ── 一个 web 工程只连**一个**网关 ────────────────────────────────────────────
# 原来这里把 ai/club/did 三份 yaml 合成一张表查,而 **70 条路径跨服务同名**
# (agent/*、api_key/*、chat/*、plugin/*、training/*、merchant/list …)。
# 后果两头都有,2026-08-17 两头都踩到了:
#   · **漏报** —— hidid-web 调 agent/list,ai.yaml 里有 → 放过;
#     可 hi-did 网关根本没有 agent 这个 service,实测 code:5。
#     hiai-web 的 trade_manage/list 同理(那在 club)。
#   · **查错消息** —— hiai-web 的 api_key/list 被拿 **club 的** ListApiKeysReq 去比,
#     报「传了 user」;而真问题是 hi.ai 的 ApiKey.List 收的是扁平 hi.Pagination,
#     压根没有 agent 这一维。报出来的和真问题不是一回事。
# 所以必须先定"这个仓连哪个服务",再只拿那一份 yaml 查。
SERVICE_OF_DIR = {"hiai": "ai", "hiclub": "club", "hidid": "did", "hisrv": "did"}
# 兜底:从 .env* 的 VUE_APP_URL 认端口/域名。dev 端口见 hi-prj.md 的部署一节。
SERVICE_OF_HINT = [
    ("9535", "ai"), ("hiai", "ai"),
    ("9537", "club"), ("9536", "club"), ("hiclub", "club"),
    ("9533", "did"), ("9532", "did"), ("hidid", "did"),
]


def guess_service(web):
    """判定这个 web 工程连的是哪个服务:目录名优先,其次 .env 里的 VUE_APP_URL。"""
    base = os.path.basename(os.path.abspath(web)).lower()
    for key, svc in SERVICE_OF_DIR.items():
        if base.startswith(key):
            return svc, f"目录名 {base}"
    for fn in (".env.development", ".env.production", ".env"):
        p = os.path.join(web, fn)
        if not os.path.exists(p):
            continue
        text = open(p, encoding="utf-8", errors="ignore").read()
        m = re.search(r"VUE_APP_URL\s*=\s*['\"]([^'\"]*)['\"]", text)
        if not m or not m.group(1):
            continue
        url = m.group(1).lower()
        for hint, svc in SERVICE_OF_HINT:
            if hint in url:
                return svc, f"{fn} 里的 VUE_APP_URL={m.group(1)}"
    return None, None


def load_routes(service=None):
    """http/*.yaml → {path: (selector, service)}。不用 yaml 库,格式是我们自己写的,固定两行一条。

    service 非空时**只**收那一份(ai/club/did);为 None 时收全部,
    此时同名路径以先读到的为准 —— 那正是原来会查错消息的情形,调用方要负责说明。
    """
    routes = {}
    http_dir = os.path.join(HIPROTO, "http")
    for fn in sorted(os.listdir(http_dir)):
        if not fn.endswith(".yaml") or fn == "merged.yaml":
            continue
        svc = fn[:-len(".yaml")]
        if service and svc != service:
            continue
        sel = None
        for line in open(os.path.join(http_dir, fn), encoding="utf-8"):
            m = re.match(r"\s*-\s*selector:\s*(\S+)", line)
            if m:
                sel = m.group(1)
                continue
            m = re.match(r"\s*(get|post|put|delete):\s*(\S+)", line)
            if m and sel:
                routes.setdefault(m.group(2), (sel, svc))
    return routes


def load_request_fields():
    """selector(全限定 rpc) → 请求消息的字段名集合。

    走 descriptor set:那是**生成器自己看到的东西**,比再解析一遍 .proto 可靠。
    """
    # ⚠️ 让 buf **直接吐 JSON**(按扩展名判断格式),不要二进制 —— 二进制得靠
    #    protobuf 的 python 运行时去读,而那是个额外依赖:CI 机器上装没装不好说,
    #    这台 Mac 上还是 PEP 668 的托管环境,装不进去。一个检查脚本不该有这种前置。
    with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as f:
        tmp = f.name
    try:
        try:
            subprocess.run(
                ["buf", "build", "--as-file-descriptor-set", "--output", tmp],
                cwd=HIPROTO, check=True, capture_output=True,
            )
        except (FileNotFoundError, subprocess.CalledProcessError):
            # 非交互 shell 里 buf 常常不在 PATH(release.sh 自己会设)。
            # **说清楚跳过了哪半**,别让人以为"没报错=都查过了"。
            # buf 起不来 or proto 本身编不过(字段号撞了之类)——都不是本检查的事,
            # 但**必须说清楚跳过了哪半**,否则"没报错"会被当成"都查过了"。
            # 而且不能抛栈:release.sh 里它是 `|| true` 兜着的,抛栈只会在日志里刷一屏,
            # 把真正的失败原因(proto 编不过)挤到看不见的地方——这次就是这么绕了一圈。
            print("[check_web] buf 不可用或 proto 当前编不过,**跳过字段核对**(路由那半照查)")
            return {}, {}
        fds = json.load(open(tmp, encoding="utf-8"))
    finally:
        os.unlink(tmp)

    msg_fields = {}   # ".hi.club.XxxReq" -> {字段名}(同时收 name 与 jsonName)

    def walk(msgs, prefix):
        for m in msgs:
            full = f"{prefix}.{m['name']}"
            names = set()
            for fl in m.get("field", []):
                names.add(fl["name"])
                if fl.get("jsonName"):
                    names.add(fl["jsonName"])
            msg_fields[full] = names
            walk(m.get("nestedType", []), full)

    for f in fds.get("file", []):
        walk(f.get("messageType", []), "." + f.get("package", ""))

    rpc_req = {}
    for f in fds.get("file", []):
        for svc in f.get("service", []):
            for m in svc.get("method", []):
                rpc_req[f"{f['package']}.{svc['name']}.{m['name']}"] = m["inputType"]
    return rpc_req, msg_fields


def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    warn = "--warn" in sys.argv
    service = None
    for a in sys.argv[1:]:
        if a.startswith("--service="):
            service = a.split("=", 1)[1]
    if not args:
        print(__doc__)
        return 2
    web = args[0]
    src = os.path.join(web, "src")
    if not os.path.isdir(src):
        print(f"[check_web] 找不到 {src},跳过")
        return 0

    if service:
        why = "--service"
    else:
        service, why = guess_service(web)
    if service:
        print(f"[check_web] 按 **{service}** 服务核对(依据:{why})")
    else:
        # 认不出来就退回合表查,但**必须说出来** —— 合表查会漏掉「路径存在但在别的服务」
        # 这一类,而那正是最难自己发现的一类(网关回 code:5,前端只看到一片空)。
        print("[check_web] ⚠ 认不出这个仓连哪个服务,退回三份 yaml 合表查 —— "
              "**跨服务同名的路径查不出来**。用 --service=ai|club|did 指定。")

    routes = load_routes(service)
    # 另外两份留着,用来把「路径存在,但在别的服务」单独报出来 —— 只说"不存在"会让人
    # 以为是改名,实际是**连错了网关**,两者的修法完全不同。
    elsewhere = {}
    if service:
        for path, (sel, svc) in load_routes(None).items():
            if path not in routes:
                elsewhere[path] = (sel, svc)
    rpc_req, msg_fields = load_request_fields()

    # 先把 api 层的 函数名 → 路径 建出来(调用点在别的文件里)。
    api_fns = {}
    for root, _, files in os.walk(src):
        for fn in files:
            if fn.endswith((".js", ".ts")):
                t = open(os.path.join(root, fn), encoding="utf-8", errors="ignore").read()
                for name, path in EXPORT_RE.findall(t):
                    api_fns[name] = norm(path)

    dead, wrong_svc, no_slash, bad_fields, snake_reads = [], [], [], [], []
    for root, _, files in os.walk(src):
        for fn in files:
            if not fn.endswith((".js", ".vue", ".ts")):
                continue
            p = os.path.join(root, fn)
            rel = os.path.relpath(p, web)
            text = open(p, encoding="utf-8", errors="ignore").read()
            # 注释掉的调用不算 —— 否则"某某页面注释里留着的老写法"会一直报,
            # 而一个总在报已知无害内容的检查,很快就没人看了。
            code = "\n".join(
                "" if l.lstrip().startswith("//") else l for l in text.splitlines())
            # .vue 里注释掉的整块是 `<!-- ... -->`,跨行。不挖掉的话,
            # 一段留着的老写法会**永远**报同一条 —— 而总在报已知无害内容的检查,
            # 很快就没人看了(这次第一版就误报了一处注释里的 row.bind_apikey)。
            code = re.sub(r"<!--.*?-->", lambda m: "\n" * m.group(0).count("\n"),
                          code, flags=re.S)

            for i, line in enumerate(text.splitlines(), 1):
                if line.lstrip().startswith(("//", "*", "#")):
                    continue  # 注释里的路径不算
                for raw in PATH_RE.findall(line):
                    if not raw.startswith("/"):
                        no_slash.append((rel, i, raw))
                    path = norm(raw)
                    if path in routes:
                        continue
                    if path in elsewhere:
                        wrong_svc.append((rel, i, path, elsewhere[path][1]))
                    else:
                        dead.append((rel, i, path))

            for i, line in enumerate(code.splitlines(), 1):
                for var, prop in RESP_RE.findall(line):
                    snake_reads.append((rel, i, f"{var}.{prop}"))

            calls = [(norm(p_), b) for p_, b in CALL_RE.findall(code)]
            # 再跟一跳:api 函数名 → 路径,然后查 `fnName({...})` 的调用点。
            for fn_name, p_ in api_fns.items():
                for b in re.findall(
                        r"""\b%s\(\s*\{([^{}]*)\}""" % re.escape(fn_name), code):
                    calls.append((p_, b))

            for path, body in calls:
                hit = routes.get(path)
                if not hit:
                    continue  # 路径本身的问题上面已经报过,这里只管字段
                sel = hit[0]
                req = rpc_req.get(sel)
                fields = msg_fields.get(req) if req else None
                if not fields:
                    continue
                for key in KEY_RE.findall(body):
                    if key not in fields:
                        bad_fields.append((rel, path, key, sorted(fields)[:6]))

    if dead:
        print(f"[check_web] ✗ {len(dead)} 处路径在 http/*.yaml 里不存在:")
        for rel, i, path in dead:
            print(f"    {rel}:{i}  {path}")
    if wrong_svc:
        print(f"[check_web] ✗ {len(wrong_svc)} 处路径**存在,但在别的服务** —— "
              f"本工程连的是 {service},请求打过去网关只会回 code:5:")
        for rel, i, path, svc in wrong_svc:
            print(f"    {rel}:{i}  {path}  (它在 {svc})")
    if no_slash:
        print(f"[check_web] ✗ {len(no_slash)} 处路径少了前导 `/` —— "
              f"axios 拼得起来、跑得通,但这类写法**曾经整片逃过本检查**,请补上:")
        for rel, i, raw in no_slash:
            print(f"    {rel}:{i}  '{raw}'  →  '/{raw}'")
    if bad_fields:
        print(f"[check_web] ✗ {len(bad_fields)} 处字段名对不上请求消息:")
        for rel, path, key, sample in bad_fields:
            print(f"    {rel}  {path}  传了 '{key}';该消息的字段有 {sample}…")
    if snake_reads:
        print(f"[check_web] ✗ {len(snake_reads)} 处按 snake_case 读响应字段"
              f"(网关吐的是 camelCase,取到的是 undefined,**不报错**):")
        for rel, i, expr in snake_reads:
            print(f"    {rel}:{i}  {expr}")
    if not (dead or wrong_svc or no_slash or bad_fields or snake_reads):
        print("[check_web] ✓ 路径与字段均对得上")
        return 0
    print("[check_web] 只报不拦 —— 正常工作流是先改 proto 再跟消费方。"
          "但**当天要跟完**,别攒。")
    return 0 if warn else 1


if __name__ == "__main__":
    sys.exit(main())
