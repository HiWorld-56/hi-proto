#!/usr/bin/env bash
# 「禁止用空串/0/false 表示 null」改造的验收用例。
#
# 每条断言的是**改动前后的差别**,不是"接口能调通":
#   · 不传某字段   → 那一列不动(以前:被摊平成零值写进去,或被 Save 抹掉)
#   · 传空串/false → 真的写进去(以前:gorm 跳过零值,清空物理上做不到)
#   · bool 载荷不传 → 报 InvalidArgument(以前:静默当 false → 撤权/停用/解禁)
#
# ⚠️ **三套 token 互不通用**(见 TEST-CREDENTIALS.md):
#     CLUB_TOKEN  club 登录态      → hi.club.*
#     DID_TOKEN   hidid 登录态     → hi.did.*
#     AI_KEY      hi.ai 商户 key   → hi.ai.*(走 ApiKey 头,不是 Bearer)
#   用错体系会得到 Unauthenticated,**而断言"库里没变"照样成立** —— 那是假绿。
#   所以每条改数据的用例都先断言"调用真的成功了"。
#
# 用法(**在 .64 上跑** —— grpcurl 只有那台有):
#
#   CLUB_TOKEN=... CLUB_DID=... \
#   DID_TOKEN=...  DID_DID=...  \
#   AI_KEY=61be7d40-... AI_KEY_DID=zGcNS5gA... \
#   ./null_test.sh
#
# token 怎么造:.66 上 /tmp/tokgen(club)与 /tmp/didtok(hidid),见 TEST-CREDENTIALS.md。
#
# 🔴 **每个工具只跑一次,TOKEN 与 DID 从同一次输出里取。**
#    登录态是按 `(did, app, dev)` 一行的 —— 为了拿 DID 再跑一次 tokgen,
#    等于**同一个位又登录了一次**,前一个 token 当场失效。
#    表现是一片 `Code(103) 异地登陆`,而那看着像产品坏了(实际是夹具自己顶掉的)。
#
#      C=$(cd /tmp/tokgen && MN_FILE=... DEV=embedded ./target/release/tokgen)
#      CLUB_TOKEN=$(echo "$C" | grep ^TOKEN= | cut -d= -f2)
#      CLUB_DID=$(  echo "$C" | grep ^DID=   | cut -d= -f2)
# AI_KEY 是 club 容器 /root/res/config.yml 的 HiAIServer.APIKEY;
# AI_KEY_DID 是它对应的人 —— hi.ai 的权限判据是 `agent.creator == 它`。
#
# ⚠️ **绿了不等于测到了。** 改完要反向验一次:把对应服务退回改造前那版,这些用例必须**红**。
#    2026-08-29 实测:退回 hi-did v2.5.26-dev5-3 后「传 avatar="" → 真的清空」当场变红;
#    而「只传 name → avatar 不动」**新旧两版都绿** —— 旧版是靠 gorm 跳过零值"碰巧"对的,
#    它不具备区分力。留着当不变式可以,别拿它当这次改动的证据。
set -uo pipefail
export PATH=$HOME/go/bin:$PATH
# protoset:**取当前最新的那份**,别把版本号写死。
#
# 原来这里写死 `hi-proto@v1.5.11-dev.4`,而 proto 已经走到 dev.14 —— 回归网自己落后于代码。
# 后果不是"跑不起来"那么直白:老 descriptor 里**没有新加的字段与方法**,
# grpcurl 会把它们当成未知字段拒掉,而那条错看着像"服务端不认这个参数"。
#
# 允许用 HI_PB 覆盖(想钉某一版时)。
PS=${HI_PB:-}
if [ -z "$PS" ]; then
  # 按**版本号**排,不按 mtime —— mtime 是"什么时候下载的",与新旧无关。
  PS=$(ls -d /home/lo/go/pkg/mod/github.com/*/hi-proto@* 2>/dev/null \
       | sed "s/.*hi-proto@//" | sort -V | tac \
       | while read -r v; do
           d=$(ls -d /home/lo/go/pkg/mod/github.com/*/hi-proto@"$v" 2>/dev/null | head -1)
           [ -n "$d" ] && [ -f "$d/rust/src/gen/hi_proto_descriptor.bin" ] && { echo "$d/rust/src/gen/hi_proto_descriptor.bin"; break; }
         done)
