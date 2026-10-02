#!/bin/bash
# 三家登出(hi.did / hi.club / hi.ai 的 Auth/Logout)与 hi-did PC 独占槽 —— 回归。
#
# 口径(2026-10-02 定):
#   · **PC 独占槽的「占用」只看 token 还有没有效** —— (did, app, pc) 那一行的当前 refresh 没到期,
#     或宽限位还在窗口内,才算占着(backend-hi-module session.Stored.Live)。token 全过期,
#     槽就空着,新登录直接占用,**不需要先登出**。原来另有一把 redis 锁,锁的时钟与会话的时钟
#     分家:token 过期后锁还在,而那时登出也做不了 —— 当初 hi-did 的登出做成 web3 验签、不要 token,
#     club / hi-ai 的登出对不上也回成功,都是为了「过期了也能解锁」。锁删了,这两种宽容一起删。
#   · **三家 Logout 都要有效的 refresh(当前那份或宽限位那份)**,判据整条在 session.ProveRefresh:
#     验签 + jwt 过期 + 身份 (did,app,dev,mac) 逐字段 + 哈希。任何一步不过 → Unauthenticated(16),
#     什么都不删。已无会话也是 16(不再「幂等成功」)。
#   · web3 验签的登出(`Logout(hi.SignedData)` + `LogoutReq{did}`)2026-09-12 已从协议删掉,第六节证它不在。
#
# 每条断言都先证前提;夹具(三个 did 的登录态)现造,跑完清掉。
#
# 用法:bash smoke-logout.sh    非 0 退出 = 有失败项
# 在 .64 跑(grpcurl + protoset);token 取自 .66 的 /tmp/didtok(hidid,要支持 MAC / REQ_ID 的那版)
# 与 /tmp/tokgen(club,要输出 APP / MAC 的那版);查库经 _endpoints.sh 的 mysqlq。
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

# ── 通用:按服务调 Auth/<方法>,body 用当前 DID/APP/DEV/MAC ──────────────────────
# 服务 → 端点与包名
ep()  { case "$1" in did) echo "$DID_GRPC";; club) echo "$CLUB_GRPC";; ai) echo "$AI_GRPC";; esac; }
pkg() { case "$1" in did) echo hi.did;; club) echo hi.club;; ai) echo hi.ai;; esac; }
req() { printf '{"did":"%s","node":{"app":"%s","dev":"%s","mac":"%s"},"refreshToken":"%s"}' "$DID" "$APP" "$DEV" "$1" "$2"; }
# call <svc> <方法> <mac> <refresh>
call() { local e; e=$(ep "$1"); grpcurl $(tp "$e") -protoset "$PS" -d "$(req "$3" "$4")" "$e" "$(pkg "$1").Auth/$2" 2>&1; }
# 回包形状:成功 → OK;失败 → grpc 码名
verdict() { local o; o=$(call "$@"); if echo "$o" | grep -q '^ERROR:'; then echo "$o" | sed -n 's/^ *Code: //p'; else echo OK; fi; }
refresh() { call "$1" RefreshToken "$MAC" "$2" | python3 -c 'import sys,json; print(json.load(sys.stdin).get("refreshToken",""))' 2>/dev/null; }

# 三家的登录态表
tbl() { case "$1" in did) echo "hi_did.hi_user_refreshtoken";; club) echo "hi_club.hi_chat_user_refreshtoken";; ai) echo "hi_ai.hi_ai_user_refreshtoken";; esac; }
rows() { mysqlq information_schema "select count(*) from $(tbl "$1") where did='$DID' and app='$APP' and dev='$DEV'"; }

# ── 夹具:三种登录 ────────────────────────────────────────────────────────────
DID_MN=/tmp/logout_smoke_did_mn.txt      # hidid PC 登录用
CAI_MN=/tmp/logout_smoke_cai_mn.txt      # club + hi-ai 共用一个身份(hi-ai 不再依赖 club,见 smoke-ai-login.sh;这里共用只为少造一个)
MAC1=""; MAC2="logout-smoke-pc-2"

