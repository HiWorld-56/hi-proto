#!/bin/bash
# gitea Actions 编排:改 hi-proto → 自动重生成 hi-proto-code + 按分支打 tag。
#   push dev   → 重生成、推 hi-proto-code dev、两仓打 vX.Y.Z-devN(预发布,N 自增)
#   push main  → 重生成、hi-proto-code dev 合 main、两仓打 vX.Y.Z(正式,去 -dev)
# 版本基号取自 hi-proto 根目录 VERSION。分支决定 -dev 后缀(合你的规约)。
# host executor 以 lo 运行:复用 .64 工具链 + lo 的 ssh key + git insteadOf/GOPRIVATE。
#
# 【安装】.64 上 /home/lo/ci/run-ci.sh 是指向本文件的**软链**(gitea workflow 里写的是那个路径):
#     ln -sfn hi-proto/ci/run-ci.sh /home/lo/ci/run-ci.sh
#   2026-08-16 之前这个文件只存在于 .64 的 home 里,没有版本控制 ——
#   收拾 ~/ci 的时候被当成散落副本扫进了 .attic/,**整条 CI 就此静默停摆**:
#   gitea 那边只是一个 job 失败,proto 照推照 merge,tag 却不再产出;
#   下游按 tag 引用,拉到的还是旧版本,编译全过 —— 三个 commit 没打 tag 才被发现。
#   所以它进仓不是"顺手整理",是**唯一入口不能只存在于一台机器的 home 里**。
set -e
# **互斥**:gitea runner 的自动触发与人手动执行会同时改同一份工作副本(~/ci/hi-proto、
# ~/ci/hi-proto-code)。踩过:rust 生成器是**扫描输出目录**决定注入哪些 .serde.rs include 的,
# 另一个进程正在重写时扫到空 → 聚合文件 hi_proto.rs 一条 serde include 都没有(v1.5.0-dev.95),
# 生成物看着齐全、实际所有 serde impl 都没被 include,下游 rust 全线编不过。
# 同一个 commit 出两个 tag(dev.93/dev.94)也是这么来的。一次只许跑一个。
exec 9>/tmp/hi-proto-ci.lock
flock -w 1800 9 || { echo "[ci] 另一轮 CI 正在跑,等锁超时" >&2; exit 1; }
export PATH=/home/lo/golang/go/bin:/home/lo/go/bin:/home/lo/.cargo/bin:/usr/local/bin:/usr/bin:/bin
CI=/home/lo/ci
GITEA=ssh://gitea@git.hi.lan
HP=$CI/hi-proto
CODE=$CI/hi-proto-code

BR="${GITHUB_REF_NAME:-$1}"
[ -z "$BR" ] && { echo "需要分支名(GITHUB_REF_NAME 或参数)"; exit 1; }
echo "[ci] branch=$BR"

# gitea SSH 偶发抖动(kex_exchange_identification),网络类 git 操作一律重试。
# 不重试的话:fetch 一失败整轮 CI 就废,而抖动几乎每天都有。
retry() {
  local n=0 max=5
  until "$@"; do
    n=$((n+1))
    [ $n -ge $max ] && { echo "[ci] 重试 $max 次仍失败: $*" >&2; return 1; }
    echo "[ci] 第 $n 次失败,$((n*3))s 后重试: $*" >&2
    sleep $((n*3))
  done
}

# 独立检出。
# $HP **不能在这里 clone** —— 本脚本自己就住在 $HP/ci/ 里,真缺了它根本轮不到这行执行。
# 换机器部署是人工一次性的事(clone hi-proto 到 ~/ci/hi-proto,再拉那根软链),
# 写个够不着的自举分支只会让人以为它能自愈。
[ -d "$HP/.git" ] || { echo "[ci] 缺 $HP —— 先 clone hi-proto 到这里,再把 ~/ci/run-ci.sh 软链到 $HP/ci/run-ci.sh" >&2; exit 1; }
[ -d "$CODE/.git" ] || git clone -q "$GITEA/HiWorld-56/hi-proto-code.git" "$CODE"

# hi-proto 对齐被推分支。
# 注:这一步会把**正在执行的这个脚本**改掉(它在 $HP/ci/ 里)。安全 ——
# git 更新文件是删了重建(换 inode),bash 手里的 fd 还指着旧 inode,读完的是旧内容;
# 危险的是就地截断改写(`> file`),git 不那么干。也就是说:本轮跑的是**上一版**脚本,
# 改动从下一轮起生效。
retry git -C "$HP" fetch -q --all --tags --prune
git -C "$HP" checkout -fq "$BR"
git -C "$HP" reset --hard -q "origin/$BR"
# hi-proto-code dev 干净对齐
retry git -C "$CODE" fetch -q --all --tags --prune
git -C "$CODE" checkout -fq dev
git -C "$CODE" reset --hard -q origin/dev

