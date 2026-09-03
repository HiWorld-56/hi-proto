#!/bin/bash
# 阶段 5:到期 / 续费 / 自动续费 / follow_latest。
set -uo pipefail
source "$(dirname "$0")/_endpoints.sh"   # 端点/CA 统一约定(前端可达→域名 TLS,内部→内网 IP)
ST="$1"; BT="$2"; PKG="$3"
# ⚠️ **没有 mysql 客户端就直接退出,不要硬着头皮往下跑。**
#    库里那些断言会全部变成 "want=1 got=",看上去像产品坏了 ——
#    实际只是这台机器没装客户端。踩过一次,查了十几分钟才发现。
#    (mysql 在 .65 上;.64 是构建机,没有。)
have_db || {
  echo "够不着 mysql —— 本机没装 mysql 时会 ssh 到 $DB 去查,检查那条路。" >&2
  exit 2
}

pass=0; fail=0
ok(){ printf "  \033[32m✓\033[0m %s\n" "$1"; pass=$((pass+1)); }
bad(){ printf "  \033[31m✗\033[0m %s  (%s)\n" "$1" "$2"; fail=$((fail+1)); }
chk(){ [ "$2" = "$3" ] && ok "$1" || bad "$1" "want=$3 got=$2"; }
has(){ case "$2" in *"$3"*) ok "$1";; *) bad "$1" "没有 '$3':$(echo "$2"|head -c 150)";; esac; }
cj(){ curl -s $CAC -m 120 -X POST "$CLUB_API/$1" -H 'Content-Type: application/json' -H "Authorization: Bearer $3" -d "$2"; }
q(){ mysqlq "$1" "$2"; }
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
L=$(cj market/create_listing "{\"agent\":\"$SB\",\"plugin_uuid\":\"$P\",\"settle_mode\":3,\"price\":\"1.5\",\"coin\":\"USDT-TRC20\",\"duration\":2592000,\"title\":\"续费测试\"}" "$ST")
LID=$(echo "$L"|g data uuid)
cj market/set_listing_status "{\"uuid\":\"$LID\",\"status\":2}" "$ST" >/dev/null
A=$(cj market/apply "{\"listing_uuid\":\"$LID\",\"to_agent\":\"$BB\"}" "$BT")
G=$(echo "$A"|g data grantUuid)
has "负面:**软件机器人**开自动续费被拒(它没有私钥付不了款)" \
    "$(cj market/set_auto_renew "{\"grant_uuid\":\"$G\",\"enabled\":true}" "$BT")" "只有硬件机器人"
R=$(cj market/set_auto_renew "{\"grant_uuid\":\"$G\",\"enabled\":false}" "$BT")
has "关掉自动续费任何机器人都可以" "$R" '"code":0'
has "负面:别人的授权改不了" \
    "$(cj market/set_auto_renew "{\"grant_uuid\":\"$G\",\"enabled\":false}" "$ST")" "不属于你"

echo
echo "── 二、续费:开单 + 付款凭据 ──"
# 手工把这笔置成已装载 + 快到期,模拟"买过了、要续了"
NOW=$(date +%s)
q hi_club "UPDATE hi_club_market_grant SET status=3, installed_at=$NOW, expire_at=$((NOW+3600)) WHERE uuid='$G';"
# 订单制之后:续期要**先开单**(CreateRenewOrder),再拿 order_id 认款。
# 旧的 confirm_payment 已删。这里验"已装载的授权能开出续期单",
# 真付款那条在 smoke-order-onchain.sh。
RO=$(cj market/create_renew_order "{\"grant_uuid\":\"$G\"}" "$BT")
ROID=$(echo "$RO"|g data orderId)
[ -n "$ROID" ] && ok "已装载的授权能开出**续期单**" || bad "开续期单失败" "$(echo "$RO"|head -c 180)"
case "$ROID" in MKT-*) ok "续期单也带 MKT- 前缀";;
  *) bad "续期单号没有 MKT- 前缀" "got=$ROID";; esac
