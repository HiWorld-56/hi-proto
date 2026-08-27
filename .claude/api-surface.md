# hi-proto 接口全量核对表

**由 codegen/gen_api_surface.py 生成,勿手工编辑**(基于 `v1.5.10-dev.5` @ `c12a0a6`)。
上一版是手写的,内容停在重构前 —— 档位名、rpc 数量、方法名全部过时,当成当前清单会被误导,故改为随发布自动重生成。

共 **357** 个 rpc。档位定义见 `hi/options.proto`;`hi.auth` 是 repeated,多档位 = 任一通过。

## 档位分布

| 档位 | 数量 |
|---|---|
| `AUTH_USER` | 147 |
| `AUTH_MERCHANT` | 95 |
| `AUTH_NONE` | 57 |
| `AUTH_SUPERADMIN` | 32 |
| `AUTH_WEB3` | 17 |
| `AUTH_INTERNAL` | 11 |

## 全量清单


### hi.ai.Agent

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| CreateAssistant | `AUTH_MERCHANT` | CreateAssistantReq | CreateAgentResp | POST /api/v1/agent/create_assistant |
| Delete | `AUTH_MERCHANT` | DeleteAgentReq | google.protobuf.Empty | POST /api/v1/agent/delete |
| Edit | `AUTH_MERCHANT` | EditAgentReq | hi.Entity | POST /api/v1/agent/edit |
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
| ListHistory | `AUTH_MERCHANT` | ListAgentDelayHistoryReq | ListAgentDelaysResp | POST /api/v1/agent_bench/list_history |

### hi.ai.AgentManage

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| List | `AUTH_SUPERADMIN` | AgentManageListReq | ListAgentsResp | POST /api/v1/agent_manage/list |

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
| Converse | `AUTH_MERCHANT` | ChatReq | ChatResp | POST /api/v1/chat/converse |
| ConverseStream ⇄ | `AUTH_MERCHANT` | ChatReq | ConverseStreamResp | POST /api/v1/chat/converse_stream |
| GetHistory | `AUTH_MERCHANT` | GetHistoryReq | GetHistoryResp | POST /api/v1/chat/get_history |
| NewSession | `AUTH_MERCHANT` | google.protobuf.Empty | NewSessionResp | GET /api/v1/chat/new_session |
| Resume | `AUTH_MERCHANT` | ToolCallResultsReq | ChatResp | POST /api/v1/chat/resume |
| ResumeStream ⇄ | `AUTH_MERCHANT` | ToolCallResultsReq | ConverseStreamResp | POST /api/v1/chat/resume_stream |

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
| Edit | `AUTH_SUPERADMIN` | MerchantEditReq | google.protobuf.Empty | POST /api/v1/merchant/edit |
| List | `AUTH_SUPERADMIN` | MerchantListReq | MerchantListResp | POST /api/v1/merchant/list |

### hi.ai.Model

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| ListEmbeddings | `AUTH_MERCHANT` | google.protobuf.Empty | ModelListResp | GET /api/v1/model/list_embeddings |
| ListLlms | `AUTH_MERCHANT` | google.protobuf.Empty | ModelListResp | GET /api/v1/model/list_llms |
| ListStts | `AUTH_MERCHANT` | google.protobuf.Empty | ListSTTResp | GET /api/v1/model/list_stts |
| ListTts | `AUTH_MERCHANT` | google.protobuf.Empty | ModelListResp | GET /api/v1/model/list_tts |

### hi.ai.Permission

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Add | `AUTH_MERCHANT` | PermissionAddReq | google.protobuf.Empty | POST /api/v1/permission/add |
| Delete | `AUTH_MERCHANT` | PermissionDeleteReq | google.protobuf.Empty | POST /api/v1/permission/delete |
| Edit | `AUTH_MERCHANT` | PermissionEditReq | google.protobuf.Empty | POST /api/v1/permission/edit |
| List | `AUTH_MERCHANT` | ListAgentPermissionsReq | ListAgentPermissionsResp | POST /api/v1/permission/list |
| ListByType | `AUTH_MERCHANT` | PermissionListReq | PermissionListResp | POST /api/v1/permission/list_by_type |