fi
[ -n "$PS" ] && [ -f "$PS" ] || { echo "找不到 hi_proto_descriptor.bin —— 先在任一后端仓跑一次 go mod download"; exit 2; }
echo "protoset: $PS"
CLUB=192.168.1.65:9536 ; AI=192.168.1.65:9534 ; DID=192.168.1.65:9532
G="\033[32m"; R="\033[31m"; Y="\033[33m"; N="\033[0m"
pass=0; fail=0; skip=0
ok(){ printf "  ${G}✓${N} %s\n" "$1"; pass=$((pass+1)); }
no(){ printf "  ${R}✗${N} %s\n     → %s\n" "$1" "$2"; fail=$((fail+1)); }
sk(){ printf "  ${Y}—${N} %s (%s)\n" "$1" "$2"; skip=$((skip+1)); }
# 🔴 **取数失败与"取到空"必须分得开。**
#
# 这条查询走 ssh 到 .65。那条链会抖(实测:同一次跑里前面几条正常、中间一条超时),
# 而失败的表现是**返回空串** —— 于是断言变成 `want=<NULL> got=`,
# **看着像产品坏了**。2026-08-29 就被这个骗过一次,今天又骗了一次。
#
# 两件事一起做:重试三次;三次都不行就置 SQL_ERR=1,让调用方报"没验"而不是"失败"。
SQL_ERR=0
sql(){
  local _i _out
  for _i in 1 2 3; do
    if _out=$(ssh -o ConnectTimeout=20 -o BatchMode=yes lo@192.168.1.65 \
                  "mysql -N -B -ulo -p568568 -e \"$1\"" 2>/dev/null); then
      SQL_ERR=0; printf '%s' "$_out"; return 0
    fi
    sleep 2
  done
  SQL_ERR=1; return 1
}
# 取一个**必须有值**的标量:取不到就是取数坏了,不是被测的东西坏了。
sqlv(){ local _v; _v=$(sql "$1") || { SQL_ERR=1; return 1; }; printf '%s' "$_v"; }
# 三个调用器,各带各的凭据体系
cclub(){ grpcurl -plaintext -protoset "$PS" -H "Authorization: Bearer $CLUB_TOKEN" -d "$2" "$CLUB" "$1" 2>&1 | tr '\n' ' '; }
cdid(){  grpcurl -plaintext -protoset "$PS" -H "Authorization: Bearer $DID_TOKEN"  -d "$2" "$DID"  "$1" 2>&1 | tr '\n' ' '; }
cai(){   grpcurl -plaintext -protoset "$PS" -H "ApiKey: $AI_KEY"                   -d "$2" "$AI"   "$1" 2>&1 | tr '\n' ' '; }
# 断言调用**真的成功了**,失败就把原文报出来 —— 别让"库里没变"冒充"行为对"。
#
# ⚠️ grpcurl 有**两种**失败形态,只认一种就会漏:
#     ERROR:\n  Code: ...          ← 服务端回的 gRPC 状态
#     Error invoking method "..."   ← grpcurl 自己的客户端错(方法名写错、协议解析不了…)
#   2026-08-29 就漏过第二种:方法名写成了 hi.did.Merchant/Set(真名是 Update),
#   调用压根没发出去,而"币种位图没变"这条断言**照样绿** —— 假绿。
must(){
  local what=$1 out=$2
  case "$out" in
    *"ERROR:"*|*"Error invoking method"*|*"Failed to dial"*)
      no "$what" "$out"; return 1;;
  esac
  return 0
}

