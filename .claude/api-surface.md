# hi-proto 接口全量核对表

自动生成自 proto。档位定义见 `hi/options.proto`。

## 档位分布

| 档位 | 含义 | 数量 |
|---|---|---|
| `AUTH_TOKEN` | 用户token | 169 |
| `AUTH_API_KEY` | apiKey | 54 |
| `AUTH_NONE` | 公开 | 54 |
| `AUTH_EXTEND_TOKEN` | 商户 | 21 |
| `AUTH_WEB3` | 载荷验签 | 12 |
| `AUTH_SUPERADMIN` | 超管 | 10 |
| **合计** | | **320** |

## hi.ai

### hi.ai.Agent  <sub>(15 个:apiKey×14 用户token×1)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `ListLlmModels` | apiKey | `google.protobuf.Empty` | `ListLLMResp` |  |
| `ListEmbeddings` | apiKey | `google.protobuf.Empty` | `ListEmbeddingResp` |  |
| `ListSttModels` | apiKey | `google.protobuf.Empty` | `ListSTTResp` |  |
| `ListTtsModels` | apiKey | `google.protobuf.Empty` | `ListTTSResp` |  |
| `AgentConfig` | apiKey | `google.protobuf.Empty` | `AgentConfigResp` |  |
| `CreateAgent` | apiKey | `CreateAgentReq` | `CreateAgentResp` |  |
| `EditAgent` | apiKey | `EditAgentReq` | `google.protobuf.Empty` |  |
| `List` | apiKey | `ListAgentReq` | `ListAgentResp` | 公开;合并原 ListAgent + ListAgentByDids |
| `ListFavorites` | 用户token | `ListFavoriteReq` | `ListAgentResp` | 需鉴权;合并原 ListFavoriteAgents + FavoriteAgentListByDIDs |
| `DeleteAgent` | apiKey | `DeleteAgentReq` | `google.protobuf.Empty` |  |
| `FindAgent` | apiKey | `FindAgentReq` | `FindAgentResp` |  |
| `FindAgentCount` | apiKey | `FindAgentCountReq` | `FindAgentCountResp` |  |
| `Transfer` | apiKey | `TransferReq` | `google.protobuf.Empty` |  |
| `UpdatesToDefault` | apiKey | `UpdatesToDefaultReq` | `google.protobuf.Empty` |  |
| `FavoriteAgent` | apiKey | `FavoriteAgentReq` | `google.protobuf.Empty` |  |

### hi.ai.AiPlugin  <sub>(4 个:公开×4)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `Search` | **公开** | `SearchReq` | `SearchResp` |  |
| `Python` | **公开** | `PythonReq` | `PythonResp` |  |
| `PythonProject` | **公开** | `PythonProjectReq` | `PythonResp` |  |
| `CleanupPythonProject` | **公开** | `CleanupPythonProjectReq` | `google.protobuf.Empty` |  |

### hi.ai.ApiKey  <sub>(4 个:用户token×4)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `Create` | 用户token | `google.protobuf.Empty` | `CreateApiKeyResp` |  |
| `Edit` | 用户token | `EditApiKeyReq` | `EditApiKeyResp` |  |
| `List` | 用户token | `hi.Pagination` | `ListApiKeyResp` |  |
| `Delete` | 用户token | `DeleteApiKeyReq` | `google.protobuf.Empty` |  |

### hi.ai.Auth  <sub>(3 个:公开×3)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `RefreshToken` | **公开** | `hi.did.RefreshTokenReq` | `hi.AuthToken` | 不鉴权 |
| `GenerateReqId` | **公开** | `hi.did.GenerateReqIdReq` | `hi.RequestId` | 不鉴权 |
| `GetReqStatus` | **公开** | `hi.RequestId` | `hi.did.ReqStatusResp` |  |

### hi.ai.Base  <sub>(2 个:公开×2)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `ListSuperAdminUsers` | **公开** | `google.protobuf.Empty` | `hi.did.ListSuperAdminUsersResp` | 不鉴权 |
| `ServerVersion` | **公开** | `google.protobuf.Empty` | `hi.ServerVersionResp` | 不鉴权:查服务自身版本+环境 |

### hi.ai.Chat  <sub>(16 个:apiKey×13 用户token×3)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `Simple` | apiKey | `SimpleReq` | `DialogResp` |  |
| `GenerateCid` | apiKey | `google.protobuf.Empty` | `GenerateCidResp` |  |
| `Dialog` | apiKey | `DialogReq` | `DialogResp` |  |
| `DialogStream` | 用户token | `DialogReq` | `stream DialogStreamResp` |  |
| `ClearContext` | apiKey | `ClearContextReq` | `google.protobuf.Empty` |  |
| `GetContext` | apiKey | `GetContextReq` | `GetContextResp` |  |
| `ListAgentDelays` | 用户token | `ListAgentDelayReq` | `ListAgentDelayResp` |  |
| `GetAgentDelay` | 用户token | `GetAgentDelayReq` | `GetAgentDelayResp` |  |
| `SimpleTextToSpeech` | apiKey | `SimpleTextToSpeechReq` | `SimpleTextToSpeechResp` |  |
| `SimpleSpeechToText` | apiKey | `SimpleSpeechToTextReq` | `SimpleSpeechToTextResp` |  |
| `SpeechToSpeech` | apiKey | `SpeechToSpeechReq` | `ChatResp` |  |
| `SpeechToSpeech2` | apiKey | `ToolCallResultsReq` | `ChatResp` |  |
| `TextToText` | apiKey | `TextToTextReq` | `ChatResp` |  |
| `TextToText2` | apiKey | `ToolCallResultsReq` | `ChatResp` |  |
| `SpeechToText` | apiKey | `SpeechToTextReq` | `ChatResp` |  |
| `SpeechToText2` | apiKey | `ToolCallResultsReq` | `ChatResp` |  |

