# VerifyTransaction 交易校验接口 —— 重建方案

> 背景:2026-06-25 `bc99fb7`「重构 did.Transfer」把 `GetTransactionDetail`(链上+业务两段式校验,三方在用)误删,换成只查状态的 `TxStatus`,校验能力丢失(回归)。决定**重写**一个新接口 `VerifyTransaction`(不叫旧名,因为它是"检查"不是"获取")。

## 语义(两阶段 + 防作弊)

一次调用完成:
1. **计数防重(不再硬拒绝)**:交易通过校验后 hash 进 cache,**TTL 1 小时且滑动**(每次被查都重置 1h 超时,超时重置机制沿用旧设计不变);cache 项带**计数字段**,每查该 hash 计数 +1。`query_count` 随查询结果一起返回,业务端看到的是**成功 + 计数**(不是 hash_dup 报错),**自行按计数做防伪**。理由:网络波动导致业务端合理重查不该被误判为恶意刷钱;是否可疑交给业务端按次数阈值决定。
2. **阶段1 链上**:按 hash 查链上交易状态(pending/confirming/success/failed/notfound)。
3. **阶段2 业务**(仅链上 success 时):把链上实际的**金额/币种(合约地址)/from/to** 跟**传入的预期值**逐项比对;并做**交易时间窗**校验(交易时间超过合法时限判无效,防旧 hash 反复欺诈)。任一不符给出原因码。

## proto(hi/did/transfer.proto,与 History/TxStatus 并存)

```proto
message VerifyTransactionReq {
  string coin   = 1;  // 预期币种(定位链/合约)
  string hash   = 2;  // 链上交易 hash
  string amount = 3;  // 预期金额
  string from   = 4;  // 预期付款方
  string to     = 5;  // 预期收款方
}
message VerifyTransactionResp {
  string state            = 1;  // pending/confirming/success/failed/notfound
  bool   passed           = 2;  // 业务校验是否通过(仅 state=success 有意义)
  string reason           = 3;  // AMOUNT_ERR/FROM_ERR/TO_ERR/CONTRACTADDRESS_ERR/EXPIRED
  int64  confirmed_blocks = 4;
  int64  timestamp        = 5;  // 交易时间(ms)
  uint32 query_count      = 6;  // 该 hash 在缓存窗口内被查询次数(首次通过=1,业务端据此自行判断是否异常)
}
service Transfer { ... rpc VerifyTransaction (VerifyTransactionReq) returns (VerifyTransactionResp); }
```

## 关键依赖:hidid_core 需新增 `tx_detail` FFI(Path A)

当前 FFI 只有 `tx_status(chain,hash)→state/progress`,**没有"按 hash 取完整明细"**。阶段2 缺数据源。故:

**hidid_core(Rust,基础)**
- `tx.rs`:新增 `TxDetail`(txid/from/to/amount/token合约/symbol/decimals/timestamp/state/confirmations)。字段口径复用现有 `TxRecord`(五链归一,amount=最小单位串+decimals,timestamp=ms)。
- `explorer.rs`:`ChainExplorer` trait 加 `tx_detail(txid)`;`Explorer::tx_detail(chain,txid)` 公有分发(复用 status 的 forward-only 缓存)。
- 各链 `{trx,eth,sol,aptos,btc}/explorer.rs`:实现 `tx_detail`——在现有 `tx_status`(已按 txid 查链)基础上,额外从节点响应提取 from/to/amount/token。**逐链、支付关键,需真链测试**。

**hidid_ffi crate**:导出 `hidid_tx_detail(chain,txid)→json`。

**backend-hi-did**
- `coreapi`:`TxDetail(chain,txid)` 包装。
- `service.VerifyTransaction(param)`:按 hash 计数 cache(改造旧 `verifyHashCache`/`getTxHashLock`→ TTL 1h 滑动、存计数字段、每查 +1、返回 `query_count`,不拒绝)→ tx_detail → 阶段2 比对(金额 decimal 精确、合约地址、from/to EqualFold)+ 交易时间窗。
- 逐链真链实测:hidid_core 自带节点信息/配置(见其 config + examples/),可在其上直接对真链验证 tx_detail。
- handler `TransferServer.VerifyTransaction` + 注册路由。

**hi-proto-code**:重生成 + 打 tag v0.3.0。

**backend-hi-club-trade / backend-hi-club-transaction**:切 v0.3.0 + 调用方改调 `VerifyTransaction`(传预期 coin/hash/amount/from/to,读 state+passed+reason)。它们原来分别在 `check_chain_tx.go`、`order_queue.go` 调旧 `GetTransactionDetail`。

## 推进顺序(逐链、逐仓,支付关键需测)
1. hidid_core:TxDetail 类型 + trait + dispatch 脚手架 →(逐链)trx→eth→sol→aptos→btc 实现,各自真链验证。
2. hidid_ffi 导出。
3. hi-proto 加 RPC → hi-proto-code v0.3.0。
4. backend-hi-did 实现 + build。
5. club-trade/transaction 切换 + build。

## 已完成的前置(本轮)
6 个后端 hi-proto→hi-proto-code 迁移:source/ai-plugin/ai/media 已切推;club-trade/transaction 待本接口就位再切(现仍 `replace ../hi-proto`,本就 :dev 未对齐)。
