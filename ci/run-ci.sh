#!/bin/bash
# gitea Actions 编排:改 hi-proto → 自动重生成 hi-proto-code + 按分支打 tag。
#   push dev   → 重生成、推 hi-proto-code dev、两仓打 vX.Y.Z-devN(预发布,N 自增)
#   push main  → 重生成、hi-proto-code dev 合 main、两仓打 vX.Y.Z(正式,去 -dev)
# 版本基号取自 hi-proto 根目录 VERSION。分支决定 -dev 后缀(合你的规约)。
# host executor 以 lo 运行:复用 .64 工具链 + lo 的 ssh key + git insteadOf/GOPRIVATE。
#
# 【安装】.64 上 /home/lo/ci/run-ci.sh 是指向本文件的**软链**(gitea workflow 里写的是那个路径):
#     ln -sfn hi-proto/ci/run-ci.sh /home/lo/ci/run-ci.sh
#
#   2026-08-16 收拾 ~/ci 时,这个文件被当成散落副本扫进了 .attic/,**整条 CI 静默停摆**
#   (gitea 那边只是一个 job 失败;proto 照推照 merge,只是不再产 tag,
#    下游按 tag 引用拉到的还是旧版本、编译全过 —— 隔了三个 commit 才发现)。
#
#   ⚠️ 当时它**已经进仓了**,收在 `smoke/run-ci.sh`。所以病根不是"没版本控制",
#      是**进了仓却没接上**:软链只给 smoke/ 拉了一根,这个真正的入口漏了,
#      仓里那份从此只是个没人执行的副本。收进版本控制这件事,
#      **没把活的那一份换成软链就等于没做**;而且它压根不该躺在 smoke/ 下面
#      —— 它是 CI 编排,不是冒烟用例,放错目录本身就在暗示"这份是抄件"。
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

# ── 路径过滤:只有真正影响生成物的改动才**重生成**;**tag 照打** ────────────────
#
# ⭐ 2026-09-05 改口径。原来这条过滤是"跳过生成**与打 tag**",于是只改 smoke/ 那类提交
#    在 dev 上没有任何号 —— 而 CLAUDE.md 的规矩是「推了 dev 就必须打 tag,一次都不能省」,
#    理由是"没打 tag 的提交消费方根本够不着,等于没发布,而且没有任何报错"。
#    两者只能留一个,留规矩:**每一个 dev 提交都要有号**,而生成仍然按需。
#
# 那么"空 tag 训练出坏直觉"这条老问题怎么办(v1.5.0-dev.166/167/168 三个 tag 指向同一个
# 生成物 commit c2faf3e4,v1.5.1 / -dev.1 / -dev.2 又是同一个 563f7e58)——
# **靠判据,不靠不打号**:两仓同号,而 hi-proto-code 侧的两个号会指向**同一个 commit**,
# `git rev-list -n1 <tag>` 一比就知道"这个号不用跟"(deps.md「唯一的例外」那节就是这条)。
# 打号是廉价且可核对的;不打号是隐性的、且违反规矩。
#
# 参照点用**本分支上最近一个 CI 打的 tag**(每轮 CI 都会给 hi-proto 自己打一个),
# 它天然就是"上一次成功生成"的水位线;而且 tag 是整轮最后才推的,中途失败下一轮会重跑。
#
# ⚠️ main(正式发布)**不过滤** —— 发版必须出 tag,哪怕这一版 .proto 与上一个 dev tag 一模一样。
# ⚠️ VERSION **不在触发集里**:release.sh 压根不读它(基号只用来拼 tag 名;生成物里没有基号,
#    rust crate 的 version 是写死的 0.1.0)。所以推基号**不会触发重生成** ——
#    但按新口径它照样会出一个号(`vX.Y.(Z+1)-dev.1`,落在与上一号相同的生成物上)。
#    (2026-09-05 前这里写的是"推基号本身不产 tag,这是预期行为" —— 那条随着
#     "每个 dev 提交都要有号"一起作废了。)
GEN_PATHS=("*.proto" "codegen/" "http/" "buf.yaml" "buf.lock" "Makefile" "release.sh")
if [ "$BR" != main ]; then
  LAST_TAG=$(git -C "$HP" describe --tags --abbrev=0 --match "v[0-9]*" "origin/$BR" 2>/dev/null || true)
  if [ -z "$LAST_TAG" ]; then
    echo "[ci] 本分支上没有既有 tag,不过滤,照常生成"
  else
    ALL_CHANGED=$(git -C "$HP" diff --name-only "$LAST_TAG" "origin/$BR")
    GEN_CHANGED=$(git -C "$HP" diff --name-only "$LAST_TAG" "origin/$BR" -- "${GEN_PATHS[@]}")
    if [ -z "$GEN_CHANGED" ]; then
      # 只跳**生成**,不跳打号。生成物与上一个号完全一致,所以 hi-proto-code 那边
      # 新号会落在同一个 commit 上 —— 那正是下游"这个号不用跟"的凭据。
      SKIP_GEN=1
      echo "[ci] 自 $LAST_TAG 起没有影响生成物的改动 → **只打号,不重生成**。"
      echo "[ci] 本次变动的文件(全部不在触发集里):"
      printf "      %s
