# AIP-132 List 方法正名(破坏性大改版)

## 规则
Google API Design Guide **AIP-132**:
> 方法名必须以 `List` 开头,其余部分是**资源名的复数形式**。
> 过滤条件用 **参数(filter/parent)** 表达,**不编码进方法名**。

推论:`Get` 返回一个 → 单数(`GetBook`);`List` 返回多个 → 复数(`ListBooks`);
`ListXByY` 是反模式 → `ListXs(filter: y)`;光秃 `List` 缺资源名 → 补上。

## 范围
**63 个 `List*` rpc**,分布:`hi/ai` 15 / `hi/club` 31 / `hi/did` 14 / `hi/media` 3。
其中 **club 有 18 个是 ai/did 的门面镜像**(返回 `hi.ai.*` / `hi.did.*` 类型)→ 改名必须两边同步。

**已合规(8,不动)**:`ListSuperAdminUsers`(ai/club/did/media base)、`ListCoins`(club/did base)、
`Wallet.ListAddresses`、`Wallet.ListUsersAssets`(⚠️ 见"待定")。

## 一、纯复数化(机械改名)

| 包 | service.rpc | → |
|---|---|---|
| ai, club | `Agent.ListEmbedding` | `ListEmbeddings` |
| ai, club | `Agent.ListFavoriteAgent` | `ListFavoriteAgents` |
| ai | `Agent.ListAgent` | `ListAgents` |
| ai | `Chat.ListAgentDelay` | `ListAgentDelays` |
| ai, club | `Training.ListAgentFile` | `ListAgentFiles` |
| club | `Group.ListMember` | `ListMembers` |
| club | `Group.ListQ3GroupMember` | `ListQ3GroupMembers` |
| club | `Group.ListMessage` | `ListMessages` |
| club | `User.ListSystemMessage` | `ListSystemMessages` |
| club | `User.ListFriend` | `ListFriends` |
| club | `User.ListServitor` | `ListServitors` |
| club | `User.ListRelation` | `ListRelations` |
| club | `User.ListGroup` | `ListGroups` |
| club | `User.ListOnlineUser` | `ListOnlineUsers` |
| ai, club | `UserACL.ListType` | `ListUserAclTypes` |

## 二、光秃 `List` → 补资源名(取自 service)

| 包 | service.rpc | → |
|---|---|---|
| ai, club, did | `ApiKey.List` | `ListApiKeys` |
| ai, did, media | `InviteCode.List` | `ListInviteCodes` |
| ai, club | `Plugin.List` | `ListPlugins` |
| ai, club | `UserACL.List` | `ListUserAcls` |
| club, did | `GatewayConfig.List` | `ListGatewayConfigs` |
| did | `MerchantManage.List` | `ListMerchants` |
| media | `User.List` | `ListUsers` |

## 三、撞名合并 / `ListXByY` 消除(**真正的重设计**)

AIP-132:同一资源**只应有一个 List 方法**,差异走 filter/parent 参数。

| 现状(多个) | 合并为 | filter 字段 |
|---|---|---|
| `club.Agent.ListOnlineAgent`(hi.DID) + `ListAllOnlineAgent`(Pagination) | `ListOnlineAgents` | `owner_did`(空=全部)+ pagination |
| `club.Trade.ListTrade` + `ListAllTrade` | `ListTrades` | `scope`/`owner`(空=全部) |
| `club.Merchant.List`(Empty=我的) + `ListAll`(Pagination) | `ListMerchants` | `mine`(bool)或 `member_did` |
| `did.AgentMarket.List` + `ListByClass` | `ListAgents` | `class`(空=全部) |
| `club.AgentMarket.ListByClass` | `ListAgents` | `class` |
| `ai/club.Agent.ListAgentByDids` | `ListAgents` | `dids[]`(空=全部)|
| `did.UserExtension.List` + `ListByMerchantDid`;`club.UserExtension.ListByMerchantDid` | `ListUserExtensions` | `merchant_did` |
| `did.DApp.ListByClass` | `ListDApps` | `class` |
| `did.Merchant.List`(hi.DID) | `ListMerchants` | `member_did` |

> ⚠️ 合并会改 **Req 消息结构**(不只是方法名),后端 handler 要合并两套逻辑。

## 四、待定(需拍板)

1. **缩写复数**:`ListLLM`/`ListSTT`/`ListTTS` → `ListLLMs`/`ListSTTs`/`ListTTSs`?
   `ListTTSs` 很丑。建议改成 **`ListLlmModels` / `ListSttModels` / `ListTtsModels`**(资源是"模型")。