### hi.ai.Plugin

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| CreateReference | `AUTH_MERCHANT` | CreateReferenceReq | google.protobuf.Empty | — |
| CreateShell | `AUTH_MERCHANT` | CreateShellReq | CreateShellResp | POST /api/v1/plugin/create_shell |
| CreateVersion | `AUTH_MERCHANT` | CreateVersionReq | google.protobuf.Empty | POST /api/v1/plugin/create_version |
| Delete | `AUTH_MERCHANT` | DeleteVersionReq | google.protobuf.Empty | POST /api/v1/plugin/delete |
| DeleteByAgents | `AUTH_MERCHANT` | DeletePluginByAgentsReq | google.protobuf.Empty | — |
| DeleteShell | `AUTH_MERCHANT` | DeleteShellReq | google.protobuf.Empty | POST /api/v1/plugin/delete_shell |
| DeleteShells | `AUTH_MERCHANT` | DeleteShellsReq | google.protobuf.Empty | POST /api/v1/plugin/delete_shells |
| DeleteVersionList | `AUTH_MERCHANT` | DeleteVersionListReq | google.protobuf.Empty | POST /api/v1/plugin/delete_version_list |
| DeleteVersions | `AUTH_MERCHANT` | DeleteVersionsReq | google.protobuf.Empty | POST /api/v1/plugin/delete_versions |
| Edit | `AUTH_MERCHANT` | EditPluginReq | google.protobuf.Empty | POST /api/v1/plugin/edit |
| Get | `AUTH_MERCHANT` | GetPluginReq | GetPluginResp | GET /api/v1/plugin/get |
| List | `AUTH_MERCHANT` | ListPluginsReq | ListPluginsResp | POST /api/v1/plugin/list |
| ListNative | `AUTH_MERCHANT` | ListNativeReq | ListNativeResp | — |
| ListVersions | `AUTH_MERCHANT` | ListVersionsReq | ListVersionsResp | POST /api/v1/plugin/list_versions |
| PublicBriefs | `AUTH_MERCHANT` | PublicBriefsReq | PublicBriefsResp | — |
| RetryBuild | `AUTH_MERCHANT` | RetryBuildReq | google.protobuf.Empty | POST /api/v1/plugin/retry_build |
| SetActive | `AUTH_MERCHANT` | SetActiveReq | google.protobuf.Empty | POST /api/v1/plugin/set_active |
| SetActiveAll | `AUTH_MERCHANT` | SetActiveAllReq | SetActiveAllResp | — |
| SetEnabled | `AUTH_MERCHANT` | SetEnabledReq | google.protobuf.Empty | POST /api/v1/plugin/set_enabled |
| SetFollowLatest | `AUTH_MERCHANT` | SetFollowLatestReq | google.protobuf.Empty | POST /api/v1/plugin/set_follow_latest |

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
| DownloadScript | `AUTH_MERCHANT` | DownloadScriptReq | DownloadScriptResp | POST /api/v1/source/download_script |
| DownloadTrainingFile | `AUTH_MERCHANT` | DownloadFileReq | DownloadFileResp | POST /api/v1/source/download_training_file |
| UploadLogo | `AUTH_MERCHANT` | hi.UploadReq | hi.UploadResp | POST /api/v1/source/upload_logo |
| UploadScript | `AUTH_MERCHANT` | hi.UploadReq | hi.UploadResp | POST /api/v1/source/upload_script |
| UploadScriptStream ⇄ | `AUTH_MERCHANT` | hi.UploadStreamReq | hi.UploadResp | — |
| UploadSummary | `AUTH_MERCHANT` | hi.UploadReq | hi.UploadResp | POST /api/v1/source/upload_summary |
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

### hi.ai.plugin.Builder

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Build | `AUTH_INTERNAL` | BuildReq | BuildResp | — |

### hi.ai.plugin.Runner

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Cleanup | `AUTH_INTERNAL` | CleanupReq | google.protobuf.Empty | — |
| Run | `AUTH_INTERNAL` | RunReq | RunResp | — |

