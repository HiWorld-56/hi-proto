# 权限体系现状与问题(待大改)

> 2026-07 在做 AIP-132 proto 整改时顺带查实。**本轮只记录,不动手**;
> 先把 hi-proto 改定,之后由业务 + proto 一起定代码怎么改。

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
