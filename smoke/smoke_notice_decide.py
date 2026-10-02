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
  ⑥ 付费档申请 → **卖家收不到通知**(付费档卖家没什么可决定的,到账成立时才发 plugin-grant-sold);
     卖家经 Market.Reject 拒它 → 9(拒了订单还开着,买家照样能付 → 钱收了插件没装)
     ⚠️ 到账那一刻的 plugin-grant-sold 要链上真付款,这里不验(见 smoke-order-onchain.sh)
  ⑦ 外部流程档申请 → 卖家**收到**申请通知(not_processed,要卖家手动点)→ handle_notice 同意 → 授权成立、通知 accept

⚠️ **只能在 .64 跑**:User 这组接口**没进 HTTP 路由表**(前端经 core 走 gRPC),探针也走 gRPC ——
   要 grpcurl(只有 .64 有);授权单状态 ssh 到 .65 查库。

用法(身份同 smoke-market.sh,token 用 .66 的 /tmp/tokgen 生成):
  SELLER_TOK=... BUYER_TOK=... [PKG=<测试插件包 url>] bash smoke_notice_decide.sh
经 .sh 壳跑:收尾(删机器人 / 壳 / 挂牌、撤权、purge 按号删行)在 _endpoints.sh 一处,本脚本只登记。
PKG 不给就由壳现造(MINIO_HOST=192.168.1.65:9000 python3 build_testpkg.py),退出时删掉。
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
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from _cleanup import made, undo_club  # noqa: E402

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
    # token 不进命令行(argv 谁都 ps 得到):头里写 ${SMK_BEARER},值走环境变量,grpcurl -expand-headers 展开
    r = subprocess.run([GRPCURL, "-plaintext", "-protoset", PROTOSET, "-expand-headers",
                        "-H", "authorization: ${SMK_BEARER}",
                        "-d", json.dumps(body), CLUB_GRPC, f"hi.club.User/{method}"], capture_output=True, text=True,
                       env={**os.environ, "SMK_BEARER": f"Bearer {tok}"})
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
# 现造的一律当场登记收尾(_cleanup.py → _endpoints.sh:退出时后进先出走接口删,再 purge 按号删行)
def new_agent(name, tok):
    d = data(call("agent/create_assistant", {"name": name}, tok)).get("base", {}).get("did")
    if d:
        made(d)
        undo_club(tok, "agent/delete", {"agent": d})
    return d


def new_shell(name):
    u = data(call("plugin/create_shell", {"agent": SB, "name": name}, SELLER)).get("uuid")
    if u:
        made(u)
        undo_club(SELLER, "plugin/delete_shell", {"agent": SB, "uuid": u})
    return u


def new_listing(body):
    u = data(call("market/create_listing", body, SELLER)).get("uuid")
    if u:
        made(u)
        undo_club(SELLER, "market/set_listing_status", {"uuid": u, "status": 4})
    return u


def new_grant(r):
    """授权号、它顺带开出的业务单 / 付款凭据都登记给 purge。撤权要等它成立(见 revoke_later)。"""
    d = data(r)
    g = d.get("grantUuid")
    o = d.get("order") or {}
    made(g, o.get("orderId"), (o.get("payment") or {}).get("payId"))
    return g


def revoke_later(g):
    """授权成立了(已成立 / 已装载)才登记撤权 —— 待处理的撤不了(9「只有已成立/已装载的授权能撤销」)。"""
    if g and grant_status(g) in (2, 3):
        undo_club(SELLER, "market/revoke", {"grant_uuid": g, "reason": "smoke"})


SB = new_agent("smk-decide-seller", SELLER)
BBS = [new_agent(f"smk-decide-buyer{i}", BUYER) for i in range(5)]
if not SB or not all(BBS):
    sys.exit("建机器人失败,前提不成立(建出来的由收尾删)")
P = new_shell("smk-decide")
call("plugin/create_version", {"agent": SB, "version": {"uuid": P, "version": "1.0.0", "url": PKG}}, SELLER)
LID = new_listing({"agent": SB, "plugin_uuid": P, "settle_mode": 2, "price": "0"})
call("market/set_listing_status", {"uuid": LID, "status": 2}, SELLER)
print(f"  seller={SB} buyers={BBS} listing={LID}")
if not LID:
    sys.exit("挂牌失败,前提不成立(建出来的由收尾删)")

print("── ① 申请 → 卖家 handle_notice 同意 ──")
g1 = new_grant(call("market/apply", {"listing_uuid": LID, "to_agent": BBS[0]}, BUYER))
chk("申请成立、在等审批", grant_status(g1) == 1, f"grant={g1} status={grant_status(g1)}")
n1 = request_notice_of(SELLER, g1)
chk("卖家收到授权申请通知,且在「还欠着的」里", n1 is not None)
chk("通知状态 not_processed", status_of(SELLER, n1) == "not_processed", status_of(SELLER, n1))
r = grpc("HandleNotice", {"uuid": n1, "accept": True}, SELLER)
chk("handle_notice 同意 → 成功", not r.get("code"), r)
time.sleep(2)
chk("授权成立(APPROVED/INSTALLED)", grant_status(g1) in (2, 3), grant_status(g1))
revoke_later(g1)
chk("通知状态跟着变成 accept(不用回执)", status_of(SELLER, n1) == "accept", status_of(SELLER, n1))
chk("不再在「还欠着的」里", not pending_has(SELLER, n1))

