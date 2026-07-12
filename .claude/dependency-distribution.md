# hi-proto 多语言依赖分发方案

> 设计记录。目的:把"各消费方 submodule + 本地生成"改成"CI 集中生成 + 各语言包管理器按版本依赖"。

## 背景 / 问题

hi-proto 是全生态(backend Go、app Dart、hinj_brain / hiclub-core-mqtt Rust、Python 等)共享的 proto 源。当前分发方式:各消费方把 hi-proto 作为 **git submodule**,构建时本地跑 buf/protoc 生成代码。三个痛点:

1. **每台开发机都要装工具链**(buf、protoc、各 plugin、yq)。
2. **版本静默漂移**:各消费方 submodule 指针独立,hi-proto 更新后容易"某个项目忘了 bump 指针",编译照过、但字节层面不一致、不报错。
3. **Rust 侧 `reencode` 恶果**:hiclub-core-mqtt 与 hinj_brain **各自** build.rs 生成一份 Rust 类型(两个不同 crate,仅字节兼容),边界要 encode→decode 来回转(见 `core_adapter.rs` / `account.rs` 的 `reencode`),靠"两边同版本"口头约定兜底,一旦漂移就静默错位。

## 决策

把**生成好的各语言代码**发布到**一个 artifact 仓 `hi-proto-code`**;消费方改用**各语言包管理器按版本依赖**,不再 submodule、不再本地生成。生成由 **CI 机在 hi-proto 变更时完成**。

排除的备选:
- **各语言私有 registry**(cargo registry / Go proxy / pub server):多平台发布基建太重 —— 否。
- **每语言一个独立 artifact 仓**:仓库太多 —— 否。
- 最终:**单一 `hi-proto-code` 仓 + 子目录**。

代码进各语言**全局缓存**(`~/.cargo`、`~/go/pkg/mod`、`~/.pub-cache`),**不进业务仓**;业务仓只有一行依赖声明。生成代码只在 `hi-proto-code` 这一个 artifact 仓提交一份(源码型 module 系统无二进制仓库,源码总得有个能拉的地方),由 CI 产出,不散落、不手动。

## hi-proto-code 仓布局(纯三目录,各自自包含)

```
hi-proto-code/
  go/     go.mod(module git.hi.lan/HiWorld-56/hi-proto-code/go)+ go.sum + hi/**.pb.go(grpc+gateway)
  rust/   Cargo.toml(package "hi-proto")+ src/lib.rs + src/gen/**(prost/tonic/pbjson 预生成,消费方无需 protoc)
  dart/   pubspec.yaml + lib/**(protobuf+grpc)
```

**布局原则**:仓根不放任何散件,每种语言的工程配置都收进自己目录,避免 root 混杂/冲突。
- Rust:crate 在 `rust/` 子目录,**无需 root workspace**——`{ git, package = "hi-proto" }` cargo 能按包名找到(已验证)。
- Go:`go/` 是子目录 module,导入路径 `git.hi.lan/HiWorld-56/hi-proto-code/go`;**发版 tag 要带前缀 `go/vX.Y.Z`**(Go 多 module 仓规矩)。
- Dart:`{ path: dart }` 原生支持。

**tag 约定**:发版打**两个** tag —— `vX.Y.Z`(rust/dart)+ `go/vX.Y.Z`(go 子目录 module)。release.sh 自动打两个。

## 依赖写法

| 语言 | 开发期(跟 dev 分支) | 发版(pin tag) |
|---|---|---|
| Rust | `hi-proto = { git = "ssh://gitea@git.hi.lan/HiWorld-56/hi-proto-code.git", branch = "dev", package = "hi-proto" }` | `tag = "vX.Y.Z"` |
| Go | `go get .../hi-proto-code/go@dev` | `.../hi-proto-code/go@vX.Y.Z`(解析 go/vX.Y.Z tag) |
| Dart | `hi_proto: { git: { url: ..., ref: dev, path: dart } }` | `ref: vX.Y.Z` |

Rust 没有"git 子路径"语法,靠 `package = "hi-proto"` 按包名在仓里找到 rust crate(效果等价"指路径")。

## CI / 分支流(dev 集成、main 发版)

CI 机 = **dev(.64)**,工作路径 `/home/lo/wip/`(与其他项目并列)。

| 场景 | hi-proto 侧动作 | CI 动作 |
|---|---|---|
| 小改动 | push | 重生成 → 推 `hi-proto-code` 的 **dev 分支** |
| 发版 | 打 tag `vX.Y.Z` | 重生成 → 推 **dev** →(fast-forward)merge dev→**main** → 在 main 打同名 tag |

