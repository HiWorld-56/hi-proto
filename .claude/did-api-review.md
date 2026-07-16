# hi.did 接口逐条评审(待裁决)

> **怎么用这份文档**:直接改「裁决」列。写 `OK` 表示认可我的建议;不认可就写你的结论(哪怕一两个字,
> 比如「不是超管」「删掉」「这个不用动」)。带 ❓ 的是我没把握、最需要你看的。改完我照着执行。

**范围**:只有 `hi.did`(81 个方法 / 22 个 service)。按依赖自底向上,did 定完再动 ai、再动 club。

**这份表的来源**(不是我拍脑袋):
- 「现档位」= proto 里 `hi.auth` 的标注
- 「handler 实际」= 扫 `backend-hi-did/internal/handler/*.go`,看方法体里有没有内联鉴权动作
- 「路由」= `http/did.yaml`;有路由 = 前端/web 能直接打,没路由 = 只走 grpc(兄弟服务调)
- 「作用」= **我的推断**,依据是入参出参 + 路由 + handler 行为。这一列最可能错。

---

## 0. 一眼看到的三件事

**① `admin.proto` 这个文件名就是答案。** `InviteCode` / `DApp` / `MerchantManage` 都在这个文件里,
handler 里 9 个方法做了超管校验 —— 整个文件就是超管面,**却一个方法都没标超管**。

**② 校验散在 handler 里,注释一行就没了。** `GatewayConfig.List` 裸奔就是这么来的:
有人把 `// err := IsAdmin(ctx)` 注掉,再把方法加进免鉴权白名单,没有任何东西会报警。
这也是「档位下沉到 proto」要解决的问题 —— 但**下沉时标错了 9 个**(见第 1 节)。

**③ 读比写严。** 商户面的读操作(`ListUsers` / `UserExtension.Get`)有 `requireGrant` 互授权校验,
写操作(`SaveUsers` / `DeleteUsers` / `UserExtension.Update/Delete`)**反而没有**。

---

## 1. 超管面 —— 现在 9 个标错

handler 里实打实做了超管名单校验,proto 却标成「用户token」。后果:**拦截器不拦,只剩 handler 自己那道**。
和前端证据吻合(hisrv web 的 `/invite`、`/dapp`、`/merchant` 都在「内部使用」菜单组下,只对超管显示)。

### hi.did.InviteCode (admin.proto)

商户靠邀请码注册进 hisrv;草民只用 hidid app,登不了 hisrv web。

| 方法 | 作用(我的理解) | 现档位 | handler 实际 | 我的建议 | 裁决 |
|---|---|---|---|---|---|
| `Create` | 管理员发邀请码 | 用户token ❌ | **超管校验** | **超管** | |
| `Edit` | 改邀请码 | 用户token ❌ | **超管校验** | **超管** | |
| `List` | 查邀请码列表 | 用户token ❌ | **超管校验** | **超管** | |
| `Delete` | 删邀请码 | 用户token ❌ | **超管校验** | **超管** | |
| `Verify` | **待注册用户**验码,换回 AuthToken | 公开 | - | 公开,但**主体不同,该拆出这个 service** | |

> `Verify` 的主体是「还没注册的人」,上面四个的主体是「管理员」。两个主体焊在一个 service 里,
> 所以档位必然不一致。这不是标注问题,是抽象问题。

### hi.did.DApp (admin.proto)

| 方法 | 作用(我的理解) | 现档位 | handler 实际 | 我的建议 | 裁决 |
|---|---|---|---|---|---|
| `Create` | 上架 DApp | 用户token ❌ | **超管校验** | **超管** | |
| `Edit` | 改 DApp | 用户token ❌ | **超管校验** | **超管** | |
| `Delete` | 下架 DApp | 用户token ❌ | **超管校验** | **超管** | |
| `UpdateOrder` | 调整排序 | 用户token ❌ | **超管校验** | **超管** | |
| `UpdateTop` | 设置置顶 | 用户token ❌ | **超管校验** | **超管** | |
| `ListByClass` | ❓ App 首页按分类展示 DApp | 用户token | - | 用户token | |
| `GetTop` | ❓ 取置顶 DApp | 用户token | - | 用户token | |
| `GetRWA` | ❓ 取 RWA 类 DApp | 用户token | - | 用户token | |