print("── ② 再点一次 ──")
r = grpc("HandleNotice", {"uuid": n1, "accept": True}, SELLER)
chk("如实报「已被处理过」(FailedPrecondition=9)", r.get("code") == 9 and "处理过" in (r.get("message") or ""), r)

print("── ③ 申请 → 卖家 handle_notice 拒绝 ──")
g2 = new_grant(call("market/apply", {"listing_uuid": LID, "to_agent": BBS[1]}, BUYER))
n2 = request_notice_of(SELLER, g2)
r = grpc("HandleNotice", {"uuid": n2, "accept": False}, SELLER)
chk("handle_notice 拒绝 → 成功", not r.get("code"), r)
chk("授权 REJECTED", grant_status(g2) == 4, grant_status(g2))
chk("通知状态 reject", status_of(SELLER, n2) == "reject", status_of(SELLER, n2))

print("── ④ 卖家分享 → 买家 handle_notice 谢绝(走 DeclineOffer)──")
g3 = new_grant(call("market/offer", {"listing_uuid": LID, "to_agent": BBS[2]}, SELLER))
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

print("── ⑥ 付费档:申请时不通知卖家,卖家也不能拒 ──")
P2 = new_shell("smk-decide-paid")
call("plugin/create_version", {"agent": SB, "version": {"uuid": P2, "version": "1.0.0", "url": PKG}}, SELLER)
LID2 = new_listing({"agent": SB, "plugin_uuid": P2, "settle_mode": 3, "price": "9.9",
                    "coin": "USDT-TRC20", "duration": 2592000})
call("market/set_listing_status", {"uuid": LID2, "status": 2}, SELLER)
a = call("market/apply", {"listing_uuid": LID2, "to_agent": BBS[3]}, BUYER)
g4 = new_grant(a)
chk("付费申请成立、开出了账单", grant_status(g4) == 1 and bool((data(a).get("order") or {}).get("orderId")), a)
# 前提:①③ 的审批档申请 30 秒内都到了,通道是通的;这里等同样久,确认**没有**这一条
chk("卖家**收不到**这条付费申请的通知", request_notice_of(SELLER, g4, secs=15) is None and not any(
    (n.get("extra") or {}).get("grantUuid") == g4 for n in data(grpc("ListNotices", {}, SELLER)).get("list") or []))
r = call("market/reject", {"grant_uuid": g4, "reason": "smoke"}, SELLER)
chk("卖家 Market.Reject 付费单 → 9「不需要处理」", r.get("code") == 9 and "不需要处理" in (r.get("message") or ""), r)
chk("授权仍是申请中(没被拒掉)", grant_status(g4) == 1, grant_status(g4))
r = call("market/approve", {"grant_uuid": g4}, SELLER)
chk("卖家 Market.Approve 付费单 → 9", r.get("code") == 9, r)

print("── ⑦ 外部流程档:卖家手动同意 ──")
P3 = new_shell("smk-decide-ext")
call("plugin/create_version", {"agent": SB, "version": {"uuid": P3, "version": "1.0.0", "url": PKG}}, SELLER)
LID3 = new_listing({"agent": SB, "plugin_uuid": P3, "settle_mode": 4,
                    "action_url": "https://example/apply"})
call("market/set_listing_status", {"uuid": LID3, "status": 2}, SELLER)
g5 = new_grant(call("market/apply", {"listing_uuid": LID3, "to_agent": BBS[4]}, BUYER))
chk("外部流程申请成立、在等", grant_status(g5) == 1, f"grant={g5} status={grant_status(g5)}")
n5 = request_notice_of(SELLER, g5)
chk("卖家收到申请通知,且在「还欠着的」里", n5 is not None)
chk("通知状态 not_processed(出按钮)", status_of(SELLER, n5) == "not_processed", status_of(SELLER, n5))
r = grpc("HandleNotice", {"uuid": n5, "accept": True}, SELLER)
chk("handle_notice 同意 → 成功", not r.get("code"), r)
time.sleep(2)
chk("授权成立(APPROVED/INSTALLED)", grant_status(g5) in (2, 3), grant_status(g5))
revoke_later(g5)
chk("通知状态 accept", status_of(SELLER, n5) == "accept", status_of(SELLER, n5))
# 清理:全部登记在收尾里(撤权 → 下架 → 删壳 → 删机器人走接口;授权 / 订单 / 凭据 / 通知行由 purge 按号删)。

print(f"\n通过 {passed} 失败 {failed}")
sys.exit(1 if failed else 0)
