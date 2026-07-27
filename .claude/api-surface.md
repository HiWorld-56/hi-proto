# hi-proto 接口全量核对表

**由 codegen/gen_api_surface.py 生成,勿手工编辑**(基于 `v1.5.0-dev.56` @ `ee673dd`)。
上一版是手写的,内容停在重构前 —— 档位名、rpc 数量、方法名全部过时,当成当前清单会被误导,故改为随发布自动重生成。

共 **278** 个 rpc。档位定义见 `hi/options.proto`;`hi.auth` 是 repeated,多档位 = 任一通过。

## 档位分布

| 档位 | 数量 |
|---|---|
| `AUTH_USER` | 119 |
| `AUTH_MERCHANT` | 75 |
| `AUTH_NONE` | 43 |
| `AUTH_SUPERADMIN` | 30 |
| `AUTH_WEB3` | 13 |

## 全量清单


### hi.ai.Agent

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| CreateAssistant | `AUTH_MERCHANT` | CreateAssistantReq | CreateAgentResp | POST /api/v1/agent/create_assistant |
| Delete | `AUTH_MERCHANT` | DeleteAgentReq | google.protobuf.Empty | POST /api/v1/agent/delete |
| Edit | `AUTH_MERCHANT` | EditAgentReq | google.protobuf.Empty | POST /api/v1/agent/edit |
| Get | `AUTH_MERCHANT` | GetAgentReq | GetAgentResp | GET /api/v1/agent/get |
| GetDefaultConfig | `AUTH_MERCHANT` | google.protobuf.Empty | DefaultConfigResp | GET /api/v1/agent/get_default_config |
| GetUsage | `AUTH_MERCHANT` | AgentUsageReq | AgentUsageResp | POST /api/v1/agent/get_usage |
| List | `AUTH_MERCHANT` | ListAgentsReq | ListAgentsResp | POST /api/v1/agent/list |
| RegisterRobot | `AUTH_MERCHANT` | RegisterRobotReq | CreateAgentResp | — |
| ResetToDefault | `AUTH_MERCHANT` | ResetToDefaultReq | google.protobuf.Empty | POST /api/v1/agent/reset_to_default |

### hi.ai.AgentBench

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| List | `AUTH_MERCHANT` | ListAgentDelaysReq | ListAgentDelaysResp | POST /api/v1/agent_bench/list |

### hi.ai.AgentManage

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| List | `AUTH_SUPERADMIN` | AgentManageListReq | ListAgentsResp | POST /api/v1/agent_manage/list |

### hi.ai.AiPlugin

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Cleanup | `AUTH_NONE` | CleanupReq | google.protobuf.Empty | — |
| Run | `AUTH_NONE` | RunReq | RunResp | — |

### hi.ai.ApiKey

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Create | `AUTH_MERCHANT` | google.protobuf.Empty | CreateApiKeyResp | POST /api/v1/api_key/create |
| Delete | `AUTH_MERCHANT` | DeleteApiKeyReq | google.protobuf.Empty | POST /api/v1/api_key/delete |
| Edit | `AUTH_MERCHANT` | EditApiKeyReq | EditApiKeyResp | POST /api/v1/api_key/edit |
| List | `AUTH_MERCHANT` | hi.Pagination | ListApiKeysResp | POST /api/v1/api_key/list |

### hi.ai.Auth

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| GenerateReqId | `AUTH_NONE` | hi.did.GenerateReqIdReq | hi.RequestId | POST /api/v1/auth/generate_req_id |
| GetReqStatus | `AUTH_NONE` | hi.RequestId | hi.did.ReqStatusResp | POST /api/v1/auth/get_req_status |
| RefreshToken | `AUTH_NONE` | hi.did.RefreshTokenReq | hi.AuthToken | POST /api/v1/auth/refresh_token |

### hi.ai.Base

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| ServerVersion | `AUTH_NONE` | google.protobuf.Empty | hi.ServerVersionResp | GET /api/v1/base/server_version |

### hi.ai.Chat

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| ClearHistory | `AUTH_MERCHANT` | ClearHistoryReq | google.protobuf.Empty | POST /api/v1/chat/clear_history |
| Complete | `AUTH_MERCHANT` | CompleteReq | CompleteResp | POST /api/v1/chat/complete |
| CompleteStream ⇄ | `AUTH_MERCHANT` | CompleteReq | CompleteStreamResp | POST /api/v1/chat/complete_stream |
| Converse | `AUTH_MERCHANT` | ChatReq | ChatResp | POST /api/v1/chat/converse |
| GetHistory | `AUTH_MERCHANT` | GetHistoryReq | GetHistoryResp | POST /api/v1/chat/get_history |
| NewSession | `AUTH_MERCHANT` | google.protobuf.Empty | NewSessionResp | GET /api/v1/chat/new_session |
| Resume | `AUTH_MERCHANT` | ToolCallResultsReq | ChatResp | POST /api/v1/chat/resume |

