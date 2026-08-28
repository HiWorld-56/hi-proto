# Overview
@.claude/overview.md

## 协作原则

**分析出问题，要解决问题本身，不要绕开，不要补丁。**

## ⛔ 不许出现 `reserved`

**本仓一处 `reserved` 都不能有。不要的字段/枚举值直接删,不留空号、不留旧名。**

`reserved` 是为**向后兼容**服务的:它把作废的字段号/名钉死,免得后来者重用同一个号,
而某个还在跑的旧二进制按旧含义解析——类型恰好兼容时不报错,只是静默地把 A 当成 B。

**我们不做向后兼容**(见「激进开发」:开发期不是维护期)。契约一改,下游**当天**全部
重钉同一个 tag 重新生成——旧号根本没有存活的窗口。留着 `reserved` 只有坏处:

- 它是**噪音**:攒到十几行时比正常字段还多,读契约的人要先跳过一堆墓碑;
- 它**误导**:让人以为这仓在做兼容,于是下一个人也不敢删,只会继续加;
- 它**替代不了说明**:真正该留下的是"为什么没有这个字段"(见下),而不是一个空号。

**要留的是理由,不是号。** 删字段时把"⚠️ 没有 X,不要再加回来 + 为什么"写进注释,
例如 `CreateShellReq` 里为什么没有 `runtime`、`CreateListingReq` 里为什么没有
`allow_follow_latest`。号空出来无所谓,含义说清楚才有用。

> 2026-08-19 清掉了全部 19 处。当时我以为**枚举值号**要留一处,理由是
> "`hi_club_market_order.status` 存的就是这个整数,放开号会让库里存量行悄悄换含义"。
> **去查了才知道这个理由不成立**:开发库只有 status 0 和 1,生产库表是空的,
> 而 `MarketOrderExpired = 2` 这个常量全仓除了自己的声明**没有任何地方用过**——
> 没有任何一行数据、没有任何一条代码路径会写 2。
> **别拿"可能有存量"当理由,先去库里数一下。**

## ⛔ 禁止用空字符串(零值)表示 null

**所有标量字段一律加 `optional`。** 2026-08-28 全仓铺平,794 个字段。

judgement 不是"这个字段缺席合不合法",而是 protobuf 官方口径 ——
> We recommend always adding the `optional` label for proto3 basic types.

### 为什么

不加 presence 时,默认值是三种情况混在一起(官方原话):
> The default value may mean: **the field was explicitly set to its default value, which is valid in
> the application-specific domain of values**; the field was notionally "cleared" by setting its
> default; or the field was never set.

更要命的是,**二进制线路上"传空串"根本不上线**:
> if the field is set to the default (zero) value. **It will not be serialized to the wire.**

所以走二进制 gRPC 的客户端(Go/Rust/Dart),把 `name` 设成 `""` 和根本不设是同一串字节 ——
**协议层面压根没有"清空"这个能力**,后端那行 `!= ""` 删了也没用。

我们自己踩到的三处(全在注释里留着):
1. `backend-hi-ai/internal/repo/agent_repo.go:73` —— 为一个 bool(`use_mem=false` 被 gorm 当零值跳过)
   单开一条 map 更新,同 struct 里所有 string 还在被静默跳。
2. `backend-hi-did/internal/repo/merchant_repo.go:60` —— 为 SetServer 单开一个"无条件写"的方法,
   绕开通用 Update 的"空串跳过"。
3. `hi/ai/chat.proto` 的 `master`(没主人)与 `asker`(匿名)两个"没有"都是空串 ——
   `asker == master` 在皆空时**成立**,匿名提问会被判成"主人在问"。

### 三态语义(ProtoJSON 规范)

| 客户端发 | 服务端 | 请求语义 | 响应语义 |
|---|---|---|---|
| 不带这个键 | `has=false` | **不动** | 这个字段没有值 |
| `"name": null` | `has=false`(**与不带键完全等价**) | **不动** | —— |
| `"name": ""` | `has=true`,值 `""` | **清空** | 值就是空串 |
| `"name": "阿明"` | `has=true` | 设成阿明 | 值是阿明 |

> Parsers accept `null` as a legal value for any field … The field should remain unset, as though it
> was not present in the input at all.

所以规则只有一条:**没有 presence 的字段不更新。**

### 例外(只有三类)

- **entity 里的身份 did**(`did` / `*_did`,32 处)。did 是常驻字段,没有 did 其他字段没有意义。
  ⚠️ **当过滤器/可选参数用的 did 要加**(`ListOnlineReq.owner_did`、
  `hi.ai.PermissionListReq.did`、`hi.ai.MerchantListReq.did` 已加)。
- **`oneof` 成员**(2 处 `bytes chunk`)。proto3 语法不允许,而且 oneof 本来就有 presence。
- **`repeated`**(110 处)。空列表天然就是"没有",不存在"设成空列表 vs 不动"的歧义。

### 配套硬规则

- **必填字段也加 `optional`**,但要同时补 `(buf.validate.field).required = true` ——
  否则 optional 之后"字段缺席"会**跳过校验**,是静默削弱。
  只对隐含非空的规则补(pattern / min_len / gt / cel);`max_len` 这类上界不补。
- **注释一律写"不传=xxx",不许写"空=xxx"。** 2026-08-28 已把全仓 47 处改过来。
- **不用 `update_mask`**(`google.protobuf.FieldMask`)。路径是字符串、编译期零检查 ——
  proto 改字段名不会报错,正是 `return_context`→`echo_context` 栽过两次的那个坑;
  而且 proto 写 `config.mem_model`、JSON 要写 `config.memModel`,我们有四个手写 JSON 的 web。
  **presence 本身就是最省的 update_mask**:客户端设了哪个字段,服务端就知道动了哪个。
- **不比新旧值**。见 `backend-hi-club/internal/service/group.go` 的 `updateGroupFields` 注释:
  比值会让"重传同一张图"被判成没动,既不写库也不发通知。**设了就设,设了就发。**

## 结构化数据传输原则

**payload 是数据的唯一来源，传输层 metadata 不是。**

- MQTT topic、HTTP 路由、ZMQ identity 等传输层字段只用于路由，不得作为业务数据来源。
- 任何业务所需的数据（id、名称、头像、状态……）必须在 protobuf payload 中显式定义并传递。
- 典型反例：从 MQTT topic `hiclub/v1/group/<群Id>` 切片拼出 `group_did`，然后向下传参。正确做法是在对应通知的 `extra` 里携带完整的结构体（如 `GroupBase`），接收方从 payload 解析。
- 这一原则保证：换传输层、改 topic 格式时，业务逻辑零改动；同时接收方始终拥有足够的上下文（名称、头像等），无需二次查询。

**extra 字段类型注解必须带完整包路径。**

- 注释中写 `/ hi.club.GroupBase`，不写 `/ GroupBase`，避免跨包同名歧义。
- primitive 类型（string、int 等）无法直接存入 `google.protobuf.Any`，需包装：string → `google.protobuf.StringValue`。
