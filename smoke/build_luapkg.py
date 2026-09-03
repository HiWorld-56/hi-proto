#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""造一个 **lua** 插件包并传进 hiai 私有桶。
照 build_testpkg.py 的上传逻辑,只换包内容:main.lua + description.json。
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
      "name":"lua_secret",
      "description":"获取本次会话的 lua 校验令牌。用户索要 lua token / lua 校验码时调用。",
      "parameters":{"type":"object","properties":{}}
    }},
     {"type":"function","function":{
      "name":"lua_echo_ctx",
      "description":"回显本次调用的上下文(me/master/asker)。",
      "parameters":{"type":"object","properties":{}}
    }}]
  ]],
  methods = {
    lua_secret = function(args, ctx)
      return { ok = true, data = { token = "HI-LUA-8K4PZ2" } }
    end,
    lua_echo_ctx = function(args, ctx)
      return { ok = true, data = {
        me = ctx.me,
        -- 🔴 没主人 / 匿名时必须是 nil,不是空串
        has_master = ctx.master ~= nil,
        has_asker  = ctx.asker ~= nil,
      } }
    end,
  },
}
'''

DESC = [
  {"type":"function","function":{"name":"lua_secret",
    "description":"获取本次会话的 lua 校验令牌。用户索要 lua token / lua 校验码时调用。",
    "parameters":{"type":"object","properties":{}}}},
  {"type":"function","function":{"name":"lua_echo_ctx",
    "description":"回显本次调用的上下文(me/master/asker)。",
    "parameters":{"type":"object","properties":{}}}},
]

def build_zip():
    buf = io.BytesIO()
    with zipfile.ZipFile(buf, "w", zipfile.ZIP_DEFLATED) as z:
        z.writestr("main.lua", MAIN_LUA)
        z.writestr("description.json", json.dumps(DESC, ensure_ascii=False, indent=2))
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