规则:**CI 永远只往 dev 生成推;main 从不被直接推,只由 dev merge 前进**。保证 dev ⊇ main、永不分叉、merge 基本 fast-forward 无冲突;tag 落在 main、发版点清晰。

**起步先用 .64 上的手动脚本** `release.sh` —— 发版/需要时人跑一次,三语言**一起生成一起推**(要么全出、要么全不出,杜绝"改了 proto 只生成了 go 忘了 dart");跑顺后再把同一脚本挂到 **Gitea Actions**(runner 就用 .64),push→自动推 dev、tag→自动 merge main 打 tag,变全自动。两档共用一个生成脚本,升级无成本。

## 关键新增:Rust 生成进 buf 流水线

现状 hi-proto 的 buf 流水线有 go / go-http / dart / python,**没有 rust** —— Rust 目前是消费方 build.rs 里跑 `buf export` + prost/tonic-build 各自生成(所以要 buf+protoc)。

改造需**新增 `codegen/rust.yaml`**(buf 的 `community/neoeinstein-prost` + `community/neoeinstein-tonic` plugin),CI 里生成 `.rs` 提交进 `hi-proto-code/rust/`,消费方 crate **直接 `include!` 预生成产物、不再需要 protoc / build.rs 生成**。

## 消费方迁移

1. 删各消费方的 `deps/hi-proto` submodule + build.rs 里的 buf/prost 生成逻辑。
2. 依赖改到 `hi-proto-code`(上表写法)。
3. **Rust 大红利**:core、brain 都依赖同一个 `hi-proto` crate,Cargo 版本统一(整棵树一份)→ `Message` 等是**同一个类型** → **删掉 `core_adapter.rs` / `account.rs` / `chat/notice.rs` 里的 `reencode` 层**,边界直接用类型。
4. Go 侧删 `replace github.com/HiWorld-56/hi-proto => ./deps/hi-proto`,正常 `require hi-proto-code`。

## 落地步骤(checklist)

- [x] 本文档入库(hi-proto)
- [ ] hi-proto 新增 `codegen/rust.yaml`(buf neoeinstein-prost/tonic)
- [ ] 建 `hi-proto-code` 仓(gitea)+ 根骨架(go.mod / Cargo.toml workspace / rust/ / dart/)
- [ ] .64 写 `release.sh`:buf 生成 go-http/rust/dart → 落 hi-proto-code 各目录 → 推 dev(发版再 merge main + 打 tag)
- [ ] 首次生成 + 推 dev,打首个 tag
- [ ] 切 hiclub-core-mqtt → hi-proto-code(验证编译)
- [ ] 切 hinj_brain → hi-proto-code **+ 删 reencode**(验证登录 / 群 @bot)
- [ ] 切 backend-hi-club / backend-hi-wallet(Go)→ 删 replace
- [ ] app(Dart)切依赖
- [ ] (可选)脚本挂 Gitea Actions 全自动

## 备注

- 单仓装三语言的唯一小代价:每个包管理器拉依赖时会把**整个仓(含另两语言目录)**拉进它自己的全局缓存(如 cargo 会把 go/ dart/ 也 clone 到缓存但只编 rust crate)—— 仅缓存冗余、一次性、可忽略;业务仓仍是干净的一行依赖。用"仓库数量少"换"一点缓存冗余",划算。
- 版本升级仍是消费方**主动决策**(改 branch/tag),这是特性不是缺陷:比 submodule"看着都拉了其实一新一旧"的静默漂移强 —— 显式、可 review、可 CI 卡一致性。

## Go:保持 import 不变(replace 重定向)

Go 里模块路径=类型身份,不能像 Rust 那样解耦。但用 `replace` 可**重定向拉取位置、消费方 import 零改动**:

- **hi-proto-code/go**(布局仍干净 `go/hi/...`,无嵌套):
  - `go_package_prefix = github.com/HiWorld-56/hi-proto/gen/go`(内部 import 也用 github,全场一个名 → 不会 two-paths)
  - `go.mod`: `module git.hi.lan/HiWorld-56/hi-proto-code/go` + 自 replace `github.com/HiWorld-56/hi-proto/gen/go => ./`(让它能独立编译)
- **消费方 go.mod**(import 一个字不动):
  ```
  require github.com/HiWorld-56/hi-proto/gen/go vX
  replace github.com/HiWorld-56/hi-proto/gen/go => git.hi.lan/HiWorld-56/hi-proto-code/go vY
  ```
  + `GOPRIVATE=git.hi.lan` + `git config url."ssh://gitea@git.hi.lan/".insteadOf "https://git.hi.lan/"`
- **第三方**(用 github 路径、走 gRPC)不受影响。
