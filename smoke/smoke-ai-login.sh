#!/bin/bash
# hi-ai 扫码登录**不依赖 club** —— 回归。
#
# 口径(2026-10-02 用户定:「hiai 是 hiclub 的前级」):用户可能先用 hi-ai、从没进过 club。
#   · 身份与基础资料的权威是 **hidid**;hidid 回拨 hi-ai 的 LoginCallback.Login 时,
#     hi-ai 用同一份签名载荷调 hidid `Auth.VerifyOffline` —— hidid 认出这个人,**首登自动注册**(hi_user + mqtt 账号),
#     与 club 的 LoginCallback 同一个写法。原来 hi-ai 只验签、不经 hidid,于是 hidid 里没有这个人的行,
#     要等他哪天登了 club(club 的回调替他注册)才会有 —— GetReqStatus 再拿自己的商户凭据去 hidid 取资料,
#     取到空,回 13「查询登录状态失败」(日志 `user profile not found`):token 已签发却拿不到。
#   · 装饰字段(name/avatar)取不到就 absent,不拿空结构体顶,也不让登录失败。
#
# 断言(每条先证前提):
#   一、全新身份(助记词现造,600 权限):登录**之前** hidid / club / hi-ai 三处都没有这个人
#   二、只扫 hi-ai:GetReqStatus 拿到 token、base.did 是他;hidid 注册了他、club 仍然没有他
#   三、后续调用:token 能调 Agent/List、能续期;用 token 建一个助手,creator 是他(建完删掉)
#   四、club 有资料的老用户(smoke-logout 的 CAI_MN 夹具)照常登录,base.name 与 hidid 一致
#   新身份与它名下的东西由收尾删(_endpoints.sh 的 made → purge.py:全部库 + redis,删完复扫到 0),助记词文件也是
#
# 用法:bash smoke-ai-login.sh    非 0 退出 = 有失败项
# 在 .64 跑(grpcurl + protoset);签名用 .66 的 /tmp/didtok(要支持 REQ_ID / DID_ONLY 的那版)。
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
cnt() { mysqlq information_schema "select count(*) from $1 where $2='$3'"; }

AI_MERCHANT=zYJZirMcNx3FjFmhMQyXAAemADUy8BPBPz   # hiai 商户(record 20260904-201500 §1.2)
NEW_MN=/tmp/ai_login_smoke_new_mn.txt           # .66 上,现造现删
OLD_MN=/tmp/logout_smoke_cai_mn.txt             # smoke-logout 的常驻夹具:club + hi-ai 都有的老用户

# ai_login <mn 文件> <mac> → 设 RID / SR(GetReqStatus 原始回包)/ SC(错误码名,成功为空)
ai_login() {
  local q
  RID=""; SR=""; SC=""
  q=$(grpcurl -plaintext -protoset "$PS" -d "{\"did\":\"$AI_MERCHANT\",\"node\":{\"app\":\"HiAI\",\"dev\":\"app\",\"mac\":\"$2\"}}" "$AI_GRPC" hi.ai.Auth/GenerateReqId 2>&1)
  RID=$(echo "$q" | js reqId)
  [ -n "$RID" ] || { SC="GenerateReqId 失败: $q"; return; }
  R66 "cd /tmp/didtok && MN_FILE=$1 REQ_ID=$RID NODE_APP=HiAI NODE_DEV=app MAC=$2 ./target/release/didtok" >/dev/null
  SR=$(grpcurl -plaintext -protoset "$PS" -d "{\"id\":\"$RID\"}" "$AI_GRPC" hi.ai.Auth/GetReqStatus 2>&1)
  if echo "$SR" | grep -q '^ERROR:'; then SC=$(echo "$SR" | sed -n 's/^ *Code: //p'); fi
}
aicall() { grpcurl_tok "$1" -plaintext -protoset "$PS" -d "$2" "$AI_GRPC" "$3" 2>&1; }   # token 不进命令行

# ── 一、全新身份,登录前三处都没有 ─────────────────────────────────────────────
echo "── 一、全新身份(只在 hidid 侧可用,从没进过 club)──"
R66 "rm -f $NEW_MN && install -m600 /dev/null $NEW_MN"
undo "R66 'rm -f $NEW_MN; ! test -e $NEW_MN'"
NDID=$(kv "$(R66 "cd /tmp/didtok && MN_FILE=$NEW_MN DID_ONLY=1 ./target/release/didtok")" DID)
[ -n "$NDID" ] || { bad "造新身份" "didtok DID_ONLY 没给出 did —— 后面全部没验"; echo "通过 $pass,失败 $fail"; exit 1; }
made "$NDID"
eq "助记词文件是 600" "$(R66 "stat -c %a $NEW_MN")" "600"
eq "登录前 hi_did.hi_user 没有他" "$(cnt hi_did.hi_user did "$NDID")" "0"
eq "登录前 hi_club.hi_chat_user 没有他" "$(cnt hi_club.hi_chat_user did "$NDID")" "0"
eq "登录前 hi_ai.hi_ai_user 没有他" "$(cnt hi_ai.hi_ai_user did "$NDID")" "0"

