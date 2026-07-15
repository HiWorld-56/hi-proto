# 权限体系现状与问题(待大改)

> 2026-07 在做 AIP-132 proto 整改时顺带查实。**本轮只记录,不动手**;
> 先把 hi-proto 改定,之后由业务 + proto 一起定代码怎么改。

## 〇、定性(据当事人,决定修法规模 —— 别搞错)
**超管和业务没有任何关系,它就是个后门** —— 方便内部去调一些全局的控制/查看方法,
省得再为内部单独做一套系统。

**推论:不要把它设计成 RBAC。** 要做的只是"**给后门装锁**":
一个拦截器 + 一张"哪些方法算全局方法"的表 + 一句 `caller did ∈ 超管名单`。
材料全是现成的(名单在库里、身份在 ctx 里、判断写法见 `acl_user.go` 的 `slices.Contains`)。

> 附带解释了一个现象:club 服务自己的商户 did(`zGcNS5gAkZiPQFT2rMsBwFEHVZpTitnAGo`)
> 同时在超管名单和 `hi_chat_user_super`(type=7 全权限)里 —— 服务自身要能调全局方法,
> 顺手加的,合理,不是配置事故。

## 一、设计意图(据当事人)
**两层超管**:
- **顶层** = 我们团队内部用 → 拥有**全部**内部权限
- **二层** = 三方合作伙伴用 → 只有**部分**内部权限

目的是"便捷设计,避免为内部再做一套页面":内部功能挂在正式产品页里(HiClub 管理页的
「内部使用」区:API key / 机器人 / 交易统计 / 用户权限),靠 did 白名单决定可见性。
hidid / hiai 有同样做法。

原先两份名单在**配置文件**里,后来迁到**数据库**。

## 二、现状(实测)

### 两张表
| 表 | 结构 | 条数(dev) | 语义 |
|---|---|---|---|
| `hi_chat_dids` | `{did, purpose, enable}` | 14(`purpose=0 & enable=1`) | **根管理员名单**(谁能授权) |
| `hi_chat_user_super` | `{did, type, note}` | 15 | **被授权用户**(谁有什么权限) |

- `hi_chat_dids` 是**独立的 did 打标签表**,不是用户表(用户表 = `hi_chat_user`)。
- ⚠️ **`purpose=0` 的常量名是 `DID_PURPOSE_INVITE_CODE`(邀请码)** —— 根管理员名单**借用了"邀请码"用途**。
  推测:配置文件迁数据库时挂在了现成的表上。
- `hi_chat_user_super.type` 是 `tinyint`,实测值 `0/2/4/5/7` → **位掩码**(4 种权限:
  `super` / `all` / `plugin` / `mem`,见 `constant.SuperUserTypes`)。

### 校验链:**只护住了"授权"本身**
```go
// internal/service/acl_user.go —— 有校验 ✓
func (uas *UserACLService) Add(operator, targetUser, targetType string) error {
	dids, _ := repo.NewDidsRepo().GetEnabledDids([]int{constant.DID_PURPOSE_INVITE_CODE})
	check := slices.Contains(*dids, operator)
	if !check { return fmt.Errorf("用户没有权限操作") }   // ← 根管理员才能改 ACL
	...
	NewSuperUserService().InsertUserSuper(targetUser, targetType)
}
```

## 三、问题

1. **⛔ 违反明确要求:"所有权限控制必须在后端"**
   「内部使用」的**数据接口全裸奔**,连调用者身份都不读:
   ```go
   func (ms *MerchantServer) ListAll(ctx, req) {           // 全部商户
       didapi.MerchantList(ctx, &hidid.MerchantManageListReq{...})  // 没碰 ctx.Value("did")
   }
   ```
   - `club.Merchant.ListAll` → 转发 did 的**管理面** `MerchantManage.List`,零校验
   - `club.Trade.ListAllTrade`(本轮已并入 `Trade.List`)→ 全部人的交易,零校验
   - 任何持有效 token 的普通用户直接调 gRPC 即可拿全量数据

2. **前端显隐被当成了权限**
   `ListSuperAdminUsers` 在**免鉴权白名单**里(`white_list.go:8`),任何人可拉根管理员名单;
   前端据此显隐「内部工具」菜单。**后端从不拿它做判断** —— 这是 UI 便利,不是访问控制。

