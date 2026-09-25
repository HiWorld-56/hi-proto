#!/bin/bash
# 订单制 · 合约币真实支付闭环(Aptos FA,**真花钱**)。
#
# 订单制改完后,购买/续期这条链路**一次真钱都没跑过** —— 验证只到编译和单测。
# 而这条路上每一步都不是编译能保证的:开单、链上真转、按订单比对、履约。
#
# ⚠️ 最要紧的是**闸③(链上时间 ≥ 下单时间)**:
#    "不看付款方"之后,它是唯一挡住"捡一笔现成的旧转账来认新单"的东西,
#    而它从来没被执行过一次。本脚本用一笔**早于下单时刻**的真实旧转账去认新单。
#
# ⚠️ 认款**不是 curl 打 club**,而是走 `hi.did.Pay.Notify` ——
#    付款方只对 hidid 上报,由 hidid 按订单带来的商户DID 回调 club
#    (`hi.did.PayCallback.Pay`)。曾经有过一个 `Market.ReportPayment` 让客户端直接调 club,
#    那是条方向反的路,已删。**拿 curl 直接打三方就等于没验这条链路**。
set -uo pipefail
source "$(dirname "$0")/_endpoints.sh"   # 端点/CA 统一约定(前端可达→域名 TLS,内部→内网 IP)
STOK="${1:?卖方token}"; BTOK="${2:?买方master token}"; RTOK="${3:?机器人token}"; PKG="${4:?插件包url}"
COIN="${COIN:-HWHD-APT}"; PRICE="${PRICE:-2}"
# 一笔**早于本次下单**的旧转账(金额/收款方与订单一致),验闸③。
# ⚠️ 必须比下单时刻早**超过 5 分钟** —— club 的闸③给了 5 分钟时钟容差
#    (它挡的是早几小时几天的旧转账,而两边的钟本来就不同步)。
#    拿一笔两分钟前的转账来试,**它本来就该被放行**,那不叫闸失效,叫用例没搭对。
#    下面会先查它的链上时间并硬性核对,不合格直接停,免得又误判成产品有问题。
OLD_TX="${OLD_TX:-}"
# 认款回执:机器人的助记词签一份 Order{id,did,hash} 交给 hidid。
# 失败时 hidid 会把三方(club)的拒绝原因顺着 grpc status 带回来,所以 stderr 也要收。
notify(){ MN_FILE="${ROBOT_MN:?}" /tmp/coin_probe --notify-pay "$1" "$2" "$3" 2>&1; }
# 链上事实(Transfer.TxDetail,只报事实)。用来核对诱饵够不够旧。
txtime(){ MN_FILE="${ROBOT_MN:?}" /tmp/coin_probe --tx-detail "$1" "$2" 2>/dev/null | sed -n "s/^timestamp=//p"; }
SKEW=300   # 与 club 的 orderClockSkew 一致(5 分钟)
pass=0; fail=0
ok(){ printf "  \033[32m✓\033[0m %s\n" "$1"; pass=$((pass+1)); }
bad(){ printf "  \033[31m✗\033[0m %s  (%s)\n" "$1" "$2"; fail=$((fail+1)); }
chk(){ [ "$2" = "$3" ] && ok "$1" || bad "$1" "want=$3 got=$2"; }
hasany(){ local w="$1" o="$2"; shift 2
  for p in "$@"; do case "$o" in *"$p"*) ok "$w"; return;; esac; done
  bad "$w" "都没命中:$(echo "$o"|head -c 200)"; }