# did_login [mac] → 设 DID/APP/DEV/MAC/R;mac 为空用 didtok 默认(did 的哈希)
did_login() {
  local out; out=$(R66 "cd /tmp/didtok && MN_FILE=$DID_MN ${1:+MAC=$1} ./target/release/didtok")
  DID=$(kv "$out" DID); APP=$(kv "$out" APP); DEV=$(kv "$out" DEV); MAC=$(kv "$out" MAC); R=$(kv "$out" REFRESH)
}
# did_login_verdict <mac> → OK / 码名 / 码名:话
did_login_verdict() {
  local out; out=$(ssh -n -o ConnectTimeout=10 192.168.1.66 "cd /tmp/didtok && MN_FILE=$DID_MN MAC=$1 ./target/release/didtok" 2>&1)
  if echo "$out" | grep -q '^REFRESH='; then echo OK; else echo "$out" | grep -o "message: \"[^\"]*\"" | head -1; fi
}
club_login() {
  local out; out=$(R66 "cd /tmp/tokgen && MN_FILE=$CAI_MN DEV=app ./target/release/tokgen")
  DID=$(kv "$out" DID); APP=$(kv "$out" APP); DEV=$(kv "$out" DEV); MAC=$(kv "$out" MAC); R=$(kv "$out" REFRESH)
}
# hi-ai:业务侧申请 reqId → 用 didtok 的 REQ_ID 模式替它签 → 去 hi-ai 的 GetReqStatus 取 token
AIMAC="logout-smoke-ai"
ai_login() {
  local q rid out
  q=$(grpcurl -plaintext -protoset "$PS" -d "{\"did\":\"zYJZirMcNx3FjFmhMQyXAAemADUy8BPBPz\",\"node\":{\"app\":\"HiAI\",\"dev\":\"app\",\"mac\":\"$AIMAC\"}}" "$AI_GRPC" hi.ai.Auth/GenerateReqId)
  rid=$(echo "$q" | python3 -c 'import sys,json; print(json.load(sys.stdin)["reqId"])' 2>/dev/null)
  [ -n "$rid" ] || { R=""; return; }
  out=$(R66 "cd /tmp/didtok && MN_FILE=$CAI_MN REQ_ID=$rid NODE_APP=HiAI NODE_DEV=app MAC=$AIMAC ./target/release/didtok")
  DID=$(kv "$out" DID); APP=HiAI; DEV=app; MAC=$AIMAC
  R=$(grpcurl -plaintext -protoset "$PS" -d "{\"id\":\"$rid\"}" "$AI_GRPC" hi.ai.Auth/GetReqStatus \
      | python3 -c 'import sys,json; print(json.load(sys.stdin).get("token",{}).get("refreshToken",""))' 2>/dev/null)
}