### hi.club.Agent

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| BindMaster | `AUTH_USER` | MasterBindReq | google.protobuf.Empty | POST /api/v1/agent/bind_master |
| BindStatus | `AUTH_USER` | BindStatusReq | BindStatusResp | — |
| CreateAssistant | `AUTH_USER` | hi.ai.CreateAssistantReq | hi.ai.CreateAgentResp | POST /api/v1/agent/create_assistant |
| Delete | `AUTH_USER` | hi.ai.DeleteAgentReq | google.protobuf.Empty | POST /api/v1/agent/delete |
| Edit | `AUTH_USER` | hi.ai.EditAgentReq | hi.Entity | POST /api/v1/agent/edit |
| Get | `AUTH_USER` | hi.ai.GetAgentReq | hi.ai.GetAgentResp | GET /api/v1/agent/get |
| GetDefaultConfig | `AUTH_USER` | google.protobuf.Empty | hi.ai.DefaultConfigResp | GET /api/v1/agent/get_default_config |
| GetUsage | `AUTH_USER` | hi.ai.AgentUsageReq | hi.ai.AgentUsageResp | POST /api/v1/agent/get_usage |
| List | `AUTH_USER` | hi.ai.ListAgentsReq | ListAgentsResp | POST /api/v1/agent/list |
| Transfer | `AUTH_USER` | TransferReq | google.protobuf.Empty | POST /api/v1/agent/transfer |
| UnbindMaster | `AUTH_USER` | MasterBindReq | google.protobuf.Empty | POST /api/v1/agent/unbind_master |

### hi.club.AgentDirectory

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| ListOnline | `AUTH_NONE` | ListOnlineReq | ListOnlineResp | POST /api/v1/agent_directory/list_online |

### hi.club.AgentManage

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| List | `AUTH_SUPERADMIN` | ListAgentsByUsersReq | ListAgentsResp | POST /api/v1/agent_manage/list |

### hi.club.AgentPlugin

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| ListNative | `AUTH_USER` | ListNativeReq | hi.ai.ListNativeResp | — |

### hi.club.ApiKey

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Create | `AUTH_USER` | CreateApiKeyReq | CreateApiKeyResp | POST /api/v1/api_key/create |
| Delete | `AUTH_USER` | DeleteApiKeyReq | google.protobuf.Empty | POST /api/v1/api_key/delete |
| Edit | `AUTH_USER` | hi.ai.EditApiKeyReq | EditApiKeyResp | POST /api/v1/api_key/edit |
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
| Logout | `AUTH_NONE` | hi.did.RefreshTokenReq | google.protobuf.Empty | POST /api/v1/auth/logout |
| RefreshToken | `AUTH_NONE` | hi.did.RefreshTokenReq | hi.AuthToken | POST /api/v1/auth/refresh_token |
| Verify | `AUTH_WEB3` | hi.SignedData | LoginResp | — |

### hi.club.Base

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| ListCoins | `AUTH_NONE` | google.protobuf.Empty | hi.did.ListCoinsResp | GET /api/v1/base/list_coins |
| ServerVersion | `AUTH_NONE` | google.protobuf.Empty | hi.ServerVersionResp | GET /api/v1/base/server_version |

### hi.club.Chat

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| ClearHistory | `AUTH_USER` | hi.ai.ClearHistoryReq | google.protobuf.Empty | POST /api/v1/chat/clear_history |
| Converse | `AUTH_USER` | ChatReq | hi.ai.ChatResp | POST /api/v1/chat/converse |
| ConverseStream ⇄ | `AUTH_USER` | ChatReq | hi.ai.ConverseStreamResp | POST /api/v1/chat/converse_stream |
| GetHistory | `AUTH_USER` | hi.ai.GetHistoryReq | GetHistoryResp | POST /api/v1/chat/get_history |
| NewSession | `AUTH_USER` | google.protobuf.Empty | hi.ai.NewSessionResp | GET /api/v1/chat/new_session |
| Resume | `AUTH_USER` | ToolCallResultsReq | hi.ai.ChatResp | POST /api/v1/chat/resume |
| ResumeStream ⇄ | `AUTH_USER` | ToolCallResultsReq | hi.ai.ConverseStreamResp | POST /api/v1/chat/resume_stream |

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
| Update | `AUTH_USER` | UpdateGroupReq | GroupBase | — |

### hi.club.Ledger

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| List | `AUTH_USER` | ListFundsReq | ListFundsResp | POST /api/v1/ledger/list |
| Record | `AUTH_USER` | FundsRecord | google.protobuf.Empty | POST /api/v1/ledger/record |