# 生成 + 推 hi-proto-code dev
( cd "$HP" && ./release.sh )

BASE=$(tr -d "[:space:]" < "$HP/VERSION")
[ -z "$BASE" ] && { echo "VERSION 为空"; exit 1; }

# 一次性拉全量远端 tag。**查询失败必须中止** —— 旧写法把"ls-remote 报错输出为空"
# 当成"该 tag 不存在",gitea 一抖动版本号就从 dev67 掉回 dev9,险些打出错误 tag。
list_tags() {
  local out
  if ! out=$(retry git -C "$1" ls-remote --tags origin 2>/dev/null); then
    echo "[ci] 致命:ls-remote 失败($(basename $1)),中止以免推算出错误版本号" >&2; exit 1
  fi
  printf '%s\n' "$out" | sed 's|.*refs/tags/||; s|\^{}$||' | sort -u
}
REMOTE_TAGS=""
tag_exists() { printf '%s\n' "$REMOTE_TAGS" | grep -qx "$2"; }
push_tag() {  # repo tag ref
  local repo=$1 tag=$2 ref=$3
  if tag_exists "$repo" "$tag"; then echo "  $tag 已存在于 $(basename $repo),跳过(不移动已发布 tag)"; return; fi
  git -C "$repo" tag -f "$tag" "$ref"
  # push 也要重试:gitea 抖动会让 code 推成功、hi-proto 推失败,两仓 tag 错位。
  ( unset HTTPS_PROXY HTTP_PROXY https_proxy http_proxy; retry git -C "$repo" push origin "$tag" )
  echo "  打 tag $tag @ $(basename $repo)"
}

if [ "$BR" = main ]; then
  TAG="v$BASE"
  REMOTE_TAGS=$(printf '%s\n%s\n' "$(list_tags "$CODE")" "$(list_tags "$HP")")
  echo "[ci] 正式发布 $TAG"
  # hi-proto-code:dev 合入 main 再打 tag
  git -C "$CODE" checkout -fq main
  git -C "$CODE" reset --hard -q origin/main
  if ! git -C "$CODE" merge -q --no-edit dev; then echo "hi-proto-code dev→main 冲突,人工处理"; exit 1; fi
  ( unset HTTPS_PROXY HTTP_PROXY https_proxy http_proxy; git -C "$CODE" push origin main )
  push_tag "$CODE" "$TAG" main
  push_tag "$HP"   "$TAG" "origin/main"
  echo "[ci] 正式版 $TAG 完成(hi-proto + hi-proto-code 同版本)"
else
  # 预发布:vBASE-dev.N,N 自增。
  #
  # ⚠️ **点号不能去掉**。semver 的预发布段按 `.` 切成标识符逐个比较:纯数字的按**数值**比,
  #    含字母的按 **ASCII** 比。写成 `dev102` 是一个含字母的标识符 → ASCII 比较 →
  #    `dev99 > dev102`('9' > '1'),版本号直接倒序。实测(golang.org/x/mod/semver):
  #        v1.4.0-dev99  >  v1.4.0-dev102     ← 真的倒过来了
  #    后果不是"不好看":go 的 MVS 选版本取**最大**,一个仓停在 dev99、另一个要 dev102,
  #    解出来的是 dev99,后者缺符号编译失败,而报错完全指不到真因。
  #    写成 `dev.102` 后 "102" 是纯数字标识符,数值比较,恢复单调。
  #
  # ⚠️ 换格式必须**同时提 minor**(1.4.0 → 1.5.0):在同一个 base 上换格式救不了 ——
  #    `v1.4.0-dev.103` 和零填充的 `v1.4.0-dev0103` 都**仍然小于** `v1.4.0-dev99`
  #    ('.' 和 '0' 的 ASCII 都小于 '9')。只有抬高 base 才能盖过整段旧序列。
  REMOTE_TAGS=$(printf '%s\n%s\n' "$(list_tags "$CODE")" "$(list_tags "$HP")")
  N=1
  while tag_exists x "v${BASE}-dev.${N}"; do N=$((N+1)); done
  TAG="v${BASE}-dev.${N}"
  echo "[ci] 预发布 $TAG"
  push_tag "$CODE" "$TAG" origin/dev
  push_tag "$HP"   "$TAG" "origin/$BR"
  echo "[ci] 预发布 $TAG 完成"
fi
echo "[ci] done."