> **读写主体不同**:写(5 个)是管理员维护目录,读(3 个)是普通用户浏览。同一 service 两个主体。

### hi.did.MerchantManage (admin.proto) —— ⚠️ 我认为这里有漏洞

| 方法 | 作用(我的理解) | 现档位 | handler 实际 | 我的建议 | 裁决 |
|---|---|---|---|---|---|
| `List` | 管理员查商户列表 | 商户Extend | **无任何校验** | **超管** | |
| `Delete` | 管理员删商户 | **用户token** ⚠️ | **无任何校验** | **超管** | |
| `Edit` | 管理员改商户 | **用户token** ⚠️ | **无任何校验** | **超管** | |

> ❓ **请重点确认**:`Delete`/`Edit` 标着「用户token」且 handler 零校验,
> 意味着**任何登录用户都能删改商户**。前端 `/merchant` 是超管页,所以我判断这是漏洞。
> 但这属于「改行为」,要你点头我才动。

### hi.did.GatewayConfig (gateway.proto) —— 已改好

| 方法 | 作用 | 现档位 | handler 实际 | 我的建议 | 裁决 |
|---|---|---|---|---|---|
| `List` | 列链节点 url + api_key | 超管 ✅ | 收敛到拦截器 | 保持 | |
| `Set` | 设链节点配置 | 超管 ✅ | 收敛到拦截器 | 保持 | |

> 唯一调用方是 hisrv web 的 `/gateway` 页(直连 did 的 9533,带用户 token)。
> `club.GatewayConfig` 已删(全生态零调用方)。

---

## 2. 商户面(ExtendToken)—— 写操作缺互授权校验

「商户」= 注册进 hisrv 的机构(club 就是其中的 35 号商户)。互授权机制:
商户 A 把 B 加进自己的授权名单,B 才能读 A 的数据。

### hi.did.Merchant (merchant.proto) —— ⚠️ 两个主体混在一个 service

**前两个是「用户」主体,后九个是「商户」主体。**

| 方法 | 作用(我的理解) | 现档位 | handler 实际 | 我的建议 | 裁决 |
|---|---|---|---|---|---|
| `Get` | **用户**查自己绑的商户节点 | 用户token | 读did | 拆去用户面 service | |
| `Set` | **用户**设置自己绑的商户节点 | 用户token | 读did | 拆去用户面 service | |
| `GetUserProfile` | 商户读用户档案(club 走这条) | 商户Extend | - | ❓ **要不要加 requireGrant** | |
| `SetUserProfile` | 商户写用户档案 | 商户Extend | - | ❓ **同上** | |
| `GetMerchant` | 按 did 查商户信息 | 商户Extend | - | ❓ **同上** | |
| `ListGrants` | 查我的授权名单 | 商户Extend | 需商户身份 | 保持 | |
| `AddGrant` | 授权某商户访问我的数据 | 商户Extend | 需商户身份 | 保持(授权给别人无需对方同意,不该有 grant 校验) | |
| `RemoveGrant` | 撤销授权 | 商户Extend | 互授权+商户身份 | 保持 | |
| `ListUsers` | 列某商户下的用户(hisrv web 用) | 商户Extend | **互授权** ✅ | 保持 | |
| `SaveUsers` | 商户增改自己的用户 | 商户Extend | 需商户身份 | ❓ **写没互授权** | |
| `DeleteUsers` | 商户删自己的用户 | 商户Extend | 需商户身份 | ❓ **写没互授权** | |

### hi.did.UserExtension (user_extension.proto)

商户给用户挂的扩展字段(club 的扩展表是空的 —— 它不需要扩展,只读别家的)。

| 方法 | 作用(我的理解) | 现档位 | handler 实际 | 我的建议 | 裁决 |
|---|---|---|---|---|---|
| `Get` | 读用户扩展数据 | 商户Extend | **互授权** ✅ | 保持 | |
| `Update` | 写用户扩展数据 | 商户Extend | 需商户身份 | ❓ **写没互授权** | |
| `Delete` | 删用户扩展数据 | 商户Extend | 需商户身份 | ❓ **写没互授权** | |
| `ListMerchants` | 列某用户所属的商户 | 商户Extend | - | ❓ 路由是 `/api/v1/merchant/list` | |

> `ListMerchants` 就是你说「看不懂」的那个 `Merchant.List`,已按主体归到 `UserExtension` 下。
> ❓ 但它没有任何校验,且入参带 `user_did` —— 任何商户都能查任意用户属于哪些商户?