### hi.club.Market

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| AcceptOffer | `AUTH_USER` | DecideOfferReq | google.protobuf.Empty | POST /api/v1/market/accept_offer |
| Apply | `AUTH_USER` | ApplyReq | ApplyResp | POST /api/v1/market/apply |
| Approve | `AUTH_USER` | DecideGrantReq | google.protobuf.Empty | POST /api/v1/market/approve |
| CreateListing | `AUTH_USER` | CreateListingReq | CreateListingResp | POST /api/v1/market/create_listing |
| CreateRenewOrder | `AUTH_USER` | CreateRenewOrderReq | MarketOrder | POST /api/v1/market/create_renew_order |
| DeclineOffer | `AUTH_USER` | DecideOfferReq | google.protobuf.Empty | POST /api/v1/market/decline_offer |
| EditListing | `AUTH_USER` | EditListingReq | google.protobuf.Empty | POST /api/v1/market/edit_listing |
| GetTransaction | `AUTH_USER` | GetTransactionReq | MarketPayment | POST /api/v1/market/get_transaction |
| IssuePayment | `AUTH_USER` | IssuePaymentReq | MarketOrder | POST /api/v1/market/issue_payment |
| ListMyGrants | `AUTH_USER` | ListGrantsReq | ListGrantsResp | POST /api/v1/market/list_my_grants |
| ListMyListings | `AUTH_USER` | ListMyListingsReq | ListMyListingsResp | POST /api/v1/market/list_my_listings |
| ListPayments | `AUTH_USER` | ListPaymentsReq | ListPaymentsResp | POST /api/v1/market/list_payments |
| ListReceivedRequests | `AUTH_USER` | ListGrantsReq | ListGrantsResp | POST /api/v1/market/list_received_requests |
| ListTransactions | `AUTH_USER` | ListTransactionsReq | ListTransactionsResp | POST /api/v1/market/list_transactions |
| Offer | `AUTH_USER` | OfferReq | OfferResp | POST /api/v1/market/offer |
| Reject | `AUTH_USER` | DecideGrantReq | google.protobuf.Empty | POST /api/v1/market/reject |
| Revoke | `AUTH_USER` | DecideGrantReq | google.protobuf.Empty | POST /api/v1/market/revoke |
| SetAutoRenew | `AUTH_USER` | SetAutoRenewReq | google.protobuf.Empty | POST /api/v1/market/set_auto_renew |
| SetListingStatus | `AUTH_USER` | SetListingStatusReq | google.protobuf.Empty | POST /api/v1/market/set_listing_status |

### hi.club.MarketCallback

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Notify | `AUTH_WEB3` | hi.SignedData | google.protobuf.Empty | — |
| Pull | `AUTH_WEB3` | hi.SignedData | MarketPullResp | — |

### hi.club.MarketDirectory

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| GetListing | `AUTH_NONE` | GetListingReq | GetListingResp | POST /api/v1/market_directory/get_listing |
| ListAgentListings | `AUTH_NONE` | ListAgentListingsReq | SearchListingsResp | POST /api/v1/market_directory/list_agent_listings |
| ListSellers | `AUTH_NONE` | hi.Pagination | ListSellersResp | POST /api/v1/market_directory/list_sellers |
| SearchListings | `AUTH_NONE` | SearchListingsReq | SearchListingsResp | POST /api/v1/market_directory/search_listings |

### hi.club.MarketManage

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| ForceDelist | `AUTH_SUPERADMIN` | ForceDelistReq | google.protobuf.Empty | POST /api/v1/market_manage/force_delist |
| ListGrants | `AUTH_SUPERADMIN` | MarketManageListGrantsReq | ListGrantsResp | POST /api/v1/market_manage/list_grants |
| ListListings | `AUTH_SUPERADMIN` | MarketManageListListingsReq | SearchListingsResp | POST /api/v1/market_manage/list_listings |

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
| Pull | `AUTH_WEB3` | hi.SignedData | PullOrdersResp | — |
| Report | `AUTH_WEB3` | hi.SignedData | google.protobuf.Empty | — |

### hi.club.Permission

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Get | `AUTH_USER` | google.protobuf.Empty | hi.ai.PermissionInfo | POST /api/v1/permission/get |
| List | `AUTH_USER` | hi.ai.ListAgentPermissionsReq | hi.ai.ListAgentPermissionsResp | POST /api/v1/permission/list |

