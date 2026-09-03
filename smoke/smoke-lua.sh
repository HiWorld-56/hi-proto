#!/bin/bash
# lua 插件端到端:发版 → 认成 LUA → 制品当场就绪 → 下发清单里拿得到 → 模型点得动
set -uo pipefail
source "$(dirname "$0")/_endpoints.sh"
TOK="$1"; PKG="$2"
# 下发清单那步要走 grpc:protoset 由 _endpoints.sh 解析成 $PS;
# 端点用**内网明文**(9536)而不是 hi.lan:443 —— 与 null_test.sh 同一套,
# 免得再拖一份 CA 进来。
CLUB_GRPC_PLAIN=${CLUB_GRPC_PLAIN:-192.168.1.65:9536}
command -v grpcurl >/dev/null || PATH=$PATH:/home/lo/go/bin
MAGIC="HI-LUA-8K4PZ2"
pass=0; fail=0
ok(){ printf "  \033[32m✓\033[0m %s\n" "$1"; pass=$((pass+1)); }
bad(){ printf "  \033[31m✗\033[0m %s  (%s)\n" "$1" "$2"; fail=$((fail+1)); }
has(){ case "$2" in *"$3"*) ok "$1";; *) bad "$1" "没有 '$3': $(echo "$2"|head -c 300)";; esac; }
cj(){ curl -s $CAC -m 180 -X POST "$CLUB_API/$1" -H 'Content-Type: application/json' -H "Authorization: Bearer $TOK" -d "$2"; }
g(){ python3 -c '
import sys,json
try:
    d=json.load(sys.stdin)
    for k in sys.argv[1:]: d=d[k]
    print(d)
except Exception: print("")
' "$@"; }

echo "── 发版:上传的是 lua 包 ──"
B=$(cj agent/create_assistant '{"name":"lua-bot"}' | g data base did)
[ -z "$B" ] && { echo "建机器人失败"; exit 1; }
cj api_key/create "{\"agent\":\"$B\"}" >/dev/null
P=$(cj plugin/create_shell "{\"agent\":\"$B\",\"name\":\"lua-demo\"}" | g data uuid)
[ -z "$P" ] && { echo "建壳失败"; exit 1; }
CV=$(cj plugin/create_version "{\"agent\":\"$B\",\"version\":{\"uuid\":\"$P\",\"version\":\"1.0.0\",\"url\":\"$PKG\"}}")
echo "  机器人=$B 插件=$P"
echo "  create_version 返回:$(echo "$CV"|head -c 200)"
CODE=$(echo "$CV" | g code)
[ "$CODE" = "0" ] && ok "**发版成功**(lua 包被接收,说明 detectLang 认出了 main.lua)" \
                  || bad "发版失败" "$(echo "$CV"|head -c 300)"

echo
echo "── 壳的语言与制品 ──"
L=$(cj plugin/list "{\"agent\":\"$B\",\"pagination\":{\"page\":1,\"limit\":50}}")
echo "  list:$(echo "$L" | head -c 500)"
LANG=$(echo "$L" | python3 -c '
import sys,json
try:
    d=json.load(sys.stdin)
    for it in d.get("data",{}).get("list",[]):
        s=it.get("shell",{})
        if s.get("name")=="lua-demo": print(s.get("lang","")); break
    else: print("")
except Exception: print("")')
[ "$LANG" = "PLUGIN_LANG_LUA" ] && ok "**壳被认成 PLUGIN_LANG_LUA**" || bad "壳的 lang 不对" "得到 '$LANG'"

ART=$(echo "$L" | python3 -c '
import sys,json
try:
    d=json.load(sys.stdin)
    for it in d.get("data",{}).get("list",[]):
        if it.get("shell",{}).get("name")=="lua-demo":
            print(json.dumps(it.get("artifacts",[]),ensure_ascii=False)); break
    else: print("[]")
except Exception: print("[]")')
echo "  artifacts:$ART"
has "**制品 target=any**(与架构无关,一份通吃)" "$ART" '"target": "any"'
has "**制品发版当场就是 SUCCEEDED**(不需要编译)" "$ART" 'PLUGIN_ARTIFACT_STATUS_SUCCEEDED'

echo
echo "── 下发清单(机器人问「我该装什么」)──"
#
# `hi.club.AgentPlugin` 整个 service 在 http_optout 里(机器人经 core 的 grpc 通道调),
# 所以 http 那条**必然** code 5 —— 先把这个"对的 404"钉住,免得哪天它变成 200 都没人发现。
ND=$(cj agent_plugin/list_on_device '{"arch":"aarch64"}')
case "$ND" in
  *'"code":5'*) ok "http 面确实没有这条(整个 service 在 http_optout 里)";;
  *) bad "list_on_device 不该上 http 网关" "$(echo "$ND"|head -c 150)";;
esac

# 真正的下发清单走 grpc,用**机器人自己的 token**。
#
# ⚠️ 这一步以前只 echo 不断言 —— 也就是**从来没被验过**。
#    它恰恰是 lua 那条链最关键的一环:发版认出了 LUA、制品也就绪了,
#    但只要下发清单里没有它,机器人就永远装不上,而**没有任何报错**
#    (清单为空对机器人的含义是「这插件我不该有」,它会把本地那份删掉)。
RTOK=$(ssh -o ConnectTimeout=10 192.168.1.66 \
        "cd /tmp/tokgen && MN_FILE=/tmp/65_vclient_mn.txt DEV=embedded ./target/release/tokgen 2>/dev/null" \
       | grep '^TOKEN=' | cut -d= -f2-)
if [ -z "$RTOK" ]; then
  printf "  \033[33m—\033[0m 没验:拿不到机器人 token(.66 的 /tmp/tokgen)\n"
else
  # arch 传 x86_64:清单要按机器人架构筛 —— lua 的 target=any 通吃,rust 的必须同架构。
  DEV_LIST=$(grpcurl -plaintext -protoset "$PS" -H "Authorization: Bearer $RTOK" \
               -d '{"arch":"x86_64"}' "$CLUB_GRPC_PLAIN" hi.club.AgentPlugin/ListOnDevice 2>&1)
  case "$DEV_LIST" in
    *'"list"'*)
      ok "grpc 下发清单拿得到(机器人 token)"
      has "清单里有 **LUA** 条目" "$DEV_LIST" 'PLUGIN_LANG_LUA'
      # lua 制品与架构无关 —— 这是 lua 相对 rust 的核心差别,必须钉住。
      # 同时验 RUST 条目**按架构筛过**:两者在同一份清单里并存才说明筛法是对的。
      OUT=$(printf '%s' "$DEV_LIST" | python3 "$(dirname "$0")/_devlist_check.py" x86_64)
      RC=$?
      printf '%s\n' "$OUT"
      case $RC in
        0) pass=$((pass+2));;
        2) pass=$((pass+1));;   # lua 对了,但这台机器人身上没有 RUST 插件可比
        *) fail=$((fail+1));;
      esac
      ;;
    *) bad "grpc 下发清单" "$(echo "$DEV_LIST"|head -c 200)";;
  esac