### hi.ai.InviteCode

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Create | `AUTH_SUPERADMIN` | google.protobuf.Empty | hi.did.InviteCodeCreateResp | POST /api/v1/invite_code/create |
| Delete | `AUTH_SUPERADMIN` | hi.did.InviteCodeDeleteReq | google.protobuf.Empty | POST /api/v1/invite_code/delete |
| Edit | `AUTH_SUPERADMIN` | hi.did.InviteCodeEditReq | google.protobuf.Empty | POST /api/v1/invite_code/edit |
| List | `AUTH_SUPERADMIN` | hi.Pagination | hi.did.InviteCodeListResp | POST /api/v1/invite_code/list |

### hi.ai.Merchant

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| List | `AUTH_SUPERADMIN` | MerchantListReq | MerchantListResp | POST /api/v1/merchant/list |

### hi.ai.Model

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| ListEmbeddings | `AUTH_MERCHANT` | google.protobuf.Empty | ModelListResp | GET /api/v1/model/list_embeddings |
| ListLlms | `AUTH_MERCHANT` | google.protobuf.Empty | ModelListResp | GET /api/v1/model/list_llms |
| ListStts | `AUTH_MERCHANT` | google.protobuf.Empty | ListSTTResp | GET /api/v1/model/list_stts |
| ListTts | `AUTH_MERCHANT` | google.protobuf.Empty | ModelListResp | GET /api/v1/model/list_tts |

### hi.ai.Plugin

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| CreateShell | `AUTH_MERCHANT` | CreateShellReq | CreateShellResp | POST /api/v1/plugin/create_shell |
| CreateVersion | `AUTH_MERCHANT` | CreateVersionReq | google.protobuf.Empty | POST /api/v1/plugin/create_version |
| Delete | `AUTH_MERCHANT` | DeleteVersionReq | google.protobuf.Empty | POST /api/v1/plugin/delete |
| DeleteByAgents | `AUTH_MERCHANT` | DeletePluginByAgentsReq | google.protobuf.Empty | POST /api/v1/plugin/delete_by_agents |
| DeleteShell | `AUTH_MERCHANT` | DeleteShellReq | google.protobuf.Empty | POST /api/v1/plugin/delete_shell |
| DeleteShells | `AUTH_MERCHANT` | DeleteShellsReq | google.protobuf.Empty | POST /api/v1/plugin/delete_shells |
| DeleteVersions | `AUTH_MERCHANT` | DeleteVersionsReq | google.protobuf.Empty | POST /api/v1/plugin/delete_versions |
| Edit | `AUTH_MERCHANT` | EditPluginReq | google.protobuf.Empty | POST /api/v1/plugin/edit |
| Get | `AUTH_MERCHANT` | GetPluginReq | GetPluginResp | GET /api/v1/plugin/get |
| List | `AUTH_MERCHANT` | ListPluginsReq | ListPluginsResp | POST /api/v1/plugin/list |
| ListVersions | `AUTH_MERCHANT` | ListVersionsReq | ListVersionsResp | POST /api/v1/plugin/list_versions |
| SetActive | `AUTH_MERCHANT` | SetActiveReq | google.protobuf.Empty | POST /api/v1/plugin/set_active |
| SetEnabled | `AUTH_MERCHANT` | SetEnabledReq | google.protobuf.Empty | POST /api/v1/plugin/set_enabled |

### hi.ai.Register

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Verify | `AUTH_NONE` | hi.did.InviteCodeVerifyReq | hi.AuthToken | POST /api/v1/register/verify |

### hi.ai.Setting

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Edit | `AUTH_SUPERADMIN` | SettingEditReq | google.protobuf.Empty | POST /api/v1/setting/edit |
| Get | `AUTH_SUPERADMIN` | google.protobuf.Empty | SettingGetResp | GET /api/v1/setting/get |
| ResetToDefault | `AUTH_SUPERADMIN` | google.protobuf.Empty | google.protobuf.Empty | POST /api/v1/setting/reset_to_default |

### hi.ai.Source

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Delete | `AUTH_MERCHANT` | hi.DeleteResourceReq | google.protobuf.Empty | POST /api/v1/source/delete |
| DownloadScript | `AUTH_MERCHANT` | DownloadScriptReq | DownloadScriptResp | — |
| DownloadTrainingFile | `AUTH_MERCHANT` | DownloadFileReq | DownloadFileResp | POST /api/v1/source/download_training_file |
| UploadScript ⇄ | `AUTH_MERCHANT` | hi.UploadStreamReq | hi.UploadResp | — |
| UploadTemp | `AUTH_MERCHANT` | hi.UploadReq | hi.UploadResp | POST /api/v1/source/upload_temp |
| UploadTrainingFile | `AUTH_MERCHANT` | UploadFileReq | google.protobuf.Empty | POST /api/v1/source/upload_training_file |