### hi.ai.Health  <sub>(1 个:用户token×1)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `Check` | 用户token | `google.protobuf.Empty` | `google.protobuf.Empty` | 不鉴权 |

### hi.ai.InviteCode  <sub>(5 个:用户token×4 公开×1)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `Create` | 用户token | `google.protobuf.Empty` | `hi.did.InviteCodeCreateResp` | Token鉴权 |
| `Edit` | 用户token | `hi.did.InviteCodeEditReq` | `google.protobuf.Empty` | Token鉴权 |
| `List` | 用户token | `hi.Pagination` | `hi.did.InviteCodeListResp` | Token鉴权 |
| `Delete` | 用户token | `hi.did.InviteCodeDeleteReq` | `google.protobuf.Empty` | Token鉴权 |
| `Verify` | **公开** | `hi.did.InviteCodeVerifyReq` | `hi.AuthToken` | 不鉴权 |

### hi.ai.Plugin  <sub>(13 个:apiKey×13)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `DrawConfig` | apiKey | `google.protobuf.Empty` | `DrawConfigResp` |  |
| `PluginSwitch` | apiKey | `PluginSwitchReq` | `PluginSwitchResp` |  |
| `SearchCreate` | apiKey | `SearchCreateReq` | `google.protobuf.Empty` |  |
| `PythonCreate` | apiKey | `PythonCreateReq` | `PythonCreateResp` | 创建Python插件 |
| `DrawCreate` | apiKey | `DrawCreateReq` | `DrawCreateResp` |  |
| `List` | apiKey | `ListPluginReq` | `ListPluginResp` |  |
| `Delete` | apiKey | `DeletePluginReq` | `google.protobuf.Empty` |  |
| `DeleteByDids` | apiKey | `DeletePluginByDidsReq` | `google.protobuf.Empty` |  |
| `Edit` | apiKey | `EditPluginReq` | `google.protobuf.Empty` | 编辑插件 |
| `GetDraw` | apiKey | `GetDrawReq` | `GetDrawResp` |  |
| `PythonParamsSet` | apiKey | `PythonParamsSetReq` | `google.protobuf.Empty` | 设置Python插件参数 |
| `GetPythonParams` | apiKey | `GetPythonParamsReq` | `GetPythonParamsResp` |  |
| `GetPlugin` | apiKey | `GetPluginReq` | `GetPluginResp` |  |

### hi.ai.PluginEndpoint  <sub>(2 个:用户token×2)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `Set` | 用户token | `EndpointSetReq` | `google.protobuf.Empty` | Token鉴权 |
| `Get` | 用户token | `google.protobuf.Empty` | `EndpointGetResp` | Token鉴权 |

### hi.ai.Setting  <sub>(2 个:用户token×2)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `Edit` | 用户token | `SettingEditReq` | `google.protobuf.Empty` |  |
| `Get` | 用户token | `google.protobuf.Empty` | `SettingGetResp` |  |

### hi.ai.Training  <sub>(14 个:apiKey×14)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `TrainingAgent` | apiKey | `TrainingAgentReq` | `google.protobuf.Empty` | 启动训练 |
| `TrainingStatus` | apiKey | `TrainingStatusReq` | `TrainingStatusResp` | 获取训练状态 |
| `TrainingClear` | apiKey | `TrainingClearReq` | `google.protobuf.Empty` | 清除训练状态 |
| `UploadFile` | apiKey | `UploadFileReq` | `google.protobuf.Empty` | 上传训练文件 |
| `ListAgentFiles` | apiKey | `ListAgentFileReq` | `ListAgentFileResp` | 获取训练文件列表 |
| `DeleteAgentFile` | apiKey | `DeleteAgentFileReq` | `google.protobuf.Empty` | 删除训练文件 |
| `DeleteAgentFiles` | apiKey | `DeleteAgentFilesReq` | `google.protobuf.Empty` | 批量删除训练文件 |
| `DeleteAgentFilesByDid` | apiKey | `DeleteAgentFilesByDidReq` | `google.protobuf.Empty` | 通过智能体did删除训练文件 |
| `GetAgentFile` | apiKey | `GetAgentFileReq` | `GetAgentFileResp` |  |
| `UpdateContent` | apiKey | `UpdateContentReq` | `google.protobuf.Empty` |  |
| `CreateContent` | apiKey | `CreateContentReq` | `CreateContentResp` |  |
| `EditDigest` | apiKey | `EditDigestReq` | `google.protobuf.Empty` |  |
| `SetMemModel` | apiKey | `SetMemModelReq` | `google.protobuf.Empty` |  |
| `GetMemModel` | apiKey | `GetMemModelReq` | `GetMemModelResp` |  |

### hi.ai.UserACL  <sub>(5 个:超管×4 用户token×1)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `Add` | **超管** | `UserACLAddReq` | `google.protobuf.Empty` |  |
| `Delete` | **超管** | `UserACLDeleteReq` | `google.protobuf.Empty` |  |
| `List` | **超管** | `UserACLListReq` | `UserACLListResp` |  |
| `ListTypes` | 用户token | `google.protobuf.Empty` | `UserACLListTypeResp` |  |
| `Edit` | **超管** | `UserACLEditReq` | `google.protobuf.Empty` |  |

