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

## 六、落地顺序(建议)
1. `VERSION` **1.3.1 → 2.0.0**(wire 破坏,按 semver 必须进主版本)
2. hi-proto 改完 → CI 出 `v2.0.0-dev1` → 内部消费方按 devN 灰度
3. 顺序:proto → 8 个后端 handler → Rust(core → brain)→ 前端(同事)→ 通告三方
4. **后端与客户端必须同版本同时上**(方法路径变,无法灰度共存);
   若要平滑,可**新旧方法并存一个版本**(旧的标 `deprecated`),下个大版本再删——推荐走这条,避免一刀切停服。

## 七、状态
- [ ] 四、待定项拍板
- [ ] 是否走"新旧并存 + deprecated 过渡"(强烈建议)
- [ ] proto 改名
- [ ] 后端 / Rust / 前端 / 三方