# ── 一~三:三家登出同一套判据 ──────────────────────────────────────────────────
logout_suite() {   # logout_suite <svc> <登录函数>
  local svc=$1 login=$2 A B
  echo "── $svc:宽限位那份登出 ──"
  $login; A=$R
  [ -n "$A" ] && [ -n "$DID" ] && [ -n "$MAC" ] || { bad "$svc 登录夹具" "拿不到 REFRESH/DID/MAC —— 后面全部没验"; return; }
  ok "$svc 登录 did=$DID app=$APP dev=$DEV"
  B=$(refresh "$svc" "$A")
  [ -n "$B" ] && [ "$B" != "$A" ] || { bad "$svc 续期轮换" "没拿到新 refresh —— 前提不成立,后面全部没验"; return; }
  ok "续期轮换:拿到新 refresh,A 进宽限位"
  eq "用宽限位那份登出 → 成功" "$(verdict "$svc" Logout "$MAC" "$A")" "OK"
  eq "会话行已删" "$(rows "$svc")" "0"
  eq "新那份 refresh 续不了(真撤销)" "$(verdict "$svc" RefreshToken "$MAC" "$B")" "Unauthenticated"
  eq "已无会话再登出 → Unauthenticated(不再假成功)" "$(verdict "$svc" Logout "$MAC" "$B")" "Unauthenticated"

  echo "── $svc:凭据不作数 ──"
  $login; A=$R
  eq "前提:新登录有会话行" "$(rows "$svc")" "1"
  eq "乱写的 refresh 登出 → Unauthenticated" "$(verdict "$svc" Logout "$MAC" "not-a-refresh-token-$$")" "Unauthenticated"
  eq "缺 refresh 登出 → Unauthenticated" "$(verdict "$svc" Logout "$MAC" "")" "Unauthenticated"
  eq "对的 token、别的设备号 → Unauthenticated" "$(verdict "$svc" Logout "other-mac-$$" "$A")" "Unauthenticated"
  eq "会话行还在(什么都没删)" "$(rows "$svc")" "1"
  B=$(refresh "$svc" "$A")
  [ -n "$B" ] && ok "真持有者照常续期" || bad "真持有者照常续期" "续期失败"
  # 宽限期过了的上一份:把宽限位到期时刻拨到过去,别真等 90 秒
  mysqlq information_schema "update $(tbl "$svc") set prev_refresh_until='2000-01-01 00:00:00' where did='$DID' and app='$APP' and dev='$DEV'" >/dev/null
  eq "前提:宽限位里存着 A、已过期" "$(mysqlq information_schema "select count(*) from $(tbl "$svc") where did='$DID' and app='$APP' and dev='$DEV' and prev_refresh_token is not null and prev_refresh_until < '2001-01-01'")" "1"
  eq "过期的上一份登出 → Unauthenticated" "$(verdict "$svc" Logout "$MAC" "$A")" "Unauthenticated"
  eq "会话行还在" "$(rows "$svc")" "1"
  eq "当前那份登出 → 成功" "$(verdict "$svc" Logout "$MAC" "$B")" "OK"
  eq "会话行已删" "$(rows "$svc")" "0"
}

logout_suite did  did_login
logout_suite club club_login
logout_suite ai   ai_login

# ── 四:hi-did PC 独占槽 —— 占用只看 token 有没有效 ───────────────────────────────
echo "── did:PC 独占槽 ──"
did_login; MAC1=$MAC; R1=$R; PCDID=$DID; PCAPP=$APP
[ -n "$R1" ] && [ "$DEV" = pc ] || { bad "PC 登录夹具" "didtok 没拿到 pc 的 refresh —— 后面全部没验"; }
eq "前提:设备 1 占着槽(token 有效)" "$(mysqlq hi_did "select count(*) from hi_user_refreshtoken where did='$DID' and app='$APP' and dev='pc' and mac='$MAC1' and refresh_until > now()")" "1"
eq "设备 2 登录 → 被挡,AlreadyExists + 人话" "$(did_login_verdict "$MAC2")" 'message: "该账号已在其他设备登录,请先在原设备登出"'
# 码单独再核一次(上面只看话):
code2=$(ssh -n 192.168.1.66 "cd /tmp/didtok && MN_FILE=$DID_MN MAC=$MAC2 ./target/release/didtok" 2>&1 | grep -o "code: '[^']*'" | head -1)
# tonic 把码渲染成英文描述;6 = AlreadyExists 的那句里一定有 already exists(13 是 Internal error)
eq "  码是 6 AlreadyExists" "$(echo "$code2" | grep -c 'already exists')" "1"
eq "设备 1 的会话没被动" "$(mysqlq hi_did "select mac from hi_user_refreshtoken where did='$DID' and app='$APP' and dev='pc'")" "$MAC1"
eq "同一台设备重登 → 放行" "$(did_login_verdict "$MAC1")" "OK"

