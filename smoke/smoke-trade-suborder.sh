#!/bin/bash
# 中间人交易 · **子订单状态机**冒烟。
#
# 为什么单独一套:2026-08-16 把"换子订单号"从**就地改写**换成了**复制一行**,
# 一次动了三处(换号、活行判据、重试计数),而当时验证只到编译 —— 这是那次改动的敞口。
#
# 它要钉住的三件事,都是那次修掉的**静默失败**:
#   ① 换号之后**旧号还查得到** —— 原来是 UPDATE 掉这一列,旧号当场消失,
#      PC 端按旧号回来的回报查不到就被 continue 掉,一笔真实付款结果静默丢失;
#   ② 换号是**插新行**,旧行留 superseded + reason(人工查账退款的依据);
#   ③ 重试次数 = **行数**,不是内存缓存(原来存在 60s TTL 的 cache 里,
#      而链上交易远不止 60 秒:缓存一过期,失败既不重试也不记失败,单子永远停在 created)。
#
# ⚠️ 本脚本**直接在库里造子订单**,不走 Trade.Add。
#    理由:要测的是子订单状态机那一段,而建一笔真交易要两个用户、手续费、币种、
#    担保方一整套前置,那些都不是这次改动碰过的东西。**造数据的边界写在这里**,
#    别把它当成"中间人交易端到端跑通了"。
#
# ⚠️ 也不走 Order.Pull:拉单要一个由 SSE 下发给 PC 端的 nonce,脚本拿不到。
#    Pull 那侧这次的改动是"重复拉不再换号",在 ④ 用库里的行数间接钉住。
set -uo pipefail
CLUB_GRPC=192.168.1.65:9536
GRPCURL=/tmp/grpcurl
PB=/tmp/hi.protoset
DB=192.168.1.65
# PC 端(担保方 server 代理)的身份 —— 冒烟里用一把我们有私钥的助记词冒充。
PC_MN="${PC_MN:-/tmp/vclient_mn.txt}"
# 另一把私钥,用来验"别人的单动不了"。
OTHER_MN="${OTHER_MN:-/tmp/user_mn.txt}"

pass=0; fail=0
ok(){ printf "  \033[32m✓\033[0m %s\n" "$1"; pass=$((pass+1)); }
bad(){ printf "  \033[31m✗\033[0m %s  (%s)\n" "$1" "$2"; fail=$((fail+1)); }
chk(){ [ "$2" = "$3" ] && ok "$1" || bad "$1" "want=$3 got=$2"; }
command -v mysql >/dev/null || { echo "缺 mysql 客户端 —— 请在 .65 上跑。" >&2; exit 2; }
[ -x /tmp/didsign ] || { echo "缺 /tmp/didsign(core-mqtt,--features testkit 编)。" >&2; exit 2; }
[ -x "$GRPCURL" ] && [ -f "$PB" ] || { echo "缺 grpcurl / $PB。" >&2; exit 2; }
Q(){ mysql -h$DB -ulo -p568568 hi_club_trade -N -e "$1" 2>/dev/null; }