: "${CLUB_TOKEN:?}" ; : "${DID_TOKEN:?}" ; : "${AI_KEY:?}" ; : "${DID_DID:?}"
: "${CLUB_DID:?}"   # club token 对应的 did,用来造只属于它自己的 apikey 夹具
: "${AI_KEY_DID:?}" # 商户 key 的 did —— hi.ai 的判据是 agent.creator == 它

# ── 夹具:现取,不写死 ────────────────────────────────────────────────────
# hi.ai 的权限判据是 `agent.creator == 商户 key 的 did`。拿一台**真属于这把 key、
# 且真装了插件**的机器人 —— 否则会先撞 PermissionDenied / "没装此插件",
# 那时候断言"没报 InvalidArgument"就成了假绿:守卫压根没被走到。
read -r FX_AGENT FX_UUID <<<"$(sql "select u.agent_did, u.uuid from hi_ai.hi_ai_plugin_using u
  join hi_ai.hi_ai_agent a on a.did=u.agent_did
  where a.creator='$AI_KEY_DID' and u.deleted_at is null limit 1" | tr '\t' ' ')"
if [ -z "${FX_AGENT:-}" ]; then
  printf "  ${Y}—${N} 取不到「该商户 key 名下且装了插件」的机器人,插件类用例会被跳过\n"
fi

# apikey 夹具:自己造一把只属于 CLUB_DID 的,用完删(别去动别人的行)
FX_KEY="nulltest$(date +%s)"
sql "insert into hi_club.hi_chat_api_key(value,user,note,created_at,updated_at)
     values('$FX_KEY','$CLUB_DID','原备注',now(3),now(3))" >/dev/null
cleanup(){ sql "delete from hi_club.hi_chat_api_key where value='$FX_KEY'" >/dev/null; }
trap cleanup EXIT

echo
echo "══════ 一、bool 载荷:不传必须报错,不能静默当 false ══════"
run_bool(){ # <描述> <调用器> <方法> <json> <字段名>
  local out; out=$($2 "$3" "$4")
  if grep -q "InvalidArgument" <<<"$out" && grep -q "$5" <<<"$out"; then ok "$1"
  else no "$1" "$out"; fi
}
if [ -n "${FX_AGENT:-}" ]; then
  run_bool "SetEnabled 不传 enabled → InvalidArgument"     cai "hi.ai.Plugin/SetEnabled"      "{\"agent\":\"$FX_AGENT\",\"uuid\":\"$FX_UUID\"}" enabled
  run_bool "SetFollowLatest 不传 on → InvalidArgument"     cai "hi.ai.Plugin/SetFollowLatest" "{\"agent\":\"$FX_AGENT\",\"uuid\":\"$FX_UUID\"}" on
else
  sk "SetEnabled / SetFollowLatest 不传" "没有可用的机器人夹具"
fi
run_bool "SetDnd 不传 dnd → InvalidArgument"                cclub "hi.club.Group/SetDnd"           '{"code":"nosuchgroup"}'            dnd
run_bool "MuteMembers 不传 muted → InvalidArgument"         cclub "hi.club.Group/MuteMembers"      '{"code":"nosuchgroup","members":["a"]}' muted
run_bool "SetAutoRenew 不传 enabled → 报错"                 cclub "hi.club.Market/SetAutoRenew"    '{"grantUuid":"nosuch"}'            enabled

# 反向:显式 false 不能也被当成"没传"
if [ -n "${FX_AGENT:-}" ]; then
  # 显式 false 必须**真的写进库** —— 只断言"没报 InvalidArgument"是不够的:
  # gorm 的 Updates(struct) 会跳过零值,那种情况下也不报错,只是没写。
  sql "update hi_ai.hi_ai_plugin_using set enabled=1 where agent_did='$FX_AGENT' and uuid='$FX_UUID'" >/dev/null
  if must "SetEnabled 显式 false" "$(cai 'hi.ai.Plugin/SetEnabled' "{\"agent\":\"$FX_AGENT\",\"uuid\":\"$FX_UUID\",\"enabled\":false}")"; then
    v=$(sql "select enabled from hi_ai.hi_ai_plugin_using where agent_did='$FX_AGENT' and uuid='$FX_UUID'")
    [ "$v" = "0" ] && ok "显式 false → **真的写成 0**(不是被当零值跳过)" || no "显式 false 没写进库" "enabled=[$v]"
    sql "update hi_ai.hi_ai_plugin_using set enabled=1 where agent_did='$FX_AGENT' and uuid='$FX_UUID'" >/dev/null
  fi