# token 全过期:当前那份 refresh 的到期时刻拨到过去、宽限位清掉 —— 别真等 15 天
mysqlq hi_did "update hi_user_refreshtoken set refresh_until='2000-01-01 00:00:00', prev_refresh_token=NULL, prev_refresh_until=NULL where did='$DID' and app='$APP' and dev='pc'" >/dev/null
eq "前提:设备 1 的 token 全过期(行还在、没登出)" "$(mysqlq hi_did "select count(*) from hi_user_refreshtoken where did='$DID' and app='$APP' and dev='pc' and mac='$MAC1' and refresh_until < now() and prev_refresh_token is null")" "1"
eq "设备 2 直接登录 → 放行(不需要先登出)" "$(did_login_verdict "$MAC2")" "OK"
eq "槽归设备 2 了" "$(mysqlq hi_did "select mac from hi_user_refreshtoken where did='$DID' and app='$APP' and dev='pc'")" "$MAC2"
# exp 按秒截断,与 now() 同秒时正好 360 小时,跨秒时 359 —— 两者都是"签发 + 15 天"
eq "新行的 refresh_until 是 token 自己的 exp(签发 + 15 天)" "$(mysqlq hi_did "select timestampdiff(hour, now(), refresh_until) between 359 and 360 from hi_user_refreshtoken where did='$DID' and app='$APP' and dev='pc'")" "1"

# 登出照样立刻释放:设备 2 登出 → 设备 1 当场进得来
did_login "$MAC2"; R2=$R
[ "$DID" = "$PCDID" ] || bad "设备 2 登录夹具" "didtok 没拿到设备 2 的 refresh"
eq "设备 2 用当前那份登出 → 成功" "$(verdict did Logout "$MAC2" "$R2")" "OK"
eq "设备 1 当场能登" "$(did_login_verdict "$MAC1")" "OK"

# ── 五:hi-did 不再用 redis 锁 ───────────────────────────────────────────────────
# 原来 key = did、值 `mac|时刻`。新代码既不写也不读;残留的键要清掉(见发版清单)。
DIDREDIS=$(ssh -n -o ConnectTimeout=10 -p 22 "$H" 'P=$(docker exec hi-did sh -c "grep -A6 ^redis: /root/res/config.yaml" | sed -n "s/^ *password: *\"\{0,1\}\([^\"]*\)\"\{0,1\}/\1/p"); REDISCLI_AUTH="$P" redis-cli -h 127.0.0.1 -n 0 --user default exists '"$PCDID" 2>/dev/null)
if [ -z "$DIDREDIS" ]; then
  printf "  \033[33m—\033[0m 没验:够不着 .65 的 redis(这一条只证新代码不再写锁)\n"; fail=$((fail+1))
else
  eq "PC 登录后 redis 里没有锁键" "$DIDREDIS" "0"
fi

# ── 六:web3 验签的登出不在协议里 ─────────────────────────────────────────────────
echo "── 删掉的接口 ──"
eq "hi.did.Auth/Logout 的入参是 RefreshTokenReq(不是 SignedData)" \
   "$(grpcurl -protoset "$PS" describe hi.did.Auth.Logout 2>&1 | grep -o 'rpc Logout ( [^ ]* )')" "rpc Logout ( .hi.did.RefreshTokenReq )"
eq "hi.did.LogoutReq(web3 载荷)不存在" "$(grpcurl -protoset "$PS" describe hi.did.LogoutReq 2>&1 | grep -c 'not found\|Symbol not found')" "1"
for p in hi.did hi.club hi.ai; do
  eq "$p.Auth 里没有收 SignedData 的登出类方法" \
     "$(grpcurl -protoset "$PS" describe $p.Auth 2>&1 | grep '^ *rpc ' | grep -i 'logout\|unlock' | grep -c 'SignedData')" "0"
done

# ── 清夹具 ───────────────────────────────────────────────────────────────────
for d in $(R66 "cd /tmp/didtok && MN_FILE=$DID_MN ./target/release/didtok" | grep ^DID= | cut -d= -f2-) \
         $(R66 "cd /tmp/tokgen && MN_FILE=$CAI_MN ./target/release/tokgen" | grep ^DID= | cut -d= -f2-); do
  mysqlq information_schema "delete from hi_did.hi_user_refreshtoken where did='$d'; delete from hi_club.hi_chat_user_refreshtoken where did='$d'; delete from hi_ai.hi_ai_user_refreshtoken where did='$d'" >/dev/null
done
echo
echo "通过 $pass,失败 $fail"
[ "$fail" -eq 0 ]