### hi.ai.UserCallback  <sub>(1 个:公开×1)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `GetUserApiKey` | **公开** | `GetUserApiKeyReq` | `GetUserApiKeyResp` | 获取用户API Key和基础信息 |

## hi.club

### hi.club.Agent  <sub>(19 个:用户token×16 公开×3)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `ListLlmModels` | 用户token | `google.protobuf.Empty` | `hi.ai.ListLLMResp` |  |
| `ListEmbeddings` | 用户token | `google.protobuf.Empty` | `hi.ai.ListEmbeddingResp` |  |
| `ListSttModels` | 用户token | `google.protobuf.Empty` | `hi.ai.ListSTTResp` |  |
| `ListTtsModels` | 用户token | `google.protobuf.Empty` | `hi.ai.ListTTSResp` |  |
| `AgentConfig` | 用户token | `google.protobuf.Empty` | `hi.ai.AgentConfigResp` |  |
| `CreateAgent` | 用户token | `hi.ai.CreateAgentReq` | `hi.ai.CreateAgentResp` |  |
| `EditAgent` | 用户token | `hi.ai.EditAgentReq` | `google.protobuf.Empty` |  |
| `List` | **公开** | `hi.ai.ListAgentReq` | `hi.ai.ListAgentResp` | 公开(免鉴权);转发 ai.Agent.List;合并原 ListAgentByDids |
| `ListFavorites` | 用户token | `hi.ai.ListFavoriteReq` | `hi.ai.ListAgentResp` | 需鉴权;转发 ai.Agent.ListFavorites;合并原 ListFavoriteAgents + FavoriteAgentListByDIDs |
| `DeleteAgent` | 用户token | `hi.ai.DeleteAgentReq` | `google.protobuf.Empty` |  |
| `FindAgent` | 用户token | `hi.ai.FindAgentReq` | `hi.ai.FindAgentResp` |  |
| `FindAgentCount` | 用户token | `hi.ai.FindAgentCountReq` | `hi.ai.FindAgentCountResp` |  |
| `Transfer` | 用户token | `hi.ai.TransferReq` | `google.protobuf.Empty` |  |
| `FavoriteAgent` | 用户token | `hi.ai.FavoriteAgentReq` | `google.protobuf.Empty` |  |
| `BindMaster` | 用户token | `BindMasterReq` | `google.protobuf.Empty` | 绑定智能体 |
| `UnbindMaster` | 用户token | `UnbindMasterReq` | `google.protobuf.Empty` | 解绑智能体 |
| `BindStatus` | 用户token | `BindStatusReq` | `BindStatusResp` | 智能体绑定状态 |
| `ListOnline` | **公开** | `ListOnlineReq` | `ListOnlineResp` | 在线智能体(club 本地 presence);owner_did 可选,空=全部 |
| `GetAgentMaster` | **公开** | `GetAgentMasterReq` | `GetAgentMasterResp` | 智能体主人 |

### hi.club.AgentMarket  <sub>(1 个:用户token×1)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `ListByClass` | 用户token | `hi.did.AgentListByClassReq` | `hi.did.AgentListByClassResp` | Token鉴权 |

### hi.club.ApiKey  <sub>(4 个:用户token×4)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `Create` | 用户token | `hi.did.CreateApiKeyReq` | `hi.did.CreateApiKeyResp` |  |
| `Edit` | 用户token | `hi.did.EditApiKeyReq` | `hi.did.EditApiKeyResp` |  |
| `List` | 用户token | `hi.did.ListApiKeyReq` | `hi.did.ListApiKeyResp` |  |
| `Delete` | 用户token | `hi.did.DeleteApiKeyReq` | `google.protobuf.Empty` |  |

### hi.club.Assets  <sub>(1 个:公开×1)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `GetUserAssets` | **公开** | `hi.did.GetUserAssetsReq` | `hi.did.GetUserAssetsResp` |  |

### hi.club.Auth  <sub>(4 个:公开×3 载荷验签×1)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `RefreshToken` | **公开** | `hi.did.RefreshTokenReq` | `hi.AuthToken` | 不鉴权 |
| `GenerateReqId` | **公开** | `hi.did.GenerateReqIdReq` | `hi.RequestId` | 不鉴权 |
| `GetReqStatus` | **公开** | `hi.RequestId` | `hi.did.ReqStatusResp` | 不鉴权 |
| `Verify` | **载荷验签** | `hi.SignedData` | `LoginResp` | Web3鉴权 / hi.did.LoginReq |

### hi.club.Base  <sub>(5 个:公开×3 用户token×2)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `ListCoins` | 用户token | `google.protobuf.Empty` | `hi.did.ListCoinsResp` | 不鉴权 |
| `LatestVersion` | **公开** | `hi.did.LatestVersionReq` | `hi.did.LatestVersionResp` | 不鉴权 |
| `ListSuperAdminUsers` | **公开** | `google.protobuf.Empty` | `hi.did.ListSuperAdminUsersResp` | 不鉴权 |
| `GetConfig` | 用户token | `GetConfigReq` | `GetConfigResp` | Token鉴权 |
| `ServerVersion` | **公开** | `google.protobuf.Empty` | `hi.ServerVersionResp` | 不鉴权:查服务自身版本+环境 |

