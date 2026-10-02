#!/bin/bash
# 冒烟脚本的**统一端点约定**。所有 smoke-*.sh 一律 `source` 它,别再各自写死。
#
# ── 判据:前端够得着的一律域名 TLS,纯内部服务才用 IP+端口。──────────────────
#
# 冒烟是拿来模拟真实环境的。前端(app / 机器人 / 网页)在用户手里,只可能走域名;
# 拿 IP+端口打,整条 TLS 路径(证书链、SNI、ALPN、nginx 那一跳)一次都走不到 ——
# 于是"开发全绿、生产一握手就挂"这类问题在冒烟里永远不会响。
#
# 反过来,给内部服务配域名等于**多开一个对外面**,所以它们仍旧只用内网 IP:
#   · hi-source 9530/9531 —— 全 AUTH_NONE 的搬运工,上传一律经业务模块转发,不对外
#   · hi-ai     9534/9535 —— 前端只有 hiclub 一条通道,hi-ai 由 club 转发
#   · mysql / redis / minio 内网口 —— 后端之间,本来就该走 IP
#
# 判据是**端口在不在内网**,不是"谁在调"。别按调用方来分。
#
# 用法:
#   source "$(dirname "$0")/_endpoints.sh"
#   curl -s $CAC -X POST "$CLUB_API/chat/converse" ...
#   $GRPCURL $(tp $CLUB_GRPC) -protoset $PB -d "$body" $CLUB_GRPC hi.club.Order/Report