### hi.ai.Speech

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Synthesize | `AUTH_MERCHANT` | SynthesizeReq | SynthesizeResp | POST /api/v1/speech/synthesize |
| Transcribe | `AUTH_MERCHANT` | TranscribeReq | TranscribeResp | POST /api/v1/speech/transcribe |

### hi.ai.SuperAdmin

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| List | `AUTH_MERCHANT` | google.protobuf.Empty | hi.did.ListSuperAdminUsersResp | GET /api/v1/super_admin/list |

### hi.ai.Training

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Clear | `AUTH_MERCHANT` | ClearReq | google.protobuf.Empty | POST /api/v1/training/clear |
| CreateContent | `AUTH_MERCHANT` | CreateContentReq | CreateContentResp | POST /api/v1/training/create_content |
| DeleteFiles | `AUTH_MERCHANT` | DeleteFilesReq | google.protobuf.Empty | POST /api/v1/training/delete_files |
| DeleteFilesByAgents | `AUTH_MERCHANT` | DeleteFilesByAgentsReq | google.protobuf.Empty | POST /api/v1/training/delete_files_by_agents |
| EditDigest | `AUTH_MERCHANT` | EditDigestReq | google.protobuf.Empty | POST /api/v1/training/edit_digest |
| GetFile | `AUTH_MERCHANT` | GetFileReq | GetFileResp | POST /api/v1/training/get_file |
| ListFiles | `AUTH_MERCHANT` | ListFilesReq | ListFilesResp | POST /api/v1/training/list_files |
| Start | `AUTH_MERCHANT` | StartReq | google.protobuf.Empty | POST /api/v1/training/start |
| Status | `AUTH_MERCHANT` | StatusReq | StatusResp | POST /api/v1/training/status |
| UpdateContent | `AUTH_MERCHANT` | UpdateContentReq | google.protobuf.Empty | POST /api/v1/training/update_content |

### hi.club.Agent

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| BindMaster | `AUTH_USER` | MasterBindReq | google.protobuf.Empty | — |
| BindStatus | `AUTH_USER` | BindStatusReq | BindStatusResp | — |
| CreateAssistant | `AUTH_USER` | hi.ai.CreateAssistantReq | hi.ai.CreateAgentResp | POST /api/v1/agent/create_assistant |
| Delete | `AUTH_USER` | hi.ai.DeleteAgentReq | google.protobuf.Empty | POST /api/v1/agent/delete |
| Edit | `AUTH_USER` | hi.ai.EditAgentReq | google.protobuf.Empty | POST /api/v1/agent/edit |
| Get | `AUTH_USER` | hi.ai.GetAgentReq | hi.ai.GetAgentResp | GET /api/v1/agent/get |
| GetDefaultConfig | `AUTH_USER` | google.protobuf.Empty | hi.ai.DefaultConfigResp | GET /api/v1/agent/get_default_config |
| GetUsage | `AUTH_USER` | hi.ai.AgentUsageReq | hi.ai.AgentUsageResp | POST /api/v1/agent/get_usage |
| List | `AUTH_USER` | ListAgentsReq | ListAgentsResp | POST /api/v1/agent/list |
| Transfer | `AUTH_USER` | TransferReq | google.protobuf.Empty | POST /api/v1/agent/transfer |
| UnbindMaster | `AUTH_USER` | MasterBindReq | google.protobuf.Empty | — |

### hi.club.AgentDirectory

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| ListOnline | `AUTH_NONE` | ListOnlineReq | ListOnlineResp | POST /api/v1/agent_directory/list_online |

### hi.club.AgentManage

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| List | `AUTH_SUPERADMIN` | ListAgentsByUsersReq | ListAgentsResp | POST /api/v1/agent_manage/list |

### hi.club.ApiKey

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Create | `AUTH_USER` | CreateApiKeyReq | CreateApiKeyResp | POST /api/v1/api_key/create |
| Delete | `AUTH_USER` | DeleteApiKeyReq | google.protobuf.Empty | POST /api/v1/api_key/delete |
| Edit | `AUTH_USER` | EditApiKeyReq | EditApiKeyResp | POST /api/v1/api_key/edit |
| List | `AUTH_USER` | ListApiKeysReq | ListApiKeysResp | POST /api/v1/api_key/list |

### hi.club.Assets

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Get | `AUTH_NONE` | hi.did.GetUserAssetsReq | hi.did.GetUserAssetsResp | — |

### hi.club.Auth

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| GenerateReqId | `AUTH_NONE` | hi.did.GenerateReqIdReq | hi.RequestId | POST /api/v1/auth/generate_req_id |
| GetReqStatus | `AUTH_NONE` | hi.RequestId | hi.did.ReqStatusResp | POST /api/v1/auth/get_req_status |
| RefreshToken | `AUTH_NONE` | hi.did.RefreshTokenReq | hi.AuthToken | POST /api/v1/auth/refresh_token |
| Verify | `AUTH_WEB3` | hi.SignedData | LoginResp | — |

