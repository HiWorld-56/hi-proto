#!/bin/bash
# 一轮里并行多个 tool_call:两个 **LLM 推理后端** 行为必须一致。
#
# 为什么要单独守:模型一轮点两个互不依赖的方法是常态,而**每个 tool_call 都必须配一条
# tool 消息、id 严格成对**。少一条,OpenAI 直接 400,vllm 则回复紊乱;
# 而 hiai 对缺失结果按 "done" 兜底 —— 于是症状不是报错,是**模型编一段像模像样的假答案**,
# 只有翻 messages 数组才看得出来。这个坑踩过。
#
# ⚠️ 这里的"两个后端"指的是**两个 LLM 推理后端**(OpenAI 的 gpt-4.1-nano 与自建 vllm 上的
# ministral-3),**不是"服务端 vs 机器人"**。别把这两条轴混起来:
#
#   · 本文件守的轴 = **同一段代码在两个推理后端上表现一致**。
#     要害是回传 tool_result 时,OpenAI 不必带上对应的 tool_call,而 vllm 跑的
#     ministral-3 **必须带**,否则回复紊乱 —— 一边过不等于另一边过。
#
#   · 另一条轴 = **方法在哪边执行**(服务端插件 vs 机器人本地 .so),走 internal/outside
#     分流,由别处守:smoke-market.sh 的"客户端工具:中途返回"+"Resume 续跑",
#     以及 NATIVE 那条"进喂模型的数组、不进服务端执行名单"。
#     那条轴上,机器人执行的方法本来就不会在服务端跑,反之亦然。
set -uo pipefail
source "$(dirname "$0")/_endpoints.sh"   # 端点/CA 统一约定(前端可达→域名 TLS,内部→内网 IP)
TOK="${1:?用法: smoke-parallel.sh <用户token> <插件包url>}"; PKG="${2:?需要测试插件包 url}"
MAGIC="HI-MKT-7Q3XZ9"; SUM="623"
pass=0; fail=0
ok(){ printf "  \033[32m✓\033[0m %s\n" "$1"; pass=$((pass+1)); }
bad(){ printf "  \033[31m✗\033[0m %s  (%s)\n" "$1" "$2"; fail=$((fail+1)); }
command -v mysql >/dev/null || { echo "缺 mysql 客户端 —— 请在 .65 上跑。" >&2; exit 2; }
Q(){ mysql -h$DB -ulo -p568568 hi_ai -N -e "$1" 2>/dev/null; }
cj(){ curl -s $CAC -m 240 -X POST "$CLUB_API/$1" -H 'Content-Type: application/json' -H "Authorization: Bearer $TOK" -d "$2"; }
g(){ python3 -c '
import sys,json
try:
    d=json.load(sys.stdin)
    for k in sys.argv[1:]: d=d[k]
    print(d)
except Exception: print("")
' "$@"; }

run_one(){   # $1=模型名(空=默认)  $2=标签
  local MODEL="$1" TAG="$2"
  local B P
  B=$(cj agent/create_assistant "{\"name\":\"par-$TAG\"}" | g data base did)
  [ -z "$B" ] && { bad "[$TAG] 建机器人失败" "-"; return; }
  cj api_key/create "{\"agent\":\"$B\"}" >/dev/null
  P=$(cj plugin/create_shell "{\"agent\":\"$B\",\"name\":\"par-$TAG\"}" | g data uuid)
  cj plugin/create_version "{\"agent\":\"$B\",\"version\":{\"uuid\":\"$P\",\"version\":\"1.0.0\",\"url\":\"$PKG\"}}" >/dev/null
  [ -n "$MODEL" ] && Q "UPDATE hi_ai_agent SET llm_model='$MODEL' WHERE did='$B';"
  local ACT; ACT=$(Q "SELECT llm_model FROM hi_ai_agent WHERE did='$B';")
  echo "  [$TAG] 机器人=$B 模型=${ACT:-默认}"

  # 两件**互不依赖**的事 —— 模型应当在同一轮里一起点掉
  local R A
  R=$(cj chat/converse "{\"agent\":\"$B\",\"cid\":\"par-$TAG-$$\",\"conts\":[{\"type\":\"text\",\"chat\":{\"content\":\"帮我做两件事:取一下校验令牌,再算 137 加 486。两个都要用工具。\"}}]}")
  A=$(echo "$R" | g data result)
  echo "  [$TAG] 答复:$(echo "$A" | head -c 200)"
  case "$A" in *"$MAGIC"*) ok "[$TAG] 令牌插件真的跑了(magic 值在)";; *) bad "[$TAG] 令牌插件没跑" "答复里没有 $MAGIC";; esac
  case "$A" in *"$SUM"*)   ok "[$TAG] 加法插件真的跑了(623 在)";;   *) bad "[$TAG] 加法插件没跑" "答复里没有 $SUM";; esac

  # ⚠️ "两个都跑了" **不等于** "在同一轮并行发出" —— 分两轮跑也能得到同样的答复。
  # 用流式的回显帧坐实:一次 echoToolCalls 帧里若有 2 条 tool_call,那就是同一轮。
  local S N
  S=$(curl -sN $CAC -m 240 -X POST "$CLUB_API/chat/converse_stream" -H 'Content-Type: application/json' \
      -H "Authorization: Bearer $TOK" \
      -d "{\"agent\":\"$B\",\"cid\":\"parx-$TAG-$$\",\"conts\":[{\"type\":\"text\",\"chat\":{\"content\":\"再来一次:取校验令牌,并算 137 加 486。两个都要用工具。\"}}],\"echo_tool_calls\":true}")
  N=$(echo "$S" | python3 -c '
import sys,json
best=0
for line in sys.stdin:
    line=line.strip()
    if not line: continue
    try: d=json.loads(line)
    except Exception: continue
    r=d.get("result") or d
    if r.get("type")!="echoToolCalls": continue
    try: best=max(best,len(json.loads(r.get("message") or "[]")))
    except Exception: pass
print(best)
')
  [ "${N:-0}" -ge 2 ] && ok "[$TAG] **同一轮并行发出** $N 个 tool_call" \
                      || bad "[$TAG] 没看到同一轮并行" "单帧里最多 ${N:-0} 个调用"

  cj plugin/delete_shell "{\"agent\":\"$B\",\"uuid\":\"$P\"}" >/dev/null
  cj agent/delete "{\"agent\":\"$B\"}" >/dev/null
}

echo "── 推理后端 A:默认(OpenAI) ──"
run_one "" "openai"
echo
echo "── 推理后端 B:自建 ministral-3(vllm) ──"
run_one "ministral-3" "ministral"

echo
echo "结果:通过 $pass,失败 $fail"
[ "$fail" -eq 0 ]