else
  sk "SetEnabled 显式 false" "没有可用的机器人夹具"
fi

echo
echo "══════ 二、改资料(hi.did):不传=不动,传空串=真清空 ══════"
# 🔴 **不能用 `ifnull(avatar,'')`。** 那正是这一整轮要消灭的东西:它把 NULL 摊成空串,
# 于是「清成 NULL」(对)和「写成空串」(错)在断言里长得**一模一样** ——
# 这条用例本来就是验"清空要写 NULL",结果自己的判据把两者摊平了。
# (2026-09-03 发现:同一个毛病在 SQL 里叫 COALESCE、在 Go 里叫 GetX()、
#  在这儿叫 ifnull —— 三处都踩过。)
E(){ sql "select concat(ifnull(name,'<NULL>'),'|',if(avatar is null,'<NULL>',concat('[',avatar,']'))) from hi_did.hi_user where did='$DID_DID'"; }

if must "Edit 两个都传" "$(cdid 'hi.did.User/Edit' '{"name":"用例甲","avatar":"http://x/a.png"}')"; then
  s=$(E); [ "$s" = "用例甲|[http://x/a.png]" ] && ok "两个都传 → 都写进去" || no "两个都传" "库里=[$s]"
fi
if must "Edit 只传 name" "$(cdid 'hi.did.User/Edit' '{"name":"用例乙"}')"; then
  s=$(E); [ "$s" = "用例乙|[http://x/a.png]" ] && ok "只传 name → avatar **不动**(以前会被摊成空串)" || no "只传 name" "库里=[$s]"
fi
if must "Edit 传空头像" "$(cdid 'hi.did.User/Edit' '{"avatar":""}')"; then
  s=$(E); [ "$s" = "用例乙|<NULL>" ] && ok "传 avatar=\"\" → **真的清空,而且落 NULL 不是空串**" || no "传空串清空头像" "库里=[$s]"
fi
# updated_at 必须前进 —— Entity.update 是资料惰性传播的唯一依据
U(){ sql "select cast(unix_timestamp(updated_at)*1000 as signed) from hi_did.hi_user where did='$DID_DID'"; }
u1=$(U); sleep 1
if must "Edit 推进 updated_at" "$(cdid 'hi.did.User/Edit' '{"name":"用例丙"}')"; then
  u2=$(U)
  if [ "${u2:-0}" -gt "${u1:-0}" ]; then ok "改资料推进 updated_at(map 更新没把它漏掉)"
  else no "updated_at 没前进 → 资料改了但**不会惰性传播**" "before=$u1 after=$u2"; fi
fi
if must "Edit 空请求" "$(cdid 'hi.did.User/Edit' '{}')"; then
  s=$(E); [ "$s" = "用例丙|<NULL>" ] && ok "什么都不传 → 一列都不动" || no "空请求改动了数据" "库里=[$s]"
fi

echo
echo "══════ 二之二、部分更新不能殃及别的列(repeated 没有 presence) ══════"
# Merchant.Update 被两个页面共用:首页发 {name,logo,coins},调用服务页发 {endpoint,scheme}。
# 后者**不带 coins** —— 服务端若无条件重算五个币种位图,保存一次就把币种配置抹了,
# 而且一声不响。2026-08-29 真出过:改成 map 更新之后,原本靠 gorm 跳过零值
# "碰巧"没事的那层运气就没了。
#
# ⚠️ 身份用**商户主人的 hidid 登录 token**(不是 ExtendToken)——
#    Merchant.Update 的 handler 读的是 ctx 的 `did`,而拦截器只做 `did → merchant_did`
#    单向归一化,ExtendToken 那条路注入的是 merchant_did,handler 拿不到 did。
#    (这是既有问题,2025-10-30 就这样,不是本次改造引入的;见记录。)
#
# 夹具:给 DID_DID 建一行商户,用完删 —— 不去动真商户的数据。
FX_BITS="1,3,3,3,1"
sql "insert into hi_did.hi_merchant(did,name,btc,eth,trx,sol,apt,endpoint,created_at,updated_at)
     values('$DID_DID','nulltest商户',1,3,3,3,1,'http://before.example',now(),now())
     on duplicate key update btc=1,eth=3,trx=3,sol=3,apt=1,endpoint='http://before.example'" >/dev/null
