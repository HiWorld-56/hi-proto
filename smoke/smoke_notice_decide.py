#!/usr/bin/env python3
"""「要我拍板的通知」统一走 User.HandleNotice —— 端到端(开发环境,只能在 .64 跑,见下)。

2026-09-24 起:好友邀请、群邀请、**插件授权申请**都只调 `user/handle_notice(通知 uuid, accept)`,
状态读取时从业务表合并(授权申请 → 授权单,授权号在通知 extra 的 MarketGrantBrief 里)。
这之前前端对 plugin-grant-request 调 handle_notice 拿到的是「这条通知不是邀请」。

验:
  ① 申请 → 卖家 handle_notice 同意 → 授权成立(APPROVED/INSTALLED)、通知状态 accept、不在「还欠着的」里
  ② 同一条再点一次 → 如实报「已被处理过」(不是假成功)
  ③ 申请 → 卖家 handle_notice 拒绝 → 授权 REJECTED、通知 reject
  ④ 卖家分享(offer)→ **买家** handle_notice 谢绝 → 走 DeclineOffer:授权 REJECTED、通知 reject
  ⑤ 纯告知的通知(plugin-grant-approved)调 handle_notice → InvalidArgument「不需要做决定」

⚠️ **只能在 .64 跑**:User 这组接口**没进 HTTP 路由表**(前端经 core 走 gRPC),探针也走 gRPC ——
   要 grpcurl(只有 .64 有);授权单状态 ssh 到 .65 查库。

用法(身份同 smoke-market.sh,token 用 .66 的 /tmp/tokgen 生成):
  SELLER_TOK=... BUYER_TOK=... PKG=<测试插件包 url> python3 smoke_notice_decide.py
PKG 现造:在 .65 上 python3 build_testpkg.py(它往本机 minio 传包)
"""
import json
import os
import subprocess
import sys
import time
import urllib.request

CLUB_API = os.environ.get("CLUB_API", "https://hiclub-http-api.hi.lan/api/v1")
CLUB_GRPC = os.environ.get("CLUB_GRPC_PLAIN", "192.168.1.65:9536")
PROTOSET = os.environ.get("PROTOSET", "/home/lo/ci/hi-proto-code/rust/src/gen/hi_proto_descriptor.bin")
GRPCURL = os.environ.get("GRPCURL", os.path.expanduser("~/go/bin/grpcurl"))
DB = os.environ.get("DB", "192.168.1.65")
CODES = {"OK": 0, "Canceled": 1, "Unknown": 2, "InvalidArgument": 3, "DeadlineExceeded": 4, "NotFound": 5,
         "AlreadyExists": 6, "PermissionDenied": 7, "ResourceExhausted": 8, "FailedPrecondition": 9,
         "Aborted": 10, "OutOfRange": 11, "Unimplemented": 12, "Internal": 13, "Unavailable": 14,
         "DataLoss": 15, "Unauthenticated": 16}
CA = next((p for p in [os.environ.get("HI_LAN_CA", ""), "/home/lo/hi_lan_ca/hi.lan.crt"] if p and os.path.exists(p)), None)
SELLER = os.environ["SELLER_TOK"]
BUYER = os.environ["BUYER_TOK"]
PKG = os.environ["PKG"]

import ssl
CTX = ssl.create_default_context(cafile=CA) if CA else ssl.create_default_context()

passed = failed = 0


def call(path, body, tok):
    req = urllib.request.Request(
        f"{CLUB_API}/{path}", data=json.dumps(body).encode(), method="POST",
        headers={"Content-Type": "application/json", "Authorization": f"Bearer {tok}"},
    )
    try:
        with urllib.request.urlopen(req, context=CTX, timeout=120) as r:
            return json.loads(r.read() or b"{}")
    except urllib.error.HTTPError as e:
        try:
            return json.loads(e.read() or b"{}")
        except Exception:
            return {"code": e.code, "message": "http error"}


