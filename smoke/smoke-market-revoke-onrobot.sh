#!/bin/bash
# 卖家卖出去的插件,卖家能不能从**买家的真机器人**上收回来(2026-10-01 用户问)。
#
# smoke-market.sh 已经验过服务端那一半(撤权 → 买方引用行删掉、单据置 revoked),
# 但它的买方是**软件机器人** —— 设备端插件在软件机器人上恒不下发,验不到「真机器人本地那份删掉了」。
# 这一条把买方换成 .66 那台真机器人:
#
#   卖家(软件机器人摆摊)挂一个免费的 lua 插件 → 买家(.66 机器人的主人)给 .66 买下
#   → .66 真装上(brain 注册表里出现这个插件的方法)
#   → **卖家**用自己的 token 调 market/revoke
#   → .66 当场卸掉(注册表里没了)、服务端引用行没了、单据「已撤销」
#   → 负面:买家拿自己的 token 撤不了(撤权只归卖家)
#
# 在 **.64** 上跑(要 ssh 到 .66 取 token、看 brain 日志,到 .65 查库)。夹具全部现造、跑完清掉。
set -uo pipefail
source "$(dirname "$0")/_endpoints.sh"

ROBOT=${ROBOT_DID:-zCgtPX6TsR2343Zk1wKdtbDDvsvavCLAVj}   # .66 上那台(买方)
NEXT=${NEXT_HOST:-192.168.1.66}

G="\033[32m"; R="\033[31m"; N="\033[0m"
pass=0; fail=0
ok(){ printf "  ${G}✓${N} %s\n" "$1"; pass=$((pass+1)); }
bad(){ printf "  ${R}✗${N} %s\n     → %s\n" "$1" "$2"; fail=$((fail+1)); }
chk(){ [ "$2" = "$3" ] && ok "$1" || bad "$1" "want=$3 got=$2"; }
has(){ case "$2" in *"$3"*) ok "$1";; *) bad "$1" "输出里没有 '$3':$(echo "$2"|head -c 200)";; esac; }
g(){ python3 -c '
import sys,json
try:
    d=json.load(sys.stdin)
    for k in sys.argv[1:]: d=d[k]
    print(d)
except Exception: print("")
' "$@"; }
cj(){ curl -s $CAC -m 180 -X POST "$CLUB_API/$1" -H 'Content-Type: application/json' -H "Authorization: Bearer $3" -d "$2"; }
q(){ mysqlq "$1" "$2"; }
tok(){ ssh -o ConnectTimeout=15 "$NEXT" "cd /tmp/tokgen && MN_FILE=$1 DEV=app ./target/release/tokgen 2>/dev/null" | grep ^TOKEN= | cut -d= -f2; }
# brain 最近一次注册表重建 / 就绪那一行(= 现在真装着的全部方法)
methods(){ ssh -o ConnectTimeout=10 "$NEXT" \
  'grep -E "\[plugin\] (重建完成|就绪)" ~/wip/hinj-brain/log/brain.log | tail -1' 2>/dev/null; }

echo "══════ 卖家从买家的真机器人上收回插件 ══════"
SELLER_TOK=$(tok /tmp/65_seller_mn.txt); BUYER_TOK=$(tok /tmp/rbt_mn.txt)
[ -n "$SELLER_TOK" ] && [ -n "$BUYER_TOK" ] || { bad "取 token" "$NEXT:/tmp/tokgen"; exit 1; }
[ "$(ssh -o ConnectTimeout=10 "$NEXT" 'systemctl is-active hinj-brain')" = "active" ] || { bad "前提:.66 的 brain 在跑" "没在跑"; exit 2; }

SB=""; P=""; LID=""; GR=""; BUYER_HAS=""
# 唯一的 EXIT trap:撤权没成也要把买家那份删掉(BUYER_HAS),机器人回到原样;卖家的挂牌、壳、摊位一并清
cleanup(){
  [ -n "$BUYER_HAS" ] && cj plugin/delete_shell "{\"agent\":\"$ROBOT\",\"uuid\":\"$P\"}" "$BUYER_TOK" >/dev/null
  [ -n "$LID" ] && cj market/set_listing_status "{\"uuid\":\"$LID\",\"status\":4}" "$SELLER_TOK" >/dev/null
  [ -n "$P" ] && cj plugin/delete_shell "{\"agent\":\"$SB\",\"uuid\":\"$P\"}" "$SELLER_TOK" >/dev/null
  [ -n "$SB" ] && cj agent/delete "{\"agent\":\"$SB\"}" "$SELLER_TOK" >/dev/null
}
trap cleanup EXIT

echo "── 准备:卖家摆摊,挂一个免费的 lua 插件 ──"
SB=$(cj agent/create_assistant '{"name":"smk-revoke-seller"}' "$SELLER_TOK" | g data base did)
LPKG=$(MINIO_HOST=${MINIO_HOST:-192.168.1.65:9000} python3 "$(dirname "$0")/build_luapkg.py" 2>&1 | tail -1)
P=$(cj plugin/create_shell "{\"agent\":\"$SB\",\"name\":\"smk-revoke\"}" "$SELLER_TOK" | g data uuid)
cj plugin/create_version "{\"agent\":\"$SB\",\"version\":{\"uuid\":\"$P\",\"version\":\"1.0.0\",\"url\":\"$LPKG\"}}" "$SELLER_TOK" >/dev/null
PRE=$(q hi_ai "SELECT fn_prefix FROM hi_ai_plugin WHERE uuid='$P';")
LID=$(cj market/create_listing "{\"agent\":\"$SB\",\"plugin_uuid\":\"$P\",\"settle_mode\":1,\"price\":\"0\"}" "$SELLER_TOK" | g data uuid)
cj market/set_listing_status "{\"uuid\":\"$LID\",\"status\":2}" "$SELLER_TOK" >/dev/null
[ -n "$SB" ] && [ -n "$P" ] && [ -n "$PRE" ] && [ -n "$LID" ] || { bad "准备" "SB=$SB P=$P PRE=$PRE LID=$LID"; exit 1; }
ok "卖家摊位 $SB,插件 $P(方法前缀 $PRE),挂牌 $LID"
case "$(methods)" in *"\"${PRE}_"*) bad "前提:机器人上本来没有这个插件" "已经有 ${PRE}_";; *) ok "前提:机器人上本来没有这个插件";; esac