MBITS(){ sql "select concat(btc,',',eth,',',trx,',',sol,',',apt) from hi_did.hi_merchant where did='$DID_DID'"; }
b4=$(MBITS)
if [ "$b4" != "$FX_BITS" ]; then
  sk "币种位图不被殃及" "夹具没建成(位图=[$b4])"
else
  if must "Merchant.Update 只发 endpoint" "$(cdid 'hi.did.Merchant/Update' '{"endpoint":"http://after.example/probe"}')"; then
    af=$(MBITS)
    ep=$(sql "select ifnull(endpoint,'<NULL>') from hi_did.hi_merchant where did='$DID_DID'")
    # 先验"这次调用真的写成了",再验"别的列没被殃及" —— 否则"没变"就是假绿
    if [ "$ep" = "http://after.example/probe" ]; then
      ok "endpoint 写进去了(证明这次调用确实生效)"
      [ "$af" = "$b4" ] && ok "只发 endpoint → 币种位图**原样不动**(共用 RPC 的部分更新)" \
        || no "部分更新把币种位图改了" "before=[$b4] after=[$af]"
    else
      no "endpoint 没写进去 —— 后面那条'不动'会是假绿" "endpoint=[$ep]"
    fi
  fi
fi
sql "delete from hi_did.hi_merchant where did='$DID_DID' and name='nulltest商户'" >/dev/null

echo
echo "══════ 三、market:不传 duration = 永久(不是 0) ══════"
# ⚠️ 计数为空 = **取数失败**,不是"零行"。分不开的话链路一抖就报成产品坏了。
cnt(){ local _v; _v=$(sql "$1"); if [ "$SQL_ERR" = "1" ] || [ -z "$_v" ]; then echo "ERR"; else echo "$_v"; fi; }
n=$(cnt "select count(*) from hi_club.hi_club_market_listing where duration=0")
case "$n" in ERR) sk "duration=0 残留" "查库没取到数,这一条没验";;
             0)   ok "库里没有 duration=0 的残留";;
             *)   no "还有 duration=0" "$n 行";; esac
n=$(cnt "select count(*) from hi_club.hi_club_market_grant where expire_at=0")
case "$n" in ERR) sk "expire_at=0 残留" "查库没取到数,这一条没验";;
             0)   ok "库里没有 expire_at=0 的残留";;
             *)   no "还有 expire_at=0" "$n 行";; esac
out=$(grpcurl -plaintext -protoset "$PS" -d '{"pagination":{"page":1,"limit":100}}' "$CLUB" hi.club.MarketDirectory/SearchListings 2>&1)
z=$(python3 - <<PY 2>/dev/null
import json
try: d=json.loads('''$out''')
except Exception: print("ERR"); raise SystemExit
rows=d.get("list",[])
bad=[r for r in rows if "duration" in r and str(r["duration"]) in ("0","")]
print("%d/%d" % (len(bad), len(rows)))
PY
)
case "$z" in
  0/*) ok "回包里没有 duration=0(共 ${z#*/} 个挂牌)";;
  ERR|"") no "SearchListings 解析失败" "$(head -c 160 <<<"$out")";;
  *) no "回包里仍有 duration=0" "$z";;