### hi.club.Chat  <sub>(14 个:用户token×14)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `Simple` | 用户token | `SimpleReq` | `hi.ai.DialogResp` |  |
| `GenerateCid` | 用户token | `google.protobuf.Empty` | `hi.ai.GenerateCidResp` |  |
| `Dialog` | 用户token | `DialogReq` | `hi.ai.DialogResp` |  |
| `DialogStream` | 用户token | `DialogReq` | `stream hi.ai.DialogStreamResp` |  |
| `ClearContext` | 用户token | `hi.ai.ClearContextReq` | `google.protobuf.Empty` |  |
| `GetContext` | 用户token | `hi.ai.GetContextReq` | `GetContextResp` |  |
| `SimpleTextToSpeech` | 用户token | `hi.ai.SimpleTextToSpeechReq` | `hi.ai.SimpleTextToSpeechResp` |  |
| `SimpleSpeechToText` | 用户token | `hi.ai.SimpleSpeechToTextReq` | `hi.ai.SimpleSpeechToTextResp` |  |
| `SpeechToSpeech` | 用户token | `SpeechToSpeechReq` | `hi.ai.ChatResp` |  |
| `SpeechToSpeech2` | 用户token | `ToolCallResultsReq` | `hi.ai.ChatResp` |  |
| `TextToText` | 用户token | `TextToTextReq` | `hi.ai.ChatResp` |  |
| `TextToText2` | 用户token | `ToolCallResultsReq` | `hi.ai.ChatResp` |  |
| `SpeechToText` | 用户token | `SpeechToTextReq` | `hi.ai.ChatResp` |  |
| `SpeechToText2` | 用户token | `ToolCallResultsReq` | `hi.ai.ChatResp` |  |

### hi.club.GatewayConfig  <sub>(1 个:公开×1)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `List` | **公开** | `google.protobuf.Empty` | `hi.did.GatewayConfigListResp` |  |

### hi.club.Group  <sub>(17 个:用户token×17)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `Get` | 用户token | `GetGroupReq` | `GroupBase` | 群信息 |
| `Create` | 用户token | `CreateGroupReq` | `GroupBase` | 创建群 |
| `CreateSingle` | 用户token | `CreateSingleReq` | `GroupBase` | 创建单聊群 |
| `Update` | 用户token | `GroupBase` | `google.protobuf.Empty` | 更新群(直接传 GroupBase;清空背景=传空串) |
| `ListMembers` | 用户token | `ListGroupMemberReq` | `GroupInfo` | 群成员列表 |
| `ListQ3GroupMembers` | 用户token | `ListQ3GroupMemberReq` | `Q3GroupInfo` | Q3群成员列表 |
| `GetMemberTotal` | 用户token | `GetGroupMemberTotalReq` | `GetGroupMemberTotalResp` | 群成员总数 |
| `Invite` | 用户token | `InviteGroupReq` | `google.protobuf.Empty` | 群邀请 |
| `Join` | 用户token | `JoinGroupReq` | `google.protobuf.Empty` | 主动加群 |
| `Quit` | 用户token | `QuitGroupReq` | `google.protobuf.Empty` | 主动退群/解散群 |
| `Remove` | 用户token | `RemoveGroupReq` | `google.protobuf.Empty` | 移出群聊 |
| `ListMessages` | 用户token | `ListGroupMessageReq` | `ListGroupMessageResp` | 群消息列表 |
| `UpdateLastUUID` | 用户token | `LastUUID` | `google.protobuf.Empty` | 更新LastUUID |
| `CheckLastUUID` | 用户token | `ListLastUUID` | `ListLastUUID` | 检查LastUUID |
| `SetRole` | 用户token | `SetRoleReq` | `google.protobuf.Empty` | 设置/取消群管理员 |
| `GetRole` | 用户token | `GetRoleReq` | `GetRoleResp` | 获取群成员角色 |
| `Mute` | 用户token | `MuteGroupReq` | `google.protobuf.Empty` | 设置/取消群管理员 |

### hi.club.Health  <sub>(1 个:公开×1)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `Check` | **公开** | `google.protobuf.Empty` | `google.protobuf.Empty` | 不鉴权 |

### hi.club.Merchant  <sub>(2 个:用户token×1 超管×1)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `List` | 用户token | `google.protobuf.Empty` | `hi.did.MerchantListResp` | 查询用户所在的商户列表 |
| `ListAll` | **超管** | `hi.Pagination` | `hi.did.MerchantListResp` |  |

### hi.club.Order  <sub>(2 个:载荷验签×2)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `GetNotPulledPcOrders` | **载荷验签** | `hi.SignedData` | `GetNotPulledPcOrdersResp` |  |
| `UpdatePulledPcOrders` | **载荷验签** | `hi.SignedData` | `google.protobuf.Empty` |  |