3. **拦截器只有 authentication,没有 authorization**
   `auth.go:30` 的链路:白名单放行 → 否则验 token/apiKey → 把 did 塞进 ctx。
   **没有任何按方法的权限表**。方法内 `ctx.Value("did")` 只用于**数据作用域**
   (如 `Merchant.List` 查"我的"),不是权限校验。

4. **两层设计只落地了一层**
   代码里只有"根管理员"这一道(`acl_user.go` 的 `slices.Contains`);
   `hi_chat_user_super.type` 那套位掩码**没有任何地方拿来做访问判断**。
   即"二层=三方伙伴的部分权限"**形同虚设**。

5. **数据层疑点**
   - `hi_chat_dids` 里 **2 个 did 不在用户表**(`zJVLJgC7x3kLe5C8bxpsMbk3Ev6VByQkaa`、
     `zByT8Bz3YPBPfRwKEZPhJtZpqPnDYztJXT`)—— 孤儿根管理员
   - `type` 在代码里是**字符串常量**(`"super"`/`"all"`/`"plugin"`/`"mem"`),
     库里是 **tinyint 位掩码** —— 中间必有转换,值域是否对得上待核
   - 表注释只写了 `1` 是什么(`purpose` 注释 `1:DApp`、`enable` 注释 `1:启用`),`0` 的含义没写

## 三·五、另一类问题:业务接口的 IDOR(**和后门无关,性质更严重**)

后门问题是"内部方法没锁";这个是**普通业务接口,参数指哪打哪**。

### `UserExtension.ListByMerchantDid(merchant)` —— 任意登录用户可拉任意商户的客户名单
```go
// did 侧:商户 did 来自请求参数,全程不与 ctx 里的商户身份比对
func (ues *UserExtensionServer) ListByMerchantDid(ctx, req *hidid.ListByMerchantDidReq) {
	merchantDid := req.Merchant                                  // ← 调用方随便传
	merchantModel, _ := repo.NewMerchantRepo().FindOne(merchantDid)
	repo.NewMerchantRepo().GetUserExtendInfos(merchantModel.ExtendTable)
}
// club 侧:原样透传,只验"你是个登录用户",不验"这商户是不是你的"
units, err := didapi.ListUserExtensionByMerchantDid(ctx, req)
```
**泄露内容**:`[{hi.Entity 用户实体, 该商户的自定义扩展字段, 备注名}, ...]` —— 商户的**完整客户名单 + 业务数据**。

**⚠️ 别误判成"冗余重复品"(我第一版就搞错了)**:这两个是**不同的东西,都不能删**。
```go
// UserExtension.List —— 商户从 token 来:商户在 hisrv 管**自己**的用户 ✓
merchantDID, ok := ctx.Value("merchant_did").(string)
// UserExtension.ListByMerchantDid —— merchant 是参数:club 作为平台读**别人**的节点(平台能力)
```

### 业务背景:`merchant` 必须是参数,这是设计
club 的核心功能之一:用户登录 club 后**选一个自己所在的商户节点**
(club=微信,其他 hisrv 商户=美团/饿了么…),club 去**那个节点的扩展表**里取字段
(例:某字段决定该用户是否显示"金标")。挂美团就看到美团的金标用户,挂饿了么就看不到。
**"先找节点 → 再去节点扩展表找字段"是固定流程**(类似回调思路)。

→ 所以 club 自己那张扩展表 0 行是**正常的**:club 不需要扩展,它是**读别人的**。
→ **`ListByMerchantDid` 不能删、不能改成"商户走 token"** —— 那会直接干掉这个功能。

### 真正缺的是两道校验(不是删接口)
用户自己的描述里藏着约束:「用户选一个**他所在的**商户节点」—— 但没人校验"他所在"。

1. **club 侧**:`req.Merchant` 必须 ∈ **调用者所属节点列表**。
   club 手里就有数据 —— `club.Merchant.List` 走的正是 `didapi.UserMerchantList(userDid)`。
   一句 `slices.Contains` 即可。
2. **did 侧**:`ListByMerchantDid` 是**平台级能力**,该校验"该 ExtendToken 是否允许跨商户读"。
   **否则任意 hisrv 商户(美团)可拿自己的 token 拉走饿了么的完整客户名单** —— 这条更要命。

