# smoke —— 跨仓端到端冒烟

这些脚本打的是**部署好的真实服务**(club / ai / did / ai-plugin),验的是**行为**:
编译过、lint 过、接口返回 success,干的事照样可能不对。

放在 hi-proto 而不是各后端仓,是因为它们本来就是**跨仓**的:一条购买链路要同时经过
club、ai、did 三个后端。hi-proto 已经在做同类的事(`codegen/check_impl.py` 扫所有后端仓
看 rpc 有没有实现),归属一致。

> ⚠️ 它们此前只活在 `.64:~/ci/` 里,**没有任何版本控制** —— 而这是整套回归网本身。
> 盘坏了或误删了,所有验证资产一次性消失,而且要到下次想跑回归时才会发现。

## 在哪跑

**`.64`**(构建机)。判据是**这台机器够不够得着全部依赖**,不是"哪台像测试机":

| 要用的东西 | `.64` | `.65` | `.66` |
|---|---|---|---|
| `grpcurl` | ✅ | 需手工拷 | ❌ |
| protoset(`~/ci/hi-proto-code/lua/hi.pb`) | ✅ CI 现生成 | ❌ | ❌ |
| 后端源码 `~/wip`(check_impl 要扫) | ✅ | ❌ | ❌ |
| ssh 到 `.66` 取 token(tokgen/didtok) | ✅ | **❌ 没有公钥** | — |
| mysql | ❌ | ✅ | ❌ |

`.64` 缺的只有 mysql,而脚本里查库一律走 `sql()` —— 它**ssh 到 `.65` 去查**,所以不缺。
反过来 `.65` 缺三样,其中两样是**静默的**:

- 没有 protoset → 每个 grpc 断言拿到**空串**,报 `want=Unauthenticated got=`,
  **看上去像接口全挂了**。(2026-09-03 实测:`smoke.sh` 在 `.65` 上 14/16,
  16 条全是这一个原因;搬到 `.64` 上是 30/0。)
- 没有 `~/wip` → `check_impl.py` 扫不到任何源码,于是"每个 rpc 都没实现"。

> 这一节原来写的是「在 `.65` 跑」,理由是"mysql 只有那台"——
> **把一个次要依赖当成了决定性判据**。protoset 与 `~/wip` 这两样反而没人提。

## 铁律:验 function call 一律看「插件真的跑没跑」

**不看模型最后那句话。** 工具没被调用时模型会自己编一个完全合理的答复
(实测:问 137+486 它自己算出 623 交差)。所以测试插件里放了一个**模型不可能猜到**的
magic 值,答复里出现了才算数。

## 脚本

| 脚本 | 验什么 |
|---|---|
| `smoke.sh` | 接口存不存在、鉴权收不收 |
| `smoke-user.sh` | 用户面基础 |
| `smoke-market.sh` | 对话路合并 / 多 function call / 市场挂牌与免费购买 |
| `smoke-market-renew.sh` | 自动续费开关 / 到期扫描 / follow_latest |
| `smoke-stream.sh` | 流式:指令帧 vs 回显帧、错误走帧不走 grpc status |
| `smoke-parallel.sh` | 一轮并行多个 tool_call,**两个 LLM 推理后端**行为一致 |
| `smoke-chain-fc.sh` | 链式 function call(第二步依赖第一步的输出) |
| `smoke-external.sh` | EXTERNAL 结算:商户 Pull/Notify + 四道闸 |
| `smoke-order-onchain.sh` | **订单制真钱闭环**(Aptos FA)。⚠️ 会真花钱 |

辅助:`build_testpkg.py`(多方法测试插件)、`build_chainpkg.py`(链式依赖插件)、
`seed_coins.py` / `coin_sync.py`(币种表,**decimals 从链上读回来写,不手填**)、
`mock_merchant.py`(mock 商户后台)。

## 收进仓当天就抓到的一件事

收编后第一次全套跑,`smoke-market.sh` 从 25/0 变成 23/2 —— **回归网自己落后于代码**:
订单制删掉了 `market/confirm_payment`,而这里还留着两条打那个路由的负面用例
(`smoke-market-renew.sh` 里还有第三条)。它们不是"测出了 bug",是**死用例**。

散在 `~/ci` 里没版本控制时,这种落后没人会发现 —— 因为没人会 diff 一个没有历史的目录。

## 已删

`smoke-paid-onchain.sh` —— 订单制之前的版本,打的 `market/confirm_payment` 已经 404。
留着就是一个必红的死用例。订单制版见 `smoke-order-onchain.sh`。