### hi.club.Plugin  <sub>(12 个:用户token×12)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `DrawConfig` | 用户token | `google.protobuf.Empty` | `hi.ai.DrawConfigResp` |  |
| `PluginSwitch` | 用户token | `hi.ai.PluginSwitchReq` | `hi.ai.PluginSwitchResp` |  |
| `SearchCreate` | 用户token | `hi.ai.SearchCreateReq` | `google.protobuf.Empty` |  |
| `PythonCreate` | 用户token | `hi.ai.PythonCreateReq` | `hi.ai.PythonCreateResp` | 创建Python插件 |
| `DrawCreate` | 用户token | `hi.ai.DrawCreateReq` | `hi.ai.DrawCreateResp` |  |
| `List` | 用户token | `hi.ai.ListPluginReq` | `hi.ai.ListPluginResp` |  |
| `Delete` | 用户token | `hi.ai.DeletePluginReq` | `google.protobuf.Empty` |  |
| `DeleteByDids` | 用户token | `hi.ai.DeletePluginByDidsReq` | `google.protobuf.Empty` |  |
| `Edit` | 用户token | `hi.ai.EditPluginReq` | `google.protobuf.Empty` |  |
| `GetDraw` | 用户token | `hi.ai.GetDrawReq` | `hi.ai.GetDrawResp` |  |
| `PythonParamsSet` | 用户token | `hi.ai.PythonParamsSetReq` | `google.protobuf.Empty` | 设置Python插件参数 |
| `GetPythonParams` | 用户token | `hi.ai.GetPythonParamsReq` | `hi.ai.GetPythonParamsResp` |  |

### hi.club.Price  <sub>(1 个:公开×1)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `GetPrice` | **公开** | `hi.did.GetPriceReq` | `hi.did.GetPriceResp` | 不鉴权 |

### hi.club.Publisher  <sub>(1 个:用户token×1)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `Publish` | 用户token | `PublishReq` | `google.protobuf.Empty` | Token鉴权 |

### hi.club.PushManager  <sub>(2 个:用户token×2)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `Register` | 用户token | `PushRegisterReq` | `google.protobuf.Empty` |  |
| `Unregister` | 用户token | `PushUnregisterReq` | `google.protobuf.Empty` |  |

### hi.club.Q3  <sub>(5 个:用户token×5)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `GetInfos` | 用户token | `Q3GetInfosReq` | `Q3GetInfosResp` |  |
| `Create` | 用户token | `Q3GroupCreateReq` | `Q3GroupCreateResp` | 创建群 |
| `Event` | 用户token | `Q3GroupEventReq` | `google.protobuf.Empty` | 群事件 |
| `Ready` | 用户token | `Q3GroupReadyReq` | `Q3GroupReadyResp` | 群就绪 |
| `Hosting` | 用户token | `Q3HostingReq` | `google.protobuf.Empty` | 设置托管 |

### hi.club.Trade  <sub>(6 个:用户token×5 超管×1)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `GetTradeFee` | 用户token | `GetTradeFeeReq` | `GetTradeFeeResp` |  |
| `GetTrade` | 用户token | `GetTradeReq` | `GetTradeResp` |  |
| `AddTrade` | 用户token | `AddTradeReq` | `AddTradeResp` |  |
| `UpdateTransHash` | 用户token | `UpdateTransHashReq` | `google.protobuf.Empty` |  |
| `List` | 用户token | `ListTradeReq` | `ListTradeResp` |  |
| `ListAll` | **超管** | `ListAllTradeReq` | `ListTradeResp` |  |

### hi.club.Training  <sub>(13 个:用户token×13)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `TrainingAgent` | 用户token | `hi.ai.TrainingAgentReq` | `google.protobuf.Empty` | 启动训练 |
| `TrainingStatus` | 用户token | `hi.ai.TrainingStatusReq` | `hi.ai.TrainingStatusResp` | 获取训练状态 |
| `TrainingClear` | 用户token | `hi.ai.TrainingClearReq` | `google.protobuf.Empty` | 清除训练状态 |
| `UploadFile` | 用户token | `hi.ai.UploadFileReq` | `google.protobuf.Empty` | 上传训练文件 |
| `ListAgentFiles` | 用户token | `hi.ai.ListAgentFileReq` | `hi.ai.ListAgentFileResp` | 获取训练文件列表 |
| `DeleteAgentFile` | 用户token | `hi.ai.DeleteAgentFileReq` | `google.protobuf.Empty` | 删除训练文件 |
| `DeleteAgentFiles` | 用户token | `hi.ai.DeleteAgentFilesReq` | `google.protobuf.Empty` | 批量删除训练文件 |
| `GetAgentFile` | 用户token | `hi.ai.GetAgentFileReq` | `hi.ai.GetAgentFileResp` |  |
| `UpdateContent` | 用户token | `hi.ai.UpdateContentReq` | `google.protobuf.Empty` |  |
| `CreateContent` | 用户token | `hi.ai.CreateContentReq` | `hi.ai.CreateContentResp` |  |
| `EditDigest` | 用户token | `hi.ai.EditDigestReq` | `google.protobuf.Empty` |  |
| `SetMemModel` | 用户token | `hi.ai.SetMemModelReq` | `google.protobuf.Empty` |  |
| `GetMemModel` | 用户token | `hi.ai.GetMemModelReq` | `hi.ai.GetMemModelResp` |  |

