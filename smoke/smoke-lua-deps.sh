#!/bin/bash
# lua 插件的 **C 模块依赖**链 —— 全套五段,判据是 magic 值经 cjson 编解码一圈还对。
#
# ## 为什么要端到端
#
# 这条链有五段,**中间任何一段断了都只在机器人本地日志里露一句
# `module 'cjson' not found`,服务端全程 code 0**:
#
#     requirements.txt  →  hi.ai 解析,按配方让构建服务编两个架构
#                       →  落进 hi_ai_lua_dep(全机共用的集合)
#                       →  ListOnDevice 的 deps 带上坐标
#                       →  brain 下到 /opt/hinj/luadeps/<rock>/<版本>/
#                       →  runner 在沙箱里 __native(rock,版本,模块) 拿到
#
# 单测覆盖的是最后一段(hinj-lua 的 `dep_lua_is_read_from_collection`、
# `c_module_dot_maps_to_subdir`、`undeclared_dep_is_refused`),
# 前四段**只有真发一次版才验得到**。
#
# ## 判据
#
# 插件里那句是 `cjson.decode(cjson.encode{token=MAGIC}).token` ——
# 只有真加载到了那个 `.so` 才跑得通。再看 **hi.ai 侧**的 `role=tool` 回执里
# 有没有 `HI-LUADEP-9X7B3`:**不看模型最后那句话**(工具没跑时它会自己编一个)。
#
# ## 环境
#
# 在 **.64** 上跑。要一台**真机器人**(默认 .66 那台)、它的**主人助记词**,
# 以及构建服务里有 `lua-cjson` 的配方。
#
#   bash smoke-lua-deps.sh   # 包会自己造
set -uo pipefail
source "$(dirname "$0")/_endpoints.sh"

ROBOT=${ROBOT_DID:-zCgtPX6TsR2343Zk1wKdtbDDvsvavCLAVj}
MN_FILE=${MASTER_MN_FILE:-/tmp/rbt_mn.txt}
ROCK=${LUA_ROCK:-lua-cjson}; RVER=${LUA_ROCK_VER:-2.1.0}
MAGIC=${LUADEP_MAGIC:-HI-LUADEP-9X7B3}
NEXT=${NEXT_HOST:-192.168.1.66}; DEPLOY=${DEPLOY_HOST:-192.168.1.65}

