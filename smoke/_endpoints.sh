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
