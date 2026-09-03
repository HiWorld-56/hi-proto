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
| `smoke-lua.sh` | lua 插件:发版认成 LUA → 制品当场就绪 → **进下发清单**(按架构筛) |
| `smoke-lua-onrobot.sh` | lua 的**最后一环**:真机器人上模型点得动它(判据是 magic 值) |
| `smoke-plugin-lifecycle.sh` | 插件**发版之后**那 10 条路由(切版/开关/删版本/reload_api_key) |
| `smoke-lua-deps.sh` | lua 的 **C 模块依赖**五段全链(requirements.txt → 集合 → 下发 → require) |
| `null_static.sh` | 「空值改造」的**四道静态闸**,一条命令跑完 |
| `empty_in_resp.sh` | 「空值改造」的**最后一道**:真调接口,数回包里的 `"字段": ""` |

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


## 「禁止用空串表示 null」怎么验 —— 三道,缺一道就有盲区

    null_static.sh      ① 库里有 NULL、Go 是裸类型   ② Go 是指针、库里有空串
                        ③ 表覆盖对账(没写 TableName() 的模型整张表看不见)
                        ④ 活代码里不许 COALESCE(x,'')
    empty_in_resp.sh    端到端:真调接口,数回包里有多少个 `"字段": ""`
    null_test.sh        行为:不传=不动 / 传空串=真清空 / bool 不传要报错

**①②看的是库和 Go 两头,中间那一段它们都看不见。** 2026-09-03 实测过一次:
`hi_ai_plugin_version` 129 行里 108 行 logo 是 NULL、**零个空串**(②绿),
Go 那侧老老实实是 `*string`(①绿),而 `MarketDirectory.SearchListings`
回包里 92 个 `"logo": ""` —— 真因是查询里一句 `COALESCE(b.logo,'')`。
④ 就是为这一条加的,而**最终判据只能是端到端数回包**。

### ⚠️ 这一类脚本最容易出的不是红,是**空跑的绿**

同一天里三个地方栽在这上面:

| 谁 | 怎么空跑的 | 长什么样 |
|---|---|---|
| `gen_nullq.py` / `gen_emptyq.py` | 它们把 SQL 写到 `/tmp/*.sql`,**stdout 只印一句中文提示**。手敲成 `python3 gen_nullq.py > /tmp/nq.sql` 就把提示喂给了 mysql,报 1064 而错误被 `mysqlq` 的 `2>/dev/null` 吞掉 | 两道闸各扫 **0 列**,输出一片干净 |
| `codegen/check_gateway.py` | 不带仓参数时 `for repo in ARGS` 一次都不进 | 打印 ✓ 退出 0,**一个仓都没扫** |
| 六个后端的 ASCII 闸 | `go test -run TestASCII` 匹配不上真名 `TestIdentifiersMustBeASCII` | `ok ... [no tests to run]` |

所以这三处现在都会**先证明自己跑了多少**:`null_static.sh` 断言回的行数等于检查数,
`check_gateway.py` 打印扫了几个仓/几个 service 并在为 0 时退 2,
ASCII 测试打印扫了多少个 .go 文件。

`empty_in_resp.py` 同理:回包里**一个字符串字段都没有**(空列表)时报「没验(空回包)」,
不报 ✓ —— 否则一个权限不对、或这个账号本来就没数据的接口会永远绿着。


## ⚠️ 一个一个跑,别串成一批

这些脚本共用 `.66:/tmp/*_mn.txt` 那几个助记词,而**登录态是按 `(did, app, dev)` 一行的**
—— 同一个助记词再登一次,前一个 token 当场失效(`Code(103) 异地登陆`)。

所以「先把所有 token 都取好,再依次跑」这种批量写法是**坏的**:
后面的脚本自己又去取了一次,把前面预取的顶掉;而不少脚本拿到失效 token 之后
是"什么都没输出"而不是报错 —— 在批量汇总里看着像**一片空白,不像失败**。

2026-09-03 实测:同样这几个脚本,批量跑时 `smoke-market` / `smoke-lua-deps` /
`smoke-lua-onrobot` 三个都是空结果,**逐个跑全是满分**。

**要么一个一个跑,要么让每个脚本自己取 token**(多数已经是这样)。
汇总脚本如果拿不到"通过 N,失败 M"这行,必须报「没验」而不是留空。


## 「空串冒充 null」这一类,判据是**字段**不是接口

⚠️ **空集合不是缺口。** List 的元素有类型,要验的是**元素那个类型的字段**;
`[]` 里没有元素,自然什么也观察不到 —— 那不是漏验,是这里没有东西。
所以 `empty_in_resp` 不再按"哪个接口没返回行"算账,而是:

1. 从 **proto 描述符**(protoc 自己吐的,不是正则读 .proto)现算
   「这些 rpc 的回包**能**出现哪些 string 字段」;
2. 顺着 schema 走一遍真实回包,记下**哪些 (消息, 字段) 真的观察到了**;
3. 报「还有多少字段**一次都没出现过**」—— 那才是这一类 bug 还没被查过的地方。

跑法:`smoke-coverage.sh` = 先让 `smoke-market.sh` 把数据造出来(挂牌/授权/订单/凭据),
再用**同一把 token** 数覆盖(token 只取一次,否则互相顶下线)。
hi.ai 那一面要给 `AI_KEY`,而且走 **`Grpc-Metadata-ApiKey`** 头 ——
grpc-gateway 默认只透传白名单头,裸写 `ApiKey:` 会得到「apiKey是空」,
那条错看着像 key 不对,其实是**头压根没到后端**。

### 端到端够不着的那一类:`synth_empty.py`

空串不一定来自库。这一种是 **handler 自己造的**:

    var role string                 // 零值就是 ""
    if groupMember != nil { role = groupMember.Role }
    Role: proto.String(role),       // ← 不是成员时发出「有角色,它是空串」

库那两道闸比的是库和 Go 类型,`COALESCE` 那道查的是 SQL,端到端只覆盖得到
**有数据**的路由 —— 三者都够不着它。2026-09-03 用这个判据扫出**四个**,
而它们在端到端那侧全在"未观察字段"里:

  · `hi-did` mqttPassword —— 客户端拿空串去连 broker,**而 MQTT 拒绝是静默的**
  · `club` group.role —— 不是成员被发成"某种未知角色"
  · `club` user.moment —— 机器人恒发 `"moment": ""`
  · `hi-ai` chat content —— 「这是张图,地址是空串」

它是 `null_static.sh` 的**第 5 闸**。判据只做词法匹配,不做数据流分析,
所以有一条白名单(switch 的 default 直接 return 那种),**每条都写了为什么**。

### 已经自己造的夹具

拿不到就现建:一台软件助手 + 一个插件壳 + 一把 apikey + 发一版 lua + 一个挂牌(草稿)。
**跑完自己收走**(下架 → 删壳 → 删机器人),清理失败会明说。

> ⚠️ 这个脚本原来一条清理都没有,每跑一次就在开发环境留一个 `smk-emptyprobe`,
> 而它每次都报「0 失败」。2026-09-03 清出来三个,全是它留的。