have_db || { echo "够不着 mysql —— 本机没装 mysql 时会 ssh 到 $DB 去查,检查那条路。" >&2; exit 2; }
[ -x /tmp/coin_probe ] || { echo "缺 /tmp/coin_probe(core-mqtt,--features testkit)" >&2; exit 2; }
Q(){ mysqlq "$1" "$2"; }
# 前提:ROBOT_MN 必须是**这台机器人自己**的助记词 —— 转账、回执签名都用它,
# 第六节「主人查得到仆从机器人的交易」判的正是 payer = 机器人 did。
# 给成主人的助记词,钱照样付得出去、认款照样成,只有第六节红 —— 看着像范围的 bug(2026-09-25 栽过)。
MNDID=$(MN_FILE="${ROBOT_MN:?}" /tmp/coin_probe "$COIN" 2>/dev/null | sed -n "s/^钱包 did=//p")
[ "$MNDID" = "${ROBOT_DID:?需要 ROBOT_DID}" ] || { echo "ROBOT_MN 是 ${MNDID:-?} 的助记词,不是机器人 $ROBOT_DID 的 —— 前提不成立,不跑" >&2; exit 2; }
cs(){ curl -s $CAC -m 120 -X POST "$CLUB_API/$1" -H 'Content-Type: application/json' -H "Authorization: Bearer $STOK" -d "$2"; }
cb(){ curl -s $CAC -m 120 -X POST "$CLUB_API/$1" -H 'Content-Type: application/json' -H "Authorization: Bearer $BTOK" -d "$2"; }
cr(){ curl -s $CAC -m 120 -X POST "$CLUB_API/$1" -H 'Content-Type: application/json' -H "Authorization: Bearer $RTOK" -d "$2"; }
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
# 钱打到 payeeAccount(摊主是软件机器人时是它的主人);payee 只是「你在付给谁」,用它找地址会找不到
OPAYACC=$(echo "$A"|g data pay payeeAccount)
OMCH=$(echo "$A"|g data order merchant)
# **对外给出去的是付款凭据号**,不是主订单号 —— 付款、回调、人工查账用的都是它。
PID=$(echo "$A"|g data order payment payId)
echo "  grant=$G order=$OID  $OAMT $OCOIN → $OPAYEE(回执报给 $OMCH)"
[ -n "$OID" ] && ok "**Apply 返回了订单号**" || bad "没有订单号" "$(echo "$A"|head -c 200)"
[ -n "$PID" ] && ok "**订单带出了付款凭据号**(对外给的是它)" || bad "订单没带凭据" "$(echo "$A"|head -c 250)"
case "$PID" in MKP-*) ok "凭据号带 MKP- 前缀(回调靠它分流)";; *) bad "凭据号前缀不对" "got=$PID";; esac
chk "订单币种" "$OCOIN" "$COIN"; chk "订单金额" "$OAMT" "$PRICE"
chk "**订单写明了给哪台机器人**(扩展性靠它)" "$OTGT" "$RB"
# merchant 必须由订单带出来 —— 机器人硬编码它就意味着换环境要刷全网设备。
# 而且它**不等于收款方**:钱给卖家,回执给市场。
[ -n "$OMCH" ] && ok "**订单带出了商户DID**(回执报给谁)" || bad "订单没带 merchant" "付款方将无处上报"
[ "$OMCH" != "$OPAYEE" ] && ok "商户DID 与收款方是两个人(钱给卖家,回执给市场)" \
  || bad "merchant 等于 payee" "多半是拿收款方顶替了商户,回调会打进黑洞"

echo
echo "── 二、闸③:拿一笔**早于下单**的旧转账去认新单 ──"
if [ -n "$OLD_TX" ]; then
  # 先证明这个诱饵**确实够旧**。不核对的话,一笔刚转的钱会被闸③正常放行,
  # 而输出看起来就像"闸③失效了" —— 踩过一次,白白多花了两笔钱才看明白。
  OT=$(txtime "$OCOIN" "$OLD_TX")
  ONOW=$(date +%s)
  if [ -z "$OT" ] || [ "$OT" = "0" ]; then
    bad "闸③没验" "取不到 OLD_TX 的链上时间(state 可能不是 success)"
  elif [ $(( ONOW - OT/1000 )) -le $SKEW ]; then
    bad "闸③没验" "OLD_TX 只比现在早 $(( ONOW - OT/1000 ))s,没超过 ${SKEW}s 容差 —— 它本来就该被放行,换一笔更早的"
  else
    ok "诱饵够旧(比现在早 $(( ONOW - OT/1000 ))s,超过 ${SKEW}s 容差)"
    # 认款是**两段**的(见第三节):回执只收下 hash、立刻回成功,闸③在异步核验里判。
    # 所以判据是**核验的结论**:凭据被否(5),且理由说的正是闸③ —— 被闸②(收款方/金额不符)否掉
    # 也是 5,只看状态会让一张没搭对的用例冒充闸③生效(「被拒了」不是判据)。
    R3=$(notify "$PID" "$OMCH" "$OLD_TX")
    case "$R3" in *"回执已交给 hidid"*) ok "旧转账的回执被收下(两段式:先收下,再核验)";;
      *) bad "旧转账的回执没送到" "$(echo "$R3"|head -c 200)";; esac
    for _ in $(seq 60); do [ "$(Q hi_club "SELECT status FROM hi_club_market_payment WHERE pay_id='$PID';")" = "4" ] || break; sleep 1; done
    chk "**旧转账认不了新单**:凭据被否(5)" "$(Q hi_club "SELECT status FROM hi_club_market_payment WHERE pay_id='$PID';")" "5"
    hasany "否掉的理由是闸③(早于开凭据)" "$(Q hi_club "SELECT reason FROM hi_club_market_payment WHERE pay_id='$PID';")" \
      "早于付款凭据创建时间"
    chk "业务单仍待付款(0)" "$(Q hi_club "SELECT status FROM hi_club_market_order WHERE order_id='$OID';")" "0"
    # 这张凭据已被否,第三节要一张干净的 —— 与付款方重开付款页同一条路
    PID=$(cb market/issue_payment "{\"order_id\":\"$OID\"}" | g data payment payId)
    case "$PID" in MKP-*) ok "闸③之后换开一张新凭据 $PID";; *) bad "换凭据失败" "got=$PID";; esac
  fi
