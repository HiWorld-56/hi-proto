#!/bin/bash
# hi-did 登出(hi.did.Auth/Logout)认不认宽限位、对不上时回什么 —— 回归。
#
# 为什么单独一个脚本:refresh 轮换 + 90 秒宽限位(backend-hi-module session.RefreshGrace)
# 上线之后,club 的 Logout 用 session.MatchRefresh 认「当前或宽限位」,hi-did 的 Logout
# 却自己拿当前那份哈希逐字比。于是客户端没收到上次轮换的响应、手里拿着宽限位那份去登出,
# hi-did **什么都不删、照样回成功** —— 用户以为退出了,会话照活,新 refresh 照样能续期。
# 对不上时回成功本身也是错的:调用方无从知道「这次登出没生效」。
#
# 钉住的判据(四条,每条都先证前提):
#   ① 宽限位那份登出 → 会话删掉、新 refresh 续不了(原来的 bug)
#   ② 两份都对不上 → Unauthenticated,会话不动(不能让人拿乱写的 token 清掉别人会话)
#   ③ 宽限期已过的上一份 → 与 ② 同(宽限位只在窗口内算数)
#   ④ 当前那份登出 → 删掉;再登出一次(已无会话)→ 幂等成功
#
# 用法:bash smoke-did-logout.sh    非 0 退出 = 有失败项
# 在 .64 跑(grpcurl + protoset);token 取自 .66 的 /tmp/didtok(要输出 REFRESH/APP/DEV/MAC 那版),
# 查库经 _endpoints.sh 的 mysqlq 转到 .65。
set -uo pipefail
source "$(dirname "$0")/_endpoints.sh"
pass=0; fail=0
ok()  { printf "  \033[32m✓\033[0m %s\n" "$1"; pass=$((pass+1)); }
bad() { printf "  \033[31m✗\033[0m %s  (%s)\n" "$1" "$2"; fail=$((fail+1)); }
eq()  { [ "$2" = "$3" ] && ok "$1" || bad "$1" "want=[$3] got=[$2]"; }

command -v grpcurl >/dev/null || { echo "  ✗ 没有 grpcurl —— 这个脚本只能在 .64 跑"; exit 2; }
have_db || { echo "  ✗ 够不着 mysql,断言全部无法执行"; exit 2; }

DID=""; APP=""; DEV=""; MAC=""; R=""
# login:新登录一次,这一轮的 refresh 放进 R(token 只进变量,不打印)。
# ⚠️ 不能写成 A=$(login) —— 命令替换是子 shell,DID/MAC 这些赋值带不出来。
login() {
  local out
  out=$(ssh -n -o ConnectTimeout=10 192.168.1.66 "cd /tmp/didtok && ./target/release/didtok 2>/dev/null")
  DID=$(echo "$out" | grep '^DID=' | cut -d= -f2-)
  APP=$(echo "$out" | grep '^APP=' | cut -d= -f2-)
  DEV=$(echo "$out" | grep '^DEV=' | cut -d= -f2-)
  MAC=$(echo "$out" | grep '^MAC=' | cut -d= -f2-)
  R=$(echo "$out" | grep '^REFRESH=' | cut -d= -f2-)
}
req()     { printf '{"did":"%s","node":{"app":"%s","dev":"%s","mac":"%s"},"refreshToken":"%s"}' "$DID" "$APP" "$DEV" "$MAC" "$1"; }
call()    { grpcurl $(tp $DID_GRPC) -protoset $PS -d "$(req "$2")" $DID_GRPC "hi.did.Auth/$1" 2>&1; }
# 回包形状:成功 → OK;失败 → grpc 码名(Unauthenticated 等)
verdict() { local o; o=$(call "$1" "$2"); if echo "$o" | grep -q '^ERROR:'; then echo "$o" | sed -n 's/^ *Code: //p'; else echo OK; fi; }
refresh() { call RefreshToken "$1" | python3 -c 'import sys,json; print(json.load(sys.stdin).get("refreshToken",""))' 2>/dev/null; }
rows()    { mysqlq hi_did "select count(*) from hi_user_refreshtoken where did='$DID' and app='$APP' and dev='$DEV'"; }

echo "── ① 宽限位那份登出(原来的 bug)──"
login; A=$R
[ -n "$A" ] && [ -n "$DID" ] && [ -n "$MAC" ] || { echo "  ✗ 拿不到 didtok 的 REFRESH/MAC(.66:/tmp/didtok 是不是旧版?)"; exit 1; }
ok "hidid 登录 did=$DID app=$APP dev=$DEV"
B=$(refresh "$A")
[ -n "$B" ] && [ "$B" != "$A" ] || { echo "  ✗ 续期没拿到新的 refresh —— 前提不成立,后面全部没验"; exit 1; }
ok "续期轮换:拿到新 refresh,A 进宽限位"
eq "前提:宽限位里存着上一份" "$(mysqlq hi_did "select count(*) from hi_user_refreshtoken where did='$DID' and app='$APP' and dev='$DEV' and prev_refresh_token is not null and prev_refresh_until is not null")" "1"
eq "用宽限位那份登出 → 成功" "$(verdict Logout "$A")" "OK"
eq "会话行已删" "$(rows)" "0"
eq "新那份 refresh 续不了" "$(verdict RefreshToken "$B")" "Unauthenticated"

echo "── ② 两份都对不上 ──"
login; A=$R
eq "前提:新登录有会话行" "$(rows)" "1"
eq "乱写的 refresh 登出 → Unauthenticated" "$(verdict Logout "not-a-refresh-token-$$")" "Unauthenticated"
eq "会话行还在" "$(rows)" "1"
B=$(refresh "$A")
[ -n "$B" ] && ok "真持有者照常续期" || bad "真持有者照常续期" "续期失败"

echo "── ③ 宽限期已过的上一份 ──"
# 造过期数据,别真等 90 秒:把宽限位到期时刻拨到过去。
mysqlq hi_did "update hi_user_refreshtoken set prev_refresh_until='2000-01-01 00:00:00' where did='$DID' and app='$APP' and dev='$DEV'" >/dev/null
eq "前提:宽限位里存着 A、已过期" "$(mysqlq hi_did "select count(*) from hi_user_refreshtoken where did='$DID' and app='$APP' and dev='$DEV' and prev_refresh_token is not null and prev_refresh_until < '2001-01-01'")" "1"
eq "过期的上一份登出 → Unauthenticated" "$(verdict Logout "$A")" "Unauthenticated"
eq "会话行还在" "$(rows)" "1"

echo "── ④ 当前那份登出 + 幂等 ──"
eq "当前那份登出 → 成功" "$(verdict Logout "$B")" "OK"
eq "会话行已删" "$(rows)" "0"
eq "已无会话再登出 → 幂等成功" "$(verdict Logout "$B")" "OK"

echo
echo "通过 $pass,失败 $fail"
[ "$fail" -eq 0 ]