2. **`Wallet.ListUsersAssets`**:资源是 Assets,`Users` 是过滤条件 → 严格 AIP 应为 `ListAssets(filter: user_dids)`。要不要一并?
3. **`Group.ListMember`** → `ListMembers` 还是 `ListGroupMembers`?(service 已是 Group,AIP 倾向 `ListMembers`)

## 五、爆炸半径(**wire 级破坏**)
rpc 改名 = gRPC 方法路径变 → **所有未同步的客户端 UNIMPLEMENTED**。

- **后端(8)**:backend-hi-club / -did / -ai / -ai-plugin / -club-trade / -club-transaction / -media / -source
- **Rust 客户端**:hiclub-core-mqtt、hinj-brain
- **前端(同事维护)**:hiclub-app、hidid-app、hiclub-web、hiai-web、hidid-web、hidid-browser-web、hidid-windows
- **其它**:hi-grpc-client-python
- **三方**:hi-prj.md 明载三方按正式 proto 对接 → **会被打断**,需提前通告

## 六、落地顺序

### 版本决策:走 **1.4.0**,不进 2.0.0(⚠️ 踩过坑,别再提议)
按 semver,wire 破坏本该进主版本。**但 Go 的语义导入版本(SIV)是硬规则**:
主版本 ≥2 时模块路径必须带 `/v2` 后缀,否则 `go mod` 直接拒绝:
```
require github.com/HiWorld-56/hi-proto: version "v2.0.0-dev1"
        invalid: should be v0 or v1, not v2
```
进 2.0.0 就意味着 hi-proto-code 的 `go.mod` 要改 `module .../hi-proto/v2`,
且 **8 个后端每一行 import 都要加 `/v2`**(Rust/Dart 无此约束,只有 Go 有)。

**结论:这次是"命名本来就错了"的整改,不是 API 增删**——破坏该破坏,但不值得为
一次改名把整个 Go 生态拖进 `/v2` 迁移。故 **VERSION 1.3.1 → 1.4.0**,wire 破坏
落在 minor 里,消费方按 `-devN` 灰度对齐。

> 曾误打 `v2.0.0-dev1`(两仓),因 Go 拿不到、且按版本序会永远是"最新"而毒化
> `@latest` 解析,已删除。

1. `VERSION` **1.3.1 → 1.4.0**
2. hi-proto 改完 → CI 出 `v1.4.0-devN` → 内部消费方按 devN 灰度
3. 顺序:proto → 8 个后端 handler → Rust(core → brain)→ 前端(同事)→ 通告三方
4. **后端与客户端必须同版本同时上**(方法路径变,无法灰度共存);
   若要平滑,可**新旧方法并存一个版本**(旧的标 `deprecated`),下个大版本再删——推荐走这条,避免一刀切停服。

## 七、⚠️ 已纠正的两个错误前提(别再按错的干)

### 1. 方法名是 **service 作用域**,不是 package 作用域 → 光秃 `List` 才对
AIP-132 的"List+资源复数"假设 **service = 领域**(`Library.ListBooks`)。
我们的 **service 本身就是资源**,此时补资源名 = **自我重复(stutter)**:
- ❌ `ApiKey.ListApiKeys` / `Plugin.ListPlugins` / `User.ListUsers` / `Agent.ListAgents`
- ✅ `ApiKey.List` / `Plugin.List` / `Agent.List`
- ✅ `Group.ListMembers` / `User.ListFriends`(service≠资源,才需要资源名)

**推论:`ApiKey.Edit` 本来就是对的**,原计划"116 处补方法名(`Edit`→`EditApiKey`)"**整体作废**。
消息名 `EditApiKeyReq` 带资源名是因为它在**包作用域**里和几百个消息平级 ——
**方法名与消息名"对不上"是天然且正确的,不是病灶**。

(曾误改 18 个,已回退。判据:凡是"老方法是光秃 `List`、给它补了资源名"的,都是 stutter。)

### 2. 不走 deprecated 并存,直接删旧
决策:**本轮目的就是修正历史坏毛病,不为之前遗留任何东西**。
- 字段号**可自由重排**(不必顾及老编号)
- 废弃方法**直接删除**,不留 deprecated

> **为什么这样是安全的**:字段号重排本身是**静默数据损坏**(protobuf 只认字段号,
> `pagination`(message)和 `id`(string)wire type 相同,老客户端的 field 2 会被
> 当 string 解成 `id`,不报错、读出乱码)。**但"删掉旧方法"堵死了它** ——
> 老客户端调的方法已不存在 → 拿到 **UNIMPLEMENTED,响亮报错**,根本走不到那个消息。
> 危险的是「留旧名 + 重排」,不是「删旧 + 重排」。这两条必须配套。

