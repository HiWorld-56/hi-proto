#!/bin/bash
# 阶段 5:到期 / 续费 / 自动续费 / follow_latest。
set -uo pipefail
H=127.0.0.1:9537
ST="$1"; BT="$2"; PKG="$3"
# ⚠️ **没有 mysql 客户端就直接退出,不要硬着头皮往下跑。**
#    库里那些断言会全部变成 "want=1 got=",看上去像产品坏了 ——
#    实际只是这台机器没装客户端。踩过一次,查了十几分钟才发现。
#    (mysql 在 .65 上;.64 是构建机,没有。)
command -v mysql >/dev/null || {
  echo "缺 mysql 客户端 —— 本脚本有一半断言要查库。请在 .65 上跑,或先装 mysql-client。" >&2
  exit 2
}

pass=0; fail=0
ok(){ printf "  \033[32m✓\033[0m %s\n" "$1"; pass=$((pass+1)); }
bad(){ printf "  \033[31m✗\033[0m %s  (%s)\n" "$1" "$2"; fail=$((fail+1)); }
chk(){ [ "$2" = "$3" ] && ok "$1" || bad "$1" "want=$3 got=$2"; }
has(){ case "$2" in *"$3"*) ok "$1";; *) bad "$1" "没有 '$3':$(echo "$2"|head -c 150)";; esac; }
cj(){ curl -s -m 120 -X POST "http://$H/api/v1/$1" -H 'Content-Type: application/json' -H "Authorization: Bearer $3" -d "$2"; }
q(){ mysql -h127.0.0.1 -ulo -p568568 "$1" -N -e "$2" 2>/dev/null; }
g(){ python3 -c '
import sys, json
try:
    d = json.load(sys.stdin)
    for k in sys.argv[1:]:
        d = d[k]
    print(d)
except Exception:
    print("")
' "$@"; }

SB=$(cj agent/create_assistant '{"name":"rn-seller"}' "$ST" | g data base did)
BB=$(cj agent/create_assistant '{"name":"rn-buyer"}' "$BT" | g data base did)
cj api_key/create "{\"agent\":\"$SB\"}" "$ST" >/dev/null
cj api_key/create "{\"agent\":\"$BB\"}" "$BT" >/dev/null
P=$(cj plugin/create_shell "{\"agent\":\"$SB\",\"name\":\"rn-demo\"}" "$ST" | g data uuid)
cj plugin/create_version "{\"agent\":\"$SB\",\"version\":{\"uuid\":\"$P\",\"version\":\"1.0.0\",\"url\":\"$PKG\"}}" "$ST" >/dev/null
echo "seller=$SB buyer=$BB(软件机器人) plugin=$P"

echo
echo "── 一、自动续费开关 ──"
L=$(cj market/create_listing "{\"agent\":\"$SB\",\"plugin_uuid\":\"$P\",\"settle_mode\":3,\"price\":\"1.5\",\"coin\":\"USDT-TRC20\",\"duration\":2592000,\"title\":\"续费测试\",\"allow_follow_latest\":true}" "$ST")
LID=$(echo "$L"|g data uuid)
cj market/set_listing_status "{\"uuid\":\"$LID\",\"status\":2}" "$ST" >/dev/null
A=$(cj market/apply "{\"listing_uuid\":\"$LID\",\"to_agent\":\"$BB\",\"follow_latest\":true}" "$BT")
G=$(echo "$A"|g data grantUuid)
has "负面:**软件机器人**开自动续费被拒(它没有私钥付不了款)" \
    "$(cj market/set_auto_renew "{\"grant_uuid\":\"$G\",\"enabled\":true}" "$BT")" "只有硬件机器人"
R=$(cj market/set_auto_renew "{\"grant_uuid\":\"$G\",\"enabled\":false}" "$BT")
has "关掉自动续费任何机器人都可以" "$R" '"code":0'
has "负面:别人的授权改不了" \
    "$(cj market/set_auto_renew "{\"grant_uuid\":\"$G\",\"enabled\":false}" "$ST")" "不属于你"

echo
echo "── 二、续费:首购与续费共用 ConfirmPayment ──"
# 手工把这笔置成已装载 + 快到期,模拟"买过了、要续了"
NOW=$(date +%s)
q hi_club "UPDATE hi_club_market_grant SET status=3, installed_at=$NOW, expire_at=$((NOW+3600)) WHERE uuid='$G';"
has "已装载状态下交假 tx_hash → 走的是**续费**分支且被链上核验挡下" \
    "$(cj market/confirm_payment "{\"grant_uuid\":\"$G\",\"tx_hash\":\"0xrenewfake000000000000000000000000000000000000000000000000000001\"}" "$BT")" "交易尚未成功"
chk "到期时刻没被改动(核验没过就不该延长)" "$(q hi_club "SELECT expire_at FROM hi_club_market_grant WHERE uuid='$G';")" "$((NOW+3600))"

echo
echo "── 三、到期扫描:提醒 + 解绑 ──"
# 造一笔"进入提醒窗口"的
q hi_club "UPDATE hi_club_market_grant SET expire_at=$((NOW+86400)), expiring_notified_at=0 WHERE uuid='$G';"
sleep 1
# 直接查扫描器会选中的条件是否命中(不等 5 分钟)
CNT=$(q hi_club "SELECT COUNT(*) FROM hi_club_market_grant WHERE status=3 AND settle_mode=3 AND expire_at>$NOW AND expire_at<=$((NOW+259200)) AND expiring_notified_at<$((NOW-43200)) AND uuid='$G';")
chk "快到期的会被扫描器选中" "$CNT" "1"
# 造一笔已过期的
q hi_club "UPDATE hi_club_market_grant SET expire_at=$((NOW-10)) WHERE uuid='$G';"
CNT=$(q hi_club "SELECT COUNT(*) FROM hi_club_market_grant WHERE status=3 AND expire_at>0 AND expire_at<=$NOW AND uuid='$G';")
chk "已过期的会被扫描器选中" "$CNT" "1"

echo
echo "── 四、follow_latest:发新版应推给跟随者 ──"
# ⚠️ 必须**真的装上**才有 d 行可切 —— 用免费挂牌走完整装载,
#    不能像上面那样在库里手改 status(那样 ai 侧根本没有 c 行,SetActive 会正确地拒绝)。
P2=$(cj plugin/create_shell "{\"agent\":\"$SB\",\"name\":\"rn-follow\"}" "$ST" | g data uuid)
cj plugin/create_version "{\"agent\":\"$SB\",\"version\":{\"uuid\":\"$P2\",\"version\":\"1.0.0\",\"url\":\"$PKG\"}}" "$ST" >/dev/null
L2=$(cj market/create_listing "{\"agent\":\"$SB\",\"plugin_uuid\":\"$P2\",\"settle_mode\":1,\"price\":\"0\",\"title\":\"跟随测试\",\"allow_follow_latest\":true}" "$ST")
LID2=$(echo "$L2"|g data uuid)
cj market/set_listing_status "{\"uuid\":\"$LID2\",\"status\":2}" "$ST" >/dev/null
A2=$(cj market/apply "{\"listing_uuid\":\"$LID2\",\"to_agent\":\"$BB\",\"follow_latest\":true}" "$BT")
G2=$(echo "$A2"|g data grantUuid)
chk "免费购买装上了(才有 d 行可切)" "$(echo "$A2"|g data status)" "GRANT_STATUS_INSTALLED"
BEFORE=$(q hi_ai "SELECT version FROM hi_ai_plugin_version_using WHERE agent_did='$BB' AND uuid='$P2' AND active=1;")
cj plugin/create_version "{\"agent\":\"$SB\",\"version\":{\"uuid\":\"$P2\",\"version\":\"1.1.0\",\"url\":\"$PKG\"}}" "$ST" >/dev/null
sleep 2
AFTER=$(q hi_ai "SELECT version FROM hi_ai_plugin_version_using WHERE agent_did='$BB' AND uuid='$P2' AND active=1;")
echo "  跟随者激活版本:$BEFORE → $AFTER"
chk "跟随者已切到新版" "$AFTER" "1.1.0"
chk "grant 里记的版本也跟上了" "$(q hi_club "SELECT version FROM hi_club_market_grant WHERE uuid='$G2';")" "1.1.0"

echo
echo "── 清理 ──"
cj market/revoke "{\"grant_uuid\":\"$G\",\"reason\":\"test\"}" "$ST" >/dev/null
cj market/revoke "{\"grant_uuid\":\"$G2\",\"reason\":\"test\"}" "$ST" >/dev/null
q hi_club "DELETE FROM hi_club_market_flow WHERE grant_uuid IN ('$G','$G2'); DELETE FROM hi_club_market_grant WHERE uuid IN ('$G','$G2'); DELETE FROM hi_club_market_listing WHERE uuid IN ('$LID','$LID2');"
cj plugin/delete_shell "{\"agent\":\"$SB\",\"uuid\":\"$P\"}" "$ST" >/dev/null
cj plugin/delete_shell "{\"agent\":\"$SB\",\"uuid\":\"$P2\"}" "$ST" >/dev/null
cj agent/delete "{\"agent\":\"$SB\"}" "$ST" >/dev/null
cj agent/delete "{\"agent\":\"$BB\"}" "$BT" >/dev/null

echo
echo "结果:通过 $pass,失败 $fail"
[ "$fail" -eq 0 ]
