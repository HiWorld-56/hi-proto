#!/bin/bash
# DownloadScript(下插件源码)的归属冒烟。
#
# ## 为什么单独一个脚本
#
# 2026-10-01 核出:club 的 `Source.DownloadScript` 只判登录、不判「这台机器人是不是你能管的」,
# hi.ai 的 `Source.DownloadScript` 连「这台机器人是不是这把商户 key 建的」都不判 ——
# 两级归属一级都没有,唯一的门是「那行是不是 ORIGINAL」。
# 而**挂牌详情公开了卖家摊位的 did 与插件 uuid**:任何登录用户填卖家摊位,
# 那行正好是 ORIGINAL,于是免费下到卖家的原创源码(REFERENCE 拦截被整个绕过)。
# 另外 club 把 hi.ai 的拒绝一律改写成 `Internal 下载失败`,码丢了。
#
# 归属分两级、各判各的(与训练文件同一套路):
#   · club  判「你能不能管这台机器人」(机器人自己 / 主人 / 超管)—— 用户体系只有 club 有;
#   · hi.ai 判「这台机器人是不是这把商户 key 建的」—— club 只用一把商户 key,
#           所以这一级拦的是**别家商户**,拦不住 club 用户之间互相越权。
# 两级都要验:只验 club 那条,hi.ai 那条直连口子还开着也看不出来。
#
# 训练文件那一族(Training 九个 + Source 上传/下载训练文件)走的是同一道 club 级归属
# (handler 里的 trainingCaller),第六节一并验:它原来把归属校验的**所有**错误收成
# PermissionDenied「无权操作该机器人」—— 机器人不存在、读超管名单失败都被说成没权限。
# 现在机器人不存在回 5、别人的机器人回 7。十一个入口逐个打,漏接一个就红。
#
# ## 用法(在 .64 上跑:要 grpcurl + protoset;查库会自己 ssh 到 .65)
#
#   SELLER_TOK=... BUYER_TOK=... PKG=... bash smoke-download-script.sh
#
#   SELLER_TOK / BUYER_TOK  在 .66 上现签(见 TEST-CREDENTIALS.md / smoke-market.sh 开头):
#       cd /tmp/tokgen && MN_FILE=/tmp/65_seller_mn.txt DEV=app ./target/release/tokgen
#       cd /tmp/tokgen && MN_FILE=/tmp/65_buyer_mn.txt  DEV=app ./target/release/tokgen
#     BUYER 在这里扮「路人」:与卖家毫无关系的另一个登录用户。
#   PKG  测试插件包:MINIO_HOST=192.168.1.65:9000 python3 build_testpkg.py
#
# 非 0 退出 = 有失败项。夹具(机器人、插件、挂牌、授权、临时商户 key)现造现清。
set -uo pipefail

source "$(dirname "$0")/_endpoints.sh"
have_db || { echo "够不着 mysql(要 ssh 到 $DB 查库)" >&2; exit 2; }
GRPCURL=${GRPCURL:-$(command -v grpcurl || echo "$HOME/go/bin/grpcurl")}
[ -x "$GRPCURL" ] || { echo "找不到 grpcurl(.64 上在 ~/go/bin/grpcurl,或给 GRPCURL=<路径>)" >&2; exit 2; }

SELLER_TOK="${SELLER_TOK:?需要卖家用户 token}"
BUYER_TOK="${BUYER_TOK:?需要路人用户 token}"
PKG="${PKG:?需要测试插件包 url}"

pass=0; fail=0
ok()  { printf "  \033[32m✓\033[0m %s\n" "$1"; pass=$((pass+1)); }
bad() { printf "  \033[31m✗\033[0m %s  (%s)\n" "$1" "$2"; fail=$((fail+1)); }
chk() { [ "$2" = "$3" ] && ok "$1" || bad "$1" "want=$3 got=$2"; }
has() { case "$2" in *"$3"*) ok "$1";; *) bad "$1" "输出里没有 '$3':$(echo "$2"|head -c 200)";; esac; }

