#!/bin/bash
# dev 环境端到端冒烟。
#
# 为什么需要:单测覆盖不了"编译通过但行为变了"这一类。真踩过 ——
# 实体命名重构把 `Type = agentBase.Type` 改成硬编码 assistant,编译永远是绿的,
# 硬件机器人注册自此全链路错,两天没人发现(因为期间恰好没有机器人注册)。
#
# 用法:bash smoke.sh          非 0 退出 = 有失败项
set -uo pipefail
# 端点/CA 的统一约定见 _endpoints.sh(前端可达→域名 TLS,内部服务→内网 IP)。
source "$(dirname "$0")/_endpoints.sh"
G=/home/lo/go/bin/grpcurl
PS=/home/lo/ci/hi-proto-code/lua/hi.pb
pass=0; fail=0

ok()   { printf "  \033[32m✓\033[0m %s\n" "$1"; pass=$((pass+1)); }
bad()  { printf "  \033[31m✗\033[0m %s  (%s)\n" "$1" "$2"; fail=$((fail+1)); }
chk()  { [ "$2" = "$3" ] && ok "$1" || bad "$1" "want=$3 got=$2"; }

echo "── 存储策略(靠 bucket 隔离,不靠代码记得)──"
# 走对外域名,不走 minio 内网口 —— 这几条问的是"**客户端**能不能读/枚举/写",
# 那就得站在客户端的位置上问。打 $H:9000 是绕过 nginx 从内网问,
# 少验了整条对外链路(TLS + nginx 那一跳),而权限判据本身还照样绿。
cs() { curl -s $CAC -o /dev/null -w '%{http_code}' "$@"; }
for b in hidid hiclub temp; do
  chk "$b 公开可读(对象不存在应 404 而非 403)" "$(cs $SRC/$b/_nope)" 404
done
for b in hiai log; do
  chk "$b 私有(匿名 GET 应 403)" "$(cs $SRC/$b/_nope)" 403
done
for b in hidid hiclub temp hiai; do
  chk "$b 不可枚举(LIST 403)" "$(cs $SRC/$b/)" 403
  chk "$b 拒匿名写(PUT 403)"  "$(cs -X PUT --data x $SRC/$b/_probe)" 403
done

echo "── hi-source:三种命名模式 + 新老 url 通吃 ──"
C=$(echo -n smoke | base64)
put() { $G $(tp $SRC_GRPC) -protoset $PS -d "$1" $SRC_GRPC hi.source.File/Put 2>&1 | grep -oE 'http[^"]+'; }
u_rand=$(put "{\"bucket\":\"temp\",\"dir\":\"_smoke\",\"name\":\"a.txt\",\"content\":\"$C\"}")
u_ts=$(  put "{\"bucket\":\"log\",\"dir\":\"_smoke\",\"name\":\"a.log\",\"content\":\"$C\",\"nameMode\":\"NAME_TIMESTAMP\"}")
u_keep=$(put "{\"bucket\":\"log\",\"dir\":\"_smoke\",\"name\":\"keep.log\",\"content\":\"$C\",\"nameMode\":\"NAME_KEEP\"}")
[[ $u_rand =~ /temp/_smoke/[0-9a-f]{32}\.txt$ ]] && ok "RANDOM:纯随机<32hex><ext>不带原名" || bad "RANDOM 命名" "$u_rand"
[[ $u_ts   =~ /log/_smoke/a_[0-9]{8}T[0-9]{6}\.[0-9]{9}Z\.log$ ]] && ok "TIMESTAMP:可读且字典序即时序" || bad "TIMESTAMP 命名" "$u_ts"
[[ $u_keep =~ /log/_smoke/keep\.log$ ]] && ok "KEEP:原样可覆盖" || bad "KEEP 命名" "$u_keep"