" $ALL_CHANGED
    else
      echo "[ci] 自 $LAST_TAG 起,影响生成物的改动:"
      printf "      %s
" $GEN_CHANGED
    fi
  fi
fi

# 生成 + 推 hi-proto-code dev。**只打号那一档跳过这一步** ——
# 生成物没变,重跑 release.sh 只会产生一个空 commit 或者什么都不产生,
# 而它要花的是整轮里最长的那段时间。
if [ "${SKIP_GEN:-0}" = 1 ]; then
  echo "[ci] 跳过生成(生成物与上一个号一致)"
else
  ( cd "$HP" && ./release.sh )
fi

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
# 两仓的 tag 分开存。合并列表只给 dev 段推算 N 用(两仓共用同一个 N,那是有意的);
# **存在性判断必须按仓** —— 旧写法 `tag_exists()` 收了 repo 参数却不用,一律 grep 合并列表。
# 2026-08-21 被这条咬过一次:发 v1.5.8 时人手先给 hi-proto 打了 tag(本该全交给 CI),
# 合并列表里于是有了 v1.5.8 → 轮到 hi-proto-code 时判定"已存在,跳过",
# **hi-proto-code 根本没打上 v1.5.8**。而且没有任何报错:CI 绿、main 也推上去了,
# 只是下游按 tag 引用够不着那一版 —— 正是 CLAUDE.md 里说的"等于没发布,且不报错"。
REMOTE_TAGS=""
CODE_TAGS=""
HP_TAGS=""
load_tags() {   # 一次性拉两仓的 tag:分开存 + 合并一份
  CODE_TAGS=$(list_tags "$CODE")
  HP_TAGS=$(list_tags "$HP")
  REMOTE_TAGS=$(printf '%s\n%s\n' "$CODE_TAGS" "$HP_TAGS")
}
tag_exists() {  # repo tag —— 只看**这个仓**自己的 tag(打 tag 前的存在性判断用这个)
  case "$1" in
    "$CODE") printf '%s\n' "$CODE_TAGS" ;;
    *)       printf '%s\n' "$HP_TAGS" ;;
  esac | grep -qx "$2"
}
# tag —— 两仓**任一**有就算占用。dev 段推算 N 专用:两仓共用同一个 N 是有意的,
# 一边跳号另一边不跳,两仓的 devN 就会错位。别把它和上面那个混用。
tag_exists_any() { printf '%s\n' "$REMOTE_TAGS" | grep -qx "$1"; }
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
  load_tags
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
  load_tags
  # ⚠️ **N = 已用过的最大号 + 1,不是"第一个没被占的号"。**
  #
  # 旧写法是 `N=1; while tag_exists_any …; do N++; done` —— 它找的是**最小空号**,
  # 于是号段里一旦出现空洞(某个号被删掉、或某轮 CI 推了一半),下一次 CI 就会
  # **把新代码打成一个更小的号**,版本序当场倒过来:
  #
  #   2026-09-05 实测:v1.5.12 段已有 dev.1 / dev.3 / dev.5(dev.2、dev.4 是空洞),
  #   新提交 10f7ff0 拿到的号是 **dev.2** —— 最新的代码在 semver 里排在
  #   dev.3 / dev.5 **前面**。后果与上面那条"点号"注释里说的完全一样:
  #   go 的 MVS 取最大,解出来的是 dev.5(旧代码),缺符号编译失败或者静默跑旧码;
  #   人去看"最新 tag"也会拿错。
  #
  # 空洞本身不一定是 bug(删过 tag、CI 中途失败都会留洞),所以**判据不是"补洞"**,
  # 而是"新号必须比所有旧号大"。补洞是舍本逐末,单调才是要的东西。
  MAXN=0
  # BASE 里的点要转义,否则 `1.5.12` 里的 `.` 在正则里是"任意字符"。
  for _t in $(printf '%s\n' "$REMOTE_TAGS" | grep -E "^v${BASE//./\\.}-dev\.[0-9]+$" || true); do
    _n=${_t##*-dev.}
    if [ "$_n" -gt "$MAXN" ] 2>/dev/null; then MAXN=$_n; fi
  done
  N=$((MAXN + 1))
  # 兜一层:两轮 CI 撞在一起时(脚本开头那把锁失效的极端情况)别覆盖已存在的号。
  while tag_exists_any "v${BASE}-dev.${N}"; do N=$((N+1)); done
  TAG="v${BASE}-dev.${N}"
  echo "[ci] 预发布 $TAG"
  push_tag "$CODE" "$TAG" origin/dev
  push_tag "$HP"   "$TAG" "origin/$BR"
  echo "[ci] 预发布 $TAG 完成"
fi
echo "[ci] done."