# ── 对外(前端可达)→ 域名 TLS ────────────────────────────────────────────
# ⚠️ 走**专用 API 域名**,不要用 `hiclub.hi.lan/api/v1` 那种后台站的同源路径。
# 同源路径只在开发存在 —— 生产的 hiclub.mados.net 根本没有 /api/(只有 /dl/、
# /download 和静态站)。拿一条生产不存在的路径去冒烟,等于没在模拟真实环境。
# 同源那几条留给**浏览器里的后台页面**;非浏览器客户端一律走 *-http-api。
CLUB_API=${CLUB_API:-https://hiclub-http-api.hi.lan/api/v1}   # → hi-club 9537
AI_API=${AI_API:-https://hiai-http-api.hi.lan/api/v1}         # → hi-ai   9535
DID_API=${DID_API:-https://hidid-http-api.hi.lan/api/v1}      # → hi-did  9533
CLUB_GRPC=${CLUB_GRPC:-hiclub-grpc-api.hi.lan:443}
DID_GRPC=${DID_GRPC:-hidid-grpc-api.hi.lan:443}
SRC=${SRC:-https://hisource.hi.lan}                     # 资源域名 —— 客户端看到的就是它

# ── 对内(前端够不着)→ 内网 IP+端口 ──────────────────────────────────────
H=${H:-192.168.1.65}          # 开发环境宿主
DB=${DB:-192.168.1.65}        # mysql
AI_GRPC=${AI_GRPC:-$H:9534}   # hi-ai gRPC:仅内部
SRC_GRPC=${SRC_GRPC:-$H:9530} # hi-source gRPC:仅内部

# ── 私有 CA ──────────────────────────────────────────────────────────────
# hi.lan 的证书是私有 CA 自签的,curl/grpcurl 得认它。各机器情况不一样:
# .64(冒烟常驻机)已把 CA 装进系统信任库、不带参数也能连;.65 没装,必须显式给。
# 所以这里**自动找一份**,找不到就不带参数、退回系统信任库 ——
# 写死单一路径的话,换台机器跑就是满屏 TLS 失败,而那跟"服务真挂了"长得一模一样。
CA=""
for _c in "${HI_LAN_CA:-}" /home/lo/wip/hi.lan.crt /home/lo/hi_lan_ca/hi.lan.crt; do
  [ -n "$_c" ] && [ -f "$_c" ] && { CA=$_c; break; }
done
unset _c
CAC=${CA:+--cacert $CA}   # curl 用(双横线)
GCA=${CA:+-cacert $CA}    # grpcurl 用(单横线)

# 按端点自动选传输:*.hi.lan 走 TLS,内网 IP 走明文 h2c。
tp() { case "$1" in *hi.lan*) echo "$GCA";; *) echo "-plaintext";; esac; }

# ── protoset(grpcurl 用)──────────────────────────────────────────────────
#
# 🔴 **别写死路径。** 原来 smoke.sh 写的是 `/home/lo/ci/hi-proto-code/lua/hi.pb`,
# 那个目录只存在于 **.64**(CI 机);而 README 说这些脚本在 **.65** 跑(一半断言要查库,
# mysql 只有那台有)。于是在 .65 上跑时,每一个 grpc 断言拿到的都是**空串** ——
# 表现是 `want=Unauthenticated got=`,**看着像接口全挂了**,实际是 protoset 不存在。
# (2026-09-03 实测:smoke.sh 在 .65 上 14 通过 / 16 失败,16 条全是这一个原因。)
#
# 这里按优先级找一份,**找不到就直接退出** —— 静默降级比报错糟得多。
# 想钉某一版就给 HI_PB=<路径>。
if [ -z "${PS:-}" ]; then
  _cand=$(ls -d /home/lo/go/pkg/mod/github.com/*/hi-proto@* 2>/dev/null \
          | sed 's/.*hi-proto@//' | sort -V | tac \
          | while read -r _v; do
              _d=$(ls -d /home/lo/go/pkg/mod/github.com/*/hi-proto@"$_v" 2>/dev/null | head -1)
              [ -n "$_d" ] && [ -f "$_d/rust/src/gen/hi_proto_descriptor.bin" ] && { echo "$_d/rust/src/gen/hi_proto_descriptor.bin"; break; }
            done)
  for _p in "${HI_PB:-}" /home/lo/ci/hi-proto-code/lua/hi.pb /home/lo/hi.pb "$_cand"; do
    [ -n "$_p" ] && [ -f "$_p" ] && { PS=$_p; break; }
  done
  unset _p _v _d _cand
fi
[ -n "${PS:-}" ] && [ -f "$PS" ] || {
  echo "找不到 protoset(hi.pb 或 hi_proto_descriptor.bin)。" >&2
  echo "  .64 上在 ~/ci/hi-proto-code/lua/hi.pb;别的机器拷一份过去,或给 HI_PB=<路径>。" >&2
  echo "  ⚠️ 缺了它每个 grpc 断言都会是空串,看着像接口全挂了。" >&2
  exit 2
}
export PS

# ── 查库:本机有 mysql 就本机,没有就 ssh 到 .65 ────────────────────────────
#
# 🔴 **不要求"必须在有 mysql 的那台跑"。** 依赖是分散的:
# grpcurl + protoset + `~/wip` 只有 `.64` 有,而 `.64` 没装 mysql;
# `.65` 有 mysql,却没有前三样、也没有到 `.66` 的公钥(取 token 要用)。
# 谁都不全 —— 所以让**够得着的那一头去够**,而不是逼脚本挑一台。
#
# `mysqlq <库> <SQL>`:回 `-N -B`(无表头、tab 分隔),与原来各脚本里的 q()/Q() 同形。
if command -v mysql >/dev/null 2>&1; then
  mysqlq() { mysql -h"${DB}" -ulo -p568568 "$1" -N -B -e "$2" 2>/dev/null; }
else
  # ⚠️ 整条 SQL 用 printf %q 转义再交给远端,别让本地 shell 先展开一遍。
  # ⚠️ **重试三次。** ssh 这条链会抖,而失败的表现是"返回空串" ——
  #    断言于是变成 `want=1 got=`,看着像产品坏了。
  mysqlq() {
    _db=$1; shift
    _i=0
    while [ $_i -lt 3 ]; do
      if _out=$(ssh -o ConnectTimeout=20 -o BatchMode=yes lo@"${DB}" \
                    "mysql -ulo -p568568 ${_db} -N -B -e $(printf %q "$*")" 2>/dev/null); then
        printf '%s' "$_out"; return 0
      fi
      _i=$((_i+1)); sleep 2
    done
    return 1
  }
fi

# 够不够得着库 —— 够不着要**当场退出**,别让一堆断言变成 `want=1 got=`。
have_db() { [ "$(mysqlq information_schema "SELECT 1" 2>/dev/null | head -1)" = "1" ]; }

# ══ 凭据一律不进命令行 ════════════════════════════════════════════════════════
#
# 进程的命令行(argv)本机任何用户 `ps` 都看得见 —— token、apikey、refresh token、助记词一个都不许放进去
# (与 .65 上去掉 `mosquitto_sub -P 密码` 同一类)。冒烟脚本自己的凭据从**环境变量**收(不收位置参数),
# 往下调工具时:
#   curl_tok <token> <curl 参数...>         Authorization 头经 `-H @<(printf …)` 交给 curl(argv 里只有 /dev/fd/N)
#   grpcurl_tok <token> <grpcurl 参数...>   头写成 `${SMK_BEARER}`,值走环境变量,grpcurl -expand-headers 自己展开
#   grpcurl_key <apikey> <grpcurl 参数...>  同上,hi.ai 商户 key 的 `ApiKey` 头
#   带秘密的请求体(refresh token)一律 `-d @` 从 stdin 喂,别写进 `-d '<json>'`
#   peer66 <.66 上的助记词文件> <命令> [参数...]   .66 的 peer_cli 走 serve 模式,助记词经本地 TCP 交给它
# printf / read 是 bash 内建,不起新进程,不留 argv。
curl_tok()    { curl -H @<(printf 'Authorization: Bearer %s\n' "$1") "${@:2}"; }
grpcurl_tok() { SMK_BEARER="Bearer $1" "$_SMK_GRPCURL" -expand-headers -H 'authorization: ${SMK_BEARER}' "${@:2}"; }
grpcurl_key() { SMK_APIKEY="$1" "$_SMK_GRPCURL" -expand-headers -H 'ApiKey: ${SMK_APIKEY}' "${@:2}"; }
# peer66 <助记词文件(.66 上的路径)> <命令> [参数...] → 回一行 `KEY=VALUE;KEY=VALUE`(出错 `ERR=…`)
#   peer_cli 的命令行模式要把助记词当参数,在 .66 的 ps 里看得见;serve 模式按行收命令(TAB 分隔),
#   这里起一个只听 127.0.0.1 随机口的 serve,喂一行、读一行、关掉。参数(正文)base64 过一道,免得引号出事。
peer66() {
  local mn=$1 cmd=$2 enc
  shift 2
  enc=$( (for x in "$@"; do printf '\t%s' "$x"; done) | base64 | tr -d '\n')
  ssh -o ConnectTimeout=20 -o BatchMode=yes 192.168.1.66 'bash -s' <<PEER
cd ~/wip/hiclub-core-mqtt || { echo "ERR=没有 ~/wip/hiclub-core-mqtt"; exit 2; }
port=\$((20000 + RANDOM % 20000)); log=\$(mktemp)
./target/release/peer_cli serve \$port > \$log 2>&1 &
pid=\$!
for _ in \$(seq 100); do grep -q LISTENING= \$log && break; sleep 0.1; done
if exec 3<>/dev/tcp/127.0.0.1/\$port; then
  { printf '%s\t' '$cmd'; tr -d '\n' < '$mn'; printf '%s' '$enc' | base64 -d; printf '\n'; } >&3
  IFS= read -r -t 180 line <&3; printf '%s\n' "\${line:-ERR=serve 没回话}"
else
  echo "ERR=serve 没起来:\$(tail -2 \$log)"
fi
kill \$pid 2>/dev/null; rm -f \$log
PEER
}

# ══ 收尾:冒烟现造的东西跑完一律清掉(唯一一份,所有脚本 source 本文件就带上)══════════════════
#
# 冒烟每跑一次都在开发环境造东西:助手、壳、版本、挂牌、授权、订单、付款凭据、apikey、临时商户、
# minio 里的插件包……原来各脚本各写各的收尾,有的没 trap(提前 exit 就漏)、有的只下架不删、
# 有的漏了订单 / 凭据这一层,开发库里于是一直攒着冒烟的残渣。现在收成一处:
#
#   made <词>...      登记**本次现造**的东西(did / uuid / 单号,12 位以上那种整词)。
#                     退出时经 ssh 交给 .66 的 purge.py —— 开发环境「删探针造的东西」唯一的实现 ——
#                     删掉开发 MySQL 全部库里含这些词的行 + redis 的键与集合成员,删完复扫,剩下不是 0 就算没清干净。
#                     ⛔ 只报自己现造的;固定复用的夹具身份(各 *_mn.txt、.66 机器人、商户 did……)一个都不许报 ——
#                        purge.py 有保护名单,词里出现一个就整批拒删,本脚本随之报 ✘。
#   undo '<命令>'     登记收尾时要跑的**正规删除**(走接口删助手 / 删壳、下架、撤权、删 minio 对象、还原夹具……)。
#                     退出时**后进先出**全部跑一遍,不论成败;任何一条失败都算没清干净。
#                     命令在本 shell 里 eval,变量请在登记时就展开(双引号),别指望退出时它们还是当时的值。
#   undone '<命令>'   正文里已经亲自做过(而且断言过)的那条,从清单上划掉 —— 字面与登记时一致。
#   最常用的是 club 接口那种:undo_club / undone_club <token> <路由> <json>(见下)。
#
# 两份清单都落在文件里(mktemp,600):`$(...)` 子 shell 里登记的、python 子进程登记的(往
# $SMOKE_MADE_FILE / $SMOKE_UNDO_FILE 追加一行)都算数。每个 source 本文件的脚本各有自己的一份,
# 互不继承 —— 嵌套调用的子脚本自己收自己的尾。
#
# 退出码:正文失败照旧;正文全过而收尾有一步没做到 → 打 ✘ 并以 1 退出。
#
# `SMOKE_PURGE_DRY=1`:purge 只扫不删(先看清会删哪些行),这时收尾算「没清」、照样非 0 退出。
PURGE_HOST=${PURGE_HOST:-192.168.1.66}
PURGE_PY=${PURGE_PY:-/home/lo/wip/hinj-brain/tools/probes/purge.py}
SMOKE_MADE_FILE=$(mktemp /tmp/smoke-made.XXXXXX)
SMOKE_UNDO_FILE=$(mktemp /tmp/smoke-undo.XXXXXX)
export SMOKE_MADE_FILE SMOKE_UNDO_FILE
_SMK_GRPCURL=$(command -v grpcurl || echo /home/lo/go/bin/grpcurl)

made()   { local w; for w in "$@"; do [ -n "$w" ] && printf '%s\n' "$w" >> "$SMOKE_MADE_FILE"; done; return 0; }
undo()   { [ -n "$1" ] && printf '%s\n' "$1" >> "$SMOKE_UNDO_FILE"; return 0; }
undone() { local t; t=$(mktemp /tmp/smoke-undo.XXXXXX); grep -vxF -- "$1" "$SMOKE_UNDO_FILE" > "$t"; cat "$t" > "$SMOKE_UNDO_FILE"; rm -f "$t"; }

# 打印前把 token(JWT 形状)遮掉 —— 收尾命令里带着它们
_smk_mask() { sed -E 's/[A-Za-z0-9_-]{16,}\.[A-Za-z0-9_-]{16,}\.[A-Za-z0-9_-]+/<token>/g'; }

# ── 收尾命令常用的三样(都是「成了回 0,没成把原因打出来回非 0」)──────────────────────
# club_do <token> <路由> <json>:club 的 http 接口,回 code 0 才算成。
club_do() {
  local r
  r=$(curl_tok "$1" -s $CAC -m 120 -X POST "$CLUB_API/$2" -H 'Content-Type: application/json' -d "$3")
  case "$r" in *'"code":0'*) return 0;; esac
  printf '%s' "${r:-无回包}" | head -c 200 | _smk_mask; return 1
}
# undo_club / undone_club <token> <路由> <json>:登记 / 划掉一条 club_do(最常用的那种收尾,省得每处手拼引号)。
undo_club()   { undo   "club_do '$1' $2 '$3'"; }
undone_club() { undone "club_do '$1' $2 '$3'"; }
# src_rm <url>:按 url 删 hi-source 里的对象(冒烟传进 minio 的插件包),删完再取一次,取得到就算没删掉。
src_rm() {
  local o
  o=$("$_SMK_GRPCURL" $(tp $SRC_GRPC) -protoset "$PS" -d "{\"url\":\"$1\"}" "$SRC_GRPC" hi.source.File/Delete 2>&1) \
    || { printf '%s' "$o" | head -c 200; return 1; }
  if "$_SMK_GRPCURL" $(tp $SRC_GRPC) -protoset "$PS" -d "{\"url\":\"$1\"}" "$SRC_GRPC" hi.source.File/Download 2>&1 | grep -q '"content"'; then
    printf '删了还取得到'; return 1
  fi
}
# pkg_build <造包脚本> [参数...]:造测试插件包并传进 minio,回 url;**同时登记退出时删掉它**。
#   在 $(...) 里调也算数(登记落在文件里)。造不出来回空串、退出码非 0。
pkg_build() {
  local u
  u=$(MINIO_HOST=${MINIO_HOST:-192.168.1.65:9000} python3 "$(dirname "${BASH_SOURCE[0]}")/$1" "${@:2}" 2>&1 | tail -1)
  case "$u" in https://*) undo "src_rm '$u'"; printf '%s' "$u";; *) printf '%s' "$u" >&2; return 1;; esac
}