### hi.club.PermissionManage

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Add | `AUTH_SUPERADMIN` | hi.ai.PermissionAddReq | google.protobuf.Empty | POST /api/v1/permission_manage/add |
| Delete | `AUTH_SUPERADMIN` | hi.ai.PermissionDeleteReq | google.protobuf.Empty | POST /api/v1/permission_manage/delete |
| Edit | `AUTH_SUPERADMIN` | hi.ai.PermissionEditReq | google.protobuf.Empty | POST /api/v1/permission_manage/edit |
| List | `AUTH_SUPERADMIN` | hi.ai.PermissionListReq | hi.ai.PermissionListResp | POST /api/v1/permission_manage/list |

### hi.club.Plugin

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| CreateShell | `AUTH_USER` | hi.ai.CreateShellReq | hi.ai.CreateShellResp | POST /api/v1/plugin/create_shell |
| CreateVersion | `AUTH_USER` | hi.ai.CreateVersionReq | google.protobuf.Empty | POST /api/v1/plugin/create_version |
| Delete | `AUTH_USER` | hi.ai.DeleteVersionReq | google.protobuf.Empty | POST /api/v1/plugin/delete |
| DeleteShell | `AUTH_USER` | hi.ai.DeleteShellReq | google.protobuf.Empty | POST /api/v1/plugin/delete_shell |
| DeleteShells | `AUTH_USER` | hi.ai.DeleteShellsReq | google.protobuf.Empty | POST /api/v1/plugin/delete_shells |
| DeleteVersionList | `AUTH_USER` | hi.ai.DeleteVersionListReq | google.protobuf.Empty | POST /api/v1/plugin/delete_version_list |
| DeleteVersions | `AUTH_USER` | hi.ai.DeleteVersionsReq | google.protobuf.Empty | POST /api/v1/plugin/delete_versions |
| Edit | `AUTH_USER` | hi.ai.EditPluginReq | google.protobuf.Empty | POST /api/v1/plugin/edit |
| Get | `AUTH_USER` | hi.ai.GetPluginReq | hi.ai.GetPluginResp | GET /api/v1/plugin/get |
| List | `AUTH_USER` | hi.ai.ListPluginsReq | hi.ai.ListPluginsResp | POST /api/v1/plugin/list |
| ListVersions | `AUTH_USER` | hi.ai.ListVersionsReq | hi.ai.ListVersionsResp | POST /api/v1/plugin/list_versions |
| ReloadApiKey | `AUTH_USER` | ReloadApiKeyReq | ReloadApiKeyResp | POST /api/v1/plugin/reload_api_key |
| RetryBuild | `AUTH_USER` | hi.ai.RetryBuildReq | google.protobuf.Empty | POST /api/v1/plugin/retry_build |
| SetActive | `AUTH_USER` | hi.ai.SetActiveReq | google.protobuf.Empty | POST /api/v1/plugin/set_active |
| SetEnabled | `AUTH_USER` | hi.ai.SetEnabledReq | google.protobuf.Empty | POST /api/v1/plugin/set_enabled |
| SetFollowLatest | `AUTH_USER` | hi.ai.SetFollowLatestReq | google.protobuf.Empty | POST /api/v1/plugin/set_follow_latest |

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
| DownloadScript | `AUTH_USER` | hi.ai.DownloadScriptReq | hi.ai.DownloadScriptResp | POST /api/v1/source/download_script |
| DownloadStream ⇄ | `AUTH_USER` | hi.source.DownloadStreamReq | hi.source.DownloadStreamResp | — |
| DownloadTrainingFile | `AUTH_USER` | hi.ai.DownloadFileReq | hi.ai.DownloadFileResp | POST /api/v1/source/download_training_file |
| UploadAvatar | `AUTH_USER` | hi.UploadReq | hi.UploadResp | POST /api/v1/source/upload_avatar |
| UploadGroupAvatar | `AUTH_USER` | hi.UploadReq | hi.UploadResp | POST /api/v1/source/upload_group_avatar |
| UploadGroupBackground | `AUTH_USER` | hi.UploadReq | hi.UploadResp | POST /api/v1/source/upload_group_background |
| UploadLog | `AUTH_USER` | hi.UploadReq | hi.UploadResp | POST /api/v1/source/upload_log |
| UploadLogo | `AUTH_USER` | hi.UploadReq | hi.UploadResp | POST /api/v1/source/upload_logo |
| UploadScript | `AUTH_USER` | hi.UploadReq | hi.UploadResp | POST /api/v1/source/upload_script |
| UploadScriptStream ⇄ | `AUTH_USER` | hi.UploadStreamReq | hi.UploadResp | — |
| UploadSummary | `AUTH_USER` | hi.UploadReq | hi.UploadResp | POST /api/v1/source/upload_summary |
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
| MarkNoticeProcessed | `AUTH_USER` | MarkNoticeProcessedReq | google.protobuf.Empty | — |
| SetRemark | `AUTH_USER` | SetRemarkReq | google.protobuf.Empty | — |
| UnprocessedSysMsgCount | `AUTH_USER` | google.protobuf.Empty | UnprocessedSysMsgCountResp | — |
| Update | `AUTH_USER` | UpdateUserReq | UserInfo | — |