### hi.club.User  <sub>(16 个:用户token×16)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `GetCurrentUser` | 用户token | `google.protobuf.Empty` | `UserInfo` | 当前用户信息 |
| `UpdateUser` | 用户token | `UpdateUserReq` | `google.protobuf.Empty` | 用户信息 |
| `ListSystemMessages` | 用户token | `ListSystemMessageReq` | `SystemMessages` | 系统消息列表 |
| `DeleteSystemMessage` | 用户token | `DeleteSystemMessageReq` | `google.protobuf.Empty` | 删除系统消息 |
| `DeleteAllSystemMessage` | 用户token | `google.protobuf.Empty` | `google.protobuf.Empty` | 删除所有系统消息 |
| `HandleSystemMessage` | 用户token | `HandleSystemMessageReq` | `google.protobuf.Empty` | 处理系统消息 |
| `ListFriends` | 用户token | `google.protobuf.Empty` | `RelationListResp` | 当前用户好友(friend 关系) |
| `ListServitors` | 用户token | `google.protobuf.Empty` | `RelationListResp` | 当前用户仆从(master 关系,人或 bot) |
| `ListRelations` | 用户token | `google.protobuf.Empty` | `ListRelationsResp` | 一次拿好友+仆从(同表,省初始化两次调用) |
| `AddFriend` | 用户token | `AddFriendReq` | `AddFriendResp` | 添加好友 |
| `DeleteFriend` | 用户token | `DeleteFriendReq` | `google.protobuf.Empty` | 删除好友 |
| `ListGroups` | 用户token | `google.protobuf.Empty` | `ListGroupResp` | 当前用户所在的群列表 |
| `GetOther` | 用户token | `GetUserReq` | `hi.Entity` | 根据DID获取用户基本信息 |
| `UnprocessedSysMsgCount` | 用户token | `google.protobuf.Empty` | `UnprocessedSysMsgCountResp` |  |
| `SetRemark` | 用户token | `SetRemarkReq` | `google.protobuf.Empty` |  |
| `ListOnlineUsers` | 用户token | `ListOnlineUserReq` | `ListOnlineUserResp` | 在线用户列表 |

### hi.club.UserACL  <sub>(5 个:超管×4 用户token×1)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `Add` | **超管** | `hi.ai.UserACLAddReq` | `google.protobuf.Empty` |  |
| `Delete` | **超管** | `hi.ai.UserACLDeleteReq` | `google.protobuf.Empty` |  |
| `List` | **超管** | `hi.ai.UserACLListReq` | `hi.ai.UserACLListResp` |  |
| `ListTypes` | 用户token | `google.protobuf.Empty` | `hi.ai.UserACLListTypeResp` |  |
| `Edit` | **超管** | `hi.ai.UserACLEditReq` | `google.protobuf.Empty` |  |

### hi.club.UserExtension  <sub>(1 个:用户token×1)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `Get` | 用户token | `hi.did.UserExtensionGetReq` | `hi.did.UserExtensionGetResp` |  |

### hi.club.Wallet  <sub>(1 个:用户token×1)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `UpdateAddresses` | 用户token | `hi.SignedData` | `google.protobuf.Empty` | Web3鉴权 // UpdateAddressesReq |

## hi.did

### hi.did.AgentMarket  <sub>(6 个:用户token×5 商户×1)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `List` | 用户token | `AgentListReq` | `AgentListResp` | Token鉴权 |
| `ListByClass` | **商户** | `AgentListByClassReq` | `AgentListByClassResp` | ExtendToken鉴权 |
| `Create` | 用户token | `AgentInfo` | `google.protobuf.Empty` | Token鉴权 |
| `Edit` | 用户token | `AgentInfo` | `google.protobuf.Empty` | Token鉴权 |
| `Delete` | 用户token | `AgentDeleteReq` | `google.protobuf.Empty` | Token鉴权 |
| `UpdateOrder` | 用户token | `AgentUpdateOrderReq` | `google.protobuf.Empty` | Token鉴权 |

### hi.did.ApiKey  <sub>(5 个:商户×5)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `Create` | **商户** | `CreateApiKeyReq` | `CreateApiKeyResp` |  |
| `Edit` | **商户** | `EditApiKeyReq` | `EditApiKeyResp` |  |
| `List` | **商户** | `ListApiKeyReq` | `ListApiKeyResp` |  |
| `Delete` | **商户** | `DeleteApiKeyReq` | `google.protobuf.Empty` |  |
| `Get` | **商户** | `GetApiKeyReq` | `GetApiKeyResp` |  |

### hi.did.Assist  <sub>(1 个:载荷验签×1)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `VerifySignature` | **载荷验签** | `hi.SignedData` | `hi.DID` | Web3鉴权 |

### hi.did.Auth  <sub>(7 个:载荷验签×4 公开×3)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `RefreshToken` | **公开** | `RefreshTokenReq` | `hi.AuthToken` | 不鉴权 |
| `Verify` | **载荷验签** | `hi.SignedData` | `LoginResp` | LoginReq // Web3鉴权 |
| `VerifyOffline` | **载荷验签** | `hi.SignedData` | `LoginResp` | 内部服务使用 Web3鉴权 |
| `GenerateReqId` | **公开** | `GenerateReqIdReq` | `hi.RequestId` | 不鉴权 |
| `GetReqStatus` | **公开** | `hi.RequestId` | `ReqStatusResp` | 不鉴权 |
| `Notify` | **载荷验签** | `hi.SignedData` | `google.protobuf.Empty` | LoginReq // Web3鉴权 |
| `Logout` | **载荷验签** | `hi.SignedData` | `google.protobuf.Empty` | Web3鉴权 |

### hi.did.Base  <sub>(4 个:公开×4)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `ListCoins` | **公开** | `google.protobuf.Empty` | `ListCoinsResp` | 不鉴权 |
| `LatestVersion` | **公开** | `LatestVersionReq` | `LatestVersionResp` | 不鉴权 |
| `ListSuperAdminUsers` | **公开** | `google.protobuf.Empty` | `ListSuperAdminUsersResp` | 不鉴权 |
| `ServerVersion` | **公开** | `google.protobuf.Empty` | `hi.ServerVersionResp` | 不鉴权:查服务自身版本+环境 |