### hi.did.Wallet.GetUserAssets (wallet.proto)

| 方法 | 作用(我的理解) | 现档位 | handler 实际 | 我的建议 | 裁决 |
|---|---|---|---|---|---|
| `GetUserAssets` | 商户查某用户的资产 | 商户Extend | - | ❓ 见下 | |

> ❓ 同一个 service 里,`TotalAssets`/`ListUsersAssets` 是**公开**的(链上数据),
> 唯独 `GetUserAssets` 要商户身份。而 club 侧还有个 `club.Assets.GetUserAssets` 是**公开**的。
> 同一份数据三种档位 —— 要么公开档标松了,要么这个标严了。

### hi.did.ApiKey (api_key.proto)

给 bot 发 apikey,供脚本(AI function call)调用受限的接口子集。

| 方法 | 作用 | 现档位 | handler 实际 | 我的建议 | 裁决 |
|---|---|---|---|---|---|
| `Create` / `Edit` / `List` / `Delete` / `Get` | apikey 的增删改查 | 商户Extend | - | 保持(档位一致) | |

> 无 http 路由,只走 grpc —— 由 club/ai 调用。`Get` 是给 club 的拦截器验 apikey 用的。

### hi.did.SuperAdmin (base.proto) —— ⚠️ 我挖的坑

| 方法 | 作用 | 现档位 | handler 实际 | 我的建议 | 裁决 |
|---|---|---|---|---|---|
| `List` | 超管名单,供 club/ai/media 穿透过来问 | 商户Extend | **无 handler!** | **必须补实现** | |

> 我在 proto 加了入口却没写实现,club 穿透过去会撞 `Unimplemented`。这个坑我来填,不用你裁决。

---

## 3. 用户面(用户 token)

| service.方法 | 作用(我的理解) | 现档位 | 我的建议 | 裁决 |
|---|---|---|---|---|
| `User.Edit` | 用户改自己资料 | 用户token | 保持 | |
| `User.Query` | 用户查自己资料 | 用户token | 保持 | |
| `UserExtensionSettings.Get` | ❓ 用户自己的扩展设置 | 用户token | 保持 | |
| `UserExtensionSettings.Update` | ❓ **入参是 `Empty` 却叫 Update** | 用户token | ❓ **这方法到底干嘛的** | |
| `Wallet.GetWallet` | 查钱包 | 用户token | 保持 | |
| `Wallet.ListAddresses` | 列地址 | 用户token | 保持 | |
| `Wallet.UpdateAssets` | 更新资产 | 用户token | 保持 | |
| `Wallet.GetUserByAddress` | 按地址反查用户 | 用户token | ❓ 任意用户可反查他人? | |
| `Transfer.VerifyTransaction` | 交易校验(你要重建的那个) | 用户token | 保持 | |
| `SSE.OrderEvents` | 订单事件流(stream) | 用户token | 保持 | |
| `Merchant.Get` / `Merchant.Set` | 见第 2 节(混在商户 service 里) | 用户token | 拆出来 | |

### hi.did.AgentMarket (agent_market.proto) —— ❓ 疑似也该是超管

| 方法 | 作用(我的理解) | 现档位 | handler 实际 | 我的建议 | 裁决 |
|---|---|---|---|---|---|
| `List` | 列 agent 市场 | 用户token | 读did | | |
| `Create` | ❓ 上架 agent | 用户token | 读did | ❓ **该不该超管** | |
| `Edit` | ❓ 改 agent | 用户token | 读did | ❓ **同上** | |
| `Delete` | ❓ 下架 agent | 用户token | 读did | ❓ **同上** | |
| `UpdateOrder` | ❓ 调整排序 | 用户token | 读did | ❓ **同上** | |
| `ListByClass` | ❓ 按分类列 | **商户Extend** | - | ❓ **唯一的 Extend 档且无路由,很怪** | |

> ❓ **请确认**:它和 `DApp` 长得几乎一样(都是「上架/排序/置顶」的目录维护),
> 但 `DApp` 的写操作 handler 里有超管校验,`AgentMarket` **一处都没有**。
> 是它本来就该普通用户可上架,还是这里漏了校验?

---

## 4. 公开面(免鉴权)

