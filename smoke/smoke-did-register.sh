#!/bin/bash
# hi-did 邀请码升商户(Register.Verify)只给**扫码认出来的那个人**发 token —— 回归。
#
# ⛔ 与 hi-ai 同型的越权(2026-10-03 只读代码发现,生产同一份代码):Verify 用的是**请求里客户端传的 did**,
#   不核对它等于会话里扫码认出的人,也不看会话状态 —— 任何人自己 GenerateReqId 拿一个 reqId
#   + 一张没用过的邀请码,就能把**任意 hidid 用户**升成商户、并拿到他的 hisrv token。
#
# 断言(每条先证前提):
#   一、夹具:A、B 两个新身份,先 app 登录(hidid 建号);A 再 web 扫码 → 会话停在 not_merchant
#   二、A 的会话 + 邀请码 + did=B → PermissionDenied;不发 token、B 没被升成商户、码没被消费
#   三、没扫码的会话(not_login)+ 邀请码 + did=B → FailedPrecondition;同上三条
#   四、正常:A 的会话 + 邀请码 → token 属于 A、A 成了商户、码已用;同一会话再用 → 拒
#   五、并发:同一张码两个 not_merchant 会话同时提交 → 恰好一个成功、只建一个商户
#   身份、邀请码、商户行由收尾 purge.py 按词删;商户扩展表(DBUserInformationExtension_<did>)由 undo 删
#
# 用法:bash smoke-did-register.sh    非 0 退出 = 有失败项
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
tok_has_did() { python3 -c "import sys,base64
t=sys.stdin.read().strip().split('.')
p=t[1]+'='*(-len(t[1])%4) if len(t)==3 else ''
try: s=base64.urlsafe_b64decode(p).decode()
except Exception: s=''
print('yes' if '$1' and '$1' in s else 'no')"; }
G() { grpcurl $(tp "$DID_GRPC") -protoset "$PS" -d "$2" "$DID_GRPC" "$1" 2>&1; }

SELF=eb9f3a5c-9632-4d5e-b14d-e385825efe12   # hi-did cmd/res/config.yaml 的 self_did(hidid 自身登录的哨兵)
RUN=$(date +%s%N | sha1sum | cut -c1-12)

new_id() {   # new_id <mn 文件> → did
  R66 "rm -f $1 && install -m600 /dev/null $1"
  undo "R66 'rm -f $1; ! test -e $1'"
  kv "$(R66 "cd /tmp/didtok && MN_FILE=$1 DID_ONLY=1 ./target/release/didtok")" DID
}
gen_rid() { G hi.did.Auth/GenerateReqId "{\"did\":\"$SELF\",\"node\":{\"app\":\"HiDID\",\"dev\":\"$1\",\"mac\":\"$2\"}}" | js reqId; }
scan() { R66 "cd /tmp/didtok && MN_FILE=$1 REQ_ID=$2 NODE_APP=HiDID NODE_DEV=$3 MAC=$4 ./target/release/didtok" >/dev/null; }
status_of() { G hi.did.Auth/GetReqStatus "{\"id\":\"$1\"}"; }
new_code() {
  local v; v=$(date +%s%N | sha1sum | cut -c1-20)
  mysqlq hi_did "insert into hi_invitecode(value,did,is_active,note,created_at,updated_at) values('$v','$SELF',1,'smoke-did-register',now(),now())" >/dev/null
  made "$v"; echo "$v"
}
code_state() { mysqlq hi_did "select is_active from hi_invitecode where value='$1'"; }
is_merchant() { cnt hi_did.hi_merchant did "$1"; }
verify() {
  local body
  if [ -n "$3" ]; then body="{\"id\":\"$1\",\"code\":\"$2\",\"did\":\"$3\"}"; else body="{\"id\":\"$1\",\"code\":\"$2\"}"; fi
  G hi.did.Register/Verify "$body"
}
# 新身份:app 登录(hidid 建号),登记扩展表的收尾
person() {  # person <mn> <tag> → did
  local d r; d=$(new_id "$1"); [ -n "$d" ] || return
  made "$d"
  undo "mysqlq hi_did 'drop table if exists DBUserInformationExtension_$d' >/dev/null; [ -z \"\$(mysqlq hi_did \"show tables like 'DBUserInformationExtension_$d'\")\" ]"
  r=$(gen_rid app "did-reg-$2"); scan "$1" "$r" app "did-reg-$2"
  echo "$d"
}
web_pending() {  # web_pending <mn> <did> <tag> → RID
  RID=$(gen_rid web "did-reg-w-$3")
  scan "$1" "$RID" web "did-reg-w-$3"
  local s; s=$(status_of "$RID")
  [ "$(echo "$s" | js status)" = "not_merchant" ] && [ "$(echo "$s" | js base.did)" = "$2" ]
}
not_issued() { local T; T=$(echo "$1" | js token); [ -n "$T" ] && echo "发了(载荷含 $3:$(echo "$T" | tok_has_did "$2"))" || echo none; }

echo "── 一、夹具 ──"
A=$(person /tmp/did_reg_a_$RUN.txt a); B=$(person /tmp/did_reg_b_$RUN.txt b)
[ -n "$A" ] && [ -n "$B" ] || { bad "造身份" "didtok 没给出 did —— 后面全部没验"; echo "通过 $pass,失败 $fail"; exit 1; }
eq "A 在 hidid 建了号" "$(cnt hi_did.hi_user did "$A")" "1"
eq "B 在 hidid 建了号" "$(cnt hi_did.hi_user did "$B")" "1"
eq "前提:B 不是商户" "$(is_merchant "$B")" "0"
web_pending /tmp/did_reg_a_$RUN.txt "$A" a && ok "A 的 web 会话停在 not_merchant" || bad "A 的 web 会话停在 not_merchant" "前提不成立 —— 二、四没验"
RID_A=$RID

echo "── 二、拿 A 的会话冒领 B ──"
K1=$(new_code); eq "前提:K1 可用" "$(code_state "$K1")" "1"
o=$(verify "$RID_A" "$K1" "$B")
eq "did 与会话不符 → PermissionDenied" "$(code_of "$o")" "PermissionDenied"
eq "  没发 token" "$(not_issued "$o" "$B" B)" "none"
eq "  B 没被升成商户" "$(is_merchant "$B")" "0"
eq "  K1 没被消费" "$(code_state "$K1")" "1"

echo "── 三、没扫码的会话(not_login)──"
RN=$(gen_rid web did-reg-n)
eq "前提:会话是 not_login" "$(status_of "$RN" | js status)" "not_login"
KN=$(new_code)
o=$(verify "$RN" "$KN" "$B")
eq "not_login 会话 → FailedPrecondition" "$(code_of "$o")" "FailedPrecondition"
eq "  没发 token" "$(not_issued "$o" "$B" B)" "none"
eq "  B 没被升成商户" "$(is_merchant "$B")" "0"
eq "  KN 没被消费" "$(code_state "$KN")" "1"

echo "── 四、正常升商户 ──"
eq "前提:A 的会话仍是 not_merchant" "$(status_of "$RID_A" | js status)" "not_merchant"
K2=$(new_code)
o=$(verify "$RID_A" "$K2" "$A")
T=$(echo "$o" | js token)
eq "A 自己的会话 + 邀请码 → 成功" "$(code_of "$o")" ""
eq "  token 属于 A" "$(echo "$T" | tok_has_did "$A")" "yes"
eq "  A 成了商户" "$(is_merchant "$A")" "1"
eq "  K2 已用" "$(code_state "$K2")" "2"
K3=$(new_code)
o=$(verify "$RID_A" "$K3" "$A")
eq "同一会话再用 → 拒(会话用完即失效)" "$([ -n "$(code_of "$o")" ] && echo rejected || echo ok)" "rejected"
eq "  K3 没被消费" "$(code_state "$K3")" "1"

echo "── 五、同一张码,两个会话并发 ──"
C=$(person /tmp/did_reg_c_$RUN.txt c); D=$(person /tmp/did_reg_d_$RUN.txt d)
web_pending /tmp/did_reg_c_$RUN.txt "$C" c && P1=1 || P1=0; RID_C=$RID
web_pending /tmp/did_reg_d_$RUN.txt "$D" d && P2=1 || P2=0; RID_D=$RID
if [ $P1 = 1 ] && [ $P2 = 1 ]; then
  ok "前提:C、D 两个会话都是 not_merchant"
  K4=$(new_code); tmp=$(mktemp -d)
  for i in 1 2 3; do
    verify "$RID_C" "$K4" "$C" > "$tmp/c$i" &
    verify "$RID_D" "$K4" "$D" > "$tmp/d$i" &
  done
  wait
  n=0; for f in "$tmp"/*; do [ -n "$(js token < "$f")" ] && n=$((n+1)); done
  eq "  六个并发请求恰好一个拿到 token" "$n" "1"
  eq "  K4 已用" "$(code_state "$K4")" "2"
  eq "  C、D 合计只建了一个商户" "$(( $(is_merchant "$C") + $(is_merchant "$D") ))" "1"
  rm -rf "$tmp"
else
  bad "并发:同一张码" "C/D 会话没停在 not_merchant —— 前提不成立,没验"
fi

echo
echo "通过 $pass,失败 $fail"
[ "$fail" -eq 0 ]
