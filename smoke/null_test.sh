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
set -uo pipefail
export PATH=$HOME/go/bin:$PATH
PS=$(ls -d /home/lo/go/pkg/mod/github.com/*/hi-proto@v1.5.11-dev.4)/rust/src/gen/hi_proto_descriptor.bin
CLUB=192.168.1.65:9536 ; AI=192.168.1.65:9534 ; DID=192.168.1.65:9532
G="\033[32m"; R="\033[31m"; Y="\033[33m"; N="\033[0m"
pass=0; fail=0; skip=0
ok(){ printf "  ${G}✓${N} %s\n" "$1"; pass=$((pass+1)); }
no(){ printf "  ${R}✗${N} %s\n     → %s\n" "$1" "$2"; fail=$((fail+1)); }
sk(){ printf "  ${Y}—${N} %s (%s)\n" "$1" "$2"; skip=$((skip+1)); }
sql(){ ssh -o ConnectTimeout=20 lo@192.168.1.65 "mysql -N -B -ulo -p568568 -e \"$1\"" 2>/dev/null; }
# 三个调用器,各带各的凭据体系
cclub(){ grpcurl -plaintext -protoset "$PS" -H "Authorization: Bearer $CLUB_TOKEN" -d "$2" "$CLUB" "$1" 2>&1 | tr '\n' ' '; }
cdid(){  grpcurl -plaintext -protoset "$PS" -H "Authorization: Bearer $DID_TOKEN"  -d "$2" "$DID"  "$1" 2>&1 | tr '\n' ' '; }
cai(){   grpcurl -plaintext -protoset "$PS" -H "ApiKey: $AI_KEY"                   -d "$2" "$AI"   "$1" 2>&1 | tr '\n' ' '; }
# 断言调用成功(没有 ERROR),失败就直接把原文报出来 —— 别让"没变"冒充"对"
must(){ local what=$1 out=$2; case "$out" in *ERROR*) no "$what" "$out"; return 1;; esac; return 0; }

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
E(){ sql "select concat(ifnull(name,''),'|',ifnull(avatar,'')) from hi_did.hi_user where did='$DID_DID'"; }

if must "Edit 两个都传" "$(cdid 'hi.did.User/Edit' '{"name":"用例甲","avatar":"http://x/a.png"}')"; then
  s=$(E); [ "$s" = "用例甲|http://x/a.png" ] && ok "两个都传 → 都写进去" || no "两个都传" "库里=[$s]"
fi
if must "Edit 只传 name" "$(cdid 'hi.did.User/Edit' '{"name":"用例乙"}')"; then
  s=$(E); [ "$s" = "用例乙|http://x/a.png" ] && ok "只传 name → avatar **不动**(以前会被摊成空串)" || no "只传 name" "库里=[$s]"
fi
if must "Edit 传空头像" "$(cdid 'hi.did.User/Edit' '{"avatar":""}')"; then
  s=$(E); [ "$s" = "用例乙|" ] && ok "传 avatar=\"\" → **真的清空**(以前物理上写不进去)" || no "传空串清空头像" "库里=[$s]"
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
  s=$(E); [ "$s" = "用例丙|" ] && ok "什么都不传 → 一列都不动" || no "空请求改动了数据" "库里=[$s]"
fi

echo
echo "══════ 三、market:不传 duration = 永久(不是 0) ══════"
n=$(sql "select count(*) from hi_club.hi_club_market_listing where duration=0")
[ "${n:-x}" = "0" ] && ok "库里没有 duration=0 的残留" || no "还有 duration=0" "$n 行"
n=$(sql "select count(*) from hi_club.hi_club_market_grant where expire_at=0")
[ "${n:-x}" = "0" ] && ok "库里没有 expire_at=0 的残留" || no "还有 expire_at=0" "$n 行"
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
printf "结果:通过 ${G}%d${N},失败 ${R}%d${N},跳过 ${Y}%d${N}\n" "$pass" "$fail" "$skip"
[ "$fail" -eq 0 ]