def grpc(method, body, tok):
    """调一个 hi.club.User 的 gRPC 方法。成功回 {"data": 回包};失败回 {"code": 数字, "message": ...}。"""
    r = subprocess.run([GRPCURL, "-plaintext", "-protoset", PROTOSET, "-H", f"authorization: Bearer {tok}",
                        "-d", json.dumps(body), CLUB_GRPC, f"hi.club.User/{method}"], capture_output=True, text=True)
    if r.returncode == 0:
        return {"data": json.loads(r.stdout or "{}")}
    code, msg = 2, r.stderr.strip()
    for line in r.stderr.splitlines():
        line = line.strip()
        if line.startswith("Code:"):
            code = CODES.get(line.split(":", 1)[1].strip(), 2)
        elif line.startswith("Message:"):
            msg = line.split(":", 1)[1].strip()
    return {"code": code, "message": msg}


def chk(what, ok, detail=""):
    global passed, failed
    if ok:
        passed += 1
        print(f"  ✓ {what}")
    else:
        failed += 1
        print(f"  ✗ {what}  ({detail})")


def data(r):
    return r.get("data") or {}


def grant_status(g):
    out = subprocess.run(["ssh", DB, f"mysql -u lo -p568568 -N hi_club -e \"SELECT status FROM hi_club_market_grant WHERE uuid='{g}'\" 2>/dev/null"],
                         capture_output=True, text=True).stdout.strip()
    return int(out) if out else None


def request_notice_of(tok, grant_uuid, secs=30):
    """等那条授权申请通知记进历史,回它的 uuid。判据是 extra 里的授权号。"""
    for _ in range(secs):
        for n in data(grpc("ListPendingNotices", {}, tok)).get("list") or []:
            if n.get("type") == "plugin-grant-request" and (n.get("extra") or {}).get("grantUuid") == grant_uuid:
                return n["uuid"]
        time.sleep(1)
    return None


def status_of(tok, uuid):
    for s in data(grpc("ListNoticeStatuses", {"uuids": [uuid]}, tok)).get("list") or []:
        if s.get("uuid") == uuid:
            return s.get("status")
    return None


def pending_has(tok, uuid):
    return any(n.get("uuid") == uuid for n in data(grpc("ListPendingNotices", {}, tok)).get("list") or [])


print("── 准备:卖家一台、买家三台机器人;一个「审批」档的挂牌 ──")
SB = data(call("agent/create_assistant", {"name": "smk-decide-seller"}, SELLER))["base"]["did"]
BBS = [data(call("agent/create_assistant", {"name": f"smk-decide-buyer{i}"}, BUYER))["base"]["did"] for i in range(3)]
P = data(call("plugin/create_shell", {"agent": SB, "name": "smk-decide"}, SELLER))["uuid"]
call("plugin/create_version", {"agent": SB, "version": {"uuid": P, "version": "1.0.0", "url": PKG}}, SELLER)
LID = data(call("market/create_listing", {"agent": SB, "plugin_uuid": P, "settle_mode": 2, "price": "0"}, SELLER)).get("uuid")
call("market/set_listing_status", {"uuid": LID, "status": 2}, SELLER)
print(f"  seller={SB} buyers={BBS} listing={LID}")
if not LID:
    for b in BBS:
        call("agent/delete", {"agent": b}, BUYER)
    call("agent/delete", {"agent": SB}, SELLER)
    sys.exit("挂牌失败,前提不成立(已删掉刚建的机器人)")