# session_keep <did>:**登录之前**调。固定夹具身份在三家(hidid / club / hi-ai)当前没有登录态的,
#   收尾时把本次登录留下的那份删掉;本来就有的不动(可能是别人正在用的会话)。
#   夹具不进 purge,登录态是它身上唯一会被冒烟新添的东西 —— hidid 的 PC 槽还是独占的,留一份活会话会挡住别的设备。
session_keep() {
  local t n
  [ -n "$1" ] || { echo "session_keep:did 为空(助记词算不出 did?)—— 登录态收不回来" >&2; return 1; }
  for t in hi_did.hi_user_refreshtoken hi_club.hi_chat_user_refreshtoken hi_ai.hi_ai_user_refreshtoken; do
    n=$(mysqlq information_schema "select count(*) from $t where did='$1'")
    [ "$n" = "0" ] && undo "mysqlq information_schema \"delete from $t where did='$1'\" >/dev/null; [ \"\$(mysqlq information_schema \"select count(*) from $t where did='$1'\")\" = 0 ]"
  done
  return 0
}
# mn_did <助记词文件>:按 .66 上那份助记词算 did(didtok DID_ONLY,不登录、不顶掉谁)
mn_did() { ssh -n -o ConnectTimeout=15 192.168.1.66 "cd /tmp/didtok && MN_FILE=$1 DID_ONLY=1 ./target/release/didtok" 2>/dev/null | sed -n 's/^DID=//p'; }