esac
# 建挂牌传 duration=0 必须被拒(0 秒 = 买了立刻过期,不是"永久")。
# ⚠️ 得用**这个 club 用户真拥有的机器人**,否则先撞上"机器人不属于你",
#    那时 duration 校验根本没被走到 —— 断言会变成假绿。
MY_AGENT=$(sql "select sub_did from hi_club.v_master where master_did='$CLUB_DID' limit 1")
if [ -n "$MY_AGENT" ]; then
  out=$(cclub "hi.club.Market/CreateListing" \
    "{\"agent\":\"$MY_AGENT\",\"pluginUuid\":\"nosuchplugin\",\"settleMode\":\"SETTLE_MODE_PAID\",\"duration\":0}")
  if grep -q "duration" <<<"$out"; then ok "建挂牌 duration=0 → 被拒(0 秒不是'永久')"
  else sk "duration=0 校验" "先撞上别的校验:$(head -c 110 <<<"$out")"; fi
else
  sk "duration=0 校验" "该 club 用户名下没有机器人"
fi

echo
echo "══════ 四、备注:不传=不动(以前 Save 会抹掉),传空串=清空 ══════"
KEY="$FX_KEY"
if [ -z "$KEY" ]; then sk "ApiKey 备注用例" "夹具没造出来"; else
  sql "update hi_club.hi_chat_api_key set note='原备注' where value='$KEY'" >/dev/null
  if must "ApiKey.Edit 不传 note" "$(cclub 'hi.club.ApiKey/Edit' "{\"apiKey\":\"$KEY\"}")"; then
    nt=$(sql "select ifnull(note,'<NULL>') from hi_club.hi_chat_api_key where value='$KEY'")
    [ "$nt" = "原备注" ] && ok "不传 note → 备注**没被抹掉**(以前 Save 会写全字段)" || no "不传 note 却改了备注" "note=[$nt]"
  fi
  if must "ApiKey.Edit 传空 note" "$(cclub 'hi.club.ApiKey/Edit' "{\"apiKey\":\"$KEY\",\"note\":\"\"}")"; then
    nt=$(sql "select ifnull(note,'<NULL>') from hi_club.hi_chat_api_key where value='$KEY'")
    [ "$nt" = "" ] && ok "传 note=\"\" → 真的清空" || no "传空串没清空" "note=[$nt]"
  fi
fi

