#!/bin/bash
# hi-ai 邀请码注册(Register.Verify)只给**回调认出来的那个人**发 token —— 回归。
#
# ⛔ 2026-10-03 只读代码发现的越权(生产同一份代码):Verify 发 token 用的是**请求里客户端传的 did**,
#   不核对它等于会话里 hidid 回调认出的那个人,也不核对会话状态是 not_merchant;
#   已存在的用户直接跳过建号照样发 token。于是任何人拿一个没用过的邀请码 + 一个活着的 reqId
#   (自己 GenerateReqId 就有一个)就能拿到**任意 did** 的 hi-ai token。
#
# 断言(每条先证前提):
#   一、夹具:A(新身份,web 扫码 → not_merchant)、B(新身份,app 登录 → hi-ai 已有用户)、邀请码现造
#   二、拿 A 的会话 + 邀请码 + did=B → PermissionDenied,不发 token,邀请码没被消费
#   三、没扫码的会话(not_login)+ 邀请码 + did=B → FailedPrecondition,邀请码没被消费
#   四、正常:A 的会话 + 邀请码(did 传 A / 不传 did)→ token 属于 A、能用;邀请码已用;同一会话再用 → 拒
#   五、并发:同一个邀请码被两个 not_merchant 会话同时提交 → 恰好一个成功
#   六、并发:同一个会话同时提交两个邀请码 → 恰好一个成功,另一个邀请码仍可用
#   夹具身份、邀请码、登录态由收尾 purge.py 按词删(全部库 + redis,删完复扫)
#
# 用法:bash smoke-ai-register.sh    非 0 退出 = 有失败项
# 在 .64 跑(grpcurl + protoset);签名用 .66 的 /tmp/didtok。
set -uo pipefail
source "$(dirname "$0")/_endpoints.sh"
pass=0; fail=0
ok()  { printf "  \033[32m✓\033[0m %s\n" "$1"; pass=$((pass+1)); }
bad() { printf "  \033[31m✗\033[0m %s  (%s)\n" "$1" "$2"; fail=$((fail+1)); }
eq()  { [ "$2" = "$3" ] && ok "$1" || bad "$1" "want=[$3] got=[$2]"; }

command -v grpcurl >/dev/null || { echo "  ✗ 没有 grpcurl —— 这个脚本只能在 .64 跑"; exit 2; }
have_db || { echo "  ✗ 够不着 mysql,断言全部无法执行"; exit 2; }