### hi.club.Base

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| LatestVersion | `AUTH_NONE` | hi.did.LatestVersionReq | hi.did.LatestVersionResp | GET /api/v1/base/latest_version |
| ListCoins | `AUTH_NONE` | google.protobuf.Empty | hi.did.ListCoinsResp | — |
| ServerVersion | `AUTH_NONE` | google.protobuf.Empty | hi.ServerVersionResp | — |

### hi.club.Chat

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| ClearHistory | `AUTH_USER` | hi.ai.ClearHistoryReq | google.protobuf.Empty | POST /api/v1/chat/clear_history |
| Complete | `AUTH_USER` | CompleteReq | hi.ai.CompleteResp | POST /api/v1/chat/complete |
| CompleteStream ⇄ | `AUTH_USER` | CompleteReq | hi.ai.CompleteStreamResp | POST /api/v1/chat/complete_stream |
| Converse | `AUTH_USER` | ChatReq | hi.ai.ChatResp | POST /api/v1/chat/converse |
| GetHistory | `AUTH_USER` | hi.ai.GetHistoryReq | GetHistoryResp | POST /api/v1/chat/get_history |
| NewSession | `AUTH_USER` | google.protobuf.Empty | hi.ai.NewSessionResp | GET /api/v1/chat/new_session |
| Resume | `AUTH_USER` | ToolCallResultsReq | hi.ai.ChatResp | POST /api/v1/chat/resume |

### hi.club.Group

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Create | `AUTH_USER` | CreateGroupReq | GroupBase | — |
| CreateSingle | `AUTH_USER` | CreateSingleReq | GroupBase | — |
| Get | `AUTH_USER` | GetGroupReq | GroupMemberView | — |
| GetMemberTotal | `AUTH_USER` | GetGroupMemberTotalReq | GetGroupMemberTotalResp | — |
| GetRole | `AUTH_USER` | GetRoleReq | GetRoleResp | — |
| Invite | `AUTH_USER` | InviteGroupReq | google.protobuf.Empty | — |
| Join | `AUTH_USER` | JoinGroupReq | google.protobuf.Empty | — |
| ListMembers | `AUTH_USER` | ListGroupMembersReq | GroupInfo | — |
| ListMessages | `AUTH_USER` | ListGroupMessagesReq | ListGroupMessagesResp | — |
| MuteMembers | `AUTH_USER` | MuteMembersReq | google.protobuf.Empty | — |
| Quit | `AUTH_USER` | QuitGroupReq | google.protobuf.Empty | — |
| Remove | `AUTH_USER` | RemoveGroupReq | google.protobuf.Empty | — |
| SetDnd | `AUTH_USER` | SetDndReq | google.protobuf.Empty | — |
| SetRole | `AUTH_USER` | SetRoleReq | google.protobuf.Empty | — |
| Update | `AUTH_USER` | UpdateGroupReq | google.protobuf.Empty | — |

### hi.club.Merchant

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| List | `AUTH_USER` | google.protobuf.Empty | hi.did.MerchantListResp | GET /api/v1/merchant/list |
| ListGreeters | `AUTH_USER` | ListGreetersReq | hi.did.ListUsersResp | POST /api/v1/merchant/list_greeters |

### hi.club.MerchantManage

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| List | `AUTH_SUPERADMIN` | hi.Pagination | hi.did.MerchantListResp | POST /api/v1/merchant_manage/list |

### hi.club.Model

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| ListEmbeddings | `AUTH_USER` | google.protobuf.Empty | hi.ai.ModelListResp | GET /api/v1/model/list_embeddings |
| ListLlms | `AUTH_USER` | google.protobuf.Empty | hi.ai.ModelListResp | GET /api/v1/model/list_llms |
| ListStts | `AUTH_USER` | google.protobuf.Empty | hi.ai.ListSTTResp | GET /api/v1/model/list_stts |
| ListTts | `AUTH_USER` | google.protobuf.Empty | hi.ai.ModelListResp | GET /api/v1/model/list_tts |

### hi.club.Order

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| ListNotPulled | `AUTH_WEB3` | hi.SignedData | GetNotPulledPcOrdersResp | — |
| UpdatePulled | `AUTH_WEB3` | hi.SignedData | google.protobuf.Empty | — |

### hi.club.Permission

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Get | `AUTH_USER` | google.protobuf.Empty | PermissionInfo | POST /api/v1/permission/get |
| List | `AUTH_USER` | ListAgentPermissionsReq | ListAgentPermissionsResp | POST /api/v1/permission/list |

