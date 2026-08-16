#!/bin/bash
# 对话路 / 多 function call / 插件市场 的端到端冒烟。
#
# 为什么单独一个脚本:smoke.sh 覆盖的是"接口存不存在、鉴权收不收"这一层,
# 而这三块的坑全在**行为**上 —— 编译过、校验脚本也过,接口照样返回 success,
# 只是干的事不对。今天一天抓到九个,没有一个是编译或 lint 能发现的。
#
# ⚠️ **验证 function call 一律看「插件真的跑没跑」,不看模型最后那句话。**
#    工具没被调用时模型会自己编一个看起来完全合理的答复(实测:问 137+486
#    它自己算出 623 交差)。所以测试插件里放了一个**模型不可能猜到**的 magic 值,
#    答复里出现了才算数。
#
# 用法:bash smoke-market.sh          非 0 退出 = 有失败项
#      SKIP_CHAT=1 bash smoke-market.sh   跳过耗时的对话用例
set -uo pipefail

CLUB=192.168.1.65:9537
AI=192.168.1.65:9535
DB=192.168.1.65
MAGIC="HI-MKT-7Q3XZ9"     # 测试插件 secret_token() 的返回值
# ⚠️ **没有 mysql 客户端就直接退出,不要硬着头皮往下跑。**
#    库里那些断言会全部变成 "want=1 got=",看上去像产品坏了 ——
#    实际只是这台机器没装客户端。踩过一次,查了十几分钟才发现。
#    (mysql 在 .65 上;.64 是构建机,没有。)
command -v mysql >/dev/null || {
  echo "缺 mysql 客户端 —— 本脚本有一半断言要查库。请在 .65 上跑,或先装 mysql-client。" >&2
  exit 2
}

pass=0; fail=0

ok()  { printf "  \033[32m✓\033[0m %s\n" "$1"; pass=$((pass+1)); }
bad() { printf "  \033[31m✗\033[0m %s  (%s)\n" "$1" "$2"; fail=$((fail+1)); }
chk() { [ "$2" = "$3" ] && ok "$1" || bad "$1" "want=$3 got=$2"; }
has() { case "$2" in *"$3"*) ok "$1";; *) bad "$1" "输出里没有 '$3':$(echo "$2"|head -c 160)";; esac; }
no()  { case "$2" in *"$3"*) bad "$1" "不该出现 '$3'";; *) ok "$1";; esac; }