### hi.club.UserDirectory

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| ListOnline | `AUTH_NONE` | ListOnlineUsersReq | ListOnlineUsersResp | POST /api/v1/user_directory/list_online |

### hi.club.Wallet

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| UpdateAddresses | `AUTH_WEB3` | hi.SignedData | google.protobuf.Empty | — |

### hi.club.trade.Order

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Pull | `AUTH_INTERNAL` | hi.SignedData | hi.club.PullOrdersResp | — |
| Report | `AUTH_INTERNAL` | hi.SignedData | google.protobuf.Empty | — |

### hi.club.trade.Trade

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Add | `AUTH_INTERNAL` | hi.club.AddTradeReq | hi.club.AddTradeResp | — |
| Get | `AUTH_INTERNAL` | hi.club.GetTradeReq | hi.club.GetTradeResp | — |
| GetFee | `AUTH_INTERNAL` | hi.club.GetTradeFeeReq | hi.club.GetTradeFeeResp | — |
| List | `AUTH_INTERNAL` | ListTradesReq | hi.club.ListTradesResp | — |
| UpdateTransHash | `AUTH_INTERNAL` | hi.club.UpdateTransHashReq | google.protobuf.Empty | — |

### hi.club.trade.TradeManage

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| List | `AUTH_INTERNAL` | hi.club.TradeManageListReq | hi.club.ListTradesResp | — |

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
| RefreshToken | `AUTH_NONE` | RefreshTokenReq | hi.AuthToken | POST /api/v1/auth/refresh_token |
| Verify | `AUTH_WEB3` | hi.SignedData | LoginResp | — |
| VerifyOffline | `AUTH_WEB3` | hi.SignedData | LoginResp | — |

### hi.did.Base

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| ListCoins | `AUTH_NONE` | google.protobuf.Empty | ListCoinsResp | — |
| ServerVersion | `AUTH_NONE` | google.protobuf.Empty | hi.ServerVersionResp | — |
| UserTotal | `AUTH_NONE` | google.protobuf.Empty | UserTotalResp | GET /api/v1/base/user_total |

### hi.did.Broadcast

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| AppUpdate | `AUTH_SUPERADMIN` | BroadcastAppUpdateReq | google.protobuf.Empty | POST /api/v1/broadcast/app_update |

### hi.did.BroadcastInternal

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| PluginUpdate | `AUTH_MERCHANT` | BroadcastPluginUpdateReq | google.protobuf.Empty | — |

### hi.did.Gateway

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| List | `AUTH_MERCHANT+AUTH_USER` | google.protobuf.Empty | GatewayConfigListResp | GET /api/v1/gateway/list |

### hi.did.GatewayAdmin

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Set | `AUTH_SUPERADMIN` | GatewayConfigSetReq | google.protobuf.Empty | POST /api/v1/gateway_admin/set |

### hi.did.GatewayDevice

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| List | `AUTH_WEB3` | hi.SignedData | GatewayConfigListResp | — |

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
| SetUserCard | `AUTH_MERCHANT` | SetUserCardReq | google.protobuf.Empty | POST /api/v1/merchant/set_user_card |
| SetUsers | `AUTH_MERCHANT` | SetUsersReq | SetUsersResp | POST /api/v1/merchant/set_users |
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

### hi.did.Notify

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Transaction | `AUTH_WEB3` | hi.SignedData | google.protobuf.Empty | — |

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

