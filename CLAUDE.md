# Overview
@claude/overview.md

## 协作原则

**分析出问题，要解决问题本身，不要绕开，不要补丁。**

## 结构化数据传输原则

**payload 是数据的唯一来源，传输层 metadata 不是。**

- MQTT topic、HTTP 路由、ZMQ identity 等传输层字段只用于路由，不得作为业务数据来源。
- 任何业务所需的数据（id、名称、头像、状态……）必须在 protobuf payload 中显式定义并传递。
- 典型反例：从 MQTT topic `hiclub/v1/group/<群Id>` 切片拼出 `group_did`，然后向下传参。正确做法是在对应通知的 `extra` 里携带完整的结构体（如 `GroupBase`），接收方从 payload 解析。
- 这一原则保证：换传输层、改 topic 格式时，业务逻辑零改动；同时接收方始终拥有足够的上下文（名称、头像等），无需二次查询。

**extra 字段类型注解必须带完整包路径。**

- 注释中写 `/ hi.club.GroupBase`，不写 `/ GroupBase`，避免跨包同名歧义。
- primitive 类型（string、int 等）无法直接存入 `google.protobuf.Any`，需包装：string → `google.protobuf.StringValue`。