### hi.club.PermissionManage

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Add | `AUTH_SUPERADMIN` | PermissionAddReq | google.protobuf.Empty | POST /api/v1/permission_manage/add |
| Delete | `AUTH_SUPERADMIN` | PermissionDeleteReq | google.protobuf.Empty | POST /api/v1/permission_manage/delete |
| Edit | `AUTH_SUPERADMIN` | PermissionEditReq | google.protobuf.Empty | POST /api/v1/permission_manage/edit |
| List | `AUTH_SUPERADMIN` | PermissionListReq | PermissionListResp | POST /api/v1/permission_manage/list |

### hi.club.Plugin

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| CreateShell | `AUTH_USER` | hi.ai.CreateShellReq | hi.ai.CreateShellResp | POST /api/v1/plugin/create_shell |
| CreateVersion | `AUTH_USER` | hi.ai.CreateVersionReq | google.protobuf.Empty | POST /api/v1/plugin/create_version |
| Delete | `AUTH_USER` | hi.ai.DeleteVersionReq | google.protobuf.Empty | POST /api/v1/plugin/delete |
| DeleteByAgents | `AUTH_USER` | hi.ai.DeletePluginByAgentsReq | google.protobuf.Empty | POST /api/v1/plugin/delete_by_agents |
| DeleteShell | `AUTH_USER` | hi.ai.DeleteShellReq | google.protobuf.Empty | POST /api/v1/plugin/delete_shell |
| DeleteShells | `AUTH_USER` | hi.ai.DeleteShellsReq | google.protobuf.Empty | POST /api/v1/plugin/delete_shells |
| DeleteVersions | `AUTH_USER` | hi.ai.DeleteVersionsReq | google.protobuf.Empty | POST /api/v1/plugin/delete_versions |
| Edit | `AUTH_USER` | hi.ai.EditPluginReq | google.protobuf.Empty | POST /api/v1/plugin/edit |
| Get | `AUTH_USER` | hi.ai.GetPluginReq | hi.ai.GetPluginResp | GET /api/v1/plugin/get |
| List | `AUTH_USER` | hi.ai.ListPluginsReq | hi.ai.ListPluginsResp | POST /api/v1/plugin/list |
| ListVersions | `AUTH_USER` | hi.ai.ListVersionsReq | hi.ai.ListVersionsResp | POST /api/v1/plugin/list_versions |
| ReloadApiKey | `AUTH_USER` | ReloadApiKeyReq | ReloadApiKeyResp | POST /api/v1/plugin/reload_api_key |
| SetActive | `AUTH_USER` | hi.ai.SetActiveReq | google.protobuf.Empty | POST /api/v1/plugin/set_active |
| SetEnabled | `AUTH_USER` | hi.ai.SetEnabledReq | google.protobuf.Empty | POST /api/v1/plugin/set_enabled |

### hi.club.Price

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Get | `AUTH_NONE` | hi.did.GetPriceReq | hi.did.GetPriceResp | — |

### hi.club.Publisher

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Publish | `AUTH_USER` | PublishReq | google.protobuf.Empty | — |

### hi.club.PushManager

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Register | `AUTH_USER` | PushRegisterReq | google.protobuf.Empty | — |
| Unregister | `AUTH_USER` | PushUnregisterReq | google.protobuf.Empty | — |

### hi.club.Source

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Delete | `AUTH_USER` | hi.DeleteResourceReq | google.protobuf.Empty | POST /api/v1/source/delete |
| Download | `AUTH_USER` | DownloadResourceReq | DownloadResourceResp | — |
| DownloadScript | `AUTH_USER` | hi.ai.DownloadScriptReq | hi.ai.DownloadScriptResp | — |
| DownloadTrainingFile | `AUTH_USER` | hi.ai.DownloadFileReq | hi.ai.DownloadFileResp | POST /api/v1/source/download_training_file |
| UploadAvatar | `AUTH_USER` | hi.UploadReq | hi.UploadResp | POST /api/v1/source/upload_avatar |
| UploadBackground | `AUTH_USER` | hi.UploadReq | hi.UploadResp | POST /api/v1/source/upload_background |
| UploadLog | `AUTH_USER` | hi.UploadReq | hi.UploadResp | POST /api/v1/source/upload_log |
| UploadScript ⇄ | `AUTH_USER` | hi.UploadStreamReq | hi.UploadResp | — |
| UploadTemp | `AUTH_USER` | hi.UploadReq | hi.UploadResp | POST /api/v1/source/upload_temp |
| UploadTempStream ⇄ | `AUTH_USER` | hi.UploadStreamReq | hi.UploadResp | — |
| UploadTrainingFile | `AUTH_USER` | hi.ai.UploadFileReq | google.protobuf.Empty | POST /api/v1/source/upload_training_file |

### hi.club.Speech

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Synthesize | `AUTH_USER` | hi.ai.SynthesizeReq | hi.ai.SynthesizeResp | POST /api/v1/speech/synthesize |
| Transcribe | `AUTH_USER` | hi.ai.TranscribeReq | hi.ai.TranscribeResp | POST /api/v1/speech/transcribe |