G="\033[32m"; R="\033[31m"; Y="\033[33m"; N="\033[0m"
pass=0; fail=0
ok(){  printf "  ${G}✓${N} %s\n" "$1"; pass=$((pass+1)); }
bad(){ printf "  ${R}✗${N} %s\n     → %s\n" "$1" "$2"; fail=$((fail+1)); }
sk(){  printf "  ${Y}—${N} 没验:%s\n" "$1"; }
has(){ case "$2" in *"$3"*) ok "$1";; *) bad "$1" "没有 '$3':$(echo "$2"|head -c 200)";; esac; }
g(){ python3 -c '
import sys, json
try:
    d = json.load(sys.stdin)
    for k in sys.argv[1:]: d = d[k]
    print(d if d is not None else "")
except Exception: print("")' "$@"; }

have_db || { echo "够不着 mysql(本机没装时会 ssh 到 $DB 查)"; exit 2; }

echo "══════ lua 插件的 C 模块依赖:五段全走一遍 ══════"

# ── 前提 ──────────────────────────────────────────────────────────────────
# **先证明前提**:机器人在跑、构建服务里有这个配方。缺哪个都会让后面
# 报成"依赖链坏了",而真因是环境没准备好。
[ "$(ssh -o ConnectTimeout=10 "$NEXT" 'systemctl --user is-active hinj-brain-local' 2>/dev/null)" = active ] \
  || { sk "$NEXT 上的 hinj-brain 没在跑"; exit 2; }
ssh -o ConnectTimeout=10 "$NEXT" "docker exec hi-plugin-build ls /opt/hinj/luarecipes" 2>/dev/null | grep -qx "$ROCK" \
  || { sk "构建服务里没有 $ROCK 的配方(有哪些:见容器的 /opt/hinj/luarecipes)"; exit 2; }
TOK=$(ssh -o ConnectTimeout=10 "$NEXT" \
      "cd /tmp/tokgen && MN_FILE=$MN_FILE DEV=app ./target/release/tokgen 2>/dev/null" | grep '^TOKEN=' | cut -d= -f2-)
[ -n "$TOK" ] || { sk "拿不到主人 token"; exit 2; }
ok "前提:brain 在跑、构建服务有 $ROCK 的配方、拿到主人 token"

cj(){ curl -s $CAC -m 300 -X POST "$CLUB_API/$1" -H 'Content-Type: application/json' \
        -H "Authorization: Bearer $TOK" -d "$2"; }

PKG=$(MINIO_HOST=${MINIO_HOST:-192.168.1.65:9000} python3 "$(dirname "$0")/build_luadeppkg.py" "$ROCK" "$RVER" 2>&1 | tail -1)
case "$PKG" in https://*) ok "造出带 requirements.txt 的包";; *) bad "造包失败" "$PKG"; exit 1;; esac

echo
echo "── 一、发版:requirements.txt 被解析并落库 ──"
B=$(cj agent/create_assistant '{"name":"ldep-bot"}' | g data base did)
cj api_key/create "{\"agent\":\"$B\"}" >/dev/null
P=$(cj plugin/create_shell "{\"agent\":\"$B\",\"name\":\"ldep-demo\"}" | g data uuid)
[ -n "$P" ] || { bad "建壳失败" ""; exit 1; }
CV=$(cj plugin/create_version "{\"agent\":\"$B\",\"version\":{\"uuid\":\"$P\",\"version\":\"1.0.0\",\"url\":\"$PKG\"}}")
has "发版成功(依赖已按配方编好,失败会在这里报出来)" "$CV" '"code":0'

# 🔴 判据在**库**里,不在回包里。`deps` 是 `PluginArtifact` 上的字段,
#    而制品上的 deps 是**下发时按这台机器人算的并集**,版本列表里本来就没有 ——
#    第一次写这条脚本时在 list_versions 里找 deps,找到 null 差点报成 bug。
DECL=$(mysqlq hi_ai "select concat(rock,' ',dep_version) from hi_ai_plugin_version_dep where uuid='$P' and version='1.0.0'")
[ "$DECL" = "$ROCK $RVER" ] && ok "声明落进 hi_ai_plugin_version_dep($DECL)" \
                            || bad "声明没落库" "want='$ROCK $RVER' got='$DECL'"

# 集合里两个架构都要有 —— **只建一个的话,另一种架构的机器人装上去 require 不到**,
# 而那条错只在它自己的本地日志里。
NT=$(mysqlq hi_ai "select count(distinct target) from hi_ai_lua_dep where rock='$ROCK' and version='$RVER'")
[ "$NT" = "2" ] && ok "集合里 aarch64 与 x86_64 **两个架构都有**" \
                || bad "集合里架构不全" "distinct target = $NT(要 2)"

echo
echo "── 二、装到真机器人(自己名下用「分享」,不是购买)──"
# ⚠️ 自己名下的机器人**不能走 market/apply** —— 服务端会说
#    「这是你自己名下机器人挂的插件,请用「分享」」。这是对的:自己人不用付钱。
L=$(cj market/create_listing "{\"agent\":\"$B\",\"plugin_uuid\":\"$P\",\"settle_mode\":1}" | g data uuid)
cj market/set_listing_status "{\"uuid\":\"$L\",\"status\":2}" >/dev/null
OF=$(cj market/offer "{\"listing_uuid\":\"$L\",\"to_agent\":\"$ROBOT\"}")
has "分享给自己名下的机器人 → **直接 INSTALLED**(不用谁同意)" "$OF" 'GRANT_STATUS_INSTALLED'

echo
echo "── 三、机器人把依赖下下来了吗 ──"
sleep 25
LOG=$(ssh -o ConnectTimeout=20 "$NEXT" 'tail -60 ~/wip/hinj-brain/log/brain.log' 2>/dev/null)
has "brain 装上了 $ROCK 的文件(luadep-sync)" "$LOG" "[luadep-sync] 装上 $ROCK/$RVER"
has "插件本体也装上了" "$LOG" "$P@1.0.0"
# 落盘布局:`<根>/<rock>/<版本>/<path>`。**版本进路径**是有意的 ——
# 插件 A 要 0.4.3、B 要 0.4.4 时两份要能共存。
ssh -o ConnectTimeout=20 "$NEXT" "ls /opt/hinj/luadeps/$ROCK/$RVER/ 2>/dev/null" | grep -q . \
  && ok "落盘布局是 /opt/hinj/luadeps/$ROCK/**$RVER**/(版本进路径,多版本能共存)" \
  || bad "落盘路径不对" "ls /opt/hinj/luadeps/$ROCK/$RVER 是空的"

echo
echo "── 四、模型点得动,且值真的过了一遍 cjson ──"
ssh -o ConnectTimeout=20 "$NEXT" \
  "cd ~/wip/hiclub-core-mqtt && ./target/release/peer_cli send \"\$(cat $MN_FILE)\" $ROBOT \
   '调用 dep_roundtrip 工具,把 lua 依赖校验码原样告诉我'" >/dev/null 2>&1
sleep 25
TMPLOG=$(mktemp /tmp/hiai-dep.XXXXXX); trap 'rm -f "$TMPLOG"' EXIT
# 🔴 日志走**文件**:`python3 -` 的 stdin 已经被 heredoc 占了,再用管道会被整个丢弃
#    (踩过一次,报成"模型没发出 tool_call",而报文明明在)。
ssh -o ConnectTimeout=20 "$DEPLOY" "docker logs hi-ai --since 5m 2>&1" > "$TMPLOG" 2>/dev/null
python3 - "$P" "$MAGIC" "$TMPLOG" <<'PYEOF'
import json, sys
uuid, magic, logfile = sys.argv[1], sys.argv[2], sys.argv[3]
G, R, N = "\033[32m", "\033[31m", "\033[0m"
called = receipt = None
for line in open(logfile, encoding="utf-8", errors="ignore"):
    if "dep_roundtrip" not in line: continue
    try: d = json.loads(line[line.index('{'):])
    except Exception: continue
    for m in d.get("messages", []):
        if m.get("role") == "assistant":
            for tc in m.get("tool_calls") or []:
                if tc.get("function", {}).get("name", "").endswith("dep_roundtrip"): called = True
        if m.get("role") == "tool" and str(m.get("name", "")).endswith("dep_roundtrip"):
            receipt = m.get("content", "")
rc = 0
print(f"  {G}✓{N} 模型**发出了** dep_roundtrip 的 tool_call" if called
      else f"  {R}✗{N} 模型没发出 tool_call —— 它可能压根没看见这个工具"); rc |= 0 if called else 1
if receipt is None:
    print(f"  {R}✗{N} hi.ai 没收到 role=tool 的回执 —— 调用发出去了但没跑成"); rc = 1
elif magic in receipt:
    print(f"  {G}✓{N} **回执里 {magic} 经 cjson 编解码一圈后还对** —— 那个 .so 真的被加载了")
    print(f"       回执:{receipt[:140]}")
else:
    print(f"  {R}✗{N} 回执里没有 {magic}(多半是 require 不到,错只在机器人本地日志里):{receipt[:160]}"); rc = 1
sys.exit(rc)
PYEOF
case $? in 0) pass=$((pass+2));; *) fail=$((fail+1));; esac

echo
echo "── 清理(撤权 → 删挂牌 → 删壳 → 删机器人)──"
# ⚠️ 依赖按**引用计数**回收,不按"这个插件的清单" —— 撤权之后集合里那份
#    可能还被别的插件用着,brain 不该删它。这里只清我们自己造的东西。
GR=$(printf '%s' "$OF" | g data grantUuid)
[ -n "$GR" ] && cj market/revoke "{\"grant_uuid\":\"$GR\"}" >/dev/null
[ -n "$L" ]  && cj market/set_listing_status "{\"uuid\":\"$L\",\"status\":4}" >/dev/null
cj plugin/delete_shell "{\"agent\":\"$B\",\"uuid\":\"$P\"}" >/dev/null
cj agent/delete "{\"agent\":\"$B\"}" >/dev/null

echo
printf "结果:通过 ${G}%d${N},失败 ${R}%d${N}\n" "$pass" "$fail"
[ "$fail" -eq 0 ]