### 架构背景(已用数据验证)
- 每个商户在 hidid 有**一张独立物理扩展表** `DBUserInformationExtension_<商户did>`(`hisrv_merchant.extend_table`)
- **club 就是 hidid 的 35 号商户**:`did=zGcNS5gAkZiPQFT2rMsBwFEHVZpTitnAGo`,
  `token=820995a0...` = club 配置里的 `HiDidServer.TOKEN`(已比对一致)
- club 那张扩展表**当前 0 行**(有能力存,尚未使用);别的商户有数据(如 `zPXUhC...` 2 行)
- club 调 did 用的是**配置里写死的商户 ExtendToken**,所以 did 眼里调用方**永远是"club 这个商户"**
  → **club 拿着 35 号商户的证,去读 73 号商户的客户名单,证不对版**

### ✅ 原定的授权机制(据当事人;**设计过,一行没实现**)

**商户之间是平级的**(club 和美团、饿了么同级),所以跨商户访问必须显式授权。原设计:

1. **商户登录 hisrv web,页面上有个列表,往里添加其他商户** → 即"我允许这些商户访问我的数据"
2. 落到代码:三方节点调接口时,判断**能否拿到该商户的 extoken**(内部处理)
3. 拿到后,用这个 extoken 去调那些本就需要 ExtendToken 鉴权的接口即可

**流程示例**(club 要 Get 商户 A 的用户 b 的数据):
```
club ──Get(merchant=A, user=b)──▶ club 门面 ──透传──▶ hisrv
                                                      │
                                                      ├ 检查:club ∈ A 的授权列表?
                                                      │   ├ 在  → 取 A 的 extoken → 调 Merchant service 的 Get
                                                      │   │       (或更简单:校验通过后直接查表返回)
                                                      │   └ 不在 → 拒绝
```
**妙处:完全复用已有的 extoken 体系** —— "授权" == "能不能拿到对方的 extoken",
拿到了就走原本那套 ExtendToken 鉴权,不需要引入任何新机制。

### ⛔ 实现现状:**零**
已核查 `hi_wallet`(hisrv 库)全部业务表:
```
gorp_migrations / hi_agent / hi_apikey / hi_app_version / hi_chain /
hi_chat_user_assets / hi_chat_user_refreshtoken / hi_chat_user_wallet(_2) /
hi_coin / hi_did_dapps / hi_gateway_config / hi_mqtt_client_id / hi_user /
hi_wallet_dapps / hi_wallet_dids / hi_wallet_invitecode / hisrv_merchant /
user_wallet_height + 每商户一张 DBUserInformationExtension_<did>
```
**没有任何"商户互授权列表"表**(无 auth/grant/permit/allow/partner/trust 之类),
hisrv web 上没有那个列表页,代码里没有 token 置换逻辑。

→ **现状裸奔**:任意商户拿自己的 extoken + 传别家 did,直接读走对方数据。

### club 实际只需要 `Get`,不需要 `List`
- club 的用法是"**查特定节点的特定用户**"(如判断该用户在美团节点是否金标)→ `Get(merchant, user)` 就够
- did 与 club 侧**都已有 `Get`**(`UserExtension.Get(UserExtensionGetReq{merchant, user})`)
- 而 `ListByMerchantDid`(拉整个节点的用户名单)**club 内部无任何业务代码调用**
  (仅 handler + didapi 封装两处,是纯透传门面),且**无 http 规则**(纯 gRPC)
- → **倾向删除 `ListByMerchantDid`**:club 用不上,却是"拉走任意商户完整客户名单"的高危面。
  删前需确认无外部 gRPC 调用方。

## 四、改造方向(待定)
- 后端补**统一 authorization**:拦截器按方法挂权限(顶层/二层/公开),
  校验 `caller did` ∈ 根管理员名单 或 `hi_chat_user_super.type` 位掩码命中。
  材料齐全:名单在、身份在 ctx 里、`slices.Contains` 写法在 `acl_user.go` 现成。
- 根管理员名单**从"邀请码"用途里剥离**,给它自己的语义(或独立表/独立 purpose 值)。
- `ListSuperAdminUsers` 是否还该免鉴权、是否还该暴露给前端,重新评估。
- 前端显隐与后端授权**解耦**:前端不显示 ≠ 后端不可调。

## 五、边界:哪些"免鉴权"是有意的(别误伤)
- `/hi.club.Agent/ListAllOnlineAgent`(本轮并入 `ListOnline`)—— **有意免鉴权**,
  给三方查看哪些机器人在线。改造时 `ListOnline` **必须留在白名单**。
