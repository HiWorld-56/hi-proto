# ci/ —— CI 编排入口

`run-ci.sh` 是 gitea Actions(`.gitea/workflows/gen.yml`)调的那个脚本,
跑在 .64 的 host executor 上,以 `lo` 身份执行。

    .64:  /home/lo/ci/run-ci.sh  ->  /home/lo/ci/hi-proto/ci/run-ci.sh   (软链)
          /home/lo/ci/smoke      ->  /home/lo/ci/hi-proto/smoke          (软链)

**改脚本改仓里这份并提交**,别在 .64 上就地改 —— 否则又变回"两份各自漂"。

> 它 2026-08-16 之前没有版本控制,只躺在 .64 的 home 里。收拾 ~/ci 时被当成
> 散落副本扫进 `.attic/`,CI 从此静默停摆:job 失败了,但 proto 照推,只是不再产 tag,
> 下游按 tag 引用照样编译通过 —— 隔了三个 commit 才发现。