fi

echo
# ⚠️ **这里故意不断言"模型调得动"。**
#
# 本脚本把插件发在一个**软件助手**上,而设备端插件(RUST / LUA)在软件机器人上
# `enabled=0` —— 那是**设计如此**:软件机器人是"柜台",挂得住、卖得出,自己一个也跑不了。
# 所以模型压根看不见这些方法,断言"调得动"必然红,而那个红指不到任何真问题。
#
# 要验"模型真的调起来了",得挂到**硬件机器人**上,而且走市场:
#   卖家 market/create_listing + set_listing_status 2
#   机器人主人 market/apply {listing_uuid, to_agent:<机器人did>}  → GRANT_STATUS_INSTALLED
#   机器人的 brain 收广播自动装上(不用重启),再用 peer_cli 发一条消息
#   判据:hi-ai 日志里 {"role":"tool",...,"name":"<前缀>_lua_secret"} 且答复含 MAGIC
# 2026-08-30 在 .66 与 .175 两台上都这么验过,见 hi-claude 的
# record/20260830-185158-*(第六节)。
echo "── 模型点得动吗 ──"
echo "  跳过:本脚本发在软件助手上,设备端插件在软件机器人上恒 enabled=0(设计如此)。"
echo "  要验这一步得挂到硬件机器人 + 走市场,做法见本文件里的注释。"

echo
echo "结果:通过 $pass,失败 $fail"
[ "$fail" = 0 ]

# ── 下发清单只能走 grpc ──────────────────────────────────────────────────────
#
# hi.club.AgentPlugin 整个 service 在 http_optout 里(机器人经 core 的 grpc 通道调),
# 所以上面那条 http 一定是 code 5。要真验下发清单,用机器人自己的 token 走 grpc:
#
#   TOK=$(cd /tmp/tokgen && MN_FILE=/tmp/65_vclient_mn.txt DEV=embedded \
#         ./target/release/tokgen | grep '^TOKEN=' | cut -d= -f2)     # 在 .66 上
#   /tmp/grpcurl $(tp $CLUB_GRPC) -protoset /tmp/hi.protoset \
#     -H "authorization: Bearer $TOK" -d '{"arch":"x86_64"}' \
#     $CLUB_GRPC hi.club.AgentPlugin/ListOnDevice
#
# 该看到 lua 那条带 lang=PLUGIN_LANG_LUA、target="any";
# 而 rust 那条带 target="x86_64"(按机器人架构筛过)。
# protoset 现造:在有 buf 的机器上 `buf build -o /tmp/hi.protoset`,再 scp 到 .64。
