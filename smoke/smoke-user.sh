#!/bin/bash
# dev 环境端到端冒烟:**需要真实用户 token 的业务路径**。
#
# 与 smoke.sh 分工:那个测免鉴权入口与凭证边界(返 Unauthenticated 即算通),
# 这个测**登录后真正跑起来**的路径 —— 它们只有拿到真 token 才会执行到,
# 而恰恰是这类地方藏得住错。
#
# 为什么需要:v_master 视图改名后,三处 WHERE 仍写着 mapping.user_did。
# GORM 里那是字符串,编译期与 go vet 都看不出,只有真执行到才炸:
#     Error 1054: Unknown column 'mapping.user_did' in 'where clause'
# 它是**归属校验的公共入口**,Agent.Get/Edit + Plugin 三个接口共 6 处调用全挂,
# 躺了整整一周,最后由使用方反馈才发现。本脚本把这些路径固定跑一遍。
#
# token 来自 .66 的 tokgen(助记词→web3 签名→真实登录),不是伪造的。
# ⚠️ tokgen 每跑一次就重新登录、把上一个 token 顶下线(Code 103 异地登陆),
#    所以全程只取一次、全脚本复用。
#
# 用法:bash smoke-user.sh      非 0 退出 = 有失败项
set -uo pipefail
source "$(dirname "$0")/_endpoints.sh"   # 端点/CA 统一约定(前端可达→域名 TLS,内部→内网 IP)
API=$CLUB_API
pass=0; fail=0

ok()  { printf "  \033[32m✓\033[0m %s\n" "$1"; pass=$((pass+1)); }
bad() { printf "  \033[31m✗\033[0m %s  (%s)\n" "$1" "$2"; fail=$((fail+1)); }
# 断言返回体的 code 字段
code() { echo "$1" | grep -oE '"code":[0-9-]+' | head -1 | cut -d: -f2; }
chkcode() { local got; got=$(code "$2"); [ "$got" = "$3" ] && ok "$1" || bad "$1" "want code=$3 got=${got:-?} body=$(echo "$2"|head -c 120)"; }

echo "── 取真实用户 token(.66 tokgen)──"
# 造**两个身份**。club 按 ClientInfo.dev 分流(handler/auth.go):
#   DEV=embedded → RobotLogin   → type=robot(机器人)
#   DEV=app      → MnemonicLogin → type=user (人用户)
# 两者行为有真实差异(人没有权限配置、机器人有),只测一种会漏掉一整类问题 ——
# 本脚本早期只用 embedded,曾把"人用户拿到权限"这个正确行为误判成 bug。
gen() { ssh -o ConnectTimeout=10 192.168.1.66 "cd /tmp/tokgen && MN_FILE=$1 DEV=$2 ./target/release/tokgen 2>/dev/null"; }

OUT=$(gen /tmp/vclient_mn.txt embedded)
TOK=$(echo "$OUT" | grep '^TOKEN=' | cut -d= -f2-)
DID=$(echo "$OUT" | grep '^DID=' | cut -d= -f2)
OUT_U=$(gen /tmp/user_mn.txt app)
TOK_U=$(echo "$OUT_U" | grep '^TOKEN=' | cut -d= -f2-)
DID_U=$(echo "$OUT_U" | grep '^DID=' | cut -d= -f2)
if [ -z "$TOK" ] || [ -z "$TOK_U" ]; then
  echo "  ✗ 拿不到 token,后续全部无法执行"; echo "    (.66:/tmp/tokgen 是否还在?cargo build --release 过没?)"; exit 1
fi
ok "机器人身份登录 did=$DID"
ok "人用户身份登录 did=$DID_U"

U() { curl -s $CAC -H "Authorization: Bearer $TOK_U" "$@"; }
PU() { curl -s $CAC -X POST -H "Authorization: Bearer $TOK_U" -H 'Content-Type: application/json' -d "$2" "$1"; }

A() { curl -s $CAC -H "Authorization: Bearer $TOK" "$@"; }             # 带 token 的 GET
P() { curl -s $CAC -X POST -H "Authorization: Bearer $TOK" -H 'Content-Type: application/json' -d "$2" "$1"; }

echo "── 归属校验链路(v_master 那个 bug 的原发地)──"
CREATED=$(P $API/agent/create_assistant '{"name":"smoke-ownership","avatar":""}')
chkcode "建 assistant" "$CREATED" 0
AG=$(echo "$CREATED" | grep -oE '"did":"[^"]+"' | head -1 | cut -d'"' -f4)
if [ -z "$AG" ]; then
  echo "  ✗ 没拿到 agent did,归属链路无法继续"; fail=$((fail+1))