try:
    print("── ① 申请 → 卖家 handle_notice 同意 ──")
    g1 = data(call("market/apply", {"listing_uuid": LID, "to_agent": BBS[0]}, BUYER)).get("grantUuid")
    chk("申请成立、在等审批", grant_status(g1) == 1, f"grant={g1} status={grant_status(g1)}")
    n1 = request_notice_of(SELLER, g1)
    chk("卖家收到授权申请通知,且在「还欠着的」里", n1 is not None)
    chk("通知状态 not_processed", status_of(SELLER, n1) == "not_processed", status_of(SELLER, n1))
    r = grpc("HandleNotice", {"uuid": n1, "accept": True}, SELLER)
    chk("handle_notice 同意 → 成功", not r.get("code"), r)
    time.sleep(2)
    chk("授权成立(APPROVED/INSTALLED)", grant_status(g1) in (2, 3), grant_status(g1))
    chk("通知状态跟着变成 accept(不用回执)", status_of(SELLER, n1) == "accept", status_of(SELLER, n1))
    chk("不再在「还欠着的」里", not pending_has(SELLER, n1))

    print("── ② 再点一次 ──")
    r = grpc("HandleNotice", {"uuid": n1, "accept": True}, SELLER)
    chk("如实报「已被处理过」(FailedPrecondition=9)", r.get("code") == 9 and "处理过" in (r.get("message") or ""), r)

    print("── ③ 申请 → 卖家 handle_notice 拒绝 ──")
    g2 = data(call("market/apply", {"listing_uuid": LID, "to_agent": BBS[1]}, BUYER)).get("grantUuid")
    n2 = request_notice_of(SELLER, g2)
    r = grpc("HandleNotice", {"uuid": n2, "accept": False}, SELLER)
    chk("handle_notice 拒绝 → 成功", not r.get("code"), r)
    chk("授权 REJECTED", grant_status(g2) == 4, grant_status(g2))
    chk("通知状态 reject", status_of(SELLER, n2) == "reject", status_of(SELLER, n2))

    print("── ④ 卖家分享 → 买家 handle_notice 谢绝(走 DeclineOffer)──")
    g3 = data(call("market/offer", {"listing_uuid": LID, "to_agent": BBS[2]}, SELLER)).get("grantUuid")
    chk("分享成立、等买家点头", grant_status(g3) == 1, f"grant={g3} status={grant_status(g3)}")
    n3 = request_notice_of(BUYER, g3)
    chk("买家收到授权申请通知", n3 is not None)
    r = grpc("HandleNotice", {"uuid": n3, "accept": False}, BUYER)
    chk("handle_notice 谢绝 → 成功", not r.get("code"), r)
    chk("授权 REJECTED", grant_status(g3) == 4, grant_status(g3))
    chk("通知状态 reject", status_of(BUYER, n3) == "reject", status_of(BUYER, n3))

    print("── ⑤ 纯告知的通知 ──")
    approved = None
    for _ in range(20):
        r = grpc("ListNotices", {}, BUYER)
        for n in data(r).get("list") or []:
            if n.get("type") == "plugin-grant-approved" and (n.get("extra") or {}).get("grantUuid") == g1:
                approved = n["uuid"]
        if approved:
            break
        time.sleep(1)
    chk("买家收到「申请已通过」", approved is not None)
    if approved:
        r = grpc("HandleNotice", {"uuid": approved, "accept": True}, BUYER)
        chk("handle_notice → InvalidArgument(3)「不需要做决定」", r.get("code") == 3 and "不需要做决定" in (r.get("message") or ""), r)
finally:
    print("── 清理 ──")
    for g in [locals().get("g1")]:
        if g:
            call("market/revoke", {"grant_uuid": g, "reason": "smoke"}, SELLER)
    call("market/set_listing_status", {"uuid": LID, "status": 4}, SELLER)
    call("plugin/delete_shell", {"agent": SB, "uuid": P}, SELLER)
    for b in BBS:
        call("agent/delete", {"agent": b}, BUYER)
    r = call("agent/delete", {"agent": SB}, SELLER)
    print(f"  删卖家机器人:{r.get('code') or 'ok'} {r.get('message') or ''}")

print(f"\n通过 {passed} 失败 {failed}")
sys.exit(1 if failed else 0)
