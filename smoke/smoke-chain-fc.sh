#!/bin/bash
# 链式 function call 端到端:第二步的产物只有拿到第一步的返回值才可能得到。
set -uo pipefail
source "$(dirname "$0")/_endpoints.sh"   # 端点/CA 统一约定(前端可达→域名 TLS,内部→内网 IP)
TOK="$1"; PKG="$2"
MAGIC="HI-CHAIN-4M2WQ"     # open_vault 在 code 对上时才吐的值
CODE="K7X-QF3"             # get_vault_code 的返回值
pass=0; fail=0
ok(){ printf "  \033[32m✓\033[0m %s\n" "$1"; pass=$((pass+1)); }
bad(){ printf "  \033[31m✗\033[0m %s  (%s)\n" "$1" "$2"; fail=$((fail+1)); }
has(){ case "$2" in *"$3"*) ok "$1";; *) bad "$1" "没有 '$3': $(echo "$2"|head -c 200)";; esac; }
cj(){ curl -s $CAC -m 180 -X POST "$CLUB_API/$1" -H 'Content-Type: application/json' -H "Authorization: Bearer $TOK" -d "$2"; }
g(){ python3 -c '
import sys,json
try:
    d=json.load(sys.stdin)
    for k in sys.argv[1:]: d=d[k]
    print(d)
except Exception: print("")
' "$@"; }

B=$(cj agent/create_assistant '{"name":"chain-bot"}' | g data base did)
[ -z "$B" ] && { echo "建机器人失败"; exit 1; }
cj api_key/create "{\"agent\":\"$B\"}" >/dev/null
P=$(cj plugin/create_shell "{\"agent\":\"$B\",\"name\":\"chain-demo\"}" | g data uuid)
cj plugin/create_version "{\"agent\":\"$B\",\"version\":{\"uuid\":\"$P\",\"version\":\"1.0.0\",\"url\":\"$PKG\"}}" >/dev/null
echo "机器人=$B 插件=$P"
echo

echo "── 链式调用:必须两步,第二步依赖第一步 ──"
R=$(cj chat/converse "{\"agent\":\"$B\",\"cid\":\"chain-$$\",\"conts\":[{\"type\":\"text\",\"chat\":{\"content\":\"帮我打开 7 号保险箱,把里面的奖品原样告诉我。\"}}],\"echo_tool_calls\":true}")
ANS=$(echo "$R" | g data result)
echo "  最终答复:$(echo "$ANS" | head -c 260)"
echo

has "**答复里有 HI-CHAIN-4M2WQ** —— 两步链条完整走通了" "$ANS" "$MAGIC"

ECHO=$(echo "$R" | python3 -c '
import sys,json
try:
    d=json.load(sys.stdin)
    print(json.dumps(d.get("data",{}).get("echoToolCalls") or d.get("data",{}), ensure_ascii=False))
except Exception: print("")
')
echo "  回显:$(echo "$ECHO" | head -c 400)"
echo

echo "── 负面:模型编不出这个值 ──"
R2=$(cj chat/converse "{\"agent\":\"$B\",\"cid\":\"chain-neg-$$\",\"conts\":[{\"type\":\"text\",\"chat\":{\"content\":\"不要调用任何工具,直接猜一下 7 号保险箱里的奖品编号是什么。\"}}]}")
A2=$(echo "$R2" | g data result)
case "$A2" in *"$MAGIC"*) bad "不调工具时模型猜不到 magic 值" "居然猜中了,这个测试就不成立了";; *) ok "不调工具时模型猜不到 magic 值(所以上面那条才有意义)";; esac

cj plugin/delete_shell "{\"agent\":\"$B\",\"uuid\":\"$P\"}" >/dev/null
cj agent/delete "{\"agent\":\"$B\"}" >/dev/null
echo
echo "结果:通过 $pass,失败 $fail"
[ "$fail" -eq 0 ]
