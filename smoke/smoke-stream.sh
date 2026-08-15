#!/bin/bash
# 流式对话冒烟:指令帧 / 回显帧 / ResumeStream 续跑。
#
# 为什么单独补:非流式那条路早有覆盖,而**流式是 app 的主路径**,却一条回归都没有。
# 这里最要紧的一条是 **`toolCalls`(指令)与 `echoToolCalls`(回显)不能合成一个** ——
# 合了的话,一个本该可关的调试开关会把流程必需的信号一起关掉,
# 而症状是"关掉回显后机器人不动了",没人会往调试开关上想。
set -uo pipefail
CLUB=192.168.1.65:9537
TOK="${1:?用法: smoke-stream.sh <用户token>}"
pass=0; fail=0
ok(){ printf "  \033[32m✓\033[0m %s\n" "$1"; pass=$((pass+1)); }
bad(){ printf "  \033[31m✗\033[0m %s  (%s)\n" "$1" "$2"; fail=$((fail+1)); }
has(){ case "$2" in *"$3"*) ok "$1";; *) bad "$1" "流里没有 '$3'";; esac; }
no(){  case "$2" in *"$3"*) bad "$1" "流里不该有 '$3'";; *) ok "$1";; esac; }
cj(){ curl -s -m 120 -X POST "http://$CLUB/api/v1/$1" -H 'Content-Type: application/json' -H "Authorization: Bearer $TOK" -d "$2"; }
# 流式:grpc-gateway 把 server-streaming 吐成一行一个 JSON
st(){ curl -sN -m 180 -X POST "http://$CLUB/api/v1/$1" -H 'Content-Type: application/json' -H "Authorization: Bearer $TOK" -d "$2"; }
g(){ python3 -c '
import sys,json
try:
    d=json.load(sys.stdin)
    for k in sys.argv[1:]: d=d[k]
    print(d)
except Exception: print("")
' "$@"; }
# 从流里挑出某个 type 的帧
frames(){ python3 -c '
import sys,json
want=sys.argv[1]
for line in sys.stdin:
    line=line.strip()
    if not line: continue
    try: d=json.loads(line)
    except Exception: continue
    r=d.get("result") or d
    if r.get("type")==want: print(json.dumps(r,ensure_ascii=False))
' "$1"; }

B=$(cj agent/create_assistant '{"name":"stream-bot"}' | g data base did)
[ -z "$B" ] && { echo "建机器人失败"; exit 1; }
echo "机器人=$B"
CTOOL='{"type":"function","function":{"name":"local_dice","description":"掷一个只有本机才有的骰子。用户要掷骰子时调用。","parameters":{"type":"object","properties":{}}}}'

echo
echo "── 一、无工具:msg + end,流正常收尾 ──"
S1=$(st chat/converse_stream "{\"agent\":\"$B\",\"cid\":\"st-1-$$\",\"conts\":[{\"type\":\"text\",\"chat\":{\"content\":\"用一句话说:你好\"}}]}")
has "有 msg 帧(**整段答复,不是分片**)" "$S1" '"type":"msg"'
has "有 end 帧(流正常收尾)" "$S1" '"type":"end"'
no  "没有 info 帧(没出错)" "$S1" '"type":"info"'
no  "没有 toolCalls 指令帧(本来就没给工具)" "$S1" '"type":"toolCalls"'

echo
echo "── 二、客户端工具:必须收到 toolCalls **指令帧**(带 id) ──"
S2=$(st chat/converse_stream "{\"agent\":\"$B\",\"cid\":\"st-2-$$\",\"conts\":[{\"type\":\"text\",\"chat\":{\"content\":\"帮我掷一次骰子,必须用工具\"}}],\"tools\":[$CTOOL]}")
has "有 toolCalls 指令帧" "$S2" '"type":"toolCalls"'
TID=$(echo "$S2" | frames toolCalls | head -1 | g id)
CID=$(echo "$S2" | frames toolCalls | head -1 | python3 -c '
import sys,json
try: print(json.load(sys.stdin)["tools"][0]["id"])
except Exception: print("")
')
[ -n "$TID" ] && ok "指令帧带了续跑 id" || bad "指令帧没有 id" "拿不到 id 就没法 ResumeStream"
[ -n "$CID" ] && ok "指令帧带了待执行的 tool_call" || bad "指令帧没有 tools" "-"

echo
echo "── 三、ResumeStream 续跑 ──"
if [ -n "$TID" ] && [ -n "$CID" ]; then
  S3=$(st chat/resume_stream "{\"id\":\"$TID\",\"list\":[{\"id\":\"$CID\",\"conts\":[{\"type\":\"text\",\"chat\":{\"content\":\"骰子点数是 6\"}}]}]}")
  has "续跑后有 msg 帧" "$S3" '"type":"msg"'
  has "续跑后有 end 帧" "$S3" '"type":"end"'
  case "$S3" in *6*) ok "工具结果进了答复(答复里出现 6)";; *) bad "工具结果没进答复" "$(echo "$S3"|tail -c 160)";; esac
else
  bad "跳过续跑" "上一步没拿到 id/tool_call_id"
fi

echo
echo "── 四、**指令帧不可关,回显帧可关**(这条是设计红线) ──"
S4=$(st chat/converse_stream "{\"agent\":\"$B\",\"cid\":\"st-4-$$\",\"conts\":[{\"type\":\"text\",\"chat\":{\"content\":\"帮我掷一次骰子,必须用工具\"}}],\"tools\":[$CTOOL],\"echo_tool_calls\":false}")
has "关掉回显,**toolCalls 指令帧照常出现**" "$S4" '"type":"toolCalls"'
no  "关掉回显,没有 echoToolCalls 帧" "$S4" '"type":"echoToolCalls"'

echo
echo "── 五、错误走帧,不走 grpc status ──"
# 拿一个不存在的 id 去续跑。若错误改走 grpc status,客户端会收半截流再拿 error,
# 两套错误通道并存反而更难排查 —— 所以这条是设计约定,不是实现细节。
S5=$(st chat/resume_stream '{"id":"NO-SUCH-TURN-ID","list":[]}')
has "错误以 info 帧返回" "$S5" '"type":"info"'
has "帧里带了 code 400" "$S5" '"code":400'

cj agent/delete "{\"agent\":\"$B\"}" >/dev/null
echo
echo "结果:通过 $pass,失败 $fail"
[ "$fail" -eq 0 ]