else
  bad "闸③没验" "没给 OLD_TX —— 这是本脚本最该验的一条,别跳过"
fi

echo
echo "── 三、负面:链上查不到的 hash ──"
# 认款是**两段**的:回执只收下 hash(REPORTED)、立刻回成功,链上核验异步做(见 club Market.OnPaid)。
# 所以判据不是「回执被拒」,而是**收下了却不放行**:授权仍申请中、业务单仍待付款。
notify "$PID" "$OMCH" "0x$(printf '%064d' 7)" >/dev/null
sleep 5
chk "假 tx:凭据只是「已上报」(4),没认款" "$(Q hi_club "SELECT status FROM hi_club_market_payment WHERE pay_id='$PID';")" "4"
chk "假 tx:授权仍是申请中(1)" "$(Q hi_club "SELECT status FROM hi_club_market_grant WHERE uuid='$G';")" "1"
chk "假 tx:业务单仍待付款(0)" "$(Q hi_club "SELECT status FROM hi_club_market_order WHERE order_id='$OID';")" "0"
# 那张凭据被假 tx 占住了(等链上确认),真付款要换一张 —— 与付款方重开付款页同一条路
PID=$(cb market/issue_payment "{\"order_id\":\"$OID\"}" | g data payment payId)
case "$PID" in MKP-*) ok "换开了一张新凭据 $PID";; *) bad "换凭据失败" "got=$PID";; esac

# 前三节不花钱(开单、旧转账认新单、查不到的 hash),而且正好走「上报交易号 → 按 hash 占位」那条写入路径。
# 只想验这一段时给 NO_REAL_TRANSFER=1:到这里如实报「四到六节没验」就停,不往链上转钱。
if [ "${NO_REAL_TRANSFER:-}" = "1" ]; then
  echo
  echo "  — 没验:四、五、六节(NO_REAL_TRANSFER=1,不做真转账)"
  NO_REAL_TRANSFER_DONE=1
fi

if [ -z "${NO_REAL_TRANSFER_DONE:-}" ]; then

echo
echo "── 四、真转账 → 认款 → 履约 ──"
CHAIN=$(Q hi_did "SELECT chain FROM hi_coin WHERE name='$OCOIN' AND deleted_at IS NULL;")
PAYEE_ADDR=$(Q hi_did "SELECT address FROM hi_user_wallet WHERE did='$OPAYACC' AND chain='$CHAIN';")
[ -n "$PAYEE_ADDR" ] && ok "收款方 did 解析出 $CHAIN 地址" || bad "收款方没注册地址" "核验必挂"
TX=$(MN_FILE="${ROBOT_MN:?}" /tmp/coin_probe --pay "$OCOIN" "$PAYEE_ADDR" "$OAMT" 2>&1 | grep -o "tx_hash=0x[0-9a-f]*" | cut -d= -f2)
[ -n "$TX" ] && ok "真转账 tx=$TX" || { bad "转账失败" "-"; echo "结果:通过 $pass,失败 $((fail+1))"; exit 1; }
sleep 6
R=$(notify "$PID" "$OMCH" "$TX")
case "$R" in *"回执已交给 hidid"*) ok "**回执收下**(经 hidid 回调 club)";; *) bad "回执失败" "$(echo "$R"|head -c 250)";; esac
# 链上核验是异步的(先立刻试一次,不成交给周期任务),等它走完再查
for _ in $(seq 120); do [ "$(Q hi_club "SELECT status FROM hi_club_market_payment WHERE pay_id='$PID';")" = "1" ] && break; sleep 1; done
chk "凭据置为已认款(1)" "$(Q hi_club "SELECT status FROM hi_club_market_payment WHERE pay_id='$PID';")" "1"
chk "业务单置为已付(1)" "$(Q hi_club "SELECT status FROM hi_club_market_order WHERE order_id='$OID';")" "1"
chk "授权置为已装载(3)" "$(Q hi_club "SELECT status FROM hi_club_market_grant WHERE uuid='$G';")" "3"
chk "**ai 侧真的插了引用行**" \
  "$(Q hi_ai "SELECT COUNT(*) FROM hi_ai_plugin_using WHERE agent_did='$RB' AND uuid='$P' AND source='reference' AND deleted_at IS NULL;")" "1"

