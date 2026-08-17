# smoke-market.sh —— 对话路 / 多 function call / 插件市场 的端到端冒烟

## 为什么单独一个脚本

`smoke.sh` 覆盖的是「接口存不存在、鉴权收不收、已删接口有没有复活」这一层。
而这三块的坑全在**行为**上 —— 编译过、校验脚本也过、接口照样返回 `success`,
只是干的事不对。2026-08-15 一天抓到九个,**没有一个是编译或 lint 能发现的**:

| 症状 | 真因 |
|---|---|
| 模型连调两批工具时答复凭空变空 | 没有循环概念,`answer = resp.Content` 取到空串 |
| 插件从没被调用,模型自己编了个合理答复 | `HasPrefix(name,"Python")` 是老命名的死守卫 |
| 多文件插件包 `ModuleNotFoundError` | `runpy.run_path` 不像 `python main.py` 那样加 sys.path |
| 好包发不出去 | 函数存在性校验枚举写法,漏了 re-export 的行尾形式 |
| 市场接口 grpc 通、http 全 404 | 只注册了 grpc server,漏了 grpc-gateway handler |
| 挂牌回 `code 0 success`、库里没行、uuid 是空的 | club 的 gorm 全局屏蔽了 `ErrRecordNotFound` |

## ⚠️ 验证 function call 的铁律

**看「插件真的跑没跑」,不看模型最后那句话。**

工具没被调用时,模型会自己编一个看起来完全合理的答复 ——
实测问「137+486」它自己算出 623 交差;让它复述工具原始输出,它当场编了一段 JSON。

所以测试插件里放了一个**模型不可能猜到**的 magic 值(`HI-MKT-7Q3XZ9`),
答复里出现了才算插件确实执行过。**新增插件相关用例时照此办理。**

## 用法

```bash
# 需要两个真实用户的 token(用 .66 的 /tmp/tokgen 生成)
export SELLER_TOK=... BUYER_TOK=... SELLER_DID=...
export PKG=$(python3 ~/ci/build_testpkg.py)          # 造并上传测试插件包
bash ~/ci/smoke-market.sh                            # 非 0 退出 = 有失败项

SKIP_CHAT=1 bash ~/ci/smoke-market.sh                # 跳过耗时的对话用例
```

`build_testpkg.py` 造的是**新约定**的多方法包:OpenAI tools 数组格式、
`main.py` 只做 re-export(实现在 `impl.py`,验证「文件怎么拆随便」)、
函数 `return` 结果由 runner 打印。

`mock_merchant.py` 是 EXTERNAL 结算的 mock 商户后台(Pull + Notify),
需要一个能用 did 私钥签任意文本的工具(见 /tmp/didsign)。

## 还没覆盖的

- 流式(`ConverseStream` / `ResumeStream`)的指令帧与断流续跑
- EXTERNAL 的 Pull/Notify 与三条异常路径(手工验过,没进脚本 —— 依赖签名工具)
- 并行 tool_calls(模型一次返回多个调用)两个后端行为是否一致
- 单 agent 的 tool 数量上限对准确率的影响
- 真实链上转账的 happy path(需要测试币)

## smoke-market-renew.sh —— 到期 / 续费 / 自动续费 / follow_latest

```bash
PKG=$(python3 ~/ci/build_testpkg.py)
bash ~/ci/smoke-market-renew.sh "<卖方token>" "<买方token>" "$PKG"
```

10 项。覆盖:自动续费开关(软件机器人被拒 / 越权被拒)、
续费走 ConfirmPayment 的 INSTALLED 分支且核验没过不延长、
到期扫描的两个选取条件、follow_latest 真的把跟随者切到新版。

⚠️ **测 follow_latest 必须让买方真的装上**(走免费挂牌),
不能在库里手改 grant 状态 —— 那样 ai 侧没有 c 行,`SetActive` 会正确地拒绝,
看起来像功能坏了,其实是测试搭错了。踩过一次。

## 链式 function call(smoke-chain-fc.sh)

验的是「第二个工具依赖第一个工具的输出」这条链,**不是**一次多调几个工具。

```bash
PKG=$(python3 ~/ci/build_chainpkg.py)        # 注意:要在 .65 上跑(minio 在那)
bash ~/ci/smoke-chain-fc.sh "<用户token>" "$PKG"
```

插件是两步强依赖:`get_vault_code` 吐一个码,`open_vault` **码对上了才**吐
`HI-CHAIN-4M2WQ`。所以答复里出现这个值,当且仅当四件事都成立:
①第一轮真调了 ②结果写回了消息数组 ③第二轮带着那个码调了第二个工具 ④第二轮结果又写回了。

比"天气→带不带伞"强的地方:带伞与否模型能自己推理编出来,这个 magic 值**编不出来**。
脚本里配了负面对照(叫它别调工具直接猜)来证明这一点。

已跑通:gpt-4.1-nano 与 **ministral-3(vllm)** 都走通两轮链。\n
## 在哪台机器跑

**.65**(部署机)。脚本有一半断言要查库,而 mysql 客户端只在 .65 上 —— .64 是构建机,没装。
脚本开头会检查,缺了直接退出;否则那些断言会全变成 `want=1 got=`,看上去像产品坏了。

## 流式对话(smoke-stream.sh)

```bash
bash ~/ci/smoke-stream.sh "<用户token>"
```