# ── 二、只扫 hi-ai ───────────────────────────────────────────────────────────
echo "── 二、扫码登录 hi-ai ──"
ai_login "$NEW_MN" ai-login-smoke-new
eq "GetReqStatus 不报错(原来回 Internal「查询登录状态失败」)" "$SC" ""
eq "status = logined" "$(echo "$SR" | js status)" "logined"
eq "base.did 是这个人" "$(echo "$SR" | js base.did)" "$NDID"
TOK=$(echo "$SR" | js token.token); RT=$(echo "$SR" | js token.refreshToken)
[ -n "$TOK" ] && [ -n "$RT" ] && ok "拿到 access + refresh" || bad "拿到 access + refresh" "token 为空"
eq "hidid 首登注册了他(hi_did.hi_user 一行)" "$(cnt hi_did.hi_user did "$NDID")" "1"
eq "club 仍然没有他(登录不经 club)" "$(cnt hi_club.hi_chat_user did "$NDID")" "0"
HNAME=$(mysqlq hi_did "select name from hi_user where did='$NDID'")
if [ -n "$HNAME" ]; then
  eq "base.name 取自 hidid" "$(echo "$SR" | js base.name)" "$HNAME"
else
  bad "base.name 取自 hidid" "hidid 里没有他的名字 —— 前提不成立,没验"
fi

# ── 三、后续调用 ─────────────────────────────────────────────────────────────
echo "── 三、拿 token 往下用 ──"
if [ -n "$TOK" ]; then
  o=$(aicall "$TOK" '{"pagination":{"page":1,"limit":10}}' hi.ai.Agent/List)
  echo "$o" | grep -q '^ERROR:' && bad "Agent/List" "$(echo "$o" | sed -n 's/^ *Message: //p')" || ok "Agent/List 正常"
  # 少传必填参数是调用方的事:InvalidArgument + 点名缺哪个(原来是 Internal「查询机器人失败」)
  o=$(aicall "$TOK" '{}' hi.ai.Agent/List)
  eq "Agent/List 不带 pagination → InvalidArgument" "$(echo "$o" | sed -n 's/^ *Code: //p')" "InvalidArgument"
  eq "  话点名缺的字段" "$(echo "$o" | sed -n 's/^ *Message: //p')" "缺少参数 pagination"
  o=$(aicall "$TOK" '{"name":"ai-login-smoke"}' hi.ai.Agent/CreateAssistant)
  AG=$(echo "$o" | js base.did)
  if [ -n "$AG" ]; then
    ok "用 token 建助手"
    made "$AG"; U_AG="o=\$(aicall '$TOK' '{\"agent\":\"$AG\"}' hi.ai.Agent/Delete); ! grep -q '^ERROR:' <<<\"\$o\""; undo "$U_AG"
    eq "助手的 creator 是他" "$(echo "$o" | js creator.did)" "$NDID"
    eq "creator.name 取自 hidid" "$(echo "$o" | js creator.name)" "$HNAME"
    d=$(aicall "$TOK" "{\"agent\":\"$AG\"}" hi.ai.Agent/Delete)
    echo "$d" | grep -q '^ERROR:' && bad "删掉助手" "$(echo "$d" | sed -n 's/^ *Message: //p')" || { ok "删掉助手"; undone "$U_AG"; }
  else
    bad "用 token 建助手" "$(echo "$o" | sed -n 's/^ *Message: //p')"
  fi
  # hidid 里没有他的资料时(删掉他那行来造),建助手照常成功,creator 只有 did、name absent(不是空串)
  mysqlq hi_did "delete from hi_user where did='$NDID'" >/dev/null
  if [ "$(cnt hi_did.hi_user did "$NDID")" = "0" ]; then
    o=$(aicall "$TOK" '{"name":"ai-login-smoke-2"}' hi.ai.Agent/CreateAssistant)
    AG=$(echo "$o" | js base.did)
    if [ -n "$AG" ]; then
      ok "hidid 没资料时建助手照常成功"
      made "$AG"; U_AG="o=\$(aicall '$TOK' '{\"agent\":\"$AG\"}' hi.ai.Agent/Delete); ! grep -q '^ERROR:' <<<\"\$o\""; undo "$U_AG"
      eq "  creator.did 仍是他" "$(echo "$o" | js creator.did)" "$NDID"
      eq "  creator 里没有 name 键(absent)" "$(echo "$o" | python3 -c 'import sys,json; print("name" in json.load(sys.stdin).get("creator",{}))')" "False"
      d=$(aicall "$TOK" "{\"agent\":\"$AG\"}" hi.ai.Agent/Delete)
      echo "$d" | grep -q '^ERROR:' && bad "  删掉这个助手" "$(echo "$d" | sed -n 's/^ *Message: //p')" || { ok "  删掉这个助手"; undone "$U_AG"; }
    else
      bad "hidid 没资料时建助手照常成功" "$(echo "$o" | sed -n 's/^ *Message: //p')"
    fi
  else
    bad "hidid 没资料时建助手" "删不掉 hi_did.hi_user 那行 —— 前提不成立,没验"
  fi
  # 续期放在最后:续期会轮换 access,旧的那份随即失效
  # refresh token 在请求体里 —— 从 stdin 喂(-d @),不进命令行
  o=$(grpcurl -plaintext -protoset "$PS" -d @ "$AI_GRPC" hi.ai.Auth/RefreshToken 2>&1 <<<"{\"did\":\"$NDID\",\"node\":{\"app\":\"HiAI\",\"dev\":\"app\",\"mac\":\"ai-login-smoke-new\"},\"refreshToken\":\"$RT\"}")
  TOK2=$(echo "$o" | js token)
  [ -n "$TOK2" ] && [ -n "$(echo "$o" | js refreshToken)" ] && ok "RefreshToken 续期正常" || bad "RefreshToken 续期正常" "$(echo "$o" | head -3 | tr '\n' ' ')"
  o=$(aicall "$TOK2" '{"pagination":{"page":1,"limit":10}}' hi.ai.Agent/List)
  echo "$o" | grep -q '^ERROR:' && bad "续期后的 token 能用" "$(echo "$o" | sed -n 's/^ *Message: //p')" || ok "续期后的 token 能用"