### hi.did.DApp  <sub>(8 个:用户token×8)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `ListByClass` | 用户token | `google.protobuf.Empty` | `DAppListByClassResp` | Token鉴权 |
| `GetRWA` | 用户token | `google.protobuf.Empty` | `DAppGetRWAResp` | Token鉴权 |
| `GetTop` | 用户token | `google.protobuf.Empty` | `DAppInfo` | Token鉴权 |
| `UpdateTop` | 用户token | `DAppUpdateTopReq` | `google.protobuf.Empty` | Token鉴权 |
| `Create` | 用户token | `DAppInfo` | `google.protobuf.Empty` | Token鉴权 |
| `Edit` | 用户token | `DAppInfo` | `google.protobuf.Empty` | Token鉴权 |
| `UpdateOrder` | 用户token | `DAppUpdateOrderReq` | `google.protobuf.Empty` | Token鉴权 |
| `Delete` | 用户token | `DAppDeleteReq` | `google.protobuf.Empty` | Token鉴权 |

### hi.did.GatewayConfig  <sub>(2 个:公开×1 用户token×1)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `List` | **公开** | `google.protobuf.Empty` | `GatewayConfigListResp` |  |
| `Set` | 用户token | `GatewayConfigSetReq` | `google.protobuf.Empty` |  |

### hi.did.Health  <sub>(1 个:公开×1)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `Check` | **公开** | `google.protobuf.Empty` | `google.protobuf.Empty` | 不鉴权 |

### hi.did.InviteCode  <sub>(5 个:用户token×4 公开×1)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `Create` | 用户token | `google.protobuf.Empty` | `InviteCodeCreateResp` | Token鉴权 |
| `Edit` | 用户token | `InviteCodeEditReq` | `google.protobuf.Empty` | Token鉴权 |
| `List` | 用户token | `hi.Pagination` | `InviteCodeListResp` | Token鉴权 |
| `Delete` | 用户token | `InviteCodeDeleteReq` | `google.protobuf.Empty` | Token鉴权 |
| `Verify` | **公开** | `InviteCodeVerifyReq` | `hi.AuthToken` | 不鉴权 |

### hi.did.LoginCallback  <sub>(1 个:载荷验签×1)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `Login` | **载荷验签** | `hi.SignedData` | `google.protobuf.Empty` | LoginReq // Web3鉴权 |

### hi.did.Merchant  <sub>(11 个:商户×9 用户token×2)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `Get` | 用户token | `google.protobuf.Empty` | `MerchantGetResp` | Token鉴权 |
| `Set` | 用户token | `MerchantSetReq` | `google.protobuf.Empty` | Token鉴权 |
| `GetUserProfile` | **商户** | `hi.DID` | `GetUserProfileResp` | ExtendToken鉴权 |
| `SetUserProfile` | **商户** | `SetUserProfileReq` | `google.protobuf.Empty` | ExtendToken鉴权 |
| `GetMerchant` | **商户** | `hi.DID` | `MerchantGetResp` | 此前误在免鉴权表里 |
| `ListGrants` | **商户** | `google.protobuf.Empty` | `ListGrantsResp` | 我授权了哪些商户 |
| `AddGrant` | **商户** | `GrantReq` | `google.protobuf.Empty` | 授权某商户访问我的数据 |
| `RemoveGrant` | **商户** | `GrantReq` | `google.protobuf.Empty` | 取消授权 |
| `ListUsers` | **商户** | `MerchantUsersListReq` | `MerchantUsersListResp` |  |
| `SaveUsers` | **商户** | `MerchantUsersSaveReq` | `google.protobuf.Empty` | ExtendToken鉴权, 批量添加商户的用户 |
| `DeleteUsers` | **商户** | `MerchantUsersDeleteReq` | `google.protobuf.Empty` | ExtendToken鉴权，批量删除商户的用户 |

### hi.did.MerchantManage  <sub>(3 个:用户token×2 商户×1)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `List` | **商户** | `MerchantManageListReq` | `MerchantManageListResp` | 管理面:全部商户;此前误在免鉴权表里(免登录可拉全量) |
| `Delete` | 用户token | `hi.DID` | `google.protobuf.Empty` | Token鉴权 |
| `Edit` | 用户token | `MerchantManageEditReq` | `google.protobuf.Empty` | Token鉴权 |

### hi.did.Pay  <sub>(2 个:公开×1 载荷验签×1)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `GenerateReq` | **公开** | `hi.ClientInfo` | `hi.RequestId` | 不鉴权 |
| `Notify` | **载荷验签** | `hi.SignedData` | `google.protobuf.Empty` | Order // Web3鉴权 |

### hi.did.PayCallback  <sub>(1 个:载荷验签×1)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `Pay` | **载荷验签** | `hi.SignedData` | `google.protobuf.Empty` | PayData // Web3鉴权 |

### hi.did.Price  <sub>(1 个:公开×1)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `GetPrice` | **公开** | `GetPriceReq` | `GetPriceResp` | 不鉴权 |

### hi.did.SSE  <sub>(2 个:用户token×1 公开×1)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `OrderEvents` | 用户token | `hi.DID` | `stream OrderEventResp` | 不鉴权 |
| `Notify` | **公开** | `MerchantNotifyReq` | `google.protobuf.Empty` | 不鉴权 |

### hi.did.Transfer  <sub>(3 个:公开×2 用户token×1)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `History` | **公开** | `HistoryReq` | `HistoryResp` | 不鉴权 |
| `TxStatus` | **公开** | `TxStatusReq` | `TxStatusResp` | 不鉴权 |
| `VerifyTransaction` | 用户token | `VerifyTransactionReq` | `VerifyTransactionResp` | 不鉴权 // 两阶段：链上确认 + 业务比对 |