### hi.club.SuperAdmin

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| List | `AUTH_USER` | google.protobuf.Empty | hi.did.ListSuperAdminUsersResp | GET /api/v1/super_admin/list |

### hi.club.Trade

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Add | `AUTH_USER` | AddTradeReq | AddTradeResp | — |
| Get | `AUTH_USER` | GetTradeReq | GetTradeResp | GET /api/v1/trade/get |
| GetFee | `AUTH_USER` | GetTradeFeeReq | GetTradeFeeResp | — |
| List | `AUTH_USER` | ListTradesReq | ListTradesResp | POST /api/v1/trade/list |
| UpdateTransHash | `AUTH_USER` | UpdateTransHashReq | google.protobuf.Empty | — |

### hi.club.TradeManage

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| List | `AUTH_SUPERADMIN` | TradeManageListReq | ListTradesResp | POST /api/v1/trade_manage/list |

### hi.club.Training

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Clear | `AUTH_USER` | hi.ai.ClearReq | google.protobuf.Empty | POST /api/v1/training/clear |
| CreateContent | `AUTH_USER` | hi.ai.CreateContentReq | hi.ai.CreateContentResp | POST /api/v1/training/create_content |
| DeleteFiles | `AUTH_USER` | hi.ai.DeleteFilesReq | google.protobuf.Empty | POST /api/v1/training/delete_files |
| EditDigest | `AUTH_USER` | hi.ai.EditDigestReq | google.protobuf.Empty | POST /api/v1/training/edit_digest |
| GetFile | `AUTH_USER` | hi.ai.GetFileReq | hi.ai.GetFileResp | POST /api/v1/training/get_file |
| ListFiles | `AUTH_USER` | hi.ai.ListFilesReq | hi.ai.ListFilesResp | POST /api/v1/training/list_files |
| Start | `AUTH_USER` | hi.ai.StartReq | google.protobuf.Empty | POST /api/v1/training/start |
| Status | `AUTH_USER` | hi.ai.StatusReq | hi.ai.StatusResp | POST /api/v1/training/status |
| UpdateContent | `AUTH_USER` | hi.ai.UpdateContentReq | google.protobuf.Empty | POST /api/v1/training/update_content |

### hi.club.User

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| AddFriend | `AUTH_USER` | AddFriendReq | AddFriendResp | — |
| DeleteAllSystemMessage | `AUTH_USER` | google.protobuf.Empty | google.protobuf.Empty | — |
| DeleteFriend | `AUTH_USER` | DeleteFriendReq | google.protobuf.Empty | — |
| DeleteSystemMessage | `AUTH_USER` | DeleteSystemMessageReq | google.protobuf.Empty | — |
| GetCurrent | `AUTH_USER` | google.protobuf.Empty | UserInfo | — |
| GetOther | `AUTH_USER` | GetUserReq | hi.Entity | — |
| HandleSystemMessage | `AUTH_USER` | HandleSystemMessageReq | google.protobuf.Empty | — |
| ListGroups | `AUTH_USER` | google.protobuf.Empty | ListGroupsResp | — |
| ListRelations | `AUTH_USER` | google.protobuf.Empty | ListRelationsResp | — |
| ListSystemMessages | `AUTH_USER` | ListSystemMessagesReq | SystemMessages | — |
| SetRemark | `AUTH_USER` | SetRemarkReq | google.protobuf.Empty | — |
| UnprocessedSysMsgCount | `AUTH_USER` | google.protobuf.Empty | UnprocessedSysMsgCountResp | — |
| Update | `AUTH_USER` | UpdateUserReq | google.protobuf.Empty | — |

### hi.club.UserDirectory

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| ListOnline | `AUTH_NONE` | ListOnlineUsersReq | ListOnlineUsersResp | POST /api/v1/user_directory/list_online |

### hi.club.Wallet

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| UpdateAddresses | `AUTH_WEB3` | hi.SignedData | google.protobuf.Empty | — |

### hi.did.Assets

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Get | `AUTH_NONE` | GetUserAssetsReq | GetUserAssetsResp | POST /api/v1/assets/get |
| List | `AUTH_NONE` | ListUsersAssetsReq | ListUsersAssetsResp | POST /api/v1/assets/list |
| ListAddresses | `AUTH_NONE` | ListAddressesReq | ListAddressesResp | — |
| Total | `AUTH_NONE` | TotalAssetsReq | TotalAssetsResp | POST /api/v1/assets/total |
| UpdateAddresses | `AUTH_WEB3` | hi.SignedData | google.protobuf.Empty | — |

### hi.did.Auth

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| GenerateReqId | `AUTH_NONE` | GenerateReqIdReq | hi.RequestId | POST /api/v1/auth/generate_req_id |
| GetReqStatus | `AUTH_NONE` | hi.RequestId | ReqStatusResp | POST /api/v1/auth/get_req_status |
| Logout | `AUTH_WEB3` | hi.SignedData | google.protobuf.Empty | — |
| Notify | `AUTH_WEB3` | hi.SignedData | google.protobuf.Empty | — |
| RefreshToken | `AUTH_NONE` | RefreshTokenReq | hi.AuthToken | POST /api/v1/auth/refresh_token |
| Verify | `AUTH_WEB3` | hi.SignedData | LoginResp | — |
| VerifyOffline | `AUTH_WEB3` | hi.SignedData | LoginResp | — |

