#!/bin/bash
# 订单制 · 合约币真实支付闭环(Aptos FA,**真花钱**)。
#
# 订单制改完后,购买/续期这条链路**一次真钱都没跑过** —— 验证只到编译和单测。
# 而这条路上每一步都不是编译能保证的:开单、链上真转、按订单比对、履约。
#
# ⚠️ 最要紧的是**闸③(链上时间 ≥ 下单时间)**:
#    "不看付款方"之后,它是唯一挡住"捡一笔现成的旧转账来认新单"的东西,
#    而它从来没被执行过一次。本脚本用一笔**早于下单时刻**的真实旧转账去认新单。
set -uo pipefail
CLUB=192.168.1.65:9537; DB=192.168.1.65
STOK="${1:?卖方token}"; BTOK="${2:?买方master token}"; RTOK="${3:?机器人token}"; PKG="${4:?插件包url}"
COIN="${COIN:-HWHD-APT}"; PRICE="${PRICE:-2}"
OLD_TX="${OLD_TX:-}"          # 一笔**早于本次下单**的旧转账(金额/收款方与订单一致),验闸③
pass=0; fail=0
ok(){ printf "  \033[32m✓\033[0m %s\n" "$1"; pass=$((pass+1)); }
bad(){ printf "  \033[31m✗\033[0m %s  (%s)\n" "$1" "$2"; fail=$((fail+1)); }
chk(){ [ "$2" = "$3" ] && ok "$1" || bad "$1" "want=$3 got=$2"; }
hasany(){ local w="$1" o="$2"; shift 2
  for p in "$@"; do case "$o" in *"$p"*) ok "$w"; return;; esac; done
  bad "$w" "都没命中:$(echo "$o"|head -c 200)"; }