[ -n "$(echo "$RO"|g data merchant)" ] && ok "续期单带出商户DID" || bad "续期单没带 merchant" "付款方将无处上报"
RPID=$(echo "$RO"|g data payment payId)
case "$RPID" in MKP-*) ok "续期单带出付款凭据号";; *) bad "续期单没带凭据号" "got=$RPID";; esac
# **凭据可换、业务单不动** —— 这就是主/子拆开的意义。
R2=$(cj market/issue_payment "{\"order_id\":\"$ROID\"}" "$BT")
chk "再开凭据拿回的还是同一张业务单" "$(echo "$R2"|g data orderId)" "$ROID"
chk "凭据没过期时幂等(不会开出一堆)" "$(echo "$R2"|g data payment payId)" "$RPID"
# 全部凭据列得出来 —— 人工查账退款看的就是它。
[ -n "$(cj market/list_payments "{\"order_id\":\"$ROID\"}" "$BT"|g data list)" ] && ok "列得出这张单的全部凭据" || bad "列不出凭据" "人工查账没有抓手"
# 认款没有客户端入口(付款方只对 hidid 上报),这里验不了 —— 见 smoke-order-onchain.sh。
# 但"没认款就不许延期"这条必须在这儿钉住:开一张单不该动到期时刻。
chk "开完单到期时刻没被改动(开单≠已付款)" "$(q hi_club "SELECT expire_at FROM hi_club_market_grant WHERE uuid='$G';")" "$((NOW+3600))"

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
# 🔴 **跟版开关不在市场接口上。**
#
# proto 写得很清楚:`ApplyReq` 没有 `follow_latest`、`CreateListingReq` 没有
# `allow_follow_latest`(「不要再加回来」)—— 这件事**归使用行**(hi.ai 的
# `c.follow_latest`),买完之后在「机器人 → 插件」那一行上自己开关。
#
# ⚠️ 原来这里往这两个接口里塞那两个字段,而 grpc-gateway 默认 `DiscardUnknown`,
#    **老字段被静默丢掉** —— 请求 200、路由命中、开关根本没打开,
#    于是"发新版没推给跟随者"这条常年红,看着像 propagateToFollowers 坏了。
#    (2026-09-03 查出来:hi-ai 日志里 propagate 一条都没有,因为 FollowersOf 是空的。)
L2=$(cj market/create_listing "{\"agent\":\"$SB\",\"plugin_uuid\":\"$P2\",\"settle_mode\":1,\"price\":\"0\",\"title\":\"跟随测试\"}" "$ST")
LID2=$(echo "$L2"|g data uuid)
cj market/set_listing_status "{\"uuid\":\"$LID2\",\"status\":2}" "$ST" >/dev/null
A2=$(cj market/apply "{\"listing_uuid\":\"$LID2\",\"to_agent\":\"$BB\"}" "$BT")
G2=$(echo "$A2"|g data grantUuid)
chk "免费购买装上了(才有 d 行可切)" "$(echo "$A2"|g data status)" "GRANT_STATUS_INSTALLED"
# 买完之后,在使用行上把跟版打开 —— 这才是真接口
FL=$(cj plugin/set_follow_latest "{\"agent\":\"$BB\",\"uuid\":\"$P2\",\"on\":true}" "$BT")
has "在使用行上打开跟版(不是在市场接口上)" "$FL" '"code":0'
chk "库里 c.follow_latest 真的是 1(证明开关生效了)" \
    "$(q hi_ai "SELECT follow_latest FROM hi_ai_plugin_using WHERE agent_did='$BB' AND uuid='$P2';")" "1"
BEFORE=$(q hi_ai "SELECT version FROM hi_ai_plugin_version_using WHERE agent_did='$BB' AND uuid='$P2' AND active=1;")
cj plugin/create_version "{\"agent\":\"$SB\",\"version\":{\"uuid\":\"$P2\",\"version\":\"1.1.0\",\"url\":\"$PKG\"}}" "$ST" >/dev/null
sleep 2
AFTER=$(q hi_ai "SELECT version FROM hi_ai_plugin_version_using WHERE agent_did='$BB' AND uuid='$P2' AND active=1;")
echo "  跟随者激活版本:$BEFORE → $AFTER"
chk "跟随者已切到新版" "$AFTER" "1.1.0"
# ⚠️ **grant.version 不跟版,这是对的。** 单据是**成交快照** ——
#    跟版切的是使用行(c/d),而 grant 记的是"当初买的是哪一版"。
#    原来这里断言它也变成 1.1.0,那与"单据要快照"的设计相反,
#    而且代码里从来没有人写过它(只有 settle 写一次)。
GV=$(q hi_club "SELECT ifnull(version,'<NULL>') FROM hi_club_market_grant WHERE uuid='$G2';")
[ "$GV" != "1.1.0" ] && ok "grant.version **不**跟版(单据是成交快照,got=$GV)" \
                     || bad "grant.version 跟着变了" "单据应当是成交快照,不该被跟版改写"

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