### hi.did.Base

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| LatestVersion | `AUTH_NONE` | LatestVersionReq | LatestVersionResp | GET /api/v1/base/latest_version |
| ListCoins | `AUTH_NONE` | google.protobuf.Empty | ListCoinsResp | — |
| ServerVersion | `AUTH_NONE` | google.protobuf.Empty | hi.ServerVersionResp | — |
| UserTotal | `AUTH_NONE` | google.protobuf.Empty | UserTotalResp | GET /api/v1/base/user_total |

### hi.did.DApp

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| GetRWA | `AUTH_USER` | google.protobuf.Empty | DAppGetRWAResp | GET /api/v1/d_app/get_rwa |
| GetTop | `AUTH_USER` | google.protobuf.Empty | DAppInfo | GET /api/v1/d_app/get_top |
| ListByClass | `AUTH_USER` | google.protobuf.Empty | DAppListByClassResp | GET /api/v1/d_app/list_by_class |

### hi.did.DAppAdmin

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Create | `AUTH_SUPERADMIN` | DAppInfo | google.protobuf.Empty | POST /api/v1/d_app_admin/create |
| Delete | `AUTH_SUPERADMIN` | DAppDeleteReq | google.protobuf.Empty | POST /api/v1/d_app_admin/delete |
| Edit | `AUTH_SUPERADMIN` | DAppInfo | google.protobuf.Empty | POST /api/v1/d_app_admin/edit |
| UpdateOrder | `AUTH_SUPERADMIN` | DAppUpdateOrderReq | google.protobuf.Empty | POST /api/v1/d_app_admin/update_order |
| UpdateTop | `AUTH_SUPERADMIN` | DAppUpdateTopReq | google.protobuf.Empty | POST /api/v1/d_app_admin/update_top |

### hi.did.Gateway

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| List | `AUTH_MERCHANT+AUTH_USER` | google.protobuf.Empty | GatewayConfigListResp | GET /api/v1/gateway/list |

### hi.did.GatewayAdmin

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Set | `AUTH_SUPERADMIN` | GatewayConfigSetReq | google.protobuf.Empty | POST /api/v1/gateway_admin/set |

### hi.did.InviteCode

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Create | `AUTH_SUPERADMIN` | google.protobuf.Empty | InviteCodeCreateResp | POST /api/v1/invite_code/create |
| Delete | `AUTH_SUPERADMIN` | InviteCodeDeleteReq | google.protobuf.Empty | POST /api/v1/invite_code/delete |
| Edit | `AUTH_SUPERADMIN` | InviteCodeEditReq | google.protobuf.Empty | POST /api/v1/invite_code/edit |
| List | `AUTH_SUPERADMIN` | hi.Pagination | InviteCodeListResp | POST /api/v1/invite_code/list |

### hi.did.LoginCallback

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Login | `AUTH_WEB3` | hi.SignedData | google.protobuf.Empty | — |

### hi.did.Merchant

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| AddGrant | `AUTH_MERCHANT` | GrantReq | google.protobuf.Empty | — |
| AddUsers | `AUTH_MERCHANT` | AddUsersReq | google.protobuf.Empty | POST /api/v1/merchant/add_users |
| Get | `AUTH_MERCHANT` | google.protobuf.Empty | MerchantGetResp | GET /api/v1/merchant/get |
| GetUser | `AUTH_MERCHANT` | GetUserReq | UserExtensionUnit | — |
| GetUserMqtt | `AUTH_MERCHANT` | GetUserMqttReq | GetUserMqttResp | — |
| List | `AUTH_MERCHANT` | ListMerchantsReq | MerchantListResp | POST /api/v1/merchant/list |
| ListGrants | `AUTH_MERCHANT` | google.protobuf.Empty | ListGrantsResp | — |
| ListGreeters | `AUTH_MERCHANT` | ListGreetersReq | ListUsersResp | POST /api/v1/merchant/list_greeters |
| ListUsers | `AUTH_MERCHANT` | ListUsersReq | ListUsersResp | POST /api/v1/merchant/list_users |
| RemoveGrant | `AUTH_MERCHANT` | GrantReq | google.protobuf.Empty | — |
| RemoveUsers | `AUTH_MERCHANT` | RemoveUsersReq | google.protobuf.Empty | POST /api/v1/merchant/remove_users |
| SetUsers | `AUTH_MERCHANT` | SetUsersReq | google.protobuf.Empty | POST /api/v1/merchant/set_users |
| Update | `AUTH_MERCHANT` | MerchantSetReq | google.protobuf.Empty | POST /api/v1/merchant/update |

