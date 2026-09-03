#!/bin/bash
# lua 插件的**最后一环**:模型真的点得动它吗。
#
# ## 为什么单独一个脚本
#
# `smoke-lua.sh` 把插件发在**软件助手**上,而设备端插件(RUST / LUA)在软件机器人上
# 恒 `enabled=0` —— 那是设计如此(软件机器人是"柜台",挂得住卖得出,自己一个也跑不了)。
# 所以那边只能验到"发版 → 认成 LUA → 制品就绪 → 进下发清单",
# **验不到"跑起来了"**。这一条要一台真机器人。
#
# ## 判据:magic 值,不是模型那句话
#
# 工具没被调用时模型会自己编一个完全合理的答复。所以判据是三样同时成立:
#   ① 模型发出了 `<前缀>_lua_secret` 的 tool_call
#   ② hi.ai 收到 `{"role":"tool", "name":"<前缀>_lua_secret", ...}` 的回执
#   ③ 回执里带着 **HI-LUA-8K4PZ2** —— build_luapkg.py 里那个模型猜不到的值
#
# 少了②③只看最终答复,等于什么都没验(已经踩过:问 137+486 模型自己算出 623 交差)。
#
# ## 环境
#
# 在 **.64** 上跑(要 ssh 到 .66 与 .65)。要求:
#   · `.66` 的 hinj-brain 在跑,且身上已装着一个 lua 插件
#   · `.66` 的 hiclub-core-mqtt 编出了 `target/release/peer_cli`
#   · 机器人**主人**的助记词在 `.66:/tmp/rbt_mn.txt`
#
# ⚠️ `.66` 没有 UI 模块,日志里会有 `Show text failed: Module hinj_ui is offline`。
#    **那不影响这条链** —— 显示失败只是 log::error,代码继续往下走 AI 那一轮
#    (见 src/brain/chat/message.rs:98)。别把它当成失败。
set -uo pipefail

ROBOT=${ROBOT_DID:-zCgtPX6TsR2343Zk1wKdtbDDvsvavCLAVj}   # .66 上那台
MN_FILE=${MASTER_MN_FILE:-/tmp/rbt_mn.txt}
MAGIC=${LUA_MAGIC:-HI-LUA-8K4PZ2}
NEXT=${NEXT_HOST:-192.168.1.66}
DEPLOY=${DEPLOY_HOST:-192.168.1.65}

G="\033[32m"; R="\033[31m"; Y="\033[33m"; N="\033[0m"
pass=0; fail=0
ok(){ printf "  ${G}✓${N} %s\n" "$1"; pass=$((pass+1)); }
bad(){ printf "  ${R}✗${N} %s\n     → %s\n" "$1" "$2"; fail=$((fail+1)); }
sk(){ printf "  ${Y}—${N} 没验:%s\n" "$1"; }

echo "══════ lua 插件:模型点得动吗(真机器人)══════"

# ── 前提一:机器人在跑,而且身上真有 lua 插件 ────────────────────────────────
# **先证明前提**。机器人没在跑 / 身上没有 lua 插件时,下面发消息一定"没反应",
# 而那和"lua 坏了"长得一模一样。
READY=$(ssh -o ConnectTimeout=10 "$NEXT" \
  'systemctl --user is-active hinj-brain-local 2>/dev/null' 2>/dev/null)
[ "$READY" = "active" ] || { sk "$NEXT 上的 hinj-brain 没在跑(is-active=$READY)"; exit 2; }

METHOD=$(ssh -o ConnectTimeout=10 "$NEXT" \
  'grep "\[plugin\] + .*\.lua \[lua\]" ~/wip/hinj-brain/log/brain.log | tail -20' 2>/dev/null \
  | grep -oE '"[a-z0-9]{6}_lua_secret"' | tr -d '"' | tail -1)
[ -n "$METHOD" ] || { sk "机器人身上没有带 lua_secret 的 lua 插件 —— 先用 smoke-lua.sh 发一个并挂到它身上"; exit 2; }
ok "前提:brain 在跑,身上有 lua 方法 $METHOD"

