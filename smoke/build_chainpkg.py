#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""造一个**强依赖链式** function call 的测试插件包。

设计要点:第二步的产物,只有拿到第一步的返回值才可能得到。

  第 1 步 get_vault_code(box)  -> {"code": "K7X-QF3"}   模型猜不到
  第 2 步 open_vault(code)     -> code 对上了才给 {"prize": "HI-CHAIN-4M2WQ"}

于是最终答复里出现 HI-CHAIN-4M2WQ,当且仅当:
  ① 第 1 轮真的调了 get_vault_code
  ② 它的结果**被写回消息数组**并重新喂给了模型
  ③ 第 2 轮调了 open_vault,且带的是第 1 步那个 code
  ④ 第 2 轮的结果又被写回并喂了回去

这四件事任何一件断了,答复里就没有那个值。比"天气→带伞"强的地方在于:
带伞与否模型可以自己推理编出来,而 HI-CHAIN-4M2WQ **无法编造**。
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
# 对外资源前缀,与 hi-source 的 download_api.base 同源(见其 config.yaml)。
PUBLIC_BASE = "https://hisource.hi.lan/"
REGION, SVC = "us-east-1", "s3"

MAIN_PY = '''from impl import get_vault_code, open_vault   # noqa: F401
'''

IMPL_PY = '''"""链式依赖的两步。故意**不让第二步能被绕过**。"""

VAULT_CODE = "K7X-QF3"
PRIZE = "HI-CHAIN-4M2WQ"


def get_vault_code(box):
    """第一步:取保险箱的开箱码。"""
    return {"box": box, "code": VAULT_CODE}


def open_vault(code):
    """第二步:用开箱码开箱。

    **码不对就不给奖品** —— 这是整个测试的支点:模型没法跳过第一步,
    也没法凭空编出 code。答复里出现 PRIZE 就证明链条完整走通了。
    """
    if code != VAULT_CODE:
        return {"opened": False, "reason": "开箱码不对,先去拿码"}
    return {"opened": True, "prize": PRIZE}
'''

DESC = [
    {
        "type": "function",
        "function": {
            "name": "get_vault_code",
            "description": "获取指定保险箱的开箱码。要开保险箱时必须先调用它拿到码。",
            "parameters": {
                "type": "object",
                "properties": {"box": {"type": "string", "description": "保险箱编号"}},
                "required": ["box"],
            },
        },
    },
    {
        "type": "function",
        "function": {
            "name": "open_vault",
            "description": "用开箱码打开保险箱,取出里面的奖品。必须传入 get_vault_code 返回的 code 字段。",
            "parameters": {
                "type": "object",
                "properties": {"code": {"type": "string", "description": "开箱码,来自 get_vault_code"}},
                "required": ["code"],
            },
        },
    },
]


def build_zip():
    buf = io.BytesIO()
    with zipfile.ZipFile(buf, "w", zipfile.ZIP_DEFLATED) as z:
        root = "chain-fc-demo/"
        z.writestr(root + "main.py", MAIN_PY)
        z.writestr(root + "impl.py", IMPL_PY)
        z.writestr(root + "requirements.txt", "")
        z.writestr(root + "description.json", json.dumps(DESC, ensure_ascii=False, indent=2))
    return buf.getvalue()


def put(key, body):
    t = datetime.datetime.utcnow()
    amzdate, datestamp = t.strftime("%Y%m%dT%H%M%SZ"), t.strftime("%Y%m%d")
    ph = hashlib.sha256(body).hexdigest()
    canonical = (f"PUT\n/{BUCKET}/{key}\n\nhost:{HOST}\nx-amz-content-sha256:{ph}\n"
                 f"x-amz-date:{amzdate}\n\nhost;x-amz-content-sha256;x-amz-date\n{ph}")
    scope = f"{datestamp}/{REGION}/{SVC}/aws4_request"
    sts = f"AWS4-HMAC-SHA256\n{amzdate}\n{scope}\n" + hashlib.sha256(canonical.encode()).hexdigest()
    sign = lambda k, m: hmac.new(k, m.encode(), hashlib.sha256).digest()
    k = sign(("AWS4" + SK).encode(), datestamp)
    for p in (REGION, SVC, "aws4_request"):
        k = sign(k, p)
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
    # 打印出去的这条 url 会被当成插件包地址存进订单,最终由**机器人**去取 ——
    # 那是用户手里的设备,只可能走域名。上面 PUT 用 127.0.0.1:9000 是本机写 minio
    # (带 minio 凭据的后端动作),两者不是一回事,别顺手统一。
    print(PUBLIC_BASE + BUCKET + "/" + key)