(此前为并存加的 23 个 deprecated 方法已全部删除。)

### 3. 合并前必须验"鉴权是否同级"(不只看 Resp 是否同构)
AIP 的"一个资源一个 List + filter"**前提是鉴权一致**。实测发现多处**跨权限边界**:
- `club.Agent.ListAgentByDids` **免鉴权**(white_list) vs `ListFavoriteAgents` **需鉴权**
  (查"我"收藏的,必须有调用者身份)→ **不能合并**,`favorite` 不能做成 `List` 的 filter
- `club.Merchant.List`(我的)vs `ListAll`(全部,转发管理面 `MerchantManage`)→ **不合并**
- 语义也不能靠名字猜:`ListAllTradeReq` 里是 `{id, pagination}`,后端 `if req.Id==""`
  才是"全量",**不是**文档最初写的"全部+分页"

## 八、状态
- [x] VERSION 1.3.1 → **1.4.0**(不进 2.0.0,Go SIV 见六)
- [x] 批1:`User.ListFriend/ListServitor/ListRelation` → 复数(直接改名)
- [x] 批2a:19 个纯复数化(service≠资源的那些);18 个 stutter 已回退
- [x] 批2b:3 个错别字(`EditDegest`/`SaveUesrs`×2)+ 2 处消息词序
- [x] 删除全部 23 个 deprecated 老方法
- [x] 2c-#1 `club.Trade.ListTrade + ListAllTrade` → `Trade.List(did, id, pagination)`
- [x] 2c-#2/#3 `Agent` 一族:ai 4→1 `List(dids, favorite, pagination)`;club 门面 3→1 `List`;
      在线 2→1 `ListOnline(owner_did, pagination)`
- [ ] **⚠️ `club.Agent.List` 合并要拆**:`ListAgentByDids` 免鉴权 vs `ListFavoriteAgents` 需鉴权,
      白名单按方法挂、粒度不够 → 拆成 `List`(公开,dids 过滤)+ `ListFavorites`(需鉴权)
- [ ] **⚠️ `ListOnline` 要进 white_list**(维持原 `ListAllOnlineAgent` 免鉴权,给三方查在线机器人)
- [x] `UserACL.ListType` → `ListTypes`(纯复数化;`UserACL.List` 本就正确不动)
- [x] **2c 收尾** —— ⚠️ **本文档第三节那份"11 组撞名对"经逐组核实,基本全是错的**

### ⛔ 教训:方法名在本库不可信,任何判断必须落到后端实现
| 组 | 文档最初的判断(错) | 核实后的真相 |
|---|---|---|
| `Trade.ListTrade + ListAllTrade` | "全部+分页" | `{id,pagination}`,`if req.Id==""` 才全量 → **真能合,已合** ✓ |
| `Agent` favorite | 可做 `List` 的 filter | `ListAgentByDids` 免鉴权 vs `ListFavoriteAgents` 需身份 → **合不了**,已拆 |
| `AgentMarket.ListByClass` | `List(filter: class)` | 返回 `{banner, curated, ordinary}` 三分组版式 → **不是 List,不动** |
| `did.DApp.ListByClass` | `List(filter: class)` | **入参是 Empty**,返回 `{top, popular, recommend}` 三分组版式 → **不动** |
| `did.Wallet.ListUsersAssets` | `ListAssets(filter: user_dids)` | 入参 `{currency, pagination}`,返回按币种的**持仓排行榜**(公开不鉴权),**无 user_dids 这回事** → **不动** |
| `Merchant.List + ListAll` | 撞名可合 | 跨权限边界(用户面 vs 管理面 `MerchantManage`)→ **不合** |
| `UserExtension.ListByMerchantDid` | 越权重复品,该删 | **club 节点渲染的支柱**(选节点→读该节点扩展表→渲染金标);
但 club 实际只需 `Get(merchant,user)`,`ListByMerchantDid` 无业务调用方 → 倾向删,属业务决策 |

**结论:2c 真正需要合并的只有 Trade 和 Agent 两组,均已完成。** 其余"撞名对"不存在。

### 留给 authz/业务轮(去留取决于权限结论,不是命名问题)
- `UserExtension.List` / `ListByMerchantDid`(+ 是否搬去 `Merchant.ListUsers`)
- `club.Merchant.List + ListAll`
- `did.Merchant.List(hi.DID)` 裸入参 → 正经 Req
- [ ] 后端 / Rust / 前端 / 三方(**hi-proto 全部改定后再动**)

## 九、关联单子
权限体系问题(设计意图两层超管、后端裸奔、前端显隐当权限)见 **`.claude/authz-findings.md`**,
本轮只记录不动手。