cj()  { curl -s $CAC -m 60 -X POST "$CLUB_API/$1" -H 'Content-Type: application/json' -H "Authorization: Bearer $3" -d "$2"; }
pub() { curl -s $CAC -m 60 -X POST "$CLUB_API/$1" -H 'Content-Type: application/json' -d "$2"; }
q()   { mysqlq "$1" "$2"; }
g()   { python3 -c '
import sys, json
try:
    d = json.load(sys.stdin)
    for k in sys.argv[1:]:
        d = d[k]
    print(d)
except Exception:
    print("")
' "$@"; }
# 下载结果压成一行:成功 → "OK <字节数> <name>";失败 → "ERR <code> <message>"。
# 断言只看这一行 —— 不把源码内容本身打进输出。
dl_club() {
  cj source/download_script "{\"agent\":\"$1\",\"uuid\":\"$2\",\"version\":\"$3\"}" "$4" | python3 -c '
import sys, json, base64
try:
    d = json.load(sys.stdin)
except Exception:
    print("BADJSON"); sys.exit()
if d.get("code", 0) != 0:
    print("ERR", d.get("code"), d.get("message", "")); sys.exit()
data = d.get("data") or d
c = data.get("content") or ""
print("OK", len(base64.b64decode(c)) if c else 0, data.get("name", ""))'
}
# hi.ai 直连(内部 grpc,带商户 ApiKey)。
dl_ai() {
  "$GRPCURL" $(tp $AI_GRPC) -protoset "$PS" -H "ApiKey: $4" \
    -d "{\"agent\":\"$1\",\"uuid\":\"$2\",\"version\":\"$3\"}" "$AI_GRPC" hi.ai.Source/DownloadScript 2>&1 | python3 -c '
import sys, json, base64, re
t = sys.stdin.read()
if t.lstrip().startswith("{"):
    d = json.loads(t); c = d.get("content") or ""
    print("OK", len(base64.b64decode(c)) if c else 0, d.get("name", "")); sys.exit()
code = re.search(r"Code:\s*(\S+)", t); msg = re.search(r"Message:\s*(.*)", t)
print("ERR", code.group(1) if code else "?", msg.group(1).strip() if msg else t.strip()[:160])'
}

echo "── 准备:卖家摊位 + 原创插件 + 挂牌;路人自己一台机器人 ──"
SB=$(cj agent/create_assistant '{"name":"smk-dl-seller"}' "$SELLER_TOK" | g data base did)
BB=$(cj agent/create_assistant '{"name":"smk-dl-bystander"}' "$BUYER_TOK" | g data base did)
P=$(cj plugin/create_shell "{\"agent\":\"$SB\",\"name\":\"smk-dl-demo\"}" "$SELLER_TOK" | g data uuid)
cj plugin/create_version "{\"agent\":\"$SB\",\"version\":{\"uuid\":\"$P\",\"version\":\"1.0.0\",\"url\":\"$PKG\"}}" "$SELLER_TOK" >/dev/null
LID=$(cj market/create_listing "{\"agent\":\"$SB\",\"plugin_uuid\":\"$P\",\"settle_mode\":1,\"price\":\"0\",\"tags\":[\"smk\"]}" "$SELLER_TOK" | g data uuid)
cj market/set_listing_status "{\"uuid\":\"$LID\",\"status\":2}" "$SELLER_TOK" >/dev/null
[ -n "$SB" ] && [ -n "$BB" ] && [ -n "$P" ] && [ -n "$LID" ] || { echo "准备失败 seller=$SB bystander=$BB plugin=$P listing=$LID"; exit 1; }
echo "  seller=$SB bystander=$BB plugin=$P listing=$LID"

# 临时商户:hi.ai 里另一个商户身份 + 一把 key(**不是** club 的那把)。用完删。
OTHER_DID="smkdl$(head -c 6 /dev/urandom | od -An -tx1 | tr -d ' \n')"
OTHER_KEY="smk-dl-$(cat /proc/sys/kernel/random/uuid)"
q hi_ai "INSERT INTO hi_ai_user(name,did,type,created_at,updated_at) SELECT 'smk-dl-merchant','$OTHER_DID',type,NOW(),NOW() FROM hi_ai_user WHERE did=(SELECT creator FROM hi_ai_agent WHERE did='$SB'); INSERT INTO hi_ai_apikey(value,did,is_active,note,created_at,updated_at) VALUES('$OTHER_KEY','$OTHER_DID',1,'smoke-download-script 临时',NOW(),NOW());"
chk "前提:临时商户 key 落库了" "$(q hi_ai "SELECT COUNT(*) FROM hi_ai_apikey a JOIN hi_ai_user u ON u.did=a.did WHERE a.value='$OTHER_KEY';")" "1"

echo
echo "── 前提:攻击所需的两样(摊位 did、插件 uuid)确实是公开的 ──"
D=$(pub market_directory/get_listing "{\"uuid\":\"$LID\"}")
has "公开挂牌详情里有卖家摊位 did" "$D" "$SB"
has "公开挂牌详情里有插件 uuid" "$D" "$P"

echo
echo "── 一、club:卖家本人下自己的原创源码 —— 放行 ──"
R=$(dl_club "$SB" "$P" "1.0.0" "$SELLER_TOK")
case "$R" in "OK "[1-9]*) ok "卖家拿到源码($R)";; *) bad "卖家拿到源码" "$R";; esac
has "文件名是 <uuid>_<版本>.zip" "$R" "${P}_1.0.0.zip"

echo
echo "── 二、club:路人填卖家摊位 —— 拒,码是 PermissionDenied(7)──"
R=$(dl_club "$SB" "$P" "1.0.0" "$BUYER_TOK")
chk "路人被拒且码为 7" "$(echo "$R" | awk '{print $1, $2}')" "ERR 7"
case "$R" in OK*) bad "路人**拿不到**源码" "$R";; *) ok "路人拿不到源码";; esac

