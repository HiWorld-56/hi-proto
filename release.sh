#!/bin/bash
# hi-proto → hi-proto-code 纯生成器:从 .proto 生成 go/rust/dart,推 hi-proto-code 的 dev。
#   本脚本【不打 tag】。版本/tag 由 CI 编排(run-ci.sh)按分支决定:
#     dev  → vX.Y.Z-devN(预发布)   main → vX.Y.Z(正式)
#   手动生成也可直接跑:./release.sh(只重生成、推 dev)。
# 约定:hi-proto-code 检出在 ../hi-proto-code(dev 分支)。
# 代理:buf 一律不走代理(BSR 走缓存/直连);cargo 走梯子。
set -e

HIPROTO="$(cd "$(dirname "$0")" && pwd)"
CODE="$(cd "$HIPROTO/.." && pwd)/hi-proto-code"
PROXY="http://192.168.1.64:1080"
export PATH="/home/lo/golang/go/bin:/home/lo/go/bin:$HOME/.cargo/bin:$PATH"

[ -d "$CODE/.git" ] || { echo "找不到 $CODE(先 clone hi-proto-code 到此)"; exit 1; }

echo "[hi-proto] $(git -C "$HIPROTO" rev-parse --short HEAD)"

# 鉴权标注校验:每个 rpc 必须显式标注 hi.auth。规则长在方法上,后端拦截器读 descriptor;
# 漏标即 fail-closed(线上会被拒绝),故在生成前就拦下,而不是等上线才发现。
echo "[0/5] 校验 hi.auth 标注"
python3 "$HIPROTO/codegen/check_auth.py"

# 实现覆盖:proto 声明的 rpc 后端有没有对应 handler。
# Go 的 Unimplemented<Svc>Server 会兜底,所以「proto 改了名、handler 没跟」编译期一声不吭,
# 服务注册着、方法接不上,运行时静默返 Unimplemented(真踩过三次)。
# **只报不拦** —— 正常工作流是先改 proto 再跟后端,硬失败会卡死每次改名的第一次推送。
python3 "$HIPROTO/codegen/check_impl.py" /home/lo/wip --warn || true

echo "[1/5] 合并 HTTP 配置"
( cd "$HIPROTO" && make merge >/dev/null )

echo "[2/5] go-http → $CODE"
( cd "$HIPROTO"; unset HTTPS_PROXY HTTP_PROXY https_proxy http_proxy
  rm -rf "$CODE/go/hi" "$CODE/go/google" "$CODE/go/buf"; buf generate --template codegen/go_http_code.yaml )

# 字段名字符串核对:handler 里 validate.ValidateNotNil(req, []string{"X"}) 这类
# **用字符串引用 proto 字段名**的地方,X 一旦随 proto 改名/删除就静默失效 ——
# ValidateNotNil 走 reflect.FieldByName,「字段不存在」与「字段为 nil」是同一分支,
# 于是接口永远返回 "field X is required",编译期毫无提示。
# hi.club/hi.ai 的 Agent.Edit 就这么坏了(校验早已删除的 Base 字段),谁都调不通,
# 直到写业务路径冒烟才发现。
#
# ⚠️ 必须放在 [2/5] **之后** —— 要用刚生成的 pb.go 校验,回答"我这次改 proto 会让
#    哪个后端失效"。若按各仓 go.mod 锁定的旧版本校验,只能说明后端与自己当前依赖
#    自洽,对刚改的这版 proto 一无所知,等于白跑。
#
# **只报不拦**(同 check_impl):正常工作流是先改 proto 再跟后端。
python3 "$HIPROTO/codegen/check_validate.py" --pb-from "$CODE/go" --warn /home/lo/wip/backend-hi-* || true

echo "[3/5] rust → $CODE/rust/src/gen"
( cd "$HIPROTO/codegen/rust-gen"
  export HTTPS_PROXY=$PROXY HTTP_PROXY=$PROXY          # cargo 走梯子;rust-gen 内部会为 buf 剥离代理
  cargo run --quiet -- "$HIPROTO" "$CODE/rust/src/gen" )

echo "[4/5] dart → $CODE/dart/lib"
( cd "$HIPROTO"; unset HTTPS_PROXY HTTP_PROXY https_proxy http_proxy
  rm -rf "$CODE/dart/lib/hi" "$CODE/dart/lib/google" "$CODE/dart/lib/buf"
  buf generate --template codegen/dart_code.yaml )

echo "[5/5] lua descriptor → $CODE/lua/hi.pb"
# lua-protobuf(pb.load)吃 FileDescriptorSet。Lua 工程(如 hinj-face)pin hi-proto-code 版本、
# 加载此 hi.pb,不再各自本地 protoc 生成。含全部 hi.* 与 imports,单文件全量。
( cd "$HIPROTO"; unset HTTPS_PROXY HTTP_PROXY https_proxy http_proxy
  mkdir -p "$CODE/lua"
  buf build --as-file-descriptor-set -o "$CODE/lua/hi.pb" )

cd "$CODE"
git checkout -q dev
git add -A
if git diff --cached --quiet; then
  echo "== 产物无变更 =="
else
  SHA=$(git -C "$HIPROTO" rev-parse --short HEAD)
  git -c user.name="ci" -c user.email="ci@hi.lan" commit -q -m "sync from hi-proto@${SHA}"
  ( unset HTTPS_PROXY HTTP_PROXY https_proxy http_proxy; git push origin dev )
  echo "== 已推 hi-proto-code dev =="
fi
