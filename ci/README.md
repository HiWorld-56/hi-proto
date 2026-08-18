# ci/ —— CI 编排入口

`run-ci.sh` 是 gitea Actions(`.gitea/workflows/gen.yml`)调的那个脚本,
跑在 .64 的 host executor 上,以 `lo` 身份执行。

    .64:  /home/lo/ci/run-ci.sh  ->  /home/lo/ci/hi-proto/ci/run-ci.sh   (软链)
          /home/lo/ci/smoke      ->  /home/lo/ci/hi-proto/smoke          (软链)

**改脚本改仓里这份并提交**,别在 .64 上就地改 —— 否则又变回"两份各自漂"。

> 2026-08-16 收拾 ~/ci 时,活的那份被当成散落副本扫进 `.attic/`,CI 从此静默停摆:
> job 失败了,但 proto 照推,只是不再产 tag,下游按 tag 引用照样编译通过 ——
> 隔了三个 commit 才发现。
>
> 当时它**已经收进仓了**(在 `smoke/` 下),所以病根不是"没版本控制",是
> **进了仓却没接上**:软链只给 `smoke/` 拉了一根,真正的入口漏了。
> 收进版本控制这件事,没把活的那一份换成软链就等于没做。

---

## 路径过滤:什么样的 push 才会产 tag

2026-08-18 加。**只有影响生成物的改动才重生成 + 打 tag。**

| | 路径 |
|---|---|
| ✅ 触发 | `*.proto`、`codegen/`、`http/`、`buf.yaml`、`buf.lock`、`Makefile`、`release.sh` |
| ⛔ 不触发 | `smoke/`、`ci/`、`VERSION`、`README.md`、`CLAUDE.md`、`.gitignore`、`LICENSE` |

参照点是**本分支上最近一个 CI 打的 tag**（每轮 CI 都会给 hi-proto 自己打一个），
它天然就是「上一次成功生成」的水位线；tag 是整轮最后才推的，所以中途失败下一轮会重跑。

- **`main`（正式发布）不过滤** —— 发版必须出 tag，哪怕 `.proto` 与上一个 dev tag 一模一样。
- **`VERSION` 不在触发集** —— `release.sh` 压根不读它（基号只用来拼 tag 名；生成物里没有
  基号，rust crate 的 `version` 是写死的 `0.1.0`）。所以**推基号本身不产 tag**，
  要等下一个真正的 `.proto` 改动才出 `vX.Y.Z-dev.1`。**这是预期行为，不是漏打。**

### 为什么要加

只改 `smoke/` 也照样产 tag，于是历史上出现过两串同指一个 commit 的 tag：

```
v1.5.0-dev.166 / .167 / .168  → 生成物 c2faf3e4
v1.5.1 / v1.5.1-dev.1 / .2    → 生成物 563f7e58
```

后果不是「多几个 tag 不好看」：

1. 下游每次都得停下来判断「这个新号要不要跟」，答案几乎总是「不用」—— 判断成本全白付；
2. `deps.md` 为此专门备案了一节（「三个 tag 同一个 commit，不用跟」）；
3. 最糟的是它训练出**「新 tag 大概率是空的」**这种直觉 —— 真正该跟的那一次会被一起忽略。

### 改这个脚本时注意

**改动从下一轮 push 起才生效。** 脚本会先 `git reset --hard` 把自己更新掉，但 git 换的是
inode、运行中的 bash 手里还攥着旧 fd，所以**本轮跑的是上一版脚本**。
加过滤那次就多产了一个 `v1.5.2-dev.2`（旧脚本执行的），属预期。
