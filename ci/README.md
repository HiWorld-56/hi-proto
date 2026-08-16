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