补它是因为**流式是 app 的主路径,却一条回归都没有**。第一次跑就撞出契约漂移:
proto 里写的帧类型是 `text`,而实现从来发的是 `msg`,另有 `end`/`info`/`event`
三种没写进文档 —— **照着 proto 写的客户端会一个字都渲染不出来**。已改 proto(dev.138)。

守着的红线:
· **`toolCalls`(指令)与 `echoToolCalls`(回显)是两个 type,不能合。**
  合了的话,一个本该可关的调试开关会把流程必需的信号一起关掉,
  而症状是"关掉回显后机器人不动了",没人会往调试开关上想。
· **错误走 info 帧,不走 grpc status** —— 否则客户端收了半截流再拿 error,
  两套错误通道并存反而更难排查。

⚠️ `msg` 里是**整段答复,不是 token 分片**。现在这条流式路的价值是错误走帧、
进度可见、以及那条指令帧,不在于逐字输出。

## 并行 tool_call · 两个推理后端(smoke-parallel.sh)

```bash
PKG=$(python3 ~/ci/build_testpkg.py)      # 在 .65 上跑
bash ~/ci/smoke-parallel.sh "<用户token>" "$PKG"
```

⚠️ **"两个后端"= 两个 LLM 推理后端**(OpenAI / 自建 vllm 上的 ministral-3),
**不是"服务端 vs 机器人"**。两条轴别混:

| 轴 | 守在哪 |
|---|---|
| 同一段代码在两个**推理后端**上一致 | 本文件。要害:回传 tool_result 时 OpenAI 不必带 tool_call,vllm 必须带 |
| 方法在**哪一边执行**(服务端插件 vs 机器人 .so) | smoke-market.sh 的"客户端工具中途返回 + Resume 续跑";NATIVE 的 allTools/internal 两个数组 |

断言分两层:①两个插件**真的都跑了**(各自的 magic 值在答复里);
②它们是**同一轮并行发出**的 —— 用流式的 echoToolCalls 帧数数,
单帧里 ≥2 条才算。只验①的话,分两轮跑也能得到同样的答复,守不住"并行"。

## EXTERNAL 外部结算(smoke-external.sh)

```bash
# 需要:/tmp/didsign(core-mqtt 的 didsign,--features testkit 编)
#       /tmp/seller_mn.txt /tmp/buyer_mn.txt(tokgen 写的助记词)
#       /tmp/grpcurl  /tmp/hi.protoset(buf build -o)
PKG=$(python3 ~/ci/build_testpkg.py)
bash ~/ci/smoke-external.sh "<卖方token>" "<买方token>" "$PKG"
```

出方向是「**商户来拉 + 回传**」而不是 club 推,理由是 **club 手里一把私钥都没有**:
让 club 主动回调三方,就得由 club 证明"这条通知是我发的" —— 它证明不了。
反过来由持私钥的商户来拉、来回传,签名方向与"谁持有密钥"天然对齐,club 只需**验签**。

⚠️ **只验"正常放行"没有意义**,这条链的价值全在四道闸上:

| 闸 | 漏了会怎样 |
|---|---|
| 验签 | 谁都能调 |
| **签名者必须是收款方** | 任何持私钥的人都能把**别人的**订单标成已支付 |
| 幂等键(grant+outer)不能空 | 重复回调无从识别 |
| 重复回调**返回成功但不重复放行** | 报错会让对方无限重试 |

最后还查一条:放行后 **ai 侧真的插了引用行** —— club 记一笔不算数,
"界面上装上了、实际没装上"是这条链最难查的失败态。
(⚠️ `hi_ai_plugin_using.source` 是**字符串** `reference`,不是整数。写断言时踩过。)

## 合约币真实支付闭环(smoke-paid-onchain.sh)⚠️ 真花钱

```bash
export HINJ_TATUM_KEY=... HINJ_APTOS_KEY=...
export ROBOT_DID=<硬件机器人did> ROBOT_MN=<它的助记词文件>
PKG=$(python3 ~/ci/build_testpkg.py)
bash ~/ci/smoke-paid-onchain.sh "<卖方token>" "<买方master token>" "<机器人token>" "$PKG"
```

前面所有付费用例都是拿假 tx_hash 验"被挡下",**这条是唯一真的把币转出去的**:
挂牌(合约币定价)→ master 申请 → 机器人真转账 → ConfirmPayment 链上核验 → 放行。

三个角色别混:**卖方**挂牌 / **买方 master** 申请(购买永远由主人发起)/
**机器人本人**交回执(钱是它自己掏的 —— 这正是自动续费那条路的形状)。

### 币种表灌数据:seed_coins.py

`hi_coin` 的 chain/contract/decimals。**decimals 从链上读回来写,不手填** ——
配错不报错,只是金额差数量级(多一位少付十倍),链上不可撤销。

⚠️ **"余额=0"不算查通了** —— 查一个不存在的合约也可能返回 0。
判据是拿假地址对比:Aptos 假合约返回 VMError/invalid_input,真合约返回 ["0"]。

### 写断言时踩的两个坑

· `case` 的 glob **不支持 `a|b` 这种或**,写了只当字面量 —— 于是"其实拦下了、
  只是拦它的是另一道闸"会被误报成失败。脚本里用 `hasany` 多模式版本。
· 同一笔转账兑第二次,被哪道闸拦取决于授权有没有期限(有期限走 TxHashUsed,
  永久授权更早被"不需要续费"挡住)。两条都是正确拒绝。