echo "── 一、买家给 .66 机器人买下,机器人真装上 ──"
A=$(cj market/apply "{\"listing_uuid\":\"$LID\",\"to_agent\":\"$ROBOT\"}" "$BUYER_TOK")
chk "免费购买:一步到已装载" "$(echo "$A"|g data status)" "GRANT_STATUS_INSTALLED"
GR=$(echo "$A"|g data grantUuid)
BUYER_HAS=1
on=""; for _ in $(seq 40); do case "$(methods)" in *"\"${PRE}_"*) on=1; break;; esac; sleep 3; done
[ -n "$on" ] && ok "**机器人真装上了**(注册表里出现 ${PRE}_ 的方法)" || { bad "机器人 120 秒内没装上" "看 $NEXT 的 brain.log"; exit 1; }
F=$(ssh -o ConnectTimeout=10 "$NEXT" "ls /opt/hinj/plugins 2>/dev/null | grep -c '^$P'")
[ "${F:-0}" -ge 1 ] && ok "本地插件目录里有它($F 个文件)" || bad "本地插件目录里有它" "找不到 $P"

echo "── 二、负面:买家撤不了(撤权只归卖家)──"
has "买家拿自己的 token 撤 → 「不属于你」" "$(cj market/revoke "{\"grant_uuid\":\"$GR\",\"reason\":\"smoke\"}" "$BUYER_TOK")" "不属于你"
case "$(methods)" in *"\"${PRE}_"*) ok "买家撤失败之后插件还在";; *) bad "买家撤失败之后插件还在" "没了";; esac

echo "── 三、卖家撤权 → 买家机器人当场卸掉 ──"
RV=$(cj market/revoke "{\"grant_uuid\":\"$GR\",\"reason\":\"smoke:卖家收回\"}" "$SELLER_TOK")
chk "卖家撤权:code 0" "$(echo "$RV"|g code)" "0"
chk "单据置「已撤销」(5)" "$(q hi_club "SELECT status FROM hi_club_market_grant WHERE uuid='$GR';")" "5"
chk "买家机器人的引用行没了" "$(q hi_ai "SELECT COUNT(*) FROM hi_ai_plugin_using WHERE uuid='$P' AND agent_did='$ROBOT' AND deleted_at IS NULL;")" "0"
off=""; for _ in $(seq 40); do case "$(methods)" in *"\"${PRE}_"*) sleep 3;; *) off=1; break;; esac; done
[ -n "$off" ] && ok "**机器人当场卸掉了**(注册表里没有 ${PRE}_ 了)" || bad "机器人 120 秒内没卸掉" "$(methods | head -c 200)"
# 插件文件在 /opt/hinj/plugins(HINJ_PLUGIN_DIR 可改),文件名以插件 uuid 开头
chk "机器人本地文件也删了(/opt/hinj/plugins 里没有 $P)" "$(ssh -o ConnectTimeout=10 "$NEXT" "ls /opt/hinj/plugins 2>/dev/null | grep -c '^$P'")" "0"
BUYER_HAS=""   # 已经收回,cleanup 不用再替买家删

echo
printf "结果:通过 ${G}%d${N},失败 ${R}%d${N}\n" "$pass" "$fail"
[ "$fail" -eq 0 ]