else
  bad "后续调用" "没有 token —— 第三节没验"
fi

# ── 四、club 有资料的老用户不受影响 ───────────────────────────────────────────
echo "── 四、老用户 ──"
ODID=$(kv "$(R66 "cd /tmp/didtok && MN_FILE=$OLD_MN DID_ONLY=1 ./target/release/didtok")" DID)
if [ -z "$ODID" ] || [ "$(cnt hi_club.hi_chat_user did "$ODID")" != "1" ]; then
  bad "老用户夹具" "$OLD_MN 不在或它在 club 里没有资料 —— 先跑一遍 smoke-logout.sh"
else
  ok "前提:老用户在 club 里有资料"
  # 这次登录在老用户名下留一行登录态(mac=ai-login-smoke-old),退出时删掉 —— 老用户是夹具,不进 purge
  undo "mysqlq hi_ai \"delete from hi_ai_user_refreshtoken where did='$ODID' and mac='ai-login-smoke-old'\" >/dev/null && [ \"\$(mysqlq hi_ai \"select count(*) from hi_ai_user_refreshtoken where did='$ODID' and mac='ai-login-smoke-old'\")\" = 0 ]"
  ai_login "$OLD_MN" ai-login-smoke-old
  eq "老用户 GetReqStatus 不报错" "$SC" ""
  eq "老用户 base.did" "$(echo "$SR" | js base.did)" "$ODID"
  eq "老用户 base.name 取自 hidid" "$(echo "$SR" | js base.name)" "$(mysqlq hi_did "select name from hi_user where did='$ODID'")"
  [ -n "$(echo "$SR" | js token.token)" ] && ok "老用户拿到 token" || bad "老用户拿到 token" "token 为空"
fi

# ── 清夹具 ───────────────────────────────────────────────────────────────────
# 新身份($NDID)、它建的助手、hidid 首登注册的行、登录态、redis 里的 mqtt 账号 —— 全部由收尾的
# purge.py 按词删(全部库 + 全部 redis db,删完复扫,剩下不是 0 就 ✘ 非 0 退出)。
# 原来这里自己按列名扫四个库、自己 redis-cli 删 db1 —— 那是「删探针造的东西」的第二份实现,已收掉。

echo
echo "通过 $pass,失败 $fail"
[ "$fail" -eq 0 ]