echo
echo "══════ 五、建机器人不传头像 → 落 NULL,不是空串 ══════"
#
# 🔴 这一条是 2026-09-03 一个**真 bug** 的回归用例,而它当时是靠翻数据发现的 ——
#    没有任何测试挡得住:整条链三段各丢一次 presence,
#
#      handler   req.GetAvatar()             GetX() 把"没传"摊成 ""
#      service   func(..., avatar string)    裸 string,签名这一层就没有 presence
#      → hi.Entity{Avatar: proto.String(avatar)}    把 "" 包回成「有一个头像,它是空串」
#
#    而 hi-ai 的 createAgent 里写着「指针直传:没传头像就是 NULL,不是空串」——
#    那句断言因此永远不成立。实测两张主用户表各 107 行 avatar="",
#    全是 08-29 迁移之后写进去的,也就是**迁移做完当天就开始被写回来**。
#
# ⚠️ 判据要看**两张表**:hi-ai 建 agent 行、club 拿回包再建自己那行。
#
# 🔴 **取 did 用 JSON 解,不要 sed 抓第一个 `"did"`。**
#    回包里第一个 did 是**创建者**,不是新建的机器人 —— 我第一版就是这么写的,
#    于是后面的清理把**测试用户自己**从两张主用户表里删掉了,
#    再登录直接 `RegisterRobot ... 服务内部错误`(agent 行还在、user 行没了)。
newdid(){ python3 -c '
import sys, json, re
raw = sys.stdin.read()
m = re.search(r"\{.*\}", raw, re.S)
try:
    d = json.loads(m.group(0)) if m else {}
    print(d.get("base", {}).get("did") or d.get("data", {}).get("base", {}).get("did") or "")
except Exception:
    print("")
'; }

mkbot(){ cclub 'hi.club.Agent/CreateAssistant' "$1"; }
# 用**产品自己的删除接口**清理,不要手写 SQL ——
# 删一个 did 要动四个库 + redis 的 ACL,手删只会留一地孤儿(实测过)。
delbot(){
  [ -n "$1" ] && [ "$1" != "$CLUB_DID" ] || return 0     # 决不删调用者自己
  cclub 'hi.club.Agent/Delete' "{\"agent\":\"$1\"}" >/dev/null 2>&1
}

AG=$(mkbot '{"name":"nulltest-avatar"}')
NEW_DID=$(newdid <<<"$AG")
if [ -z "$NEW_DID" ]; then
  sk "建机器人不传头像" "建不出来:$(head -c 160 <<<"$AG")"
elif [ "$NEW_DID" = "$CLUB_DID" ]; then
  no "取到的 did 是调用者自己" "解析回包出错,拒绝往下走(否则会删掉测试用户)"
else
  n1=$(sql "select count(*) from hi_ai.hi_ai_user where did='$NEW_DID'")
  n2=$(sql "select count(*) from hi_club.hi_chat_user where did='$NEW_DID'")
  if [ "$SQL_ERR" = "1" ] || [ -z "$n1" ] || [ -z "$n2" ]; then
    sk "建机器人不传头像" "查库没取到数(ssh 到 .65 那条链抖了),这一条**没验**"
  elif [ "$n1" != "1" ] || [ "$n2" != "1" ]; then
    no "建机器人:两张表都该有行" "hi_ai=$n1 hi_chat=$n2"
  else
    a1=$(sql "select if(avatar is null,'<NULL>',concat('[',avatar,']')) from hi_ai.hi_ai_user where did='$NEW_DID'")
    a2=$(sql "select if(avatar is null,'<NULL>',concat('[',avatar,']')) from hi_club.hi_chat_user where did='$NEW_DID'")
    [ "$a1" = "<NULL>" ] && ok "hi_ai_user.avatar 落 NULL(不是空串)" \
                         || no "hi_ai_user.avatar 不是 NULL" "got=$a1 —— GetX()/proto.String 又把它摊平了"
    [ "$a2" = "<NULL>" ] && ok "hi_chat_user.avatar 落 NULL(不是空串)" \
                         || no "hi_chat_user.avatar 不是 NULL" "got=$a2"
  fi
  # ✅ 反面:**传了头像要真的写进去**,别用"一律不写"糊弄过上面那两条
  AG2=$(mkbot '{"name":"nulltest-avatar2","avatar":"https://x/y.png"}')
  D2=$(newdid <<<"$AG2")
  if [ -n "$D2" ] && [ "$D2" != "$CLUB_DID" ]; then
    a3=$(sql "select ifnull(avatar,'<NULL>') from hi_ai.hi_ai_user where did='$D2'")
    if [ "$SQL_ERR" = "1" ] || [ -z "$a3" ]; then sk "传了头像要真的写进去" "查库没取到数,这一条没验"
    elif [ "$a3" = "https://x/y.png" ]; then ok "传了头像要真的写进去(不许一律不写)"
    else no "传了头像没写进去" "got=$a3"; fi
    delbot "$D2"
  fi
  delbot "$NEW_DID"
fi

echo
echo "══════ 六、core 那一层也要能表达「不传=不动」 ══════"
#
# 前面几节验的是**后端**的 presence 语义。但客户端够不着后端 ——
# 它经 `hiclub-core-mqtt` 的 `update_my_profile`,而那个方法原来收三个裸 `&str`,
# 进去一律 `Some(...)`:**物理上表达不了"不传"**,于是每个调用方都被迫
# 先 GetCurrentUser 拿现值、把不打算改的字段 `unwrap_or_default()` 之后原样回写。
#
# 那套绕法关不住一个洞:`unwrap_or_default()` 把"没有头像"摊成 `""`,
# 而 `""` 在后端是**清空**。只要那一刻读回来是空的(刚登录还没刷新、或那次读失败),
# 一次「只改验证方式」就能把用户真实的头像抹掉,**而且全程没有任何报错**。
#
# 2026-09-03 改成四个字段各自 `Option`。这一节把三种取值都钉住 ——
# 少了它,下次有人"顺手"把签名改回裸 String,前面五节照样全绿。
UMP_MN=${UMP_MN_FILE:-/tmp/cam_mn.txt}
UMP_DID=${UMP_DID:-zTAYhBG2DfQyKphn1qP3ksRBQWGiZqfbLV}
NEXT=${NEXT_HOST:-192.168.1.66}
pc(){ ssh -o ConnectTimeout=15 "$NEXT" \
        "cd ~/wip/hiclub-core-mqtt && ./target/release/peer_cli $1 \"\$(cat $UMP_MN)\" $2" 2>&1 | tail -1; }
umpq(){ sql "select concat(ifnull(name,'<NULL>'),'|',ifnull(avatar,'<NULL>'),'|',ifnull(friend_verify_policy,'<NULL>')) from hi_club.hi_chat_user where did='$UMP_DID'"; }

if ! ssh -o ConnectTimeout=10 "$NEXT" "test -x ~/wip/hiclub-core-mqtt/target/release/peer_cli" 2>/dev/null; then
  sk "core 的 update_my_profile 三态" "$NEXT 上没有 peer_cli(cargo build --release --features testkit --bin peer_cli)"
else
  # 先把三样设成已知值 —— **断言之前先把前提摆平**,否则"没变"是二义的。
  pc profile "ump-base http://x/UMP.png" >/dev/null
  pc accept-on "" >/dev/null
  BASE=$(umpq)
  case "$BASE" in
    "ump-base|http://x/UMP.png|auto_accept") ok "前提:name/avatar/policy 三样都设好了";;
    *) sk "core 的 update_my_profile 三态" "前提没摆平(got=$BASE),这一节没验"; BASE="";;
  esac

  if [ -n "$BASE" ]; then
    # ① 只改名字 → 另外两样**一个都不许动**
    pc profile "ump-renamed" >/dev/null
    A=$(umpq)
    [ "$A" = "ump-renamed|http://x/UMP.png|auto_accept" ] \
      && ok "只改 name → avatar / policy **原样不动**(不传=不动)" \
      || no "只改 name 却动了别的" "want=ump-renamed|http://x/UMP.png|auto_accept got=$A"

    # ② 只改验证方式 → name/avatar 不许动。
    #    这条是老写法最危险的那个入口:它只想改 policy,却被迫回写 avatar。
    pc accept-on "" >/dev/null
    B=$(umpq)
    [ "$B" = "ump-renamed|http://x/UMP.png|auto_accept" ] \
      && ok "只改 policy → name / avatar **原样不动**" \
      || no "只改 policy 却动了别的" "got=$B"

    # ③ 显式传空串 → **真的清空,而且落 NULL 不是空串**。
    #    别从一个极端跑到另一个极端:改成 Option 之后"清空"这条路必须还在。
    pc profile "ump-renamed ''" >/dev/null
    C=$(sql "select if(avatar is null,'<NULL>',concat('[',avatar,']')) from hi_club.hi_chat_user where did='$UMP_DID'")
    [ "$C" = "<NULL>" ] \
      && ok "显式传空串 → 真的清空,且落 **NULL** 不是空串" \
      || no "传空串没清干净" "got=$C"

    # 收尾:设回去,别给下一个用这个账号的人留一个没头像的用户
    pc profile "ump-base http://x/UMP.png" >/dev/null
    D=$(sql "select ifnull(avatar,'<NULL>') from hi_club.hi_chat_user where did='$UMP_DID'")
    [ "$D" = "http://x/UMP.png" ] && ok "收尾:头像设得回来(不是一去不回)" \
                                  || no "收尾没设回去" "got=$D"
  fi
fi

echo
printf "结果:通过 ${G}%d${N},失败 ${R}%d${N},跳过 ${Y}%d${N}\n" "$pass" "$fail" "$skip"
[ "$fail" -eq 0 ]
