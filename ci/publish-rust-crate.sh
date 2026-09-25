#!/bin/bash
# 把 hi-proto-code 某个 tag 的 Rust 生成物(rust/,crate 名 `hi-proto`)发到 Gitea 自带的 Cargo 仓库 `hi`。
#
#   ci/publish-rust-crate.sh <tag> [hi-proto-code 工作副本]      # 例:ci/publish-rust-crate.sh v1.5.19-dev.2
#
# ⭐ 为什么要发到仓库(2026-09-25 用户定):git 依赖的身份是「仓库地址 + tag」,core 钉 A、brain 钉 B
#    就是两份 hi-proto,跨 core 的接口一传就 E0308,于是 brain 只能用 core re-export 的那份 ——
#    **proto 版本被 core 决定**,brain 要新 proto 就得逼 core 打号。发到仓库后身份是「hi 仓库里的 hi-proto」,
#    core 只写最低版本、应用(brain / app)写确切版本,Cargo 合成一份,core 只在信封真变了时才跟。
#
# ⭐ **crate 版本号 = tag 的确定性映射,不用预发布后缀**:
#       vX.Y.Z-dev.N  →  X.Y.(Z*1000 + N)          v1.5.19-dev.2 → 1.5.19002
#       vX.Y.Z        →  X.Y.(Z*1000 + 999)        v1.5.19       → 1.5.19999
#    只增不减、能从版本号倒推回 tag。不用 `-dev.N` 是因为 Cargo 的 semver 规定预发布版本
#    不满足不带预发布的要求(`1.5.20-dev.1` 不满足 `>=1.5.19`),会重新拉出两份 hi-proto。
#    git tag 的形式不变(Go / Dart / lua / python 照旧按 tag 拿);只有 Rust crate 的版本号是这个形式。
#
# **幂等**:仓库里已经有这个版本就跳过 —— CI 中途失败(tag 推了、crate 没发)时直接重跑本脚本即可。
# 发布用 `~/.cargo/credentials.toml` 里 `[registries.hi]` 的 token;查询用 ~/.config/hi/gitea-package.token。
set -euo pipefail

TAG="${1:?用法: $0 <tag> [hi-proto-code 工作副本]}"
CODE="${2:-/home/lo/ci/hi-proto-code}"
REG_URL="https://git.hi.lan/api/packages/HiWorld-56/cargo"

if [[ "$TAG" =~ ^v([0-9]+)\.([0-9]+)\.([0-9]+)-dev\.([0-9]+)$ ]]; then
  N=${BASH_REMATCH[4]}
  (( N >= 1 && N <= 998 )) || { echo "[crate] $TAG 的 dev 号 $N 超出 1..998,映射放不下,需要先改映射规则" >&2; exit 1; }
elif [[ "$TAG" =~ ^v([0-9]+)\.([0-9]+)\.([0-9]+)$ ]]; then
  N=999
else
  echo "[crate] 认不出的 tag 形式: $TAG" >&2; exit 1
fi
VER="${BASH_REMATCH[1]}.${BASH_REMATCH[2]}.$(( BASH_REMATCH[3] * 1000 + N ))"
echo "[crate] $TAG → hi-proto $VER"

# 已发布过就跳过。稀疏索引路径:名字 ≥4 个字符 → <前两位>/<三四位>/<名字>。
TOKEN=$(cat ~/.config/hi/gitea-package.token)
IDX=$(curl -sf -H "Authorization: token $TOKEN" "$REG_URL/hi/-p/hi-proto" || true)
if printf '%s\n' "$IDX" | grep -q "\"vers\":\"$VER\""; then
  echo "[crate] 仓库里已有 $VER,跳过"; exit 0
fi

# 在干净的工作树里发:不动 CI 的工作副本,版本号只改在这份临时拷贝里(仓库里的 Cargo.toml 保持原样)。
WT=$(mktemp -d /tmp/hi-proto-crate.XXXXXX)
trap 'git -C "$CODE" worktree remove --force "$WT" >/dev/null 2>&1 || true; rm -rf "${WT:?}"' EXIT
git -C "$CODE" fetch -q origin "refs/tags/$TAG:refs/tags/$TAG" 2>/dev/null || true
git -C "$CODE" worktree add -q --detach "$WT" "$TAG"
sed -i -E "0,/^version = \".*\"$/s//version = \"$VER\"/" "$WT/rust/Cargo.toml"
grep -q "^version = \"$VER\"$" "$WT/rust/Cargo.toml" || { echo "[crate] 没写进版本号" >&2; exit 1; }
( cd "$WT/rust" && CARGO_TARGET_DIR="$WT/target" cargo publish --registry hi --allow-dirty 2>&1 | tail -5 )

# 读回来核对:仓库里真有这个版本才算发了
IDX=$(curl -sf -H "Authorization: token $TOKEN" "$REG_URL/hi/-p/hi-proto")
printf '%s\n' "$IDX" | grep -q "\"vers\":\"$VER\"" || { echo "[crate] 发完读不回 $VER" >&2; exit 1; }
echo "[crate] 已发布 hi-proto $VER($TAG)"
