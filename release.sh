#!/bin/bash
# hi-proto → hi-proto-code 生成发布脚本。
#   用法:  ./release.sh            # 小改动:生成三语言 → 推 hi-proto-code dev
#          ./release.sh v1.4.0     # 发版:  推 dev → merge main → 打 tag
# 约定:hi-proto-code 检出在 ../hi-proto-code(dev 分支)。
# 代理:buf 一律不走代理(BSR 走缓存/直连;走代理会 404);cargo/go 走梯子。
set -e

HIPROTO="$(cd "$(dirname "$0")" && pwd)"
CODE="$(cd "$HIPROTO/.." && pwd)/hi-proto-code"
VERSION="$1"
PROXY="http://192.168.1.64:1080"
export PATH="/home/lo/golang/go/bin:/home/lo/go/bin:$HOME/.cargo/bin:$PATH"

[ -d "$CODE/.git" ] || { echo "找不到 $CODE(先 clone hi-proto-code 到此)"; exit 1; }

echo "[hi-proto] $(git -C "$HIPROTO" rev-parse --short HEAD)"

echo "[1/4] 合并 HTTP 配置"
( cd "$HIPROTO" && make merge >/dev/null )

echo "[2/4] go-http → $CODE"
( cd "$HIPROTO"; unset HTTPS_PROXY HTTP_PROXY https_proxy http_proxy
  rm -rf "$CODE/go/hi" "$CODE/go/google" "$CODE/go/buf"; buf generate --template codegen/go_http_code.yaml )

echo "[3/4] rust → $CODE/rust/src/gen"
( cd "$HIPROTO/codegen/rust-gen"
  export HTTPS_PROXY=$PROXY HTTP_PROXY=$PROXY          # cargo 走梯子;rust-gen 内部会为 buf 剥离代理
  cargo run --quiet -- "$HIPROTO" "$CODE/rust/src/gen" )

echo "[4/4] dart → $CODE/dart/lib"
( cd "$HIPROTO"; unset HTTPS_PROXY HTTP_PROXY https_proxy http_proxy
  rm -rf "$CODE/dart/lib/hi" "$CODE/dart/lib/google" "$CODE/dart/lib/buf"
  buf generate --template codegen/dart_code.yaml )

cd "$CODE"
git checkout -q dev
git add -A
if git diff --cached --quiet; then echo "== 产物无变更(仅可能补 tag)=="; NOCHANGE=1; fi
if [ -z "$NOCHANGE" ]; then
  SHA=$(git -C "$HIPROTO" rev-parse --short HEAD)
  git -c user.name="ci" -c user.email="ci@hi.lan" commit -q -m "sync from hi-proto@${SHA}"
  ( unset HTTPS_PROXY HTTP_PROXY https_proxy http_proxy; git push origin dev )
  echo "== 已推 dev =="
fi

if [ -n "$VERSION" ]; then
  git checkout -q main
  git merge -q --ff-only dev
  git tag "$VERSION"        # 单 tag:go.mod 在仓根,普通 vX;go/rust/dart 三语言共用
  ( unset HTTPS_PROXY HTTP_PROXY https_proxy http_proxy; git push origin main "$VERSION" )
  git checkout -q dev
  # 源仓 hi-proto 打同一个版本号(产物仓版本 = 源仓版本,始终一致)
  ( cd "$HIPROTO"; git tag "$VERSION" 2>/dev/null; unset HTTPS_PROXY HTTP_PROXY https_proxy http_proxy; git push origin "$VERSION" )
  echo "== 已发版 $VERSION(hi-proto + hi-proto-code 同版本 $VERSION)=="
fi