cj()  { curl -s -m 120 -X POST "http://$CLUB/api/v1/$1" -H 'Content-Type: application/json' -H "Authorization: Bearer $3" -d "$2"; }
# ⚠️ 对话一律走 **club**,不打 hi-ai 直连:机器人的 apikey 是 club 原生的
#    (hi_chat_api_key),hi-ai 有它自己的一套,两边不通用;而且 app→club→ai 才是真实链路。
#    只有"老路由还在不在"这类探针才直接打 ai。
ai_probe() { curl -s -m 30 -X POST "http://$AI/api/v1/$1" -H 'Content-Type: application/json' -d '{}'; }
pub() { curl -s -m 60 -X POST "http://$CLUB/api/v1/$1" -H 'Content-Type: application/json' -d "$2"; }
q()   { mysql -h$DB -ulo -p568568 "$1" -N -e "$2" 2>/dev/null; }
g()   { python3 -c '
import sys, json
try:
    d = json.load(sys.stdin)
    for k in sys.argv[1:]:
        d = d[k]
    print(d)
except Exception:
    print("")
' "$@"; }

SELLER_TOK="${SELLER_TOK:?需要卖方用户 token}"
BUYER_TOK="${BUYER_TOK:?需要买方用户 token}"
SELLER_DID="${SELLER_DID:?需要卖方用户 did}"
PKG="${PKG:?需要测试插件包 url}"

echo "── 准备:两台机器人 + apikey + 多方法插件 ──"
SB=$(cj agent/create_assistant '{"name":"smk-seller"}' "$SELLER_TOK" | g data base did)
BB=$(cj agent/create_assistant '{"name":"smk-buyer"}' "$BUYER_TOK" | g data base did)
SK_=$(cj api_key/create "{\"agent\":\"$SB\"}" "$SELLER_TOK" | g data info value)
BK=$(cj api_key/create "{\"agent\":\"$BB\"}" "$BUYER_TOK" | g data info value)
P=$(cj plugin/create_shell "{\"agent\":\"$SB\",\"name\":\"smk-demo\",\"data\":{\"ext-str\":\"注入生效\"}}" "$SELLER_TOK" | g data uuid)
VR=$(cj plugin/create_version "{\"agent\":\"$SB\",\"version\":{\"uuid\":\"$P\",\"version\":\"1.0.0\",\"url\":\"$PKG\"}}" "$SELLER_TOK")
[ -n "$SB" ] && [ -n "$BB" ] && [ -n "$P" ] || { echo "准备失败"; exit 1; }
echo "  seller=$SB buyer=$BB plugin=$P"

echo
echo "── 一、对话路合并(阶段 0)──"
R=$(ai_probe chat/complete)
has "老路由 /chat/complete 已消失" "$R" '"code":5'
R=$(cj chat/converse "{\"agent\":\"$SB\",\"cid\":\"smk-1\",\"conts\":[{\"type\":\"text\",\"chat\":{\"content\":\"用一句话回答:2+2等于几\"}}]}" "$SELLER_TOK")
chk "无工具:一次调用拿到最终答复" "$(echo "$R"|g data final)" "True"

if [ "${SKIP_CHAT:-0}" != "1" ]; then
  R=$(cj chat/converse "{\"agent\":\"$SB\",\"cid\":\"smk-2\",\"conts\":[{\"type\":\"text\",\"chat\":{\"content\":\"查北京天气,必须用工具\"}}],\"tools\":[{\"type\":\"function\",\"function\":{\"name\":\"get_weather\",\"description\":\"查天气\",\"parameters\":{\"type\":\"object\",\"properties\":{\"city\":{\"type\":\"string\"}},\"required\":[\"city\"]}}}]}" "$SELLER_TOK")
  chk "客户端工具:中途返回(final=false)" "$(echo "$R"|g data final)" "False"
  TID=$(echo "$R"|g data result)
  CID=$(echo "$R" | python3 -c 'import sys,json;print(json.load(sys.stdin)["data"]["tools"][0]["id"])' 2>/dev/null)
  R=$(cj chat/resume "{\"id\":\"$TID\",\"list\":[{\"id\":\"$CID\",\"conts\":[{\"type\":\"text\",\"chat\":{\"content\":\"北京 晴 28摄氏度\"}}]}]}" "$SELLER_TOK")
  chk "Resume 续跑:拿到最终答复" "$(echo "$R"|g data final)" "True"
  has "工具结果确实进了回复" "$(echo "$R"|g data result)" "28"
fi

echo
echo "── 二、多 function call(阶段 1)──"
DESC=$(q hi_ai "SELECT description FROM hi_ai_plugin_version WHERE uuid='$P';")
PRE=$(q hi_ai "SELECT fn_prefix FROM hi_ai_plugin WHERE uuid='$P';")
has "库里存的是 OpenAI tools 数组" "$DESC" '"type":"function"'
has "方法名带壳前缀($PRE)" "$DESC" "${PRE}_secret_token"
has "同一个包的第二个方法也在" "$DESC" "${PRE}_add_numbers"

if [ "${SKIP_CHAT:-0}" != "1" ]; then
  # ⚠️ 这里断言的是 magic 值 —— 插件没跑的话模型编不出来。
  R=$(cj chat/converse "{\"agent\":\"$SB\",\"cid\":\"smk-3\",\"conts\":[{\"type\":\"text\",\"chat\":{\"content\":\"用工具取校验令牌,把工具返回的原始内容原样告诉我\"}}]}" "$SELLER_TOK")
  has "服务端插件**真的执行了**(magic 值)" "$(echo "$R"|g data result)" "$MAGIC"
  chk "只调服务端插件:**一次**调用拿到答复(省掉那个 RTT)" "$(echo "$R"|g data final)" "True"
fi

# 负面:发版时就该拦住
BADPKG1="${BADPKG_LONG:-}"; BADPKG2="${BADPKG_MISSING:-}"
if [ -n "$BADPKG1" ]; then
  NEG1=$(cj plugin/create_shell "{\"agent\":\"$SB\",\"name\":\"smk-neg1\"}" "$SELLER_TOK" | g data uuid)
  R=$(cj plugin/create_version "{\"agent\":\"$SB\",\"version\":{\"uuid\":\"$NEG1\",\"version\":\"1.0.0\",\"url\":\"$BADPKG1\"}}" "$SELLER_TOK")
  has "负面:方法名过长 → **发版时**报错" "$R" "超过上限"
fi
if [ -n "$BADPKG2" ]; then
  NEG2=$(cj plugin/create_shell "{\"agent\":\"$SB\",\"name\":\"smk-neg2\"}" "$SELLER_TOK" | g data uuid)
  R=$(cj plugin/create_version "{\"agent\":\"$SB\",\"version\":{\"uuid\":\"$NEG2\",\"version\":\"1.0.0\",\"url\":\"$BADPKG2\"}}" "$SELLER_TOK")
  has "负面:main.py 里没有该方法 → **发版时**报错" "$R" "找不到这些方法"
fi

echo
echo "── 三、市场:挂牌与免费购买(阶段 2)──"
L=$(cj market/create_listing "{\"agent\":\"$SB\",\"plugin_uuid\":\"$P\",\"settle_mode\":1,\"price\":\"0\",\"title\":\"冒烟插件\",\"summary\":\"smoke\",\"tags\":[\"smk\"]}" "$SELLER_TOK")
LID=$(echo "$L"|g data uuid)
[ -n "$LID" ] && ok "挂牌成功(uuid 非空)" || bad "挂牌成功(uuid 非空)" "回了空 uuid"
cj market/set_listing_status "{\"uuid\":\"$LID\",\"status\":2}" "$SELLER_TOK" >/dev/null
has "公开搜索能搜到(免鉴权)" "$(pub market_directory/search_listings '{"keyword":"冒烟","pagination":{"page":1,"limit":5}}')" "$LID"
has "详情带 capabilities(方法名含壳前缀)" "$(pub market_directory/get_listing "{\"uuid\":\"$LID\"}")" "${PRE}_"
has "负面:拿别人的机器人挂牌被拒" "$(cj market/create_listing "{\"agent\":\"$SB\",\"plugin_uuid\":\"$P\",\"settle_mode\":1,\"title\":\"偷挂\"}" "$BUYER_TOK")" "不属于你"

A=$(cj market/apply "{\"listing_uuid\":\"$LID\",\"to_agent\":\"$BB\"}" "$BUYER_TOK")
chk "免费购买:一步到已装载" "$(echo "$A"|g data status)" "GRANT_STATUS_INSTALLED"
G=$(echo "$A"|g data grantUuid)
chk "ai 侧确实插了引用行" "$(q hi_ai "SELECT COUNT(*) FROM hi_ai_plugin_using WHERE uuid='$P' AND source='reference' AND deleted_at IS NULL;")" "1"
has "负面:有引用时卖方删壳被拒" "$(cj plugin/delete_shell "{\"agent\":\"$SB\",\"uuid\":\"$P\"}" "$SELLER_TOK")" "个引用方"

if [ "${SKIP_CHAT:-0}" != "1" ]; then
  R=$(cj chat/converse "{\"agent\":\"$BB\",\"cid\":\"smk-4\",\"conts\":[{\"type\":\"text\",\"chat\":{\"content\":\"用工具取校验令牌,原样告诉我\"}}]}" "$BUYER_TOK")
  has "**买方机器人真的用上了卖方的插件**(magic 值)" "$(echo "$R"|g data result)" "$MAGIC"
fi

cj market/revoke "{\"grant_uuid\":\"$G\",\"reason\":\"smoke\"}" "$SELLER_TOK" >/dev/null
chk "撤权后引用行被删" "$(q hi_ai "SELECT COUNT(*) FROM hi_ai_plugin_using WHERE uuid='$P' AND source='reference' AND deleted_at IS NULL;")" "0"
chk "撤权后 grant 置 revoked(5)" "$(q hi_club "SELECT status FROM hi_club_market_grant WHERE uuid='$G';")" "5"

echo
echo "── 四、付费购买:hidid 直付(阶段 4)──"
# ⚠️ 必须换一个插件:同一个 (机器人,插件) 只有一行挂牌,而 settle_mode **挂过就冻结**
#    —— 拿 $P 再挂 PAID 会被正确拒绝(那道守卫本身在上面已经间接验过)。
P2=$(cj plugin/create_shell "{\"agent\":\"$SB\",\"name\":\"smk-paid\"}" "$SELLER_TOK" | g data uuid)
cj plugin/create_version "{\"agent\":\"$SB\",\"version\":{\"uuid\":\"$P2\",\"version\":\"1.0.0\",\"url\":\"$PKG\"}}" "$SELLER_TOK" >/dev/null
L2=$(cj market/create_listing "{\"agent\":\"$SB\",\"plugin_uuid\":\"$P2\",\"settle_mode\":3,\"price\":\"9.9\",\"coin\":\"USDT-TRC20\",\"duration\":2592000,\"title\":\"冒烟付费\"}" "$SELLER_TOK")
LID2=$(echo "$L2"|g data uuid)
cj market/set_listing_status "{\"uuid\":\"$LID2\",\"status\":2}" "$SELLER_TOK" >/dev/null
A2=$(cj market/apply "{\"listing_uuid\":\"$LID2\",\"to_agent\":\"$BB\"}" "$BUYER_TOK")
G2=$(echo "$A2"|g data grantUuid)
chk "**软件机器人也能卖**(收款方=它的 master)" "$(echo "$A2"|g data pay payee)" "$SELLER_DID"
chk "回了金额" "$(echo "$A2"|g data pay amount)" "9.9"
# 订单制之后:付费购买由 Apply **顺带开出账单**;认款则**没有客户端入口** ——
# 付款方只对 hidid 上报,由 hidid 按订单里的商户DID 回调 club(hi.did.PayCallback.Pay)。
# 旧的 market/confirm_payment 与更旧的 market/report_payment 都已删。
#
# ⚠️ **认款那半边不在这里验**:它要一把私钥去签回执,而本脚本只有 token。
#    smoke-order-onchain.sh 会真转一笔上链、经 hi.did.Pay.Notify 认款,
#    把四道闸(tx 唯一 / 金额币种收款方 / 链上时间≥下单时间 / query_count)全走一遍。
#    这里只验"账单确实开出来了、字段齐不齐"。
OID2=$(echo "$A2"|g data order orderId)
[ -n "$OID2" ] && ok "付费购买**顺带开出账单**(订单号非空)" || bad "没开出账单" "$(echo "$A2"|head -c 160)"
case "$OID2" in MKT-*) ok "订单号带 MKT- 前缀(回调靠它与 trade 子单分流)";;
  *) bad "订单号没有 MKT- 前缀" "got=$OID2 —— 付款回调会被当成 trade 的单";; esac