### hi.did.MerchantGranted

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| GetUser | `AUTH_MERCHANT` | GrantedGetUserReq | UserExtensionUnit | POST /api/v1/merchant_granted/get_user |
| ListGreeters | `AUTH_MERCHANT` | GrantedListGreetersReq | ListUsersResp | POST /api/v1/merchant_granted/list_greeters |
| ListUsers | `AUTH_MERCHANT` | GrantedListUsersReq | ListUsersResp | POST /api/v1/merchant_granted/list_users |

### hi.did.MerchantManage

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Delete | `AUTH_SUPERADMIN` | hi.DID | google.protobuf.Empty | POST /api/v1/merchant_manage/delete |
| Edit | `AUTH_SUPERADMIN` | MerchantManageEditReq | google.protobuf.Empty | POST /api/v1/merchant_manage/edit |
| List | `AUTH_SUPERADMIN` | MerchantManageListReq | MerchantManageListResp | POST /api/v1/merchant_manage/list |
| SetPermission | `AUTH_SUPERADMIN` | MerchantSetPermissionReq | google.protobuf.Empty | POST /api/v1/merchant_manage/set_permission |

### hi.did.MerchantOwner

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| GetExDB | `AUTH_USER` | google.protobuf.Empty | MerchantExDBResp | GET /api/v1/merchant_owner/get_ex_db |
| RefreshExDB | `AUTH_USER` | google.protobuf.Empty | MerchantExDBResp | POST /api/v1/merchant_owner/refresh_ex_db |
| SetServer | `AUTH_USER` | SetServerReq | google.protobuf.Empty | POST /api/v1/merchant_owner/set_server |

### hi.did.MerchantPub

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Scheme | `AUTH_NONE` | hi.DID | MerchantPubSchemeResp | POST /api/v1/merchant_pub/scheme |
| Server | `AUTH_NONE` | hi.DID | MerchantPubServerResp | POST /api/v1/merchant_pub/server |

### hi.did.OrderEvent

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Sub ⇄ | `AUTH_USER` | google.protobuf.Empty | OrderEventResp | — |

### hi.did.OrderNotify

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Send | `AUTH_NONE` | MerchantNotifyReq | google.protobuf.Empty | — |

### hi.did.Pay

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| GenerateReq | `AUTH_NONE` | hi.ClientInfo | hi.RequestId | — |
| Notify | `AUTH_WEB3` | hi.SignedData | google.protobuf.Empty | — |

### hi.did.PayCallback

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Pay | `AUTH_WEB3` | hi.SignedData | google.protobuf.Empty | — |

### hi.did.Price

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Get | `AUTH_NONE` | GetPriceReq | GetPriceResp | — |

### hi.did.Register

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Verify | `AUTH_NONE` | InviteCodeVerifyReq | hi.AuthToken | POST /api/v1/register/verify |

### hi.did.Source

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Delete | `AUTH_USER` | hi.DeleteResourceReq | google.protobuf.Empty | — |
| UploadAvatar | `AUTH_USER` | hi.UploadReq | hi.UploadResp | — |
| UploadLog | `AUTH_USER` | hi.UploadReq | hi.UploadResp | — |

### hi.did.SuperAdmin

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| List | `AUTH_MERCHANT+AUTH_USER` | google.protobuf.Empty | ListSuperAdminUsersResp | GET /api/v1/super_admin/list |

### hi.did.Transfer

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| History | `AUTH_NONE` | HistoryReq | HistoryResp | — |
| TxStatus | `AUTH_NONE` | TxStatusReq | TxStatusResp | — |
| VerifySignature | `AUTH_WEB3` | hi.SignedData | hi.DID | — |
| VerifyTransaction | `AUTH_NONE` | VerifyTransactionReq | VerifyTransactionResp | — |

### hi.did.User

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Edit | `AUTH_USER` | EditProfileReq | google.protobuf.Empty | — |
| Query | `AUTH_USER` | google.protobuf.Empty | hi.Entity | — |

### hi.did.Wallet

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Get | `AUTH_USER` | GetWalletReq | GetWalletResp | — |
| UpdateAssets | `AUTH_USER` | UpdateAssetsReq | google.protobuf.Empty | — |

### hi.source.Base

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| ServerVersion | `AUTH_NONE` | google.protobuf.Empty | hi.ServerVersionResp | — |

### hi.source.File

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Delete | `AUTH_NONE` | DeleteReq | google.protobuf.Empty | — |
| Download | `AUTH_NONE` | DownloadReq | DownloadResp | — |
| DownloadStream ⇄ | `AUTH_NONE` | DownloadStreamReq | DownloadStreamResp | — |
| Put | `AUTH_NONE` | PutReq | PutResp | — |
| PutStream ⇄ | `AUTH_NONE` | PutStreamReq | PutResp | — |
