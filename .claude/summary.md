# hi-proto 开发总结

## 仓库说明

protobuf 工程，统一各端数据结构与 RPC 接口标准。

- **开发分支**：`dev`
- **brain 引用方式**：`deps/hi-proto` submodule，跟踪 `origin/dev`
- **face 引用方式**：`gen_proto.sh` 从本地 hi-proto 编译 `game/asset/proto/ipc.pb`

---

## hinj 专属协议（hi/ninja/ipc.proto）

brain ↔ face 专用 IPC 协议，详见 hinj_brain 的 `.claude/protocol.md`。

### 当前 BrainToFace 字段列表

| 字段名 | 编号 | 类型 |
|--------|------|------|
| init_bot | 1 | BotInit |
| show_listen | 2 | StateToggle |
| show_emotion | 3 | Emotion |
| show_im_request | 4 | hi.club.Message |
| show_im_reply | 5 | TextReply |
| show_voice_reply | 6 | TextReply |
| show_qr_code | 7 | google.protobuf.Empty |
| event_bot | 8 | hi.Entity |
| event_master | 9 | MasterEvent |
| event_members | 10 | hi.club.GroupInfo |
| event_plugin | 11 | hi.ai.PluginItem |
| event_transaction | 12 | hi.did.Transaction |
| play_audio | 13 | AudioPlay |
| event_friend_delete | 14 | hi.Entity |
| event_friends | 15 | FriendList |
| event_friend_add | 16 | hi.Entity |
| members_init | 17 | GroupInfoList |

---

## 重要变更记录

### extra 字段重构（2026-06-15）

`hi.did.Notice` / `hi.club.Notice` / `hi.club.Message` 的 `extra` 字段统一改为：

```proto
google.protobuf.Any extra  = N;
string              ex_type = N+1;
```

**之前**（已废弃）：
```proto
hi.did.Extra extra = N;
// Extra { google.protobuf.Any extra; repeated string notes; }
```

`ex_type` 用途：配合主类型 `type` 细化语义，避免主类型分支过多。
例：`type=member-update + ex_type=base.name` 表示成员名字更新。

brain 侧影响：所有 `.get_extra()?.get_any()?.value` 改为 `.get_extra()?.value`，删除 `Extra` 中间层。
face 侧影响：`extract_group()` 中直接读 `message.extra.value`，不走 `extra.extra`。

### FriendList + GroupInfoList（2026-06-15）

新增两个批量初始化消息类型，用于 face 上线时的全量推送：

```proto
message FriendList    { repeated hi.Entity        list = 1; }
message GroupInfoList { repeated hi.club.GroupInfo list = 1; }
```

对应 BrainToFace 字段：`event_friends = 15`，`members_init = 17`。

---

## 更新 brain submodule 的正确方式

```bash
cd /home/lo/wip/hinj_brain/deps/hi-proto
git fetch origin
git checkout origin/dev
cd /home/lo/wip/hinj_brain
git add deps/hi-proto
```

**不要**直接 scp 文件覆盖 submodule 目录——那样 submodule 指针不更新，下次拉取会回退。

---

## face 更新 pb 的方式

```bash
# 在 hinj_face 项目根目录
bash gen_proto.sh
# 产物：game/asset/proto/ipc.pb
```

更新 pb 后必须同步检查 `zmq_client.lua` 的 `CMD_FIELDS`，确保新增字段已加入。
