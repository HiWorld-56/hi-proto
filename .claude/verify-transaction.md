# 交易校验接口 VerifyTransaction —— 全链路对接文档

> 面向调用方(club-trade 等)与后端同事。校验一笔**链上交易**是否与业务**预期**一致(收付方 / 金额 / 币种),两阶段:先链上确认、再业务比对。
>
> 定义:`hi/did/transfer.proto` 的 `Transfer.VerifyTransaction`(hi-proto-code **v0.3.0+**)。设计缘由见同目录 `verify-transaction-plan.md`。

## 1. 接口定义

```proto
service Transfer {
  rpc VerifyTransaction (VerifyTransactionReq) returns (VerifyTransactionResp); // 不鉴权
}

message VerifyTransactionReq {
  string coin   = 1; // 预期币种(用于定位链 / 合约地址),如 "USDT-TRC20"
  string hash   = 2; // 链上交易 hash
  string amount = 3; // 预期金额(最小单位整数串,与链上口径一致)
  string from   = 4; // 预期付款方(链地址)
  string to     = 5; // 预期收款方(链地址)
}
message VerifyTransactionResp {
  string state            = 1; // 链上状态:pending/confirming/success/failed/notfound
  bool   passed           = 2; // 业务校验是否通过(仅 state=success 时有意义)
  string reason           = 3; // 未过原因:AMOUNT_ERR/FROM_ERR/TO_ERR/CONTRACTADDRESS_ERR
  int64  confirmed_blocks = 4; // 链上确认数
  int64  timestamp        = 5; // 交易时间(ms);调用方据此自行做时限校验(业务层解耦)
  uint32 query_count      = 6; // 该 hash 在缓存窗口内被查询次数(见"计数防重")
}
```

## 2. 语义(两阶段 + 计数防重)

一次调用完成三件事:

1. **阶段1 链上状态**:按 `hash` 查交易在链上到哪一步(`state`)。只有 `success` 才进入阶段2。
2. **阶段2 业务比对**(仅 `state=success`):把链上**实际**的 金额 / 币种(合约地址) / from / to 跟传入的**预期值**逐项比对,全对 `passed=true`;任一不符 `passed=false` 且 `reason` 给出原因码。
3. **计数防重(不硬拒绝)**:交易**通过校验后** hash 进单条 **1 小时滑动** cache(每次被查重置超时)并计数;`query_count` 随结果返回。业务侧据此**自行判断**是否异常(如同一 hash 短时间被反复校验=可疑),**后端不拒绝**——避免网络波动导致的合理重查被误杀。

**时间窗校验归业务侧**:接口只返回 `timestamp`,调用方据订单时限自行判定"交易是否过期"。后端不做时限。

## 3. 全链路时序

```
club-trade 定时任务(check_chain_tx)
   │  VerifyTransactionReq{coin,hash,amount,from,to}
   ▼  gRPC
backend-hi-did  Transfer.VerifyTransaction (internal/handler/transfer.go)
   │  ① 计数防重 cache(1h 滑动)
   │  ② coreapi.Detail(chain, hash)  ── purego ─▶ libhidid_ffi.so: hidid_tx_detail
   │                                              └▶ hidid_core Explorer::tx_detail
   │                                                 └▶ 各链 explorer(trx/eth/sol/aptos/btc)查链节点
   │  ③ state=success 时业务比对(合约地址 / 金额 decimal 精确 / from / to 大小写不敏感)
   ▼
VerifyTransactionResp{state,passed,reason,confirmed_blocks,timestamp,query_count}
```

链上明细由 hidid_core 的 `tx_detail` 统一产出(五链归一:amount=最小单位串、地址=各链原生格式、timestamp=ms)。

## 4. 调用示例(Go,club 侧)

```go
req := hidid.VerifyTransactionReq{
    Coin:   p.Coin,
    Hash:   p.Hash,
    Amount: p.Amount,          // 预期金额(最小单位)
    From:   from.Info.Server.Did, // 预期付款方地址
    To:     to.Info.Server.Did,   // 预期收款方地址
}
resp, err := didapi.VerifyTransaction(ctx, &req) // 内部 cli.VerifyTransaction 走 Transfer 通道
if err != nil { /* 网络/服务错,重试 */ }

switch resp.State {
case "success":
    if resp.Passed {
        // 链上成功 + 业务吻合 → 订单确认
        // 需要防伪:可看 resp.QueryCount(>1 说明该 hash 已被校验过)
        // 需要时限:可用 resp.Timestamp(ms)跟订单时间比
    } else {
        // 链上成功但金额/收付方不符 → 失败,resp.Reason 给原因
    }
case "failed":
    // 链上失败 → 失败
default: // pending / confirming / notfound
    // 还没确认 → 继续轮询
}
```

## 5. 支持的链 & 注意事项

- **支持**:TRX/TRC20、ETH/ERC20、SOL/SPL、Aptos(APT/coin/FA)、BTC。均按 txid 查单笔并解出 from/to/amount/合约。
- **BTC 是 UTXO**:无单一 from/to,采用"付款启发式"——from=首个输入地址,to/amount=地址不属于输入方的外部输出(找零回输入地址)。**适用于单收款人的商户支付**;批量多收款人场景 amount 会合计、to 取第一个。
- **金额单位**:`amount` 是**最小单位整数串**(如 USDT 6 位精度,484.88 → "484880000")。预期值也要按此口径传。
- **from/to 大小写**:比对用 `EqualFold`(大小写不敏感)。
- 阶段2 只在 `state=success` 执行;`pending/confirming` 时 `passed` 恒为 false(无意义),别据此判失败,应继续轮询。