OMCH2=$(echo "$A2"|g data order merchant)
[ -n "$OMCH2" ] && ok "订单带出商户DID(付款方据此知道回执报给谁)" || bad "订单没带 merchant" "付款方将无处上报"
# 对外给出去的是**付款凭据号**;业务单号不出系统。
PAYID=$(echo "$A2"|g data order payment payId)
case "$PAYID" in MKP-*) ok "订单带出付款凭据号(MKP- 前缀)";; *) bad "订单没带凭据号" "got=$PAYID";; esac
chk "没人付款,授权仍是待处理(1)" "$(q hi_club "SELECT status FROM hi_club_market_grant WHERE uuid='$G2';")" "1"

echo
echo "── 清理 ──"
cj market/set_listing_status "{\"uuid\":\"$LID\",\"status\":4}" "$SELLER_TOK" >/dev/null
cj market/set_listing_status "{\"uuid\":\"$LID2\",\"status\":4}" "$SELLER_TOK" >/dev/null
q hi_club "DELETE FROM hi_club_market_flow WHERE grant_uuid IN ('$G','$G2'); DELETE FROM hi_club_market_grant WHERE uuid IN ('$G','$G2'); DELETE FROM hi_club_market_listing WHERE uuid IN ('$LID','$LID2');"
cj plugin/delete_shell "{\"agent\":\"$SB\",\"uuid\":\"$P\"}" "$SELLER_TOK" >/dev/null
cj plugin/delete_shell "{\"agent\":\"$SB\",\"uuid\":\"$P2\"}" "$SELLER_TOK" >/dev/null
cj agent/delete "{\"agent\":\"$SB\"}" "$SELLER_TOK" >/dev/null
cj agent/delete "{\"agent\":\"$BB\"}" "$BUYER_TOK" >/dev/null

echo
echo "结果:通过 $pass,失败 $fail"
[ "$fail" -eq 0 ]
