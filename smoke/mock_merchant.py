#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Mock 商户后台 —— 验证「商户来拉 + 回传」这条外部结算链路。

它做的正是真实商户该做的三件事:
  ① 用自己的 did 私钥签一个 MarketPullData,调 club 的 MarketCallback.Pull 拉待处理申请;
  ② 处理业务(这里就是"假装收到钱了");
  ③ 签一个 MarketNotifyData,调 MarketCallback.Notify 回传结果。

⚠️ **club 侧不需要任何密钥** —— 签名方向与"谁持有私钥"天然对齐,
   这正是把出方向反过来的理由(同 hidid PC 端那套)。

签名用 hidid 的现成工具生成(见 /tmp/didsign),这里只负责组装与调用。
"""
import argparse
import base64
import json
import subprocess
import sys
import time
import uuid

GRPCURL = "/home/lo/go/bin/grpcurl"
PB = "/home/lo/ci/hi-proto-code/lua/hi.pb"
CLUB_GRPC = "192.168.1.65:9536"


def sign(payload: dict, signer: str) -> dict:
    """用 signer 的私钥签 payload,返回 {data, signature}。"""
    raw = json.dumps(payload, ensure_ascii=False, separators=(",", ":"))
    out = subprocess.run([signer, raw], capture_output=True, text=True)
    if out.returncode != 0:
        print("签名失败:", out.stderr, file=sys.stderr)
        sys.exit(1)
    sig = out.stdout.strip()
    return {"data": base64.b64encode(raw.encode()).decode(), "signature": sig}


def call(method: str, body: dict):
    p = subprocess.run(
        [GRPCURL, "-plaintext", "-protoset", PB, "-d", json.dumps(body), CLUB_GRPC, method],
        capture_output=True, text=True)
    return p.returncode, p.stdout.strip(), p.stderr.strip()


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--signer", required=True, help="签名工具路径(拿私钥签一段文本)")
    ap.add_argument("--grant", help="只处理这一笔;不给就处理拉到的第一笔")
    ap.add_argument("--result", default="approved", choices=["approved", "rejected"])
    ap.add_argument("--outer", help="商户侧单号;不给就现生成")
    ap.add_argument("--pull-only", action="store_true")
    args = ap.parse_args()

    print("── ① Pull:拉自己名下待处理的申请 ──")
    rc, out, err = call("hi.club.MarketCallback/Pull",
                        sign({"nonce": uuid.uuid4().hex, "timestamp": int(time.time())}, args.signer))
    print("rc=%d" % rc)
    print(out or err)
    if rc != 0 or args.pull_only:
        return

    try:
        lst = json.loads(out).get("list", [])
    except Exception:
        lst = []
    if not lst and not args.grant:
        print("没有待处理的申请")
        return

    grant = args.grant or lst[0]["grantUuid"]
    outer = args.outer or ("ORDER-" + uuid.uuid4().hex[:10])
    print("\n── ② 处理业务(假装收到钱了):grant=%s outer=%s ──" % (grant, outer))

    print("\n── ③ Notify:回传结果 ──")
    rc, out, err = call("hi.club.MarketCallback/Notify",
                        sign({"grant_uuid": grant, "outer_id": outer,
                              "result": args.result, "reason": "mock 商户处理",
                              "nonce": uuid.uuid4().hex, "timestamp": int(time.time())}, args.signer))
    print("rc=%d" % rc)
    print(out or err)
    print("\nGRANT=%s OUTER=%s" % (grant, outer))


if __name__ == "__main__":
    main()