### hi.did.User  <sub>(3 个:用户token×2 公开×1)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `Edit` | 用户token | `hi.Entity` | `google.protobuf.Empty` | Token鉴权 |
| `Query` | 用户token | `google.protobuf.Empty` | `hi.Entity` | Token鉴权 |
| `Total` | **公开** | `google.protobuf.Empty` | `UserTotalResp` | 不鉴权 |

### hi.did.UserExtension  <sub>(4 个:商户×4)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `Update` | **商户** | `UserExtensionUpdateReq` | `google.protobuf.Empty` | Extend-Token鉴权 |
| `Delete` | **商户** | `UserExtensionDeleteReq` | `google.protobuf.Empty` | Extend-Token鉴权 |
| `Get` | **商户** | `UserExtensionGetReq` | `UserExtensionGetResp` | 某商户下某用户的扩展数据(跨商户须先获授权) |
| `ListMerchants` | **商户** | `ListMerchantsReq` | `MerchantListResp` |  |

### hi.did.UserExtensionSettings  <sub>(2 个:用户token×2)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `Update` | 用户token | `google.protobuf.Empty` | `UserExtensionSettingResp` | Token鉴权 |
| `Get` | 用户token | `google.protobuf.Empty` | `UserExtensionSettingResp` | Token鉴权 |

### hi.did.Wallet  <sub>(8 个:用户token×4 公开×2 载荷验签×1 商户×1)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `UpdateAddresses` | **载荷验签** | `hi.SignedData` | `google.protobuf.Empty` | Web3鉴权 // UpdateAddressesReq |
| `UpdateAssets` | 用户token | `UpdateAssetsReq` | `google.protobuf.Empty` | Token鉴权 |
| `GetWallet` | 用户token | `GetWalletReq` | `GetWalletResp` | Token鉴权 |
| `ListAddresses` | 用户token | `ListAddressesReq` | `ListAddressesResp` | Token鉴权 |
| `TotalAssets` | **公开** | `TotalAssetsReq` | `TotalAssetsResp` | 不鉴权 |
| `ListUsersAssets` | **公开** | `ListUsersAssetsReq` | `ListUsersAssetsResp` | 不鉴权 |
| `GetUserAssets` | **商户** | `GetUserAssetsReq` | `GetUserAssetsResp` | 用户资产;此前误在免鉴权表里(任何人可查) |
| `GetUserByAddress` | 用户token | `GetUserByAddressReq` | `GetUserByAddressResp` |  |

## hi.media

### hi.media.Auth  <sub>(3 个:公开×3)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `RefreshToken` | **公开** | `hi.did.RefreshTokenReq` | `hi.AuthToken` |  |
| `GenerateReqId` | **公开** | `hi.did.GenerateReqIdReq` | `hi.RequestId` |  |
| `GetReqStatus` | **公开** | `hi.RequestId` | `hi.did.ReqStatusResp` |  |

### hi.media.Base  <sub>(2 个:公开×2)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `ListSuperAdminUsers` | **公开** | `google.protobuf.Empty` | `hi.did.ListSuperAdminUsersResp` | 不鉴权 |
| `ServerVersion` | **公开** | `google.protobuf.Empty` | `hi.ServerVersionResp` | 不鉴权:查服务自身版本+环境 |

### hi.media.Health  <sub>(1 个:公开×1)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `Check` | **公开** | `google.protobuf.Empty` | `google.protobuf.Empty` | 不鉴权 |

### hi.media.InviteCode  <sub>(5 个:用户token×4 公开×1)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `Create` | 用户token | `google.protobuf.Empty` | `hi.did.InviteCodeCreateResp` | Token鉴权 |
| `Edit` | 用户token | `hi.did.InviteCodeEditReq` | `google.protobuf.Empty` | Token鉴权 |
| `List` | 用户token | `hi.Pagination` | `hi.did.InviteCodeListResp` | Token鉴权 |
| `Delete` | 用户token | `hi.did.InviteCodeDeleteReq` | `google.protobuf.Empty` | Token鉴权 |
| `Verify` | **公开** | `hi.did.InviteCodeVerifyReq` | `hi.AuthToken` | 不鉴权 |

### hi.media.User  <sub>(3 个:用户token×3)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `List` | 用户token | `ListUserReq` | `ListUserResp` |  |
| `Edit` | 用户token | `EditUserReq` | `google.protobuf.Empty` |  |
| `Delete` | 用户token | `DeleteUserReq` | `google.protobuf.Empty` |  |

## hi.source

### hi.source.Base  <sub>(1 个:公开×1)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `ServerVersion` | **公开** | `google.protobuf.Empty` | `hi.ServerVersionResp` | 不鉴权:查服务自身版本+环境 |

### hi.source.File  <sub>(4 个:公开×4)</sub>

| 方法 | 档位 | 入参 | 返回 | 说明 |
|---|---|---|---|---|
| `Upload` | **公开** | `UploadReq` | `UploadResp` | 文件上传 |
| `Download` | **公开** | `DownloadReq` | `DownloadResp` | 文件下载 |
| `UploadStream` | **公开** | `stream UploadStreamReq` | `UploadResp` | 流式上传 |
| `DownloadStream` | **公开** | `DownloadStreamReq` | `stream DownloadStreamResp` | 流式下载 |