dl() { $G $(tp $SRC_GRPC) -protoset $PS -d "{\"url\":\"$1\"}" $SRC_GRPC hi.source.File/Download 2>&1 | grep -c '"content"'; }
chk "私有桶经 Download 能取(匿名取不到)" "$(dl "$u_ts")" 1
# ⚠️ 这条**故意**用内网 IP 前缀,不要"顺手统一成域名"。
# 它验的是 parseURL 认不认存量数据:库里的老 url 和别的服务传来的 url 都是
# `http://<ip>:9000/` 形式。只认域名的那一刻,历史 url 全报"跨环境数据",
# 插件包取不到、CreateVersion 整条挂掉(踩过:冒烟从 21/0 掉到 13/8)。
# 这里的 IP 是**入参数据**,不是"前端拿 IP 访问服务" —— 两回事。
chk "老 upload url 仍可下(存量不受影响)" \
    "$(dl "http://$H:9000/upload/2026_04/bc52deaa4b554fffb208c9a1e2178a8f_test_pic.jpg")" 1

echo "── 鉴权边界:操作对象只能来自 token ──"
# 第一个参数改成**端点**(原来是端口号):前端可达的两个网关走域名 TLS,
# hi-ai / hi-source 这两个纯内部的仍走内网 IP。判据是"前端够不够得着",不是"谁在调"。
code() { $G $(tp $1) -protoset $PS -d '{}' $1 $2 2>&1 | grep -oE 'Unauthenticated|Unimplemented|does not include a method|does not expose service' | head -1; }
chk "OrderEvent.Sub 需 token(已不收 did 入参)" "$(code $DID_GRPC hi.did.OrderEvent/Sub)" Unauthenticated
chk "club.Source.UploadLog 需 token"           "$(code $CLUB_GRPC hi.club.Source/UploadLog)"   Unauthenticated
chk "ai.Source.DownloadScript 需鉴权"          "$(code $AI_GRPC hi.ai.Source/DownloadScript)" Unauthenticated
chk "did.Source.UploadAvatar 需 token"         "$(code $DID_GRPC hi.did.Source/UploadAvatar)"  Unauthenticated
chk "club.Source.UploadTrainingFile 需 token"  "$(code $CLUB_GRPC hi.club.Source/UploadTrainingFile)" Unauthenticated

echo "── 已删接口不得复活 ──"
chk "hi-source 旧 Upload 已删"       "$(code $SRC_GRPC hi.source.File/Upload)"    "does not include a method"
chk "Wallet.ListAddresses 已迁走"    "$(code $DID_GRPC hi.did.Wallet/ListAddresses)" "does not include a method"
chk "club.UserExtension 已删"        "$(code $CLUB_GRPC hi.club.UserExtension/Get)"   "does not expose service"
chk "ai.Agent.Create 已拆(不得合并回来)" "$(code $AI_GRPC hi.ai.Agent/Create)"  "does not include a method"
chk "ai.Agent.RegisterRobot 存在"    "$(code $AI_GRPC hi.ai.Agent/RegisterRobot)"   Unauthenticated
chk "ai.Agent.CreateAssistant 存在"  "$(code $AI_GRPC hi.ai.Agent/CreateAssistant)" Unauthenticated

echo "── 公开查询确实免鉴权 ──"
n=$($G $(tp $DID_GRPC) -protoset $PS -d '{"list":[{"did":"zYJZirMcNx3FjFmhMQyXAAemADUy8BPBPz"}]}' $DID_GRPC hi.did.Assets/ListAddresses 2>&1 | grep -c 'Unauthenticated')
chk "Assets.ListAddresses 公开可调" "$n" 0

echo "── 实现覆盖(proto 改名后 handler 没跟 → 静默 Unimplemented)──"
if python3 /home/lo/ci/hi-proto/codegen/check_impl.py /home/lo/wip >/dev/null 2>&1; then
  ok "所有 rpc 都有后端实现"
else
  bad "有 rpc 找不到实现" "跑 check_impl.py 看详情"
fi

# 本次产生的对象落在 temp/_smoke 与 log/_smoke:
# hi-source 没有删除接口(有意的——删除权不该给搬运工),而这两个 bucket 分别有
# 14 天 / 30 天 lifecycle,会自己过期。要立刻清就用 minio 凭据直接删。

echo
echo "结果:通过 $pass,失败 $fail"
[ "$fail" -eq 0 ] || exit 1