R66() { ssh -n -o ConnectTimeout=10 192.168.1.66 "$1" 2>/dev/null; }
kv()  { echo "$1" | grep "^$2=" | cut -d= -f2-; }
js()  { python3 -c "import sys,json
try: d=json.load(sys.stdin)
except Exception: print(''); sys.exit()
for k in '$1'.split('.'):
    d=d.get(k,{}) if isinstance(d,dict) else {}
print(d if d!={} else '')"; }
code_of() { echo "$1" | sed -n 's/^ *Code: //p'; }
cnt()  { mysqlq information_schema "select count(*) from $1 where $2='$3'"; }
# jwt 载荷里写的是谁(只解第二段、只打 did 是否在里面,token 本身不打印)
tok_has_did() { python3 -c "import sys,base64,json
t=sys.stdin.read().strip().split('.')
p=t[1]+'='*(-len(t[1])%4) if len(t)==3 else ''
try: s=base64.urlsafe_b64decode(p).decode()
except Exception: s=''
print('yes' if '$1' and '$1' in s else 'no')"; }

AI_MERCHANT=zYJZirMcNx3FjFmhMQyXAAemADUy8BPBPz   # hiai 商户(扫码登录上报的 did)
RUN=$(date +%s%N | sha1sum | cut -c1-12)
MN_A=/tmp/ai_reg_smoke_a_$RUN.txt; MN_B=/tmp/ai_reg_smoke_b_$RUN.txt
MN_C=/tmp/ai_reg_smoke_c_$RUN.txt; MN_D=/tmp/ai_reg_smoke_d_$RUN.txt

new_id() {   # new_id <mn 文件> → did
  R66 "rm -f $1 && install -m600 /dev/null $1"
  undo "R66 'rm -f $1; ! test -e $1'"
  kv "$(R66 "cd /tmp/didtok && MN_FILE=$1 DID_ONLY=1 ./target/release/didtok")" DID
}
gen_rid() {  # gen_rid <dev> <mac> → reqId
  grpcurl -plaintext -protoset "$PS" -d "{\"did\":\"$AI_MERCHANT\",\"node\":{\"app\":\"HiAI\",\"dev\":\"$1\",\"mac\":\"$2\"}}" "$AI_GRPC" hi.ai.Auth/GenerateReqId 2>&1 | js reqId
}
scan() {     # scan <mn 文件> <reqId> <dev> <mac>:用这个身份扫这个码(hidid 回拨 hi-ai)
  R66 "cd /tmp/didtok && MN_FILE=$1 REQ_ID=$2 NODE_APP=HiAI NODE_DEV=$3 MAC=$4 ./target/release/didtok" >/dev/null
}
status_of() { grpcurl -plaintext -protoset "$PS" -d "{\"id\":\"$1\"}" "$AI_GRPC" hi.ai.Auth/GetReqStatus 2>&1; }
new_code() { # 现造一张可用的邀请码 → value
  local v; v=$(date +%s%N | sha1sum | cut -c1-20)
  mysqlq hi_ai "insert into hi_ai_invitecode(value,did,is_active,note,created_at,updated_at) values('$v','$AI_MERCHANT',1,'smoke-ai-register',now(),now())" >/dev/null
  made "$v"; echo "$v"
}
code_state() { mysqlq hi_ai "select is_active from hi_ai_invitecode where value='$1'"; }
# verify <reqId> <code> <did 或空>:回包原文(did 为空则不带这个字段)
verify() {
  local body
  if [ -n "$3" ]; then body="{\"id\":\"$1\",\"code\":\"$2\",\"did\":\"$3\"}"; else body="{\"id\":\"$1\",\"code\":\"$2\"}"; fi
  grpcurl -plaintext -protoset "$PS" -d "$body" "$AI_GRPC" hi.ai.Register/Verify 2>&1
}
# web 扫码一个新身份,停在 not_merchant → 设 RID
web_pending() {  # web_pending <mn> <did> <mac>
  RID=$(gen_rid web "$3")
  scan "$1" "$RID" web "$3"
  local s; s=$(status_of "$RID")
  [ "$(echo "$s" | js status)" = "not_merchant" ] && [ "$(echo "$s" | js base.did)" = "$2" ]
}

# ── 一、夹具 ─────────────────────────────────────────────────────────────────
echo "── 一、夹具 ──"
A=$(new_id "$MN_A"); B=$(new_id "$MN_B"); C=$(new_id "$MN_C"); D=$(new_id "$MN_D")
[ -n "$A" ] && [ -n "$B" ] && [ -n "$C" ] && [ -n "$D" ] || { bad "造身份" "didtok DID_ONLY 没给出 did —— 后面全部没验"; echo "通过 $pass,失败 $fail"; exit 1; }
made "$A" "$B" "$C" "$D"
eq "登录前 hi-ai 没有 A" "$(cnt hi_ai.hi_ai_user did "$A")" "0"
# B:app 扫码登录 → 成为 hi-ai 的已有用户(越权的目标)
RB=$(gen_rid app ai-reg-smoke-b); scan "$MN_B" "$RB" app ai-reg-smoke-b
eq "B 已是 hi-ai 用户(app 登录建号)" "$(cnt hi_ai.hi_ai_user did "$B")" "1"
web_pending "$MN_A" "$A" ai-reg-smoke-a && ok "A 的 web 会话停在 not_merchant,base.did=A" || bad "A 的 web 会话停在 not_merchant" "前提不成立 —— 第二、四节没验"
RID_A=$RID

# ── 二、A 的会话 + 邀请码 + did=B ────────────────────────────────────────────
echo "── 二、拿 A 的会话冒领 B ──"
K1=$(new_code)
eq "前提:邀请码 K1 可用" "$(code_state "$K1")" "1"
o=$(verify "$RID_A" "$K1" "$B")
T=$(echo "$o" | js token)
eq "did 与会话不符 → PermissionDenied" "$(code_of "$o")" "PermissionDenied"
eq "  没发 token" "$([ -n "$T" ] && echo "发了(载荷含 B:$(echo "$T" | tok_has_did "$B"))" || echo none)" "none"
eq "  K1 没被消费" "$(code_state "$K1")" "1"

# ── 三、没扫码 / 已登录的会话 ───────────────────────────────────────────────
# 每条用一张**新**邀请码:上一条要是把码消费了,这一条会因「邀请码已用」被拒,绿得没有意义。
echo "── 三、没扫码的会话(not_login)/ 已登录的会话(logined)──"
RN=$(gen_rid web ai-reg-smoke-n)
eq "前提:会话是 not_login" "$(status_of "$RN" | js status)" "not_login"
KN=$(new_code)
eq "前提:邀请码 KN 可用" "$(code_state "$KN")" "1"
o=$(verify "$RN" "$KN" "$B")
T=$(echo "$o" | js token)
eq "not_login 会话 → FailedPrecondition" "$(code_of "$o")" "FailedPrecondition"
eq "  没发 token" "$([ -n "$T" ] && echo "发了(载荷含 B:$(echo "$T" | tok_has_did "$B"))" || echo none)" "none"
eq "  KN 没被消费" "$(code_state "$KN")" "1"
eq "前提:B 的 app 会话是 logined" "$(status_of "$RB" | js status)" "logined"
KL=$(new_code)
o=$(verify "$RB" "$KL" "$B")
T=$(echo "$o" | js token)
eq "logined 会话 → FailedPrecondition" "$(code_of "$o")" "FailedPrecondition"
eq "  没发 token" "$([ -n "$T" ] && echo "发了(载荷含 B:$(echo "$T" | tok_has_did "$B"))" || echo none)" "none"
eq "  KL 没被消费" "$(code_state "$KL")" "1"

# ── 四、正常注册 ─────────────────────────────────────────────────────────────
echo "── 四、正常注册 ──"
eq "前提:A 的会话仍是 not_merchant" "$(status_of "$RID_A" | js status)" "not_merchant"
K1=$(new_code)
o=$(verify "$RID_A" "$K1" "$A")
T=$(echo "$o" | js token)
eq "A 自己的会话 + 邀请码 → 成功" "$(code_of "$o")" ""
eq "  token 属于 A" "$(echo "$T" | tok_has_did "$A")" "yes"
if [ -n "$T" ]; then
  r=$(grpcurl_tok "$T" -plaintext -protoset "$PS" -d '{"pagination":{"page":1,"limit":5}}' "$AI_GRPC" hi.ai.Agent/List 2>&1)
  eq "  token 能用(Agent/List)" "$(code_of "$r")" ""
fi
eq "  hi-ai 建了 A" "$(cnt hi_ai.hi_ai_user did "$A")" "1"
eq "  K1 已用" "$(code_state "$K1")" "2"
K2=$(new_code)
o=$(verify "$RID_A" "$K2" "$A")
eq "同一会话再用 → FailedPrecondition(会话用完即失效)" "$(code_of "$o")" "FailedPrecondition"
eq "  K2 没被消费" "$(code_state "$K2")" "1"
o=$(verify "$RID_A" "$K1" "$A")
eq "用过的邀请码再用(会话也已失效)→ 拒" "$([ -n "$(code_of "$o")" ] && echo rejected || echo ok)" "rejected"
# 不带 did 也行(只认会话里那个人)
web_pending "$MN_C" "$C" ai-reg-smoke-c && ok "前提:C 的 web 会话 not_merchant" || bad "前提:C 的 web 会话 not_merchant" "没验"
RID_C=$RID
o=$(verify "$RID_C" "$K2" "")
T=$(echo "$o" | js token)
eq "不带 did → 成功" "$(code_of "$o")" ""
eq "  token 属于 C" "$(echo "$T" | tok_has_did "$C")" "yes"
eq "  K2 已用" "$(code_state "$K2")" "2"

# ── 五、同一个邀请码,两个会话并发 ───────────────────────────────────────────
echo "── 五、同一个邀请码被两个会话同时提交 ──"
# D 与一个新的 E 都停在 not_merchant
MN_E=/tmp/ai_reg_smoke_e_$RUN.txt; E=$(new_id "$MN_E"); made "$E"
web_pending "$MN_D" "$D" ai-reg-smoke-d && P1=1 || P1=0; RID_D=$RID
web_pending "$MN_E" "$E" ai-reg-smoke-e && P2=1 || P2=0; RID_E=$RID
if [ $P1 = 1 ] && [ $P2 = 1 ]; then
  ok "前提:D、E 两个会话都是 not_merchant"
  K3=$(new_code)
  tmp=$(mktemp -d)
  for i in 1 2 3; do  # 每个会话各打三次,一共六个请求同时出发
    verify "$RID_D" "$K3" "$D" > "$tmp/d$i" &
    verify "$RID_E" "$K3" "$E" > "$tmp/e$i" &
  done
  wait
  n=0; for f in "$tmp"/*; do [ -n "$(js token < "$f")" ] && n=$((n+1)); done
  eq "  六个并发请求恰好一个拿到 token" "$n" "1"
  eq "  K3 已用" "$(code_state "$K3")" "2"
  eq "  D、E 合计只建了一个用户" "$(( $(cnt hi_ai.hi_ai_user did "$D") + $(cnt hi_ai.hi_ai_user did "$E") ))" "1"
  rm -rf "$tmp"
else
  bad "并发:同一个邀请码" "D/E 会话没停在 not_merchant —— 前提不成立,没验"
fi

# ── 六、同一个会话,两个邀请码并发 ───────────────────────────────────────────
echo "── 六、同一个会话同时提交两个邀请码 ──"
MN_F=/tmp/ai_reg_smoke_f_$RUN.txt; F=$(new_id "$MN_F"); made "$F"
if web_pending "$MN_F" "$F" ai-reg-smoke-f; then
  ok "前提:F 的会话是 not_merchant"
  RID_F=$RID; K4=$(new_code); K5=$(new_code)
  tmp=$(mktemp -d)
  for i in 1 2 3; do
    verify "$RID_F" "$K4" "$F" > "$tmp/a$i" &
    verify "$RID_F" "$K5" "$F" > "$tmp/b$i" &
  done
  wait
  n=0; for f in "$tmp"/*; do [ -n "$(js token < "$f")" ] && n=$((n+1)); done
  eq "  六个并发请求恰好一个拿到 token" "$n" "1"
  eq "  K4、K5 恰好用掉一张" "$(( $(code_state "$K4") + $(code_state "$K5") ))" "3"
  rm -rf "$tmp"
else
  bad "并发:同一个会话" "F 的会话没停在 not_merchant —— 前提不成立,没验"
fi

echo
echo "通过 $pass,失败 $fail"
[ "$fail" -eq 0 ]
