#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""造一个「新约定」的双方法测试插件包,并直接传进 hiai 私有桶。

新约定要点(全部要被验证到):
  · description.json 是 **OpenAI tools 数组**,每项有 name
  · main.py 是 facade:方法就是它顶层暴露的函数,实现可以散在别的文件里(这里放 impl.py 验 re-export)
  · 函数签名接收 **关键字实参**(runner 用 f(**arguments) 调)
  · 函数 **return** 结果,由 runner 打印
"""
import hashlib, hmac, datetime, io, json, urllib.request, uuid, zipfile

AK = "fnYMEbIv5wiz0SzuH42s"
SK = "NyoDifhqrDB7L9jrEE5K6eVM7pwSEueQKIQ8Vjht"
HOST = "127.0.0.1:9000"
BUCKET = "hiai"
# 对外资源前缀,与 hi-source 的 download_api.base 同源(见其 config.yaml)。
PUBLIC_BASE = "https://hisource.hi.lan/"
REGION, SVC = "us-east-1", "s3"

MAIN_PY = '''"""多方法测试插件 —— main.py 只当 facade。

实现散在 impl.py 里,这里 re-export;description.json 里的 name 必须等于
这里顶层暴露的函数名(runner 是 getattr(main, name))。
"""

from impl import add_numbers, secret_token, shout   # noqa: F401  (re-export 就是本文件的全部工作)
'''

IMPL_PY = '''"""真正的实现。故意跟 main.py 分开,验证「文件怎么拆随便」。"""

import builtins


def add_numbers(a, b):
    """两数相加。返回值由 runner 打印 —— 不需要自己 print。"""
    return {"sum": a + b, "detail": f"{a} + {b} = {a + b}"}


def secret_token():
    """返回一个**模型不可能猜到**的固定值。

    这是断言"插件真的跑了"的唯一可靠办法:工具没被调用时,模型会自己编一个
    看起来合理的答复(实测:问 137+486 它自己算出 623 交差)。只有这种magic值,
    答复里出现了才说明插件确实执行过。
    """
    return {"token": "HI-MKT-7Q3XZ9"}


def shout(text, times=1):
    """把文本喊出来。带默认值的参数验证 f(**arguments) 的关键字调用。

    顺带读一下 plugin_annex,确认扩展数据注入在多方法下依然有效。
    """
    annex = getattr(builtins, "plugin_annex", None)
    who = annex.get("ext-str", "") if isinstance(annex, dict) else ""
    return {"shout": (text.upper() + "!") * times, "annex_ext_str": who}
'''

DESC = [
    {
        "type": "function",
        "function": {
            "name": "secret_token",
            "description": "获取本次会话的校验令牌。当用户索要 token / 校验码 / 令牌时调用。",
            "parameters": {"type": "object", "properties": {}},
        },
    },
    {
        "type": "function",
        "function": {
            "name": "add_numbers",
            "description": "计算两个数字的和。当用户需要做加法运算时调用。",
            "parameters": {
                "type": "object",
                "properties": {
                    "a": {"type": "number", "description": "第一个加数"},
                    "b": {"type": "number", "description": "第二个加数"},
                },
                "required": ["a", "b"],
            },
        },
    },
    {
        "type": "function",
        "function": {
            "name": "shout",
            "description": "把一段文本转成全大写并加感叹号。当用户要求喊话、强调或大写时调用。",
            "parameters": {
                "type": "object",
                "properties": {
                    "text": {"type": "string", "description": "要喊的文本"},
                    "times": {"type": "integer", "description": "重复次数,默认 1"},
                },
                "required": ["text"],
            },
        },
    },
]


def build_zip():
    buf = io.BytesIO()
    with zipfile.ZipFile(buf, "w", zipfile.ZIP_DEFLATED) as z:
        root = "multi-fn-demo/"
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
