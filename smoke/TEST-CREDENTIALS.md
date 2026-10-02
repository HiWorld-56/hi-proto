# 测试凭证工具(都在 .66 上)

两个工具造的是**不同体系**的 token,互不通用 —— 弄混会得到"请重新登录"这类
指不到真因的报错。

## /tmp/tokgen —— club 的登录 token

    cd /tmp/tokgen
    MN_FILE=/tmp/vclient_mn.txt DEV=embedded ./target/release/tokgen   # → type=robot
    MN_FILE=/tmp/user_mn.txt    DEV=app      ./target/release/tokgen   # → type=user

club 按 ClientInfo.dev 分流身份(handler/auth.go):`embedded` 走 RobotLogin 注册成
硬件机器人,其余走 MnemonicLogin 注册成人用户。两者行为有真实差异(人没有权限配置、
机器人有),smoke-user.sh 两个都用。

## /tmp/didtok —— hidid 的登录 token

    cd /tmp/didtok && ./target/release/didtok

输出 `DID=` / `TOKEN=`,以及续期 / 登出类冒烟要用的 `REFRESH=` 与登录时那份 ClientInfo
(`APP=` / `DEV=` / `MAC=`;2026-10-01 加,`smoke-logout.sh` 用)。每跑一次就是一次新登录,
会顶掉同一 (did, app, dev) 槽位上一次的会话。

2026-10-02 加两个环境变量(`smoke-logout.sh` 用):
- `MAC=<设备号>`:覆盖默认设备号(did 的哈希)。PC 独占槽要两台「不同设备」。
- `REQ_ID=<reqId> NODE_APP=<app> NODE_DEV=<dev>`:替**别的服务**的扫码会话签字
  (如 hi-ai `GenerateReqId` 申请出来的 reqId),只 Verify、不出 token —— token 去那个服务的
  `GetReqStatus` 取。hi-ai 要求这个 did 在 club 里有名片,先用同一个 `MN_FILE` 跑一次 tokgen。

/tmp/tokgen 同日起多输出 `APP=` / `MAC=`(登录时那份 ClientInfo,登出要原样回填)。

⚠️ **GenerateReqIdReq.did 是「应用方 did」,不是登录用户的 did**。hidid 按它分流:
等于 config 的 `hi_wallet_did` → hidid 自身登录;否则走 ThirdPartyLogin(三方=商户
登录,会报"用户需要注册为商户")。工具里默认填好了,用 APP_DID 可覆盖。

hidid 的 AUTH_SUPERADMIN = 「hidid 登录 token + 在 hi_superadmin 名单里」两关,
**club 的 token 在这里不认**。要测 hidid 超管接口:先用本工具拿 did,
insert 进 hi_superadmin,再调;测完记得删掉。

⚠️ 超管名单有 **60s 缓存**,改完 hi_superadmin 要等一分钟或重启对应服务才生效。

## 备注

.66 的 ~/.cargo/config.toml 需要 `[net] git-fetch-with-cli = true`,
否则 libgit2 拉 gitea 私有仓会 "no authentication methods succeeded"。