else
  ok "新建 agent did=$AG"
  # 这四条全部经过 GetAssistantByCreatorDIDAndAssistantDID —— 正是坏掉的那个查询
  chkcode "Agent.Get 自己的机器人"       "$(A "$API/agent/get?agent=$AG")" 0
  chkcode "Agent.Edit 自己的机器人"      "$(P $API/agent/edit "{\"agent\":\"$AG\",\"name\":\"smoke-renamed\"}")" 0
  # Plugin 是受限功能:先查 TYPE_SUPER_USER_PLUGIN,普通测试用户会止步于此、
  # 走不到那条 SQL。所以这里只断言"不是 SQL 崩"——真正覆盖那条查询的是上面的
  # Get/Edit(与 Plugin 共用 GetAssistantByCreatorDIDAndAssistantDID)。
  R=$(P $API/plugin/list "{\"agent\":\"$AG\",\"pagination\":{\"page\":1,\"limit\":5}}")
  echo "$R" | grep -q "Unknown column" \
    && bad "Plugin.List 不该崩在 SQL" "$(echo "$R"|head -c 120)" \
    || ok "Plugin.List 未崩在 SQL(该用户无插件权限,属预期)"
  chkcode "Agent.List 名下机器人"        "$(P $API/agent/list '{"pagination":{"page":1,"limit":10}}')" 0

  # 负向:别人的机器人必须拿不到(归属校验真的在拦,而不是查询恰好没报错)
  OTHER=zCgtPX6TsR2343Zk1wKdtbDDvsvavCLAVj
  R=$(A "$API/agent/get?agent=$OTHER")
  if [ "$(code "$R")" = "0" ]; then bad "Agent.Get 别人的机器人应被拒" "竟然返回了 code=0"
  elif echo "$R" | grep -q "Unknown column"; then bad "Agent.Get 别人的机器人" "SQL 错(列名又漂了):$(echo "$R"|head -c 100)"
  else ok "Agent.Get 别人的机器人被拒(非 SQL 错)"; fi

  chkcode "清理:删掉新建的 agent" "$(P $API/agent/delete "{\"agent\":\"$AG\"}")" 0
fi

echo "── 登录用户可见的公共查询 ──"
SA=$(A "$API/super_admin/list")
chkcode "SuperAdmin.List 取超管名单" "$SA" 0
N=$(echo "$SA" | grep -oE 'z[A-Za-z0-9]{20,}' | wc -l)
[ "$N" -gt 0 ] && ok "超管名单非空($N 个)" || bad "超管名单" "空列表 —— hidid 穿透可能挂了"
echo "$SA" | grep -q "$DID" && bad "测试用户不该是超管" "它出现在名单里" || ok "测试用户非超管(符合预期)"

chkcode "UserDirectory.ListOnline(免鉴权,带 token 也应通)" \
        "$(P $API/user_directory/list_online "{\"users\":[\"$DID\"]}")" 0


echo "── 身份差异:人用户 vs 机器人(权限只属于机器人)──"
RU=$(PU $API/permission/get '{}')
if echo "$RU" | grep -q '"permissions":\[\]' || ! echo "$RU" | grep -q 'PERMISSION_'; then
  ok "人用户 Permission.Get 无权限(人没有权限配置)"
else
  bad "人用户不该有权限" "$(echo "$RU"|head -c 120)"
fi
RB=$(P $API/permission/get '{}')
echo "$RB" | grep -q 'PERMISSION_NORMAL' \
  && ok "机器人 Permission.Get 有权限(含 NORMAL 位)" \
  || bad "机器人应有权限" "$(echo "$RB"|head -c 120)"

# 人用户建一台机器人,再用 List 查它的权限 —— master 视角
CU=$(PU $API/agent/create_assistant '{"name":"smoke-human-owned","avatar":""}')
AGU=$(echo "$CU" | grep -oE '"did":"[^"]+"' | head -1 | cut -d'"' -f4)
if [ -n "$AGU" ]; then
  ok "人用户建机器人 did=$AGU"
  chkcode "master 用 Permission.List 查名下机器人" "$(PU $API/permission/list "{\"agents\":[\"$AGU\"]}")" 0
  R=$(PU $API/permission/list "{\"agents\":[\"$AGU\",\"$DID\"]}")
  [ "$(code "$R")" = "7" ] && ok "List 混入别人的机器人 → 整体拒绝" \
                           || bad "List 应拒绝越权" "got=$(echo "$R"|head -c 90)"
  chkcode "清理:删掉人用户的机器人" "$(PU $API/agent/delete "{\"agent\":\"$AGU\"}")" 0
  # 删机器人应连权限一起删(否则留孤儿)
  sleep 1
else
  bad "人用户建机器人失败" "$(echo "$CU"|head -c 120)"
fi

echo "── 超管档必须拦住普通用户 ──"
# ⚠️ 超管名单在 club 侧有 **60s 缓存**(didapi.ListSuperAdmins)。刚在库里加/删过超管
# 就跑本节,拿到的可能是旧名单 —— 表现为"非超管却通过了",是假阳性不是越权。
# 判定时把这种情况单独点出来,别让人对着一条假失败查半天。
R=$(P $API/agent_manage/list '{"pagination":{"page":1,"limit":2}}')
c=$(code "$R")
if [ "$c" = "7" ]; then
  ok "AgentManage.List 拒绝非超管(PermissionDenied)"
elif [ "$c" = "0" ]; then
  bad "AgentManage.List 应拒绝非超管" "返回 code=0。若刚改过 hi_superadmin,多半是 60s 名单缓存未过期 —— docker restart hi-club 后重跑"
else
  bad "AgentManage.List 应拒绝非超管" "got=$(echo "$R"|head -c 100)"
fi

echo
echo "通过 $pass,失败 $fail"
[ "$fail" -eq 0 ] || exit 1