| service.方法 | 作用 | 我的建议 | 裁决 |
|---|---|---|---|
| `Wallet.TotalAssets` / `Wallet.ListUsersAssets` | 资产统计 | 公开(你已确认:链上数据无隐藏性) | |
| `Transfer.History` / `Transfer.TxStatus` | 转账历史 / 交易状态 | 公开(同上) | |
| `User.Total` | 用户总数 | 公开(同上) | |
| `Price.GetPrice` | 行情 | 公开 | |
| `Base.ListCoins` | 币种列表 | 公开 | |
| `Base.LatestVersion` / `Base.ServerVersion` | 版本 | 公开 | |
| `Health.Check` | 健康检查 | 公开 | |
| `Auth.RefreshToken` | 刷 token | 公开(内含自校验) | |
| `Auth.GenerateReqId` / `Auth.GetReqStatus` | 登录握手 | 公开 | |
| `Pay.GenerateReq` | 支付握手 | 公开 | |
| `SSE.Notify` | ❓ **商户回调通知,却完全公开** | ❓ **名字叫 Notify 但入参不是 SignedData,谁都能推送?** | |

### hi.did.Base —— 杂物袋

| 方法 | 现档位 | 我的建议 | 裁决 |
|---|---|---|---|
| `ListSuperAdminUsers` | 用户token | **不能标超管**(否则「先是超管才能知道自己是不是超管」);前端拿它显隐菜单 | |
| `ListCoins` / `LatestVersion` / `ServerVersion` | 公开 | 挪进 `Health`,让 Base 归于一致 | |

---

## 5. web3 面(传输层放行,验签在 handler)

不是接口鉴权,是**数据真实性识别**。**别改成 token 档** —— 调用方(登录握手 / hidid 回调)手里根本没有用户 token。

| service.方法 | 作用 | 裁决 |
|---|---|---|
| `Auth.Verify` / `Auth.VerifyOffline` | 登录验签 | |
| `Auth.Notify` / `Auth.Logout` | 登录通知 / 登出 | |
| `Assist.VerifySignature` | 验签工具 | |
| `Pay.Notify` | 支付通知 | |
| `Wallet.UpdateAddresses` | 更新链地址 | |
| `LoginCallback.Login` | **契约**:did 定义、**club 实现**,did 侧无 handler 是对的 | |
| `PayCallback.Pay` | **契约**:同上 | |

---

## 6. 死代码(handler 有、proto 没有,永远调不到)

| 方法 | 我的建议 | 裁决 |
|---|---|---|
| `Transfer.HistoryOld` | 删 | |
| `User.List` | 删 | |

> 这类东西存在的原因:handler 内嵌 `UnimplementedXServer`,方法多写少写都编译通过,
> 不会有任何提示。同理,proto 加了方法忘了实现,运行时才 501。

---

## 7. 最需要你拍板的 6 个问题

1. **`MerchantManage.Delete/Edit` 任何登录用户都能删改商户** —— 是漏洞吗?收紧成超管?
2. **`AgentMarket.Create/Edit/Delete/UpdateOrder` 该不该是超管?**(DApp 同类操作是超管)
3. **商户面的写操作没有 requireGrant**(`SaveUsers`/`DeleteUsers`/`UserExtension.Update/Delete`)——
   读要授权、写不要,是有意的吗?
4. **`UserExtensionSettings.Update` 入参是 `Empty`** —— 这方法干嘛的?
5. **`SSE.Notify` 完全公开且入参不是 SignedData** —— 谁都能推送商户通知?
6. **`Merchant.GetUserProfile/SetUserProfile/GetMerchant` 没有 requireGrant** ——
   club 就是走 `GetUserProfile` 读用户档案的。能读别家商户的用户吗?

---

## 8. 定完之后的执行顺序(不用你裁决,给你个预期)

1. 补 `SuperAdmin.List` 的实现(我挖的坑)
2. 按裁决改 proto 档位 + 把 handler 内联校验收敛到拦截器
3. 删死代码
4. **补对照测试**:每个超管方法验「有效 token 的非超管必须被拒 + 超管必须放行」。
   之前 `club.UserACL.List` 被我标错成超管、把普通用户挡在门外,冒烟测试全绿没拦住 ——
   因为它只断言「不带凭证会被拒」,而那条对两个档位都成立,**区分不了**。
5. did 定稿后再动 ai,最后 club。