command -v mysql >/dev/null || { echo "缺 mysql —— 请在 .65 跑" >&2; exit 2; }
[ -x /tmp/coin_probe ] || { echo "缺 /tmp/coin_probe(core-mqtt,--features testkit)" >&2; exit 2; }
Q(){ mysql -h$DB -ulo -p568568 "$1" -N -e "$2" 2>/dev/null; }
cs(){ curl -s -m 120 -X POST "http://$CLUB/api/v1/$1" -H 'Content-Type: application/json' -H "Authorization: Bearer $STOK" -d "$2"; }
cb(){ curl -s -m 120 -X POST "http://$CLUB/api/v1/$1" -H 'Content-Type: application/json' -H "Authorization: Bearer $BTOK" -d "$2"; }
cr(){ curl -s -m 120 -X POST "http://$CLUB/api/v1/$1" -H 'Content-Type: application/json' -H "Authorization: Bearer $RTOK" -d "$2"; }
g(){ python3 -c '
import sys,json
try:
    d=json.load(sys.stdin)
    for k in sys.argv[1:]: d=d[k]
    print(d)
except Exception: print("")
' "$@"; }

SB=$(cs agent/create_assistant '{"name":"ord-seller"}' | g data base did)
cs api_key/create "{\"agent\":\"$SB\"}" >/dev/null
P=$(cs plugin/create_shell "{\"agent\":\"$SB\",\"name\":\"ord\"}" | g data uuid)
cs plugin/create_version "{\"agent\":\"$SB\",\"version\":{\"uuid\":\"$P\",\"version\":\"1.0.0\",\"url\":\"$PKG\"}}" >/dev/null
# duration>0:这样续期分支才活着(永久授权没有续期一说)
L=$(cs market/create_listing "{\"agent\":\"$SB\",\"plugin_uuid\":\"$P\",\"settle_mode\":3,\"price\":\"$PRICE\",\"coin\":\"$COIN\",\"duration\":2592000,\"title\":\"订单制真付\"}" | g data uuid)
cs market/set_listing_status "{\"uuid\":\"$L\",\"status\":2}" >/dev/null
RB="${ROBOT_DID:?需要 ROBOT_DID}"
echo "卖方=$SB 机器人=$RB 插件=$P 定价=$PRICE $COIN"

echo
echo "── 一、Apply 顺带开出账单 ──"
A=$(cb market/apply "{\"listing_uuid\":\"$L\",\"to_agent\":\"$RB\"}")
G=$(echo "$A"|g data grantUuid); OID=$(echo "$A"|g data order orderId)
OAMT=$(echo "$A"|g data order amount); OCOIN=$(echo "$A"|g data order coin)
OPAYEE=$(echo "$A"|g data order payee); OTGT=$(echo "$A"|g data order targetAgent)
echo "  grant=$G order=$OID  $OAMT $OCOIN → $OPAYEE"
[ -n "$OID" ] && ok "**Apply 返回了订单号**" || bad "没有订单号" "$(echo "$A"|head -c 200)"
chk "订单币种" "$OCOIN" "$COIN"; chk "订单金额" "$OAMT" "$PRICE"
chk "**订单写明了给哪台机器人**(扩展性靠它)" "$OTGT" "$RB"

echo
echo "── 二、闸③:拿一笔**早于下单**的旧转账去认新单 ──"
if [ -n "$OLD_TX" ]; then
  hasany "**旧转账认不了新单**(时间早于下单)" \
    "$(cr market/report_payment "{\"order_id\":\"$OID\",\"tx_hash\":\"$OLD_TX\"}")" \
    "时序" "早于" "时间" "不符"
  chk "订单仍是待付款(0)" "$(Q hi_club "SELECT status FROM hi_club_market_order WHERE order_id='$OID';")" "0"
else
  bad "闸③没验" "没给 OLD_TX —— 这是本脚本最该验的一条,别跳过"
fi

echo
echo "── 三、负面:链上查不到的 hash ──"
hasany "假 tx 被挡下" "$(cr market/report_payment "{\"order_id\":\"$OID\",\"tx_hash\":\"0x$(printf '%064d' 7)\"}")" \
  "尚未成功" "notfound" "取交易明细失败"

echo
echo "── 四、真转账 → 认款 → 履约 ──"
CHAIN=$(Q hi_did "SELECT chain FROM hi_coin WHERE name='$OCOIN' AND deleted_at IS NULL;")
PAYEE_ADDR=$(Q hi_did "SELECT address FROM hi_user_wallet WHERE did='$OPAYEE' AND chain='$CHAIN';")
[ -n "$PAYEE_ADDR" ] && ok "收款方 did 解析出 $CHAIN 地址" || bad "收款方没注册地址" "核验必挂"
TX=$(MN_FILE="${ROBOT_MN:?}" /tmp/coin_probe --pay "$OCOIN" "$PAYEE_ADDR" "$OAMT" 2>&1 | grep -o "tx_hash=0x[0-9a-f]*" | cut -d= -f2)
[ -n "$TX" ] && ok "真转账 tx=$TX" || { bad "转账失败" "-"; echo "结果:通过 $pass,失败 $((fail+1))"; exit 1; }
sleep 6
R=$(cr market/report_payment "{\"order_id\":\"$OID\",\"tx_hash\":\"$TX\"}")
case "$R" in *'"code":0'*) ok "**认款通过**";; *) bad "认款失败" "$(echo "$R"|head -c 250)";; esac
chk "订单置为已付(1)" "$(Q hi_club "SELECT status FROM hi_club_market_order WHERE order_id='$OID';")" "1"
chk "授权置为已装载(3)" "$(Q hi_club "SELECT status FROM hi_club_market_grant WHERE uuid='$G';")" "3"
chk "**ai 侧真的插了引用行**" \
  "$(Q hi_ai "SELECT COUNT(*) FROM hi_ai_plugin_using WHERE agent_did='$RB' AND uuid='$P' AND source='reference' AND deleted_at IS NULL;")" "1"

echo
echo "── 五、同一笔 tx 认不了第二张单 ──"
O2=$(cr market/create_renew_order "{\"grant_uuid\":\"$G\"}")
OID2=$(echo "$O2"|g data orderId)
[ -n "$OID2" ] && ok "机器人自己开出续期单(它掏钱,所以它能开)" || bad "开续期单失败" "$(echo "$O2"|head -c 200)"
hasany "**旧 tx 认不了新单**(全局唯一)" "$(cr market/report_payment "{\"order_id\":\"$OID2\",\"tx_hash\":\"$TX\"}")" \
  "已经被用过" "用过"

echo
echo "── 清理 ──"
cs market/revoke "{\"grant_uuid\":\"$G\",\"reason\":\"test\"}" >/dev/null
Q hi_club "DELETE FROM hi_club_market_order WHERE grant_uuid='$G'; DELETE FROM hi_club_market_flow WHERE grant_uuid='$G'; DELETE FROM hi_club_market_grant WHERE uuid='$G'; DELETE FROM hi_club_market_listing WHERE uuid='$L';"
cs plugin/delete_shell "{\"agent\":\"$SB\",\"uuid\":\"$P\"}" >/dev/null
cs agent/delete "{\"agent\":\"$SB\"}" >/dev/null
echo
echo "结果:通过 $pass,失败 $fail"
[ "$fail" -eq 0 ]