# 卖家的通知(2026-09-24 起):付费档**下单时不通知卖家**,到账成立时发 plugin-grant-sold。
# 判据是通知历史表 —— 后端从 MQTT 收到才记,所以记下了 = 真经 broker 投到了卖家的单聊 topic。
SM=$(Q hi_club "SELECT from_master FROM hi_club_market_grant WHERE uuid='$G';")
nq(){ Q hi_club "SELECT COUNT(*) FROM hi_chat_notice WHERE to_did='$SM' AND JSON_UNQUOTE(JSON_EXTRACT(payload,'\$.notice.type'))='$1' AND JSON_UNQUOTE(JSON_EXTRACT(payload,'\$.notice.extra.grantUuid'))='$G';"; }
SOLD=0; for _ in $(seq 20); do SOLD=$(nq plugin-grant-sold); [ "$SOLD" = "1" ] && break; sleep 1; done
chk "**到账那一刻卖家收到 plugin-grant-sold**(且只一条)" "$SOLD" "1"
chk "下单时卖家**没收到**申请通知(付费档不用卖家决定)" "$(nq plugin-grant-request)" "0"

if [ "$RTOK" = "-" ]; then
  # 拿机器人自己的 token 要用它的助记词登录 —— 那会把正在跑的机器人挤下线(异地登录),
  # 于是这两节只能在拿得到它 token 的时候跑。不跑就如实报「没验」,不算过。
  bad "五、六节没验" "RTOK=- (没有机器人本人的 token)"
else
echo
echo "── 五、同一笔 tx 认不了第二张单 ──"
O2=$(cr market/create_renew_order "{\"grant_uuid\":\"$G\"}")
OID2=$(echo "$O2"|g data orderId); PID2=$(echo "$O2"|g data payment payId)
[ -n "$OID2" ] && ok "机器人自己开出续期单(它掏钱,所以它能开)" || bad "开续期单失败" "$(echo "$O2"|head -c 200)"
OMCH2=$(echo "$O2"|g data merchant)
[ "$PID2" != "$PID" ] && ok "**续期是另一张凭据**(号不复用)" || bad "凭据号复用了" "got=$PID2"
chk "续期单带的商户DID 与首购一致" "$OMCH2" "$OMCH"
hasany "**旧 tx 认不了新单**(全局唯一)" "$(notify "$PID2" "$OMCH" "$TX")" \
  "已经被用过" "用过"

echo
echo "── 六、交易记录:范围靠当事人限死 ──"
# 机器人自己掏钱付的(payer = 机器人 did),**主人要查得到那笔账** ——
# 这正是 ListTransactions 收 did 的理由。
# 用**主人**的 token、指定这台机器人 —— did 参数的口子只有这样才被走到(机器人自己查自己不经过它)。
TXM=$(cb market/list_transactions "{\"did\":\"$RB\"}")
case "$TXM" in *"$PID"*) ok "**主人查得到仆从机器人的交易**(凭据号在列表里)";;
  *) bad "主人查不到机器人的交易" "$(echo "$TXM"|head -c 200)";; esac
# 卖家是收款方,同一笔也应该查得到 —— 一笔交易两头都是当事人。
case "$(cs market/list_transactions '{}')" in *"$PID"*) ok "收款方(卖家)也查得到同一笔";;
  *) bad "卖家查不到" "收款方本该是当事人";; esac
# 负面两条:范围是这个接口唯一在守的东西,守不住就等于没有。
hasany "负面:拿别人的 did 当主体被拒" "$(cs market/list_transactions "{\"did\":\"$RB\"}")" \
  "不是你的机器人"
hasany "负面:不相干的凭据号查不到" "$(cb market/get_transaction '{"pay_id":"MKP-not-mine"}')" \
  "不存在或与你无关"
fi

fi # NO_REAL_TRANSFER_DONE

echo
echo "── 清理 ──"
cs market/revoke "{\"grant_uuid\":\"$G\",\"reason\":\"test\"}" >/dev/null
Q hi_club "DELETE FROM hi_club_market_payment WHERE order_id IN (SELECT order_id FROM hi_club_market_order WHERE grant_uuid='$G'); DELETE FROM hi_club_market_order WHERE grant_uuid='$G'; DELETE FROM hi_club_market_flow WHERE grant_uuid='$G'; DELETE FROM hi_club_market_grant WHERE uuid='$G'; DELETE FROM hi_club_market_listing WHERE uuid='$L';"
cs plugin/delete_shell "{\"agent\":\"$SB\",\"uuid\":\"$P\"}" >/dev/null
cs agent/delete "{\"agent\":\"$SB\"}" >/dev/null
echo
echo "结果:通过 $pass,失败 $fail"
[ "$fail" -eq 0 ]
