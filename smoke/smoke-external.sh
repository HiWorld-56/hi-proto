#!/bin/bash
# EXTERNAL 结算:商户来拉(Pull)+ 回传(Notify)。
#
# 为什么这条链是"商户来拉"而不是 club 推:**club 手里一把私钥都没有**。
# 让 club 主动回调三方,就得由 club 去证明"这条通知是我发的" —— 它证明不了。
# 反过来由持私钥的商户来拉、来回传,签名方向与"谁持有密钥"天然对齐,
# club 只需要**验签**(同 hidid PC 端那套)。
#
# ⚠️ 只验"正常放行"没有意义 —— 这条链的价值全在**几道闸**上:
#    验签、签名者必须是收款方、幂等键、重复回调不能重复放行。
#    闸漏一道,任何持私钥的人就能把别人的订单标成已支付。
set -uo pipefail
source "$(dirname "$0")/_endpoints.sh"   # 端点/CA 统一约定(前端可达→域名 TLS,内部→内网 IP)
GRPCURL=/tmp/grpcurl
PB=/tmp/hi.protoset
DB=192.168.1.65
STOK="${1:?用法: smoke-external.sh <卖方token> <买方token> <插件包url>}"
BTOK="${2:?需要买方 token}"
PKG="${3:?需要插件包 url}"
SELLER_MN="${SELLER_MN:-/tmp/seller_mn.txt}"
BUYER_MN="${BUYER_MN:-/tmp/buyer_mn.txt}"
pass=0; fail=0
ok(){ printf "  \033[32m✓\033[0m %s\n" "$1"; pass=$((pass+1)); }
bad(){ printf "  \033[31m✗\033[0m %s  (%s)\n" "$1" "$2"; fail=$((fail+1)); }
has(){ case "$2" in *"$3"*) ok "$1";; *) bad "$1" "输出里没有 '$3':$(echo "$2"|head -c 160)";; esac; }
chk(){ [ "$2" = "$3" ] && ok "$1" || bad "$1" "want=$3 got=$2"; }
have_db || { echo "够不着 mysql —— 本机没装 mysql 时会 ssh 到 $DB 去查,检查那条路。" >&2; exit 2; }
[ -x /tmp/didsign ] || { echo "缺 /tmp/didsign(core-mqtt 的 didsign,--features testkit 编)。" >&2; exit 2; }
Q(){ mysqlq "$1" "$2"; }
cjs(){ curl -s $CAC -m 60 -X POST "$CLUB_API/$1" -H 'Content-Type: application/json' -H "Authorization: Bearer $STOK" -d "$2"; }
cjb(){ curl -s $CAC -m 60 -X POST "$CLUB_API/$1" -H 'Content-Type: application/json' -H "Authorization: Bearer $BTOK" -d "$2"; }
g(){ python3 -c '
import sys,json
try:
    d=json.load(sys.stdin)
    for k in sys.argv[1:]: d=d[k]
    print(d)
except Exception: print("")
' "$@"; }

# 签一段 json,组装成 hi.SignedData。**signature 是 hex,不是 base64**(参数名就叫 sigHex)。
signed(){ # $1=助记词文件 $2=payload json
  MN_FILE="$1" python3 - "$2" <<'PYEOF'
import base64, json, os, subprocess, sys
raw = json.dumps(json.loads(sys.argv[1]), ensure_ascii=False, separators=(",", ":"))
sig = subprocess.run(["/tmp/didsign", raw], capture_output=True, text=True,
                     env={**os.environ}).stdout.strip()
print(json.dumps({"data": base64.b64encode(raw.encode()).decode(), "signature": sig}))
PYEOF
}
rpc(){ $GRPCURL $(tp $CLUB_GRPC) -protoset $PB -max-time 30 -d "$2" $CLUB_GRPC "$1" 2>&1; }

echo "── 准备:EXTERNAL 挂牌 + 买方申请 ──"
SB=$(cjs agent/create_assistant '{"name":"ext-seller"}' | g data base did)
BB=$(cjb agent/create_assistant '{"name":"ext-buyer"}' | g data base did)
[ -z "$SB" ] || [ -z "$BB" ] && { echo "建机器人失败"; exit 1; }
cjs api_key/create "{\"agent\":\"$SB\"}" >/dev/null; cjb api_key/create "{\"agent\":\"$BB\"}" >/dev/null
P=$(cjs plugin/create_shell "{\"agent\":\"$SB\",\"name\":\"ext-demo\"}" | g data uuid)
cjs plugin/create_version "{\"agent\":\"$SB\",\"version\":{\"uuid\":\"$P\",\"version\":\"1.0.0\",\"url\":\"$PKG\"}}" >/dev/null
L=$(cjs market/create_listing "{\"agent\":\"$SB\",\"plugin_uuid\":\"$P\",\"settle_mode\":4,\"title\":\"外部结算测试\",\"action_url\":\"https://example/apply\"}" | g data uuid)
cjs market/set_listing_status "{\"uuid\":\"$L\",\"status\":2}" >/dev/null
G=$(cjb market/apply "{\"listing_uuid\":\"$L\",\"to_agent\":\"$BB\"}" | g data grantUuid)
SELLER_DID=$(MN_FILE=$SELLER_MN /tmp/didsign --did)
# ⚠️ 这一行原来打的是**助记词**的 did,却写成 "master=" —— 把一个假设显示成了事实。
#    实际的出让方 master 由 SELLER_TOK 决定,库里才是真值。
REAL_MASTER=$(mysqlq hi_club "SELECT from_master FROM hi_club_market_grant WHERE uuid='$G';")
echo "  卖方=$SB(master=$REAL_MASTER) 买方=$BB 授权=$G  签名用=$SELLER_DID"
# **前提先自证**:卖方 token 与卖方助记词必须是同一个人,否则闸②(签名者必须是收款方)
# 会拦下正路,而报出来的是"签名者不是这笔授权的收款方" —— 看着像产品坏了,实际是参数配错。
# 踩过一次:传了另一个用户的 token,一路红到第六条断言才看明白。
if [ -n "$REAL_MASTER" ] && [ "$REAL_MASTER" != "$SELLER_DID" ]; then
  echo "卖方 token 的 master 是 $REAL_MASTER,而 SELLER_MN($SELLER_MN)是 $SELLER_DID —— 不是同一个人,换对再跑。" >&2
  exit 2
fi
[ -n "$G" ] && ok "EXTERNAL 申请已受理(待商户处理)" || bad "申请失败" "拿不到 grant_uuid"

echo
echo "── 一、Pull:商户拉自己名下的待办 ──"
NOW=$(date +%s); N1=$(python3 -c "import uuid;print(uuid.uuid4().hex)")
R=$(rpc hi.club.MarketCallback/Pull "$(signed $SELLER_MN "{\"nonce\":\"$N1\",\"timestamp\":$NOW}")")
has "拉到了自己的单子" "$R" "$G"

echo
echo "── 二、闸 ①:签名坏掉 → 拒 ──"
BADSIG=$(signed $SELLER_MN "{\"nonce\":\"x\",\"timestamp\":$NOW}" | python3 -c '
import sys,json
d=json.load(sys.stdin); d["signature"]="deadbeef"*8; print(json.dumps(d))')
has "坏签名被拒" "$(rpc hi.club.MarketCallback/Pull "$BADSIG")" "Unauthenticated"

echo
echo "── 三、闸 ②:**签名者必须是收款方** ──"
# 买方拿自己的私钥去 Notify 卖方的单子。只验签不比对主体的话,
# 任何持私钥的人都能把别人的订单标成已支付 —— 这是这条链最要紧的一道闸。
OUT1=$(python3 -c "import uuid;print(uuid.uuid4().hex)")
R=$(rpc hi.club.MarketCallback/Notify "$(signed $BUYER_MN "{\"grantUuid\":\"$G\",\"outerId\":\"$OUT1\",\"result\":\"approved\"}")")
has "**别人签名改不了我的单子**" "$R" "签名者不是这笔授权的收款方"
chk "而且这笔仍未放行" "$(Q hi_club "SELECT status FROM hi_club_market_grant WHERE uuid='$G';")" "1"

echo
echo "── 四、闸 ③:幂等键不能空 / 单子必须存在 ──"
has "空 outer_id 被拒" \
  "$(rpc hi.club.MarketCallback/Notify "$(signed $SELLER_MN "{\"grantUuid\":\"$G\",\"outerId\":\"\",\"result\":\"approved\"}")")" "幂等键"
has "不存在的授权被拒" \
  "$(rpc hi.club.MarketCallback/Notify "$(signed $SELLER_MN "{\"grantUuid\":\"NO-SUCH-GRANT\",\"outerId\":\"$OUT1\",\"result\":\"approved\"}")")" "授权不存在"

echo
echo "── 五、正路:商户回传 approved → 放行 ──"
OUT2=$(python3 -c "import uuid;print(uuid.uuid4().hex)")
R=$(rpc hi.club.MarketCallback/Notify "$(signed $SELLER_MN "{\"grantUuid\":\"$G\",\"outerId\":\"$OUT2\",\"result\":\"approved\"}")")
case "$R" in *"{}"*|"") ok "回传成功";; *) bad "回传失败" "$(echo "$R"|head -c 160)";; esac
sleep 1
chk "授权置为已装载(3)" "$(Q hi_club "SELECT status FROM hi_club_market_grant WHERE uuid='$G';")" "3"
chk "**ai 侧真的插了引用行**(不只是 club 记一笔)" \
    "$(Q hi_ai "SELECT COUNT(*) FROM hi_ai_plugin_using WHERE agent_did='$BB' AND uuid='$P' AND source='reference' AND deleted_at IS NULL;")" "1"

echo
echo "── 六、闸 ④:重复回调 → **返回成功但不重复放行** ──"
# 报错会让对方无限重试,所以这里返回成功;但业务上不能再动一次。
R=$(rpc hi.club.MarketCallback/Notify "$(signed $SELLER_MN "{\"grantUuid\":\"$G\",\"outerId\":\"$OUT2\",\"result\":\"approved\"}")")
case "$R" in *"{}"*|"") ok "重复回调返回成功(不报错,免得对方无限重试)";; *) bad "重复回调报错了" "$(echo "$R"|head -c 160)";; esac
chk "flow 里这一笔仍只有一条" "$(Q hi_club "SELECT COUNT(*) FROM hi_club_market_flow WHERE grant_uuid='$G' AND outer_id='$OUT2';")" "1"

echo
echo "── 清理 ──"
cjs market/revoke "{\"grant_uuid\":\"$G\",\"reason\":\"test\"}" >/dev/null
Q hi_club "DELETE FROM hi_club_market_flow WHERE grant_uuid='$G'; DELETE FROM hi_club_market_grant WHERE uuid='$G'; DELETE FROM hi_club_market_listing WHERE uuid='$L';"
cjs plugin/delete_shell "{\"agent\":\"$SB\",\"uuid\":\"$P\"}" >/dev/null
cjs agent/delete "{\"agent\":\"$SB\"}" >/dev/null; cjb agent/delete "{\"agent\":\"$BB\"}" >/dev/null
echo
echo "结果:通过 $pass,失败 $fail"
[ "$fail" -eq 0 ]