echo
echo "── 三、club:机器人不存在 —— NotFound(5),不是 Internal ──"
R=$(dl_club "smkdl-no-such-agent" "$P" "1.0.0" "$BUYER_TOK")
chk "不存在的机器人回 5" "$(echo "$R" | awk '{print $1, $2}')" "ERR 5"

echo
echo "── 四、club:买来的(REFERENCE)不给源码 —— hi.ai 的拒绝原码透传(9),不被改写成 13 ──"
A=$(cj market/apply "{\"listing_uuid\":\"$LID\",\"to_agent\":\"$BB\"}" "$BUYER_TOK")
G=$(echo "$A" | g data grantUuid)
chk "前提:免费购买已装载" "$(echo "$A" | g data status)" "GRANT_STATUS_INSTALLED"
R=$(dl_club "$BB" "$P" "1.0.0" "$BUYER_TOK")
chk "引用方下源码回 9" "$(echo "$R" | awk '{print $1, $2}')" "ERR 9"
has "话是 hi.ai 那句人话" "$R" "引用的插件不能下载源码"

echo
echo "── 五、hi.ai 直连:别家商户的 key 填卖家摊位 —— 拒(商户级归属)──"
R=$(dl_ai "$SB" "$P" "1.0.0" "$OTHER_KEY")
case "$R" in OK*) bad "别家商户**拿不到**源码" "$R";; ERR\ NotFound*|ERR\ PermissionDenied*) ok "别家商户被拒($R)";; *) bad "别家商户被拒(码应为 NotFound/PermissionDenied)" "$R";; esac

echo
echo "── 六、训练文件一族:归属错误照实回 —— 不存在 5、别人的机器人 7(十一个入口逐个)──"
TC_BODY() { echo "{\"agent\":\"$1\",\"uuid\":\"u1\",\"uuids\":[\"u1\"],\"pagination\":{\"page\":1,\"limit\":5},\"content\":\"eA==\",\"name\":\"a.txt\",\"title\":\"t\",\"digest\":\"d\"}"; }
for ep in training/start training/status training/clear training/list_files training/get_file \
          training/delete_files training/create_content training/update_content training/edit_digest \
          source/upload_training_file source/download_training_file; do
  chk "$ep:路人填卖家的机器人 → 7" "$(cj "$ep" "$(TC_BODY "$SB")" "$BUYER_TOK" | g code)" "7"
  chk "$ep:机器人不存在 → 5" "$(cj "$ep" "$(TC_BODY "smktc-no-such-agent")" "$BUYER_TOK" | g code)" "5"
done
# 正向对照:同一个入口,卖家本人过得了归属这一关(否则上面的 7 可能只是"谁都过不去")。
chk "training/list_files:卖家本人 → 0" "$(cj training/list_files "$(TC_BODY "$SB")" "$SELLER_TOK" | g code)" "0"

echo
echo "── 清理 ──"
cj market/set_listing_status "{\"uuid\":\"$LID\",\"status\":4}" "$SELLER_TOK" >/dev/null
cj market/revoke "{\"grant_uuid\":\"$G\"}" "$SELLER_TOK" >/dev/null
q hi_club "DELETE p FROM hi_club_market_payment p JOIN hi_club_market_order o ON o.order_id=p.order_id WHERE o.grant_uuid='$G'; DELETE FROM hi_club_market_order WHERE grant_uuid='$G'; DELETE FROM hi_club_market_flow WHERE grant_uuid='$G'; DELETE FROM hi_club_market_grant WHERE uuid='$G'; DELETE FROM hi_club_market_listing WHERE uuid='$LID';"
cj plugin/delete_shell "{\"agent\":\"$BB\",\"uuid\":\"$P\"}" "$BUYER_TOK" >/dev/null
cj plugin/delete_shell "{\"agent\":\"$SB\",\"uuid\":\"$P\"}" "$SELLER_TOK" >/dev/null
cj agent/delete "{\"agent\":\"$SB\"}" "$SELLER_TOK" >/dev/null
cj agent/delete "{\"agent\":\"$BB\"}" "$BUYER_TOK" >/dev/null
q hi_ai "DELETE FROM hi_ai_apikey WHERE value='$OTHER_KEY'; DELETE FROM hi_ai_user WHERE did='$OTHER_DID';"
chk "清理:临时商户 key 已删" "$(q hi_ai "SELECT COUNT(*) FROM hi_ai_apikey WHERE value='$OTHER_KEY';")" "0"
chk "清理:两台测试机器人已删" "$(q hi_club "SELECT COUNT(*) FROM hi_chat_user WHERE did IN ('$SB','$BB');")" "0"

echo
echo "结果:通过 $pass,失败 $fail"
[ "$fail" -eq 0 ]
