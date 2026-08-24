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
echo "[0/6] 校验 hi.auth 标注"
python3 "$HIPROTO/codegen/check_auth.py"

# 请求/响应命名坏味道(纯 proto 侧,硬拦):All 冗余段、裸 Manage/Admin 前缀。
# 与 check_auth 一样不依赖消费方,可在生成前直接拒。
python3 "$HIPROTO/codegen/check_naming.py"

# 消费方版本一致性。**开发阶段字段号随便改、不做向后兼容**,前提是全仓 lockstep 升级。
# 这条前提一破就是编译期查不出的线上故障:GetUserReq 挪了字段号而 hi-ai 停在旧版,
# 它按老编号编码、hi-did 按新编号解析 → 收到空值,所有仓编译全过、CreateAssistant
# 整条链路却挂掉,报错还是 validate 的 "pattern 不匹配",完全指不到真因。
# 只报不拦:发布 proto 的当下各仓本来就还没升,拦了会卡死每次发布。
python3 "$HIPROTO/codegen/check_lockstep.py" --warn /home/lo/wip/backend-hi-* || true

# 实现覆盖:proto 声明的 rpc 后端有没有对应 handler。
# Go 的 Unimplemented<Svc>Server 会兜底,所以「proto 改了名、handler 没跟」编译期一声不吭,
# 服务注册着、方法接不上,运行时静默返 Unimplemented(真踩过三次)。
# **只报不拦** —— 正常工作流是先改 proto 再跟后端,硬失败会卡死每次改名的第一次推送。
python3 "$HIPROTO/codegen/check_impl.py" /home/lo/wip --warn || true

# web 工程:路由 + **字段名**核对。
# 它们是仅有的手写 HTTP 客户端消费方(Go/Rust/Dart 都是生成的),于是 proto 一改名,
# 别人编译期就炸、它们却只是请求照发、字段静默变空 —— 这一类**探测路由发现不了**。
# 只报不拦,理由同 check_impl;而且字段那半用的是正则,宁可漏报也不要误拦
# (一个会误拦的检查,第一次误拦之后就会被人绕过去)。
#
# ⚠️ 原来只查 hiclub-web。2026-08-17 审出来:hidid-web 与 hiai-web 各自漂了一大截
#    (对话流式整条打不通、三个页面无后端),**因为从来没进过这个循环**。
#    checker 会按目录名自己判断连的是哪个服务(见 check_web_routes.py 开头那段说明)。
#    仓没检出就跳过 —— CI 机器上缺哪个都不该让发布失败。
for w in hiclub-web hidid-web hiai-web; do
    if [ -d "/home/lo/ci/$w/src" ]; then
        python3 "$HIPROTO/codegen/check_web_routes.py" "/home/lo/ci/$w" --warn || true
    else
        echo "[check_web] /home/lo/ci/$w 未检出,跳过(**没查过,不等于没问题**)"
    fi
done

# 接口清单随发布重生成 —— 上一版是手写的,内容停在重构前(档位名/rpc 数/方法名全过时),
# 当成当前清单会被误导。生成物入库,便于 review 时直接看接口面变化。
python3 "$HIPROTO/codegen/gen_api_surface.py"

echo "[1/6] 合并 HTTP 配置"
( cd "$HIPROTO" && make merge >/dev/null )

echo "[2/6] go-http → $CODE"
( cd "$HIPROTO"; unset HTTPS_PROXY HTTP_PROXY https_proxy http_proxy
  rm -rf "$CODE/go/hi" "$CODE/go/google" "$CODE/go/buf"; buf generate --template codegen/go_http_code.yaml )

