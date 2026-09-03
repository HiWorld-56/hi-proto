#!/bin/bash
# 「空串冒充 null」的**覆盖跑法**:先让别的 smoke 把数据造出来,再用**同一把 token**
# 去数回包里的字段。
#
# ## 为什么要串起来
#
# `empty_in_resp.sh` 单独跑时,测试账号名下什么都没有 —— 大半接口回的是空集合。
# 空集合本身没什么可验的(要验的是**元素那个类型的字段**),
# 但它也就意味着 `MarketGrantView` / `FundsRecord` / `MarketPayment` 这些类型的字段
# **一次都没被观察过**,「空串冒充 null」在它们身上从来没查过。
#
# 而 `smoke-market.sh` 本来就会造出挂牌 / 授权 / 订单 / 付款凭据 ——
# 与其再写一套夹具,不如**接着它跑**。
#
# ## 🔴 token 只取一次
#
# 这些脚本共用 `.66:/tmp/*_mn.txt`,而登录态按 `(did, app, dev)` 一行 ——
# 同一个助记词再登一次,前一个 token 当场失效(`Code(103) 异地登陆`)。
# 所以这里**取一次、两个脚本共用**,不要各取各的。
set -uo pipefail
cd "$(dirname "$0")"

NEXT=${NEXT_HOST:-192.168.1.66}
tok(){ ssh -o ConnectTimeout=15 "$NEXT" \
        "cd /tmp/tokgen && MN_FILE=$1 DEV=${2:-app} ./target/release/tokgen 2>/dev/null"; }

echo "── 取 token(只取这一次)──"
S=$(tok /tmp/65_seller_mn.txt); B=$(tok /tmp/65_buyer_mn.txt); D=$(ssh -o ConnectTimeout=15 "$NEXT" "cd /tmp/didtok && ./target/release/didtok 2>/dev/null")
ST=$(printf '%s' "$S"|grep ^TOKEN=|cut -d= -f2); SD=$(printf '%s' "$S"|grep ^DID=|cut -d= -f2)
BT=$(printf '%s' "$B"|grep ^TOKEN=|cut -d= -f2)
DT=$(printf '%s' "$D"|grep ^TOKEN=|cut -d= -f2)
[ -n "$ST" ] && [ -n "$BT" ] || { echo "拿不到 token"; exit 2; }
echo "  卖家 did=$SD"

echo
echo "── 一、先让 smoke-market 把数据造出来(挂牌/授权/订单/凭据)──"
PKG=$(MINIO_HOST=${MINIO_HOST:-192.168.1.65:9000} python3 build_testpkg.py 2>&1 | tail -1)
SELLER_TOK="$ST" SELLER_DID="$SD" BUYER_TOK="$BT" PKG="$PKG" \
  bash smoke-market.sh 2>&1 | tail -3

echo
echo "── 二、用**同一把卖家 token** 数字段覆盖 ──"
#
# `AI_KEY` 是 hi.ai 的**商户 key**(club 容器 /root/res/config.yml 的 HiAIServer.APIKEY)。
# 不给它的话,hi.ai 自己那一面只能拿 club 用户 token 去打 —— 那边什么都不拥有,
# 一片空回包,AgentInfo / ApiKeyInfo / TrainingFile / QA 这些类型的字段一次都观察不到。
AI_KEY=${AI_KEY:-61be7d40-09bb-41a1-8e33-f7acd440b7ae}
CLUB_TOKEN="$ST" CLUB_DID="$SD" DID_TOKEN="$DT" AI_KEY="$AI_KEY" \
  MINIO_HOST=${MINIO_HOST:-192.168.1.65:9000} bash empty_in_resp.sh