did_of(){ MN_FILE="$1" /tmp/didsign --did; }
# Order.Report:载荷是 ReportResultsData 的 JSON,用对应私钥签,走 web3(无 token)。
report(){ # $1=助记词 $2=签名者did $3=子订单号 $4=status $5=hash
  local data sig
  data=$(python3 -c '
import json,sys
print(json.dumps({"did":sys.argv[1],"orders":[{"orderId":sys.argv[2],"status":sys.argv[3],"txHash":sys.argv[4],"timestamp":"0"}]},separators=(",",":"),ensure_ascii=False))
' "$2" "$3" "$4" "$5")
  sig=$(MN_FILE="$1" /tmp/didsign "$data")
  "$GRPCURL" -protoset "$PB" -plaintext \
    -d "$(python3 -c '
import json,sys,base64
print(json.dumps({"data":base64.b64encode(sys.argv[1].encode()).decode(),"signature":sys.argv[2]}))
' "$data" "$sig")" "$CLUB_GRPC" hi.club.Order/Report 2>&1
}

PC=$(did_of "$PC_MN"); OTHER=$(did_of "$OTHER_MN")
OID="SMK-$(date +%s)"
S1="sub1-$(date +%s)"
echo "PC=$PC 其他人=$OTHER 订单=$OID"

# 造一张主订单 + 一条 CA 子订单(付款方 = PC,与真实 CA/CB 一致)。
Q "INSERT INTO hi_trade_order (order_id, \`from\`, \`to\`, status, created_at, updated_at)
   VALUES ('$OID','$PC','$OTHER','created',NOW(),NOW());"
Q "INSERT INTO hi_trade_sub_order (sub_order_id, order_id, stage, \`from\`, \`to\`, amount, fee, coin, status, created_at, updated_at)
   VALUES ('$S1','$OID','ca','$PC','$OTHER','1','0','USDT-TRC20','no_pull',NOW(),NOW());"
chk "前置:造出了一条子订单" "$(Q "SELECT COUNT(*) FROM hi_trade_sub_order WHERE order_id='$OID';")" "1"

echo
echo "── 一、闸:别人的子订单动不了 ──"
R=$(report "$OTHER_MN" "$OTHER" "$S1" "cancel" "")
chk "**别人回报不动我的单**(状态没变)" "$(Q "SELECT status FROM hi_trade_sub_order WHERE sub_order_id='$S1';")" "no_pull"
chk "也没有因此多出一行" "$(Q "SELECT COUNT(*) FROM hi_trade_sub_order WHERE order_id='$OID';")" "1"

echo
echo "── 二、失败一次:复制一行换号,旧行留档 ──"
R=$(report "$PC_MN" "$PC" "$S1" "cancel" "")
sleep 1
chk "**换号是插新行**(现在两行)" "$(Q "SELECT COUNT(*) FROM hi_trade_sub_order WHERE order_id='$OID';")" "2"
chk "**旧号还在**(原来会被 UPDATE 掉,回报就此丢失)" "$(Q "SELECT COUNT(*) FROM hi_trade_sub_order WHERE sub_order_id='$S1';")" "1"
chk "旧行置 superseded(出局但业务还在走)" "$(Q "SELECT status FROM hi_trade_sub_order WHERE sub_order_id='$S1';")" "superseded"
[ -n "$(Q "SELECT reason FROM hi_trade_sub_order WHERE sub_order_id='$S1';")" ] \
  && ok "旧行写下了 reason(人工查账退款的依据)" || bad "旧行没有 reason" "出了事没有依据"
S2=$(Q "SELECT sub_order_id FROM hi_trade_sub_order WHERE order_id='$OID' AND status='no_pull' ORDER BY id DESC LIMIT 1;")
[ -n "$S2" ] && [ "$S2" != "$S1" ] && ok "新行是新号 $S2,状态 no_pull(等 PC 重拉)" || bad "没开出新号" "got=$S2"
chk "期望值照抄(换的是凭据,不是这笔交易的内容)" "$(Q "SELECT CONCAT(amount,'/',coin,'/',\`to\`) FROM hi_trade_sub_order WHERE sub_order_id='$S2';")" "1/USDT-TRC20/$OTHER"

echo
echo "── 三、迟到的旧回报:不该把出局的行再搅活 ──"
R=$(report "$PC_MN" "$PC" "$S1" "ok" "0xLATE")
chk "出局的行不接受回报(仍是 superseded)" "$(Q "SELECT status FROM hi_trade_sub_order WHERE sub_order_id='$S1';")" "superseded"
chk "新行也没被这条迟到的回报动到" "$(Q "SELECT status FROM hi_trade_sub_order WHERE sub_order_id='$S2';")" "no_pull"

echo
echo "── 四、重试次数按**行数**算,试满判死 ──"
# 已经 2 行了,再失败 3 次就到 5 行(maxPayAttempts=5),第 5 次不再换号。
CUR="$S2"
for i in 3 4 5; do
  report "$PC_MN" "$PC" "$CUR" "cancel" "" >/dev/null
  sleep 1
  NEXT=$(Q "SELECT sub_order_id FROM hi_trade_sub_order WHERE order_id='$OID' AND status='no_pull' ORDER BY id DESC LIMIT 1;")
  [ -n "$NEXT" ] && CUR="$NEXT"
done
N=$(Q "SELECT COUNT(*) FROM hi_trade_sub_order WHERE order_id='$OID';")
chk "试满之后不再换号(行数停在 5)" "$N" "5"
chk "最后一行判死 failed(等人工,不是无限换号)" "$(Q "SELECT status FROM hi_trade_sub_order WHERE sub_order_id='$CUR';")" "failed"
chk "换号过程全部留档(4 行 superseded)" "$(Q "SELECT COUNT(*) FROM hi_trade_sub_order WHERE order_id='$OID' AND status='superseded';")" "4"

echo
echo "── 五、成功那条:填 hash 转 checking ──"
OID2="SMK2-$(date +%s)"; T1="sub2-$(date +%s)"
Q "INSERT INTO hi_trade_order (order_id, \`from\`, \`to\`, status, created_at, updated_at)
   VALUES ('$OID2','$PC','$OTHER','created',NOW(),NOW());"
Q "INSERT INTO hi_trade_sub_order (sub_order_id, order_id, stage, \`from\`, \`to\`, amount, fee, coin, status, created_at, updated_at)
   VALUES ('$T1','$OID2','ca','$PC','$OTHER','1','0','USDT-TRC20','no_pull',NOW(),NOW());"
report "$PC_MN" "$PC" "$T1" "ok" "0xSMOKEHASH" >/dev/null
sleep 1
chk "回报成功 → checking(等异步核链)" "$(Q "SELECT status FROM hi_trade_sub_order WHERE sub_order_id='$T1';")" "checking"
chk "hash 填进了对应那一行" "$(Q "SELECT hash FROM hi_trade_sub_order WHERE sub_order_id='$T1';")" "0xSMOKEHASH"
chk "成功不换号(还是一行)" "$(Q "SELECT COUNT(*) FROM hi_trade_sub_order WHERE order_id='$OID2';")" "1"

echo
echo "── 清理 ──"
Q "DELETE FROM hi_trade_sub_order WHERE order_id IN ('$OID','$OID2');"
Q "DELETE FROM hi_trade_order WHERE order_id IN ('$OID','$OID2');"

echo
echo "结果:通过 $pass,失败 $fail"
[ "$fail" -eq 0 ]
