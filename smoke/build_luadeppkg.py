#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""造一个**带 C 模块依赖**的 lua 插件包,传进 hiai 私有桶。

与 `build_luapkg.py` 的唯一差别:包根多一个 `requirements.txt`,
里面钉死一个 luarocks 包(默认 `lua-cjson 2.1.0`),而 `main.lua` **真的去 require 它**。

## 它验的是哪一段

lua 插件的依赖链有五段,中间任何一段断了都**只在机器人本地日志里**露一句
"module 'cjson' not found",服务端全程 code 0:

    requirements.txt  →  hi.ai 解析 + 让构建服务按配方编两个架构
                      →  落进 hi_ai_lua_dep(全机共用的集合)
                      →  ListOnDevice 的 deps 带上坐标
                      →  brain 下到 /opt/hinj/luadeps/
                      →  runner 在沙箱里 require 得到

判据是 **magic 值经 cjson 编解码一圈之后还对**:
`cjson.decode(cjson.encode{token=MAGIC}).token` —— 这一句只有真的加载到了
那个 `.so` 才跑得通,任何一段断掉都拿不到值。

用法(在 .64 上):MINIO_HOST=192.168.1.65:9000 python3 build_luadeppkg.py [rock] [版本]
"""
import hashlib, hmac, datetime, io, json, urllib.request, uuid, zipfile

AK = "fnYMEbIv5wiz0SzuH42s"
SK = "NyoDifhqrDB7L9jrEE5K6eVM7pwSEueQKIQ8Vjht"
# minio 的地址。**默认本机**,但允许 `MINIO_HOST` 覆盖 ——
# 这些脚本要在 .64(有 grpcurl / protoset / ~/wip)上跑,而 minio 在 .65。
# 写死 127.0.0.1 的话在 .64 上就是 `Connection refused`,
# 而那条错看着像 minio 挂了。
# ⚠️ SigV4 的 canonical request 里也带 host,所以两处必须用同一个值 —— 它们都读这个常量。
import os as _os
HOST = _os.environ.get("MINIO_HOST", "127.0.0.1:9000")
BUCKET = "hiai"
PUBLIC_BASE = "https://hisource.hi.lan/"
REGION, SVC = "us-east-1", "s3"

# ⭐ MAGIC 是"插件真的跑了"的唯一可靠证据 —— 工具没被调用时模型会自己编一个合理答复。
MAIN_LUA = '''return {
  contract = 1,
  manifest = [[
    [{"type":"function","function":{
      "name":"dep_roundtrip",
      "description":"用 cjson 把校验令牌编码再解码一圈后返回。用户要 lua 依赖校验码 / dep token 时调用。",
      "parameters":{"type":"object","properties":{}}
    }}]
  ]],
  methods = {
    dep_roundtrip = function(args, ctx)
      -- 🔴 **依赖一律走 `__native(rock, 版本, 模块)`**,不是裸 require。
      --    集合是全机共用的(同一个 rock 被五个插件用到只存一份),
      --    三个分量少一个就定位不到那份 .so —— 而"定位不到"表现成
      --    `module 'cjson' not found`,看着像没装,实际是没声明。
      local cjson = __native("REPLACE_ROCK", "REPLACE_VER", "cjson")
      -- 编码再解码一圈:只有真加载到了那个 .so 才跑得通。
      local round = cjson.decode(cjson.encode({ token = "HI-LUADEP-9X7B3" }))
      return { ok = true, data = { token = round.token, rock = "REPLACE_ROCK" } }
    end,
  },
}
'''

DESC = [
  {"type":"function","function":{"name":"dep_roundtrip",
    "description":"用 cjson 把校验令牌编码再解码一圈后返回。用户要 lua 依赖校验码 / dep token 时调用。",
    "parameters":{"type":"object","properties":{}}}},
]

import sys as _sys
ROCK = _sys.argv[1] if len(_sys.argv) > 1 else "lua-cjson"
VER  = _sys.argv[2] if len(_sys.argv) > 2 else "2.1.0"

def build_zip():
    buf = io.BytesIO()
    with zipfile.ZipFile(buf, "w", zipfile.ZIP_DEFLATED) as z:
        z.writestr("main.lua", MAIN_LUA.replace("REPLACE_ROCK", ROCK).replace("REPLACE_VER", VER))
        z.writestr("description.json", json.dumps(DESC, ensure_ascii=False, indent=2))
        # ⚠️ **版本必须钉死,不给范围。** 给范围就要解算器,而解算器的结果会随
        #    "解析那一刻 luarocks 上有什么"而变 —— 同一个插件版本在不同时间装出
        #    不同的东西,而且没人会发现。(与 hi.ai 那侧 parseDeps 的口径一致。)
        z.writestr("requirements.txt", "# smoke:带 C 模块依赖的 lua 插件\n%s %s\n" % (ROCK, VER))
    return buf.getvalue()

def put(key, body):
    now = datetime.datetime.now(datetime.timezone.utc)
    amzdate = now.strftime("%Y%m%dT%H%M%SZ"); datestamp = now.strftime("%Y%m%d")
    ph = hashlib.sha256(body).hexdigest()
    canonical = (f"PUT\n/{BUCKET}/{key}\n\nhost:{HOST}\nx-amz-content-sha256:{ph}\n"
                 f"x-amz-date:{amzdate}\n\nhost;x-amz-content-sha256;x-amz-date\n{ph}")
    scope = f"{datestamp}/{REGION}/{SVC}/aws4_request"
    sts = f"AWS4-HMAC-SHA256\n{amzdate}\n{scope}\n" + hashlib.sha256(canonical.encode()).hexdigest()
    sign = lambda k, m: hmac.new(k, m.encode(), hashlib.sha256).digest()
    k = sign(("AWS4" + SK).encode(), datestamp)
    for p in (REGION, SVC, "aws4_request"): k = sign(k, p)
    sig = hmac.new(k, sts.encode(), hashlib.sha256).hexdigest()
    auth = (f"AWS4-HMAC-SHA256 Credential={AK}/{scope}, "
            f"SignedHeaders=host;x-amz-content-sha256;x-amz-date, Signature={sig}")
    req = urllib.request.Request(f"http://{HOST}/{BUCKET}/{key}", data=body, method="PUT",
                                 headers={"Authorization": auth, "x-amz-date": amzdate,
                                          "x-amz-content-sha256": ph})
    urllib.request.urlopen(req).read()

if __name__ == "__main__":
    key = "plugin/" + uuid.uuid4().hex + ".zip"
    put(key, build_zip())
    print(PUBLIC_BASE + BUCKET + "/" + key)