_smk_finish() {
  local rc=$? bad=0 i c o words
  trap - EXIT
  # 把这些身份的单聊会话号补进词表。purge 自己也按「单聊成员」展开,但正规删除(下面那段、或正文里
  # 已经做过的)一跑,助手那条成员行就没了 —— 单聊群只标 severed_at 留档、只剩对方(常是夹具)那一头,
  # purge 再也认不出它是谁的会话,于是每删一台助手就在开发库留一个留档群。
  # 会话号是按两个 did 算出来的(club BuildSingleGroupCode:sha256(小的 + ":" + 大的),按字节比),
  # 所以拿「我们的词 × 群里还剩的那个成员」现算一遍就认得回来;成员行还在的,直接按成员认。
  if [ -s "$SMOKE_MADE_FILE" ]; then
    o=$(sort -u "$SMOKE_MADE_FILE" | sed "s/.*/select '&' w/" | paste -sd'|' - | sed 's/|/ union all /g')
    mysqlq hi_club "select distinct g.code from hi_chat_group g join hi_chat_group_user u on u.group_code = g.code
                      join ($o) t
                     where g.group_type = 'single'
                       and (u.user_did = t.w
                            or g.code = sha2(concat(least(binary t.w, binary u.user_did), ':', greatest(binary t.w, binary u.user_did)), 256))" \
      >> "$SMOKE_MADE_FILE"
  fi
  if [ -s "$SMOKE_UNDO_FILE" ]; then
    echo
    echo "── 收尾:正规删除(后进先出)──"
    local -a cmds
    mapfile -t cmds < "$SMOKE_UNDO_FILE"
    for ((i=${#cmds[@]}-1; i>=0; i--)); do
      c=${cmds[i]}; [ -n "$c" ] || continue
      if o=$(eval "$c" 2>&1); then
        printf "  \033[32m✓\033[0m %s\n" "$(printf '%s' "$c" | _smk_mask | head -c 150)"
      else
        printf "  \033[31m✘\033[0m %s\n     → %s\n" "$(printf '%s' "$c" | _smk_mask | head -c 150)" "$(printf '%s' "$o" | _smk_mask | head -c 200)"
        bad=1
      fi
    done
  fi
  words=$(sort -u "$SMOKE_MADE_FILE" | tr '\n' ' ')
  if [ -n "${words// /}" ]; then
    echo
    echo "── 收尾:purge($PURGE_HOST,词 $(wc -w <<<"$words") 个)──"
    o=$(ssh -n -o ConnectTimeout=20 -o BatchMode=yes "$PURGE_HOST" \
          "python3 $PURGE_PY ${SMOKE_PURGE_DRY:+--dry-run} $words" 2>&1)
    c=$?
    printf '%s\n' "$o" | sed 's/^/  /'
    if [ $c -ne 0 ]; then
      printf "  \033[31m✘\033[0m purge 没清干净(退出码 %s)\n" "$c"; bad=1
    elif [ -n "${SMOKE_PURGE_DRY:-}" ]; then
      printf "  \033[31m✘\033[0m SMOKE_PURGE_DRY=1:只扫没删\n"; bad=1
    fi
  fi
  rm -f "$SMOKE_MADE_FILE" "$SMOKE_UNDO_FILE"
  if [ $bad -ne 0 ]; then
    printf "\033[31m✘ 收尾没做干净 —— 开发环境里还留着这次造的东西(见上)\033[0m\n"
    [ $rc -eq 0 ] && rc=1
  fi
  exit $rc
}
trap _smk_finish EXIT
