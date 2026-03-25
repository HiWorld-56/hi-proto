# UserExtension（用户扩展）

## 定义

`UserExtension` 是 DID 为商户提供的**可扩展用户数据表系统**，属于商户级功能，普通用户不具备。

## 背景

DID 的基础用户数据结构（`Entity`）只包含通用字段（DID、名称、头像等），无法满足各商户个性化的用户数据需求。例如，某商户可能需要为其用户存储：等级、主页链接、宣传卡片、积分余额等字段。

## 工作机制

当普通用户注册成为商户后，DID 后台会为其自动创建：

1. **扩展数据表** `DBExtend_<merchant_did>`：专属于该商户的用户扩展表，商户可将任意 DID 用户拉入此表，并为其存储自定义字段。

2. **扩展操作凭证**（`extension_token`）：商户后台调用 DID 接口操作其扩展数据表时，使用此 token 进行鉴权，与普通用户 token 隔离。

```
普通用户 A  ──注册商户──▶  商户 M
                              │
                              ├── DBExtend_<M_did>（扩展用户表）
                              │     ├── user_did: A_did
                              │     ├── level: 3          ← 商户自定义字段
                              │     └── homepage: "..."   ← 商户自定义字段
                              │
                              └── extension_token（商户后台鉴权凭证）
```

## 与基础用户的关系

- `Entity`（基础用户）由 DID 统一管理，所有模块共享
- `UserExtension` 由**各商户独立管理**，数据归属于该商户，DID 只提供存储和接口标准
- 同一个 DID 用户可同时存在于多个商户的扩展表中

## 命名说明

- **不使用 `UserExtend`**（旧名）：extend 是动词，作名词使用不自然
- **使用 `UserExtension`**：extension 是 extend 的标准名词形式，在企业系统中是通用术语（如 SAP User Extensions）