# 字段名字符串核对:handler 里 validate.ValidateNotNil(req, []string{"X"}) 这类
# **用字符串引用 proto 字段名**的地方,X 一旦随 proto 改名/删除就静默失效 ——
# ValidateNotNil 走 reflect.FieldByName,「字段不存在」与「字段为 nil」是同一分支,
# 于是接口永远返回 "field X is required",编译期毫无提示。
# hi.club/hi.ai 的 Agent.Edit 就这么坏了(校验早已删除的 Base 字段),谁都调不通,
# 直到写业务路径冒烟才发现。
#
# ⚠️ 必须放在 [2/6] **之后** —— 要用刚生成的 pb.go 校验,回答"我这次改 proto 会让
#    哪个后端失效"。若按各仓 go.mod 锁定的旧版本校验,只能说明后端与自己当前依赖
#    自洽,对刚改的这版 proto 一无所知,等于白跑。
#
# **只报不拦**(同 check_impl):正常工作流是先改 proto 再跟后端。
python3 "$HIPROTO/codegen/check_validate.py" --pb-from "$CODE/go" --warn /home/lo/wip/backend-hi-* || true

# 网关注册核对:路由链路有**两段**,断哪一段都是 404,且两段的失败长得一模一样 ——
#   ① proto 侧 http/*.yaml 配 selector      → check_auth 覆盖
#   ② Go 侧 RegisterXxxHandlerFromEndpoint  → 本检查覆盖
# hi.club.Merchant 就是断在②:grpc 注册了、路由也配了,唯独网关没注册,
# 于是 /api/v1/merchant/* 全部 code 5,而 grpcurl 直连完全正常,真因极难定位。
python3 "$HIPROTO/codegen/check_gateway.py" --warn /home/lo/wip/backend-hi-* || true

# 流式白名单(streamApi)是否跟上 proto 的 server-streaming 路由。硬编码字符串列表,
# 改名时无类型引用可依靠 —— complete_stream 就这么漏过、流式端点静默变空。
python3 "$HIPROTO/codegen/check_stream.py" --warn /home/lo/wip/backend-hi-* || true

# Any 载荷可见性:装进 google.protobuf.Any 的类型,其 audience 不得比宿主字段更严。
# **Any 是可见性 lint 唯一的结构性缺口** —— 装进去的真实类型 check_auth 看不见,
# 于是 level(field.visibility) <= level(message.audience) 这条规则在那里失效。
# 实例:Notice.extra(PARTICIPANT)曾装 PluginView(SELF,含私有 bucket 脚本地址)。
python3 "$HIPROTO/codegen/check_any.py" --warn /home/lo/wip/backend-hi-* || true

# 各后端死代码(不可达函数)。6 个后端已全清到 0,从干净起步,新增即显形。
# **只报不拦**:deadcode 保守看不到反射,重构中途也会短暂出现不可达 —— 硬失败会卡开发。
python3 "$HIPROTO/codegen/check_deadcode.py" --warn /home/lo/wip/backend-hi-* || true

echo "[3/6] rust → $CODE/rust/src/gen"
( cd "$HIPROTO/codegen/rust-gen"
  export HTTPS_PROXY=$PROXY HTTP_PROXY=$PROXY          # cargo 走梯子;rust-gen 内部会为 buf 剥离代理
  cargo run --quiet -- "$HIPROTO" "$CODE/rust/src/gen" )

echo "[4/6] dart → $CODE/dart/lib"
( cd "$HIPROTO"; unset HTTPS_PROXY HTTP_PROXY https_proxy http_proxy
  rm -rf "$CODE/dart/lib/hi" "$CODE/dart/lib/google" "$CODE/dart/lib/buf"
  buf generate --template codegen/dart_code.yaml )

echo "[5/6] python → $CODE/python"
# 谁在用:**三方插件作者的本地调试**。插件里的 plugin_builtin.call 一律走 grpc + protobuf,
# 本地也必须走同一套 —— 不给生成物、让作者自己拼 JSON,就是把"多端一致"这个前提破掉。
( cd "$HIPROTO"; unset HTTPS_PROXY HTTP_PROXY https_proxy http_proxy
  rm -rf "$CODE/python/hi" "$CODE/python/google" "$CODE/python/buf"
  buf generate --template codegen/python_code.yaml )

echo "[6/6] lua descriptor → $CODE/lua/hi.pb"
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
