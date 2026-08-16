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

所以这个脚本把两件事都查:
  1. web 里出现的 `/api/v1/...` 字面量,在 http/*.yaml 里存不存在;
  2. 调用点传的对象字面量,key 在对应请求消息里存不存在。

## 只报不拦

与 check_impl 同理:正常工作流是先改 proto 再跟消费方,硬失败会卡死每次改名的第一次推送。
而且第 2 项用的是正则,天然有取不准的时候(拼接出来的 key、展开的变量),
**宁可漏报也不要误拦** —— 一个会误拦的检查,第一次误拦之后就会被人加 `|| true` 绕过去,
那它就彻底没用了。

用法:
    python3 codegen/check_web_routes.py <hiclub-web 检出目录> [--warn]
"""
import json
import os
import re
import subprocess
import sys
import tempfile

HIPROTO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# 路径字面量:'/api/v1/xxx/yyy'
PATH_RE = re.compile(r"""['"](/api/v1/[a-zA-Z0-9_/]+)['"]""")
# 调用点:postRequest('/api/v1/x', { a: 1, 'b': 2, c })  —— 只吃**同一行**的对象字面量,
# 跨行的放过(见上面"宁可漏报")。
CALL_RE = re.compile(
    r"""(?:post|get|put|delete)Request\(\s*['"](/api/v1/[a-zA-Z0-9_/]+)['"]\s*,\s*\{([^{}]*)\}""",
    re.IGNORECASE,
)
KEY_RE = re.compile(r"""['"]?([A-Za-z_][A-Za-z0-9_]*)['"]?\s*:""")
# api 层几乎都是 `export const foo = (data) => { return postRequest('/path', data) }` 透传,
# 真正的对象字面量在**调用点**(`foo({ bot_did: x })`)。只查 *Request( 的话,
# 这个仓里几乎一条都查不到 —— 检查会一直绿,而绿得毫无意义。所以再跟一跳。
EXPORT_RE = re.compile(
    r"""export\s+const\s+([A-Za-z_][A-Za-z0-9_]*)\s*=\s*\([^)]*\)\s*=>\s*\{?\s*(?:return\s+)?"""
    r"""(?:post|get|put|delete)Request\(\s*['"](/api/v1/[a-zA-Z0-9_/]+)['"]""",
    re.IGNORECASE,
)


def load_routes():
    """http/*.yaml → {path: selector}。不用 yaml 库,格式是我们自己写的,固定两行一条。"""
    routes = {}
    http_dir = os.path.join(HIPROTO, "http")
    for fn in sorted(os.listdir(http_dir)):
        if not fn.endswith(".yaml") or fn == "merged.yaml":
            continue
        sel = None
        for line in open(os.path.join(http_dir, fn), encoding="utf-8"):
            m = re.match(r"\s*-\s*selector:\s*(\S+)", line)
            if m:
                sel = m.group(1)
                continue
            m = re.match(r"\s*(get|post|put|delete):\s*(\S+)", line)
            if m and sel:
                routes[m.group(2)] = sel
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
        subprocess.run(
            ["buf", "build", "--as-file-descriptor-set", "--output", tmp],
            cwd=HIPROTO, check=True, capture_output=True,
        )
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
    if not args:
        print(__doc__)
        return 2
    web = args[0]
    src = os.path.join(web, "src")
    if not os.path.isdir(src):
        print(f"[check_web] 找不到 {src},跳过")
        return 0

    routes = load_routes()
    rpc_req, msg_fields = load_request_fields()

    # 先把 api 层的 函数名 → 路径 建出来(调用点在别的文件里)。
    api_fns = {}
    for root, _, files in os.walk(src):
        for fn in files:
            if fn.endswith((".js", ".ts")):
                t = open(os.path.join(root, fn), encoding="utf-8", errors="ignore").read()
                for name, path in EXPORT_RE.findall(t):
                    api_fns[name] = path

    dead, bad_fields = [], []
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

            for i, line in enumerate(text.splitlines(), 1):
                if line.lstrip().startswith(("//", "*", "#")):
                    continue  # 注释里的路径不算
                for path in PATH_RE.findall(line):
                    if path not in routes:
                        dead.append((rel, i, path))

            calls = [(p_, b) for p_, b in CALL_RE.findall(code)]
            # 再跟一跳:api 函数名 → 路径,然后查 `fnName({...})` 的调用点。
            for fn_name, p_ in api_fns.items():
                for b in re.findall(
                        r"""\b%s\(\s*\{([^{}]*)\}""" % re.escape(fn_name), code):
                    calls.append((p_, b))

            for path, body in calls:
                sel = routes.get(path)
                if not sel:
                    continue
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
    if bad_fields:
        print(f"[check_web] ✗ {len(bad_fields)} 处字段名对不上请求消息:")
        for rel, path, key, sample in bad_fields:
            print(f"    {rel}  {path}  传了 '{key}';该消息的字段有 {sample}…")
    if not dead and not bad_fields:
        print("[check_web] ✓ 路径与字段均对得上")
        return 0
    print("[check_web] 只报不拦 —— 正常工作流是先改 proto 再跟消费方。"
          "但**当天要跟完**,别攒。")
    return 0 if warn else 1


if __name__ == "__main__":
    sys.exit(main())