### hi.did.PayRequest

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Close | `AUTH_MERCHANT` | hi.RequestId | google.protobuf.Empty | — |
| Register | `AUTH_MERCHANT` | PayRequestSpec | hi.RequestId | — |

### hi.did.PayRequestPayer

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Get | `AUTH_WEB3` | hi.SignedData | PayRequestSpec | — |

### hi.did.Price

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Get | `AUTH_NONE` | GetPriceReq | GetPriceResp | — |

### hi.did.Register

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Verify | `AUTH_NONE` | InviteCodeVerifyReq | hi.AuthToken | POST /api/v1/register/verify |

### hi.did.Release

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Download ⇄ | `AUTH_NONE` | DownloadReq | DownloadChunk | — |
| Latest | `AUTH_NONE` | LatestReq | ReleaseManifest | GET /api/v1/release/latest |

### hi.did.ReleaseManage

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Publish | `AUTH_SUPERADMIN` | PublishReq | google.protobuf.Empty | POST /api/v1/release_manage/publish |
| UploadPackage ⇄ | `AUTH_SUPERADMIN` | hi.UploadStreamReq | UploadPackageResp | — |

### hi.did.Source

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Delete | `AUTH_USER` | hi.DeleteResourceReq | google.protobuf.Empty | — |
| UploadAvatar | `AUTH_USER` | hi.UploadReq | hi.UploadResp | — |
| UploadLog | `AUTH_USER` | hi.UploadReq | hi.UploadResp | — |
| UploadPub | `AUTH_USER` | hi.UploadReq | hi.UploadResp | POST /api/v1/source/upload_pub |

### hi.did.SuperAdmin

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| List | `AUTH_MERCHANT+AUTH_USER` | google.protobuf.Empty | ListSuperAdminUsersResp | GET /api/v1/super_admin/list |

### hi.did.Transfer

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| History | `AUTH_NONE` | HistoryReq | HistoryResp | — |
| TxDetail | `AUTH_NONE` | TxDetailReq | TxDetailResp | — |
| TxStatus | `AUTH_NONE` | TxStatusReq | TxStatusResp | — |
| VerifySignature | `AUTH_WEB3` | hi.SignedData | hi.DID | — |
| VerifyTransaction | `AUTH_NONE` | VerifyTransactionReq | VerifyTransactionResp | — |

### hi.did.User

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Edit | `AUTH_USER` | EditProfileReq | hi.Entity | — |
| Query | `AUTH_USER` | google.protobuf.Empty | hi.Entity | — |

### hi.did.Wallet

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| Get | `AUTH_USER` | GetWalletReq | GetWalletResp | — |
| UpdateAssets | `AUTH_USER` | UpdateAssetsReq | google.protobuf.Empty | — |

### hi.media.Auth

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| GenerateReqId | `AUTH_NONE` | hi.did.GenerateReqIdReq | hi.RequestId | POST /api/v1/auth/generate_req_id |
| GetReqStatus | `AUTH_NONE` | hi.RequestId | hi.did.ReqStatusResp | POST /api/v1/auth/get_req_status |
| Logout | `AUTH_NONE` | hi.did.RefreshTokenReq | google.protobuf.Empty | POST /api/v1/auth/logout |
| RefreshToken | `AUTH_NONE` | hi.did.RefreshTokenReq | hi.AuthToken | POST /api/v1/auth/refresh_token |

### hi.media.Base

| 方法 | 档位 | 入参 | 返回 | HTTP |
|---|---|---|---|---|
| ServerVersion | `AUTH_NONE` | google.protobuf.Empty | hi.ServerVersionResp | GET /api/v1/base/server_version |

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
| GetObject | `AUTH_NONE` | GetObjectReq | GetObjectResp | — |
| GetObjectStream ⇄ | `AUTH_NONE` | GetObjectStreamReq | GetObjectStreamResp | — |
| ObjectInfo | `AUTH_NONE` | ObjectInfoReq | ObjectInfoResp | — |
| PresignedUrl | `AUTH_NONE` | PresignedUrlReq | PresignedUrlResp | — |
| Put | `AUTH_NONE` | PutReq | hi.UploadResp | — |
| PutObject | `AUTH_NONE` | PutObjectReq | google.protobuf.Empty | — |
| PutStream ⇄ | `AUTH_NONE` | PutStreamReq | hi.UploadResp | — |