# ── 发一条只有调工具才答得上来的话 ─────────────────────────────────────────
SENT_AT=$(date -u +%s)
SEND=$(ssh -o ConnectTimeout=20 "$NEXT" \
  "cd ~/wip/hiclub-core-mqtt && ./target/release/peer_cli send \"\$(cat $MN_FILE)\" $ROBOT \
   '请调用 lua_secret 工具,把 lua 校验令牌原样告诉我'" 2>&1)
case "$SEND" in
  *OK=send*) ok "主人发出单聊消息(code=$(printf '%s' "$SEND"|grep -oE 'CODE=\S+'|cut -d= -f2|head -c 12)…)";;
  *) bad "peer_cli 发消息失败" "$(printf '%s' "$SEND"|head -c 200)"; exit 1;;
esac

# 一轮对话要经 mqtt → brain → hi.ai → 推理 → 回程,给足时间再取证。
sleep 25

# ── 取证:去 hi.ai 的请求日志里找那三样 ────────────────────────────────────
#
# ⚠️ 判据在 **hi.ai 侧**,不是机器人侧。机器人日志只说"我把工具调了",
#    而"模型看见了工具、发出了调用、拿到了回执"这三件事只有 hi.ai 那侧的报文能证明。
# 🔴 **日志走文件,别用管道喂给 `python3 -`。**
#    `python3 - <<EOF` 已经用 heredoc 占掉了 stdin(它从那里读程序),
#    再 `printf ... | python3 - <<EOF` 的话**管道整个被丢弃**,`sys.stdin` 是空的 ——
#    于是"什么都没找到",报出来是「模型没发出 tool_call」,
#    而真相是脚本自己没拿到日志。第一版就这么误报过一次(手工复核时报文明明在)。
TMPLOG=$(mktemp /tmp/hiai-log.XXXXXX)
trap 'rm -f "$TMPLOG"' EXIT
ssh -o ConnectTimeout=20 "$DEPLOY" "docker logs hi-ai --since 5m 2>&1" > "$TMPLOG" 2>/dev/null
[ -s "$TMPLOG" ] || { bad "取不到 hi-ai 日志" "ssh $DEPLOY docker logs hi-ai 没有输出"; exit 1; }

python3 - "$METHOD" "$MAGIC" "$TMPLOG" <<'PYEOF'
import json, sys
method, magic, logfile = sys.argv[1], sys.argv[2], sys.argv[3]
G, R = "\033[32m", "\033[31m"; N = "\033[0m"
# ⚠️ 只看**最后一条**含这个方法的报文。
#    同一段会话里,模型可能凭前几轮的历史把 magic 值直接背出来、**一个工具都不调** ——
#    实测见过(上一轮的 role=tool 回执还在 messages 里,它照抄了)。
#    所以判据必须是「这一轮有没有 tool_call + 有没有新的 role=tool 回执」,
#    而不是"答复里有没有那个值"。
called = receipt = None
for line in open(logfile, encoding="utf-8", errors="ignore"):
    if method not in line:
        continue
    try:
        d = json.loads(line[line.index('{'):])
    except Exception:
        continue
    for m in d.get("messages", []):
        if m.get("role") == "assistant":
            for tc in m.get("tool_calls") or []:
                if tc.get("function", {}).get("name") == method:
                    called = True
        if m.get("role") == "tool" and m.get("name") == method:
            receipt = m.get("content", "")
rc = 0
if called:
    print(f"  {G}✓{N} 模型**发出了** {method} 的 tool_call")
else:
    print(f"  {R}✗{N} 模型没发出 {method} 的 tool_call —— 它可能压根没看见这个工具"); rc = 1
if receipt is None:
    print(f"  {R}✗{N} hi.ai 没收到 role=tool 的回执 —— 调用发出去了但没跑成"); rc = 1
elif magic in receipt:
    print(f"  {G}✓{N} **回执里带着 {magic}** —— lua 插件真的在 runner 里跑了")
    print(f"       回执:{receipt[:120]}")
else:
    print(f"  {R}✗{N} 回执里没有 {magic}:{receipt[:150]}"); rc = 1
sys.exit(rc)
PYEOF
case $? in 0) pass=$((pass+2));; *) fail=$((fail+1));; esac

echo
printf "结果:通过 ${G}%d${N},失败 ${R}%d${N}\n" "$pass" "$fail"
[ "$fail" -eq 0 ]
