// This is a generated file - do not edit.
//
// Generated from v1/ai/bot.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use botConfigDescriptor instead')
const BotConfig$json = {
  '1': 'BotConfig',
  '2': [
    {'1': 'system_prompt', '3': 1, '4': 1, '5': 9, '10': 'systemPrompt'},
    {'1': 'user_prompt', '3': 2, '4': 1, '5': 9, '10': 'userPrompt'},
    {
      '1': 'freedom',
      '3': 3,
      '4': 1,
      '5': 2,
      '9': 0,
      '10': 'freedom',
      '17': true
    },
    {'1': 'gpt_model', '3': 4, '4': 1, '5': 9, '10': 'gptModel'},
    {'1': 'stt_model', '3': 5, '4': 1, '5': 9, '10': 'sttModel'},
    {'1': 'stt_lang', '3': 6, '4': 1, '5': 9, '10': 'sttLang'},
    {'1': 'tts_model', '3': 7, '4': 1, '5': 9, '10': 'ttsModel'},
    {'1': 'embedding_model', '3': 8, '4': 1, '5': 9, '10': 'embeddingModel'},
    {'1': 'qa_num', '3': 9, '4': 1, '5': 5, '9': 1, '10': 'qaNum', '17': true},
    {'1': 'mem_model', '3': 10, '4': 1, '5': 9, '10': 'memModel'},
    {'1': 'use_mem', '3': 11, '4': 1, '5': 9, '10': 'useMem'},
    {
      '1': 'use_plugin_search',
      '3': 12,
      '4': 1,
      '5': 9,
      '10': 'usePluginSearch'
    },
    {
      '1': 'use_plugin_python',
      '3': 13,
      '4': 1,
      '5': 9,
      '10': 'usePluginPython'
    },
    {'1': 'use_plugin_draw', '3': 14, '4': 1, '5': 9, '10': 'usePluginDraw'},
  ],
  '8': [
    {'1': '_freedom'},
    {'1': '_qa_num'},
  ],
};

/// Descriptor for `BotConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botConfigDescriptor = $convert.base64Decode(
    'CglCb3RDb25maWcSIwoNc3lzdGVtX3Byb21wdBgBIAEoCVIMc3lzdGVtUHJvbXB0Eh8KC3VzZX'
    'JfcHJvbXB0GAIgASgJUgp1c2VyUHJvbXB0Eh0KB2ZyZWVkb20YAyABKAJIAFIHZnJlZWRvbYgB'
    'ARIbCglncHRfbW9kZWwYBCABKAlSCGdwdE1vZGVsEhsKCXN0dF9tb2RlbBgFIAEoCVIIc3R0TW'
    '9kZWwSGQoIc3R0X2xhbmcYBiABKAlSB3N0dExhbmcSGwoJdHRzX21vZGVsGAcgASgJUgh0dHNN'
    'b2RlbBInCg9lbWJlZGRpbmdfbW9kZWwYCCABKAlSDmVtYmVkZGluZ01vZGVsEhoKBnFhX251bR'
    'gJIAEoBUgBUgVxYU51bYgBARIbCgltZW1fbW9kZWwYCiABKAlSCG1lbU1vZGVsEhcKB3VzZV9t'
    'ZW0YCyABKAlSBnVzZU1lbRIqChF1c2VfcGx1Z2luX3NlYXJjaBgMIAEoCVIPdXNlUGx1Z2luU2'
    'VhcmNoEioKEXVzZV9wbHVnaW5fcHl0aG9uGA0gASgJUg91c2VQbHVnaW5QeXRob24SJgoPdXNl'
    'X3BsdWdpbl9kcmF3GA4gASgJUg11c2VQbHVnaW5EcmF3QgoKCF9mcmVlZG9tQgkKB19xYV9udW'
    '0=');

@$core.Deprecated('Use botExtraDescriptor instead')
const BotExtra$json = {
  '1': 'BotExtra',
  '2': [
    {'1': 'creator_did', '3': 1, '4': 1, '5': 9, '10': 'creatorDid'},
    {'1': 'api_key', '3': 2, '4': 1, '5': 9, '10': 'apiKey'},
    {'1': 'note', '3': 3, '4': 1, '5': 9, '10': 'note'},
    {'1': 'bind_api_key', '3': 4, '4': 1, '5': 9, '10': 'bindApiKey'},
    {'1': 'org_name', '3': 5, '4': 1, '5': 9, '10': 'orgName'},
    {'1': 'org_logo', '3': 6, '4': 1, '5': 9, '10': 'orgLogo'},
    {'1': 'about', '3': 7, '4': 1, '5': 9, '10': 'about'},
    {'1': 'org_background', '3': 8, '4': 1, '5': 9, '10': 'orgBackground'},
    {'1': 'use_tokens', '3': 9, '4': 1, '5': 5, '10': 'useTokens'},
    {'1': 'prompt_tokens', '3': 10, '4': 1, '5': 5, '10': 'promptTokens'},
    {'1': 'mem_tokens', '3': 11, '4': 1, '5': 5, '10': 'memTokens'},
    {'1': 'created_at', '3': 12, '4': 1, '5': 3, '10': 'createdAt'},
    {'1': 'favorited', '3': 13, '4': 1, '5': 5, '10': 'favorited'},
  ],
};

/// Descriptor for `BotExtra`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botExtraDescriptor = $convert.base64Decode(
    'CghCb3RFeHRyYRIfCgtjcmVhdG9yX2RpZBgBIAEoCVIKY3JlYXRvckRpZBIXCgdhcGlfa2V5GA'
    'IgASgJUgZhcGlLZXkSEgoEbm90ZRgDIAEoCVIEbm90ZRIgCgxiaW5kX2FwaV9rZXkYBCABKAlS'
    'CmJpbmRBcGlLZXkSGQoIb3JnX25hbWUYBSABKAlSB29yZ05hbWUSGQoIb3JnX2xvZ28YBiABKA'
    'lSB29yZ0xvZ28SFAoFYWJvdXQYByABKAlSBWFib3V0EiUKDm9yZ19iYWNrZ3JvdW5kGAggASgJ'
    'Ug1vcmdCYWNrZ3JvdW5kEh0KCnVzZV90b2tlbnMYCSABKAVSCXVzZVRva2VucxIjCg1wcm9tcH'
    'RfdG9rZW5zGAogASgFUgxwcm9tcHRUb2tlbnMSHQoKbWVtX3Rva2VucxgLIAEoBVIJbWVtVG9r'
    'ZW5zEh0KCmNyZWF0ZWRfYXQYDCABKANSCWNyZWF0ZWRBdBIcCglmYXZvcml0ZWQYDSABKAVSCW'
    'Zhdm9yaXRlZA==');

@$core.Deprecated('Use botInfoDescriptor instead')
const BotInfo$json = {
  '1': 'BotInfo',
  '2': [
    {'1': 'profile', '3': 1, '4': 1, '5': 11, '6': '.hi.Unit', '10': 'profile'},
    {
      '1': 'config',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.ai.BotConfig',
      '10': 'config'
    },
    {'1': 'extra', '3': 3, '4': 1, '5': 11, '6': '.ai.BotExtra', '10': 'extra'},
  ],
};

/// Descriptor for `BotInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botInfoDescriptor = $convert.base64Decode(
    'CgdCb3RJbmZvEiIKB3Byb2ZpbGUYASABKAsyCC5oaS5Vbml0Ugdwcm9maWxlEiUKBmNvbmZpZx'
    'gCIAEoCzINLmFpLkJvdENvbmZpZ1IGY29uZmlnEiIKBWV4dHJhGAMgASgLMgwuYWkuQm90RXh0'
    'cmFSBWV4dHJh');

@$core.Deprecated('Use lLMModelsRespDescriptor instead')
const LLMModelsResp$json = {
  '1': 'LLMModelsResp',
  '2': [
    {'1': 'models', '3': 1, '4': 3, '5': 9, '10': 'models'},
  ],
};

/// Descriptor for `LLMModelsResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lLMModelsRespDescriptor = $convert
    .base64Decode('Cg1MTE1Nb2RlbHNSZXNwEhYKBm1vZGVscxgBIAMoCVIGbW9kZWxz');

@$core.Deprecated('Use botConfigRespDescriptor instead')
const BotConfigResp$json = {
  '1': 'BotConfigResp',
  '2': [
    {
      '1': 'config',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.ai.BotConfig',
      '10': 'config'
    },
  ],
};

/// Descriptor for `BotConfigResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botConfigRespDescriptor = $convert.base64Decode(
    'Cg1Cb3RDb25maWdSZXNwEiUKBmNvbmZpZxgBIAEoCzINLmFpLkJvdENvbmZpZ1IGY29uZmln');

@$core.Deprecated('Use embeddingModelsRespDescriptor instead')
const EmbeddingModelsResp$json = {
  '1': 'EmbeddingModelsResp',
  '2': [
    {'1': 'models', '3': 1, '4': 3, '5': 9, '10': 'models'},
  ],
};

/// Descriptor for `EmbeddingModelsResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List embeddingModelsRespDescriptor =
    $convert.base64Decode(
        'ChNFbWJlZGRpbmdNb2RlbHNSZXNwEhYKBm1vZGVscxgBIAMoCVIGbW9kZWxz');

@$core.Deprecated('Use audioModelsRespDescriptor instead')
const AudioModelsResp$json = {
  '1': 'AudioModelsResp',
  '2': [
    {'1': 'models', '3': 1, '4': 3, '5': 9, '10': 'models'},
    {'1': 'stt_langs', '3': 2, '4': 3, '5': 9, '10': 'sttLangs'},
  ],
};

/// Descriptor for `AudioModelsResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List audioModelsRespDescriptor = $convert.base64Decode(
    'Cg9BdWRpb01vZGVsc1Jlc3ASFgoGbW9kZWxzGAEgAygJUgZtb2RlbHMSGwoJc3R0X2xhbmdzGA'
    'IgAygJUghzdHRMYW5ncw==');

@$core.Deprecated('Use textModelsRespDescriptor instead')
const TextModelsResp$json = {
  '1': 'TextModelsResp',
  '2': [
    {'1': 'models', '3': 1, '4': 3, '5': 9, '10': 'models'},
  ],
};

/// Descriptor for `TextModelsResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List textModelsRespDescriptor = $convert
    .base64Decode('Cg5UZXh0TW9kZWxzUmVzcBIWCgZtb2RlbHMYASADKAlSBm1vZGVscw==');

@$core.Deprecated('Use createBotReqDescriptor instead')
const CreateBotReq$json = {
  '1': 'CreateBotReq',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'type', '3': 3, '4': 1, '5': 9, '10': 'type'},
    {'1': 'avatar', '3': 4, '4': 1, '5': 9, '10': 'avatar'},
    {'1': 'background', '3': 5, '4': 1, '5': 9, '10': 'background'},
    {'1': 'qa_num', '3': 6, '4': 1, '5': 5, '10': 'qaNum'},
    {'1': 'system_prompt', '3': 7, '4': 1, '5': 9, '10': 'systemPrompt'},
    {'1': 'user_prompt', '3': 8, '4': 1, '5': 9, '10': 'userPrompt'},
    {'1': 'freedom', '3': 9, '4': 1, '5': 2, '10': 'freedom'},
    {'1': 'gpt_model', '3': 10, '4': 1, '5': 9, '10': 'gptModel'},
    {'1': 'embedding_model', '3': 11, '4': 1, '5': 9, '10': 'embeddingModel'},
  ],
};

/// Descriptor for `CreateBotReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBotReqDescriptor = $convert.base64Decode(
    'CgxDcmVhdGVCb3RSZXESEAoDZGlkGAEgASgJUgNkaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRISCg'
    'R0eXBlGAMgASgJUgR0eXBlEhYKBmF2YXRhchgEIAEoCVIGYXZhdGFyEh4KCmJhY2tncm91bmQY'
    'BSABKAlSCmJhY2tncm91bmQSFQoGcWFfbnVtGAYgASgFUgVxYU51bRIjCg1zeXN0ZW1fcHJvbX'
    'B0GAcgASgJUgxzeXN0ZW1Qcm9tcHQSHwoLdXNlcl9wcm9tcHQYCCABKAlSCnVzZXJQcm9tcHQS'
    'GAoHZnJlZWRvbRgJIAEoAlIHZnJlZWRvbRIbCglncHRfbW9kZWwYCiABKAlSCGdwdE1vZGVsEi'
    'cKD2VtYmVkZGluZ19tb2RlbBgLIAEoCVIOZW1iZWRkaW5nTW9kZWw=');

@$core.Deprecated('Use createBotRespDescriptor instead')
const CreateBotResp$json = {
  '1': 'CreateBotResp',
  '2': [
    {'1': 'profile', '3': 1, '4': 1, '5': 11, '6': '.hi.Unit', '10': 'profile'},
    {
      '1': 'config',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.ai.BotConfig',
      '10': 'config'
    },
    {'1': 'creator_did', '3': 3, '4': 1, '5': 9, '10': 'creatorDid'},
  ],
};

/// Descriptor for `CreateBotResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBotRespDescriptor = $convert.base64Decode(
    'Cg1DcmVhdGVCb3RSZXNwEiIKB3Byb2ZpbGUYASABKAsyCC5oaS5Vbml0Ugdwcm9maWxlEiUKBm'
    'NvbmZpZxgCIAEoCzINLmFpLkJvdENvbmZpZ1IGY29uZmlnEh8KC2NyZWF0b3JfZGlkGAMgASgJ'
    'UgpjcmVhdG9yRGlk');

@$core.Deprecated('Use editBotReqDescriptor instead')
const EditBotReq$json = {
  '1': 'EditBotReq',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'avatar', '3': 3, '4': 1, '5': 9, '10': 'avatar'},
    {'1': 'background', '3': 4, '4': 1, '5': 9, '10': 'background'},
    {
      '1': 'bot_config',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.ai.BotConfig',
      '10': 'botConfig'
    },
    {'1': 'org_name', '3': 6, '4': 1, '5': 9, '10': 'orgName'},
    {'1': 'org_logo', '3': 7, '4': 1, '5': 9, '10': 'orgLogo'},
    {'1': 'org_background', '3': 8, '4': 1, '5': 9, '10': 'orgBackground'},
    {'1': 'about', '3': 9, '4': 1, '5': 9, '10': 'about'},
    {'1': 'note', '3': 10, '4': 1, '5': 9, '10': 'note'},
  ],
};

/// Descriptor for `EditBotReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editBotReqDescriptor = $convert.base64Decode(
    'CgpFZGl0Qm90UmVxEhAKA2RpZBgBIAEoCVIDZGlkEhIKBG5hbWUYAiABKAlSBG5hbWUSFgoGYX'
    'ZhdGFyGAMgASgJUgZhdmF0YXISHgoKYmFja2dyb3VuZBgEIAEoCVIKYmFja2dyb3VuZBIsCgpi'
    'b3RfY29uZmlnGAUgASgLMg0uYWkuQm90Q29uZmlnUglib3RDb25maWcSGQoIb3JnX25hbWUYBi'
    'ABKAlSB29yZ05hbWUSGQoIb3JnX2xvZ28YByABKAlSB29yZ0xvZ28SJQoOb3JnX2JhY2tncm91'
    'bmQYCCABKAlSDW9yZ0JhY2tncm91bmQSFAoFYWJvdXQYCSABKAlSBWFib3V0EhIKBG5vdGUYCi'
    'ABKAlSBG5vdGU=');

@$core.Deprecated('Use listBotRespDescriptor instead')
const ListBotResp$json = {
  '1': 'ListBotResp',
  '2': [
    {'1': 'total', '3': 1, '4': 1, '5': 3, '10': 'total'},
    {'1': 'infos', '3': 2, '4': 3, '5': 11, '6': '.ai.BotInfo', '10': 'infos'},
  ],
};

/// Descriptor for `ListBotResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listBotRespDescriptor = $convert.base64Decode(
    'CgtMaXN0Qm90UmVzcBIUCgV0b3RhbBgBIAEoA1IFdG90YWwSIQoFaW5mb3MYAiADKAsyCy5haS'
    '5Cb3RJbmZvUgVpbmZvcw==');

@$core.Deprecated('Use listBotByDidsReqDescriptor instead')
const ListBotByDidsReq$json = {
  '1': 'ListBotByDidsReq',
  '2': [
    {'1': 'bot_dids', '3': 1, '4': 3, '5': 9, '10': 'botDids'},
    {
      '1': 'pagination',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.hi.Pagination',
      '10': 'pagination'
    },
  ],
};

/// Descriptor for `ListBotByDidsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listBotByDidsReqDescriptor = $convert.base64Decode(
    'ChBMaXN0Qm90QnlEaWRzUmVxEhkKCGJvdF9kaWRzGAEgAygJUgdib3REaWRzEi4KCnBhZ2luYX'
    'Rpb24YAiABKAsyDi5oaS5QYWdpbmF0aW9uUgpwYWdpbmF0aW9u');

@$core.Deprecated('Use listBotByDidsRespDescriptor instead')
const ListBotByDidsResp$json = {
  '1': 'ListBotByDidsResp',
  '2': [
    {'1': 'total', '3': 1, '4': 1, '5': 3, '10': 'total'},
    {'1': 'infos', '3': 2, '4': 3, '5': 11, '6': '.ai.BotInfo', '10': 'infos'},
  ],
};

/// Descriptor for `ListBotByDidsResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listBotByDidsRespDescriptor = $convert.base64Decode(
    'ChFMaXN0Qm90QnlEaWRzUmVzcBIUCgV0b3RhbBgBIAEoA1IFdG90YWwSIQoFaW5mb3MYAiADKA'
    'syCy5haS5Cb3RJbmZvUgVpbmZvcw==');

@$core.Deprecated('Use deleteBotReqDescriptor instead')
const DeleteBotReq$json = {
  '1': 'DeleteBotReq',
  '2': [
    {'1': 'bot_did', '3': 1, '4': 1, '5': 9, '10': 'botDid'},
  ],
};

/// Descriptor for `DeleteBotReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteBotReqDescriptor = $convert
    .base64Decode('CgxEZWxldGVCb3RSZXESFwoHYm90X2RpZBgBIAEoCVIGYm90RGlk');

@$core.Deprecated('Use findBotReqDescriptor instead')
const FindBotReq$json = {
  '1': 'FindBotReq',
  '2': [
    {'1': 'bot_did', '3': 1, '4': 1, '5': 9, '10': 'botDid'},
  ],
};

/// Descriptor for `FindBotReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findBotReqDescriptor = $convert
    .base64Decode('CgpGaW5kQm90UmVxEhcKB2JvdF9kaWQYASABKAlSBmJvdERpZA==');

@$core.Deprecated('Use findBotRespDescriptor instead')
const FindBotResp$json = {
  '1': 'FindBotResp',
  '2': [
    {'1': 'info', '3': 1, '4': 1, '5': 11, '6': '.ai.BotInfo', '10': 'info'},
  ],
};

/// Descriptor for `FindBotResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findBotRespDescriptor = $convert.base64Decode(
    'CgtGaW5kQm90UmVzcBIfCgRpbmZvGAEgASgLMgsuYWkuQm90SW5mb1IEaW5mbw==');

@$core.Deprecated('Use findBotCountReqDescriptor instead')
const FindBotCountReq$json = {
  '1': 'FindBotCountReq',
  '2': [
    {'1': 'bot_did', '3': 1, '4': 1, '5': 9, '10': 'botDid'},
  ],
};

/// Descriptor for `FindBotCountReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findBotCountReqDescriptor = $convert
    .base64Decode('Cg9GaW5kQm90Q291bnRSZXESFwoHYm90X2RpZBgBIAEoCVIGYm90RGlk');

@$core.Deprecated('Use findBotCountRespDescriptor instead')
const FindBotCountResp$json = {
  '1': 'FindBotCountResp',
  '2': [
    {'1': 'message_count', '3': 1, '4': 1, '5': 5, '10': 'messageCount'},
    {'1': 'use_tokens', '3': 2, '4': 1, '5': 5, '10': 'useTokens'},
    {'1': 'prompt_tokens', '3': 3, '4': 1, '5': 5, '10': 'promptTokens'},
    {'1': 'mem_tokens', '3': 4, '4': 1, '5': 5, '10': 'memTokens'},
  ],
};

/// Descriptor for `FindBotCountResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findBotCountRespDescriptor = $convert.base64Decode(
    'ChBGaW5kQm90Q291bnRSZXNwEiMKDW1lc3NhZ2VfY291bnQYASABKAVSDG1lc3NhZ2VDb3VudB'
    'IdCgp1c2VfdG9rZW5zGAIgASgFUgl1c2VUb2tlbnMSIwoNcHJvbXB0X3Rva2VucxgDIAEoBVIM'
    'cHJvbXB0VG9rZW5zEh0KCm1lbV90b2tlbnMYBCABKAVSCW1lbVRva2Vucw==');

@$core.Deprecated('Use transferReqDescriptor instead')
const TransferReq$json = {
  '1': 'TransferReq',
  '2': [
    {'1': 'bot_did', '3': 1, '4': 1, '5': 9, '10': 'botDid'},
    {'1': 'to_user_did', '3': 2, '4': 1, '5': 9, '10': 'toUserDid'},
  ],
};

/// Descriptor for `TransferReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transferReqDescriptor = $convert.base64Decode(
    'CgtUcmFuc2ZlclJlcRIXCgdib3RfZGlkGAEgASgJUgZib3REaWQSHgoLdG9fdXNlcl9kaWQYAi'
    'ABKAlSCXRvVXNlckRpZA==');

@$core.Deprecated('Use bindApikeyReqDescriptor instead')
const BindApikeyReq$json = {
  '1': 'BindApikeyReq',
  '2': [
    {'1': 'operate', '3': 1, '4': 1, '5': 9, '10': 'operate'},
    {'1': 'bot_did', '3': 2, '4': 1, '5': 9, '10': 'botDid'},
  ],
};

/// Descriptor for `BindApikeyReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bindApikeyReqDescriptor = $convert.base64Decode(
    'Cg1CaW5kQXBpa2V5UmVxEhgKB29wZXJhdGUYASABKAlSB29wZXJhdGUSFwoHYm90X2RpZBgCIA'
    'EoCVIGYm90RGlk');

@$core.Deprecated('Use updatesToDefaultReqDescriptor instead')
const UpdatesToDefaultReq$json = {
  '1': 'UpdatesToDefaultReq',
  '2': [
    {'1': 'bot_dids', '3': 1, '4': 3, '5': 9, '10': 'botDids'},
  ],
};

/// Descriptor for `UpdatesToDefaultReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatesToDefaultReqDescriptor =
    $convert.base64Decode(
        'ChNVcGRhdGVzVG9EZWZhdWx0UmVxEhkKCGJvdF9kaWRzGAEgAygJUgdib3REaWRz');

@$core.Deprecated('Use favoriteBotReqDescriptor instead')
const FavoriteBotReq$json = {
  '1': 'FavoriteBotReq',
  '2': [
    {'1': 'bot_did', '3': 1, '4': 1, '5': 9, '10': 'botDid'},
    {'1': 'operation', '3': 2, '4': 1, '5': 5, '10': 'operation'},
  ],
};

/// Descriptor for `FavoriteBotReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List favoriteBotReqDescriptor = $convert.base64Decode(
    'Cg5GYXZvcml0ZUJvdFJlcRIXCgdib3RfZGlkGAEgASgJUgZib3REaWQSHAoJb3BlcmF0aW9uGA'
    'IgASgFUglvcGVyYXRpb24=');

@$core.Deprecated('Use favoriteBotListReqDescriptor instead')
const FavoriteBotListReq$json = {
  '1': 'FavoriteBotListReq',
  '2': [
    {
      '1': 'pagination',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.hi.Pagination',
      '10': 'pagination'
    },
  ],
};

/// Descriptor for `FavoriteBotListReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List favoriteBotListReqDescriptor = $convert.base64Decode(
    'ChJGYXZvcml0ZUJvdExpc3RSZXESLgoKcGFnaW5hdGlvbhgBIAEoCzIOLmhpLlBhZ2luYXRpb2'
    '5SCnBhZ2luYXRpb24=');

@$core.Deprecated('Use favoriteBotListRespDescriptor instead')
const FavoriteBotListResp$json = {
  '1': 'FavoriteBotListResp',
  '2': [
    {'1': 'total', '3': 1, '4': 1, '5': 3, '10': 'total'},
    {'1': 'infos', '3': 2, '4': 3, '5': 11, '6': '.ai.BotInfo', '10': 'infos'},
  ],
};

/// Descriptor for `FavoriteBotListResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List favoriteBotListRespDescriptor = $convert.base64Decode(
    'ChNGYXZvcml0ZUJvdExpc3RSZXNwEhQKBXRvdGFsGAEgASgDUgV0b3RhbBIhCgVpbmZvcxgCIA'
    'MoCzILLmFpLkJvdEluZm9SBWluZm9z');

@$core.Deprecated('Use favoriteBotListByDIDsReqDescriptor instead')
const FavoriteBotListByDIDsReq$json = {
  '1': 'FavoriteBotListByDIDsReq',
  '2': [
    {'1': 'bot_dids', '3': 1, '4': 3, '5': 9, '10': 'botDids'},
    {
      '1': 'pagination',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.hi.Pagination',
      '10': 'pagination'
    },
  ],
};

/// Descriptor for `FavoriteBotListByDIDsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List favoriteBotListByDIDsReqDescriptor =
    $convert.base64Decode(
        'ChhGYXZvcml0ZUJvdExpc3RCeURJRHNSZXESGQoIYm90X2RpZHMYASADKAlSB2JvdERpZHMSLg'
        'oKcGFnaW5hdGlvbhgCIAEoCzIOLmhpLlBhZ2luYXRpb25SCnBhZ2luYXRpb24=');

@$core.Deprecated('Use favoriteBotListByDIDsRespDescriptor instead')
const FavoriteBotListByDIDsResp$json = {
  '1': 'FavoriteBotListByDIDsResp',
  '2': [
    {'1': 'total', '3': 1, '4': 1, '5': 3, '10': 'total'},
    {'1': 'infos', '3': 2, '4': 3, '5': 11, '6': '.ai.BotInfo', '10': 'infos'},
  ],
};

/// Descriptor for `FavoriteBotListByDIDsResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List favoriteBotListByDIDsRespDescriptor =
    $convert.base64Decode(
        'ChlGYXZvcml0ZUJvdExpc3RCeURJRHNSZXNwEhQKBXRvdGFsGAEgASgDUgV0b3RhbBIhCgVpbm'
        'ZvcxgCIAMoCzILLmFpLkJvdEluZm9SBWluZm9z');

@$core.Deprecated('Use trainingBotReqDescriptor instead')
const TrainingBotReq$json = {
  '1': 'TrainingBotReq',
  '2': [
    {'1': 'file_ids', '3': 1, '4': 3, '5': 5, '10': 'fileIds'},
    {'1': 'bot_did', '3': 2, '4': 1, '5': 9, '10': 'botDid'},
  ],
};

/// Descriptor for `TrainingBotReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trainingBotReqDescriptor = $convert.base64Decode(
    'Cg5UcmFpbmluZ0JvdFJlcRIZCghmaWxlX2lkcxgBIAMoBVIHZmlsZUlkcxIXCgdib3RfZGlkGA'
    'IgASgJUgZib3REaWQ=');

@$core.Deprecated('Use trainingStatusReqDescriptor instead')
const TrainingStatusReq$json = {
  '1': 'TrainingStatusReq',
  '2': [
    {'1': 'bot_did', '3': 1, '4': 1, '5': 9, '10': 'botDid'},
  ],
};

/// Descriptor for `TrainingStatusReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trainingStatusReqDescriptor = $convert.base64Decode(
    'ChFUcmFpbmluZ1N0YXR1c1JlcRIXCgdib3RfZGlkGAEgASgJUgZib3REaWQ=');

@$core.Deprecated('Use trainingStatusRespDescriptor instead')
const TrainingStatusResp$json = {
  '1': 'TrainingStatusResp',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    {'1': 'mem_count', '3': 2, '4': 1, '5': 5, '10': 'memCount'},
    {'1': 'slice_count', '3': 3, '4': 1, '5': 5, '10': 'sliceCount'},
    {'1': 'message', '3': 4, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `TrainingStatusResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trainingStatusRespDescriptor = $convert.base64Decode(
    'ChJUcmFpbmluZ1N0YXR1c1Jlc3ASFgoGc3RhdHVzGAEgASgJUgZzdGF0dXMSGwoJbWVtX2NvdW'
    '50GAIgASgFUghtZW1Db3VudBIfCgtzbGljZV9jb3VudBgDIAEoBVIKc2xpY2VDb3VudBIYCgdt'
    'ZXNzYWdlGAQgASgJUgdtZXNzYWdl');

@$core.Deprecated('Use trainingClearReqDescriptor instead')
const TrainingClearReq$json = {
  '1': 'TrainingClearReq',
  '2': [
    {'1': 'bot_did', '3': 1, '4': 1, '5': 9, '10': 'botDid'},
  ],
};

/// Descriptor for `TrainingClearReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trainingClearReqDescriptor = $convert.base64Decode(
    'ChBUcmFpbmluZ0NsZWFyUmVxEhcKB2JvdF9kaWQYASABKAlSBmJvdERpZA==');

@$core.Deprecated('Use createBotFileReqDescriptor instead')
const CreateBotFileReq$json = {
  '1': 'CreateBotFileReq',
  '2': [
    {'1': 'bot_did', '3': 1, '4': 1, '5': 9, '10': 'botDid'},
    {'1': 'filename', '3': 2, '4': 1, '5': 9, '10': 'filename'},
    {'1': 'file_content', '3': 3, '4': 1, '5': 12, '10': 'fileContent'},
  ],
};

/// Descriptor for `CreateBotFileReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBotFileReqDescriptor = $convert.base64Decode(
    'ChBDcmVhdGVCb3RGaWxlUmVxEhcKB2JvdF9kaWQYASABKAlSBmJvdERpZBIaCghmaWxlbmFtZR'
    'gCIAEoCVIIZmlsZW5hbWUSIQoMZmlsZV9jb250ZW50GAMgASgMUgtmaWxlQ29udGVudA==');

@$core.Deprecated('Use botTrainingFileDescriptor instead')
const BotTrainingFile$json = {
  '1': 'BotTrainingFile',
  '2': [
    {'1': 'file_id', '3': 1, '4': 1, '5': 5, '10': 'fileId'},
    {'1': 'user_did', '3': 2, '4': 1, '5': 9, '10': 'userDid'},
    {'1': 'bot_did', '3': 3, '4': 1, '5': 9, '10': 'botDid'},
    {'1': 'content', '3': 4, '4': 1, '5': 9, '10': 'content'},
    {'1': 'file_path', '3': 5, '4': 1, '5': 9, '10': 'filePath'},
    {'1': 'title', '3': 6, '4': 1, '5': 9, '10': 'title'},
    {'1': 'size', '3': 7, '4': 1, '5': 5, '10': 'size'},
    {'1': 'type', '3': 8, '4': 1, '5': 9, '10': 'type'},
    {'1': 'is_use', '3': 9, '4': 1, '5': 5, '10': 'isUse'},
    {'1': 'digest', '3': 10, '4': 1, '5': 9, '10': 'digest'},
    {'1': 'training_time', '3': 11, '4': 1, '5': 3, '10': 'trainingTime'},
    {'1': 'created_at', '3': 12, '4': 1, '5': 3, '10': 'createdAt'},
    {'1': 'updated_at', '3': 13, '4': 1, '5': 3, '10': 'updatedAt'},
  ],
};

/// Descriptor for `BotTrainingFile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botTrainingFileDescriptor = $convert.base64Decode(
    'Cg9Cb3RUcmFpbmluZ0ZpbGUSFwoHZmlsZV9pZBgBIAEoBVIGZmlsZUlkEhkKCHVzZXJfZGlkGA'
    'IgASgJUgd1c2VyRGlkEhcKB2JvdF9kaWQYAyABKAlSBmJvdERpZBIYCgdjb250ZW50GAQgASgJ'
    'Ugdjb250ZW50EhsKCWZpbGVfcGF0aBgFIAEoCVIIZmlsZVBhdGgSFAoFdGl0bGUYBiABKAlSBX'
    'RpdGxlEhIKBHNpemUYByABKAVSBHNpemUSEgoEdHlwZRgIIAEoCVIEdHlwZRIVCgZpc191c2UY'
    'CSABKAVSBWlzVXNlEhYKBmRpZ2VzdBgKIAEoCVIGZGlnZXN0EiMKDXRyYWluaW5nX3RpbWUYCy'
    'ABKANSDHRyYWluaW5nVGltZRIdCgpjcmVhdGVkX2F0GAwgASgDUgljcmVhdGVkQXQSHQoKdXBk'
    'YXRlZF9hdBgNIAEoA1IJdXBkYXRlZEF0');

@$core.Deprecated('Use listBotFileReqDescriptor instead')
const ListBotFileReq$json = {
  '1': 'ListBotFileReq',
  '2': [
    {'1': 'bot_did', '3': 1, '4': 1, '5': 9, '10': 'botDid'},
    {'1': 'use', '3': 2, '4': 1, '5': 8, '10': 'use'},
    {
      '1': 'pagination',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.hi.Pagination',
      '10': 'pagination'
    },
  ],
};

/// Descriptor for `ListBotFileReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listBotFileReqDescriptor = $convert.base64Decode(
    'Cg5MaXN0Qm90RmlsZVJlcRIXCgdib3RfZGlkGAEgASgJUgZib3REaWQSEAoDdXNlGAIgASgIUg'
    'N1c2USLgoKcGFnaW5hdGlvbhgDIAEoCzIOLmhpLlBhZ2luYXRpb25SCnBhZ2luYXRpb24=');

@$core.Deprecated('Use listBotFileRespDescriptor instead')
const ListBotFileResp$json = {
  '1': 'ListBotFileResp',
  '2': [
    {'1': 'total', '3': 1, '4': 1, '5': 3, '10': 'total'},
    {
      '1': 'training_file_list',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.ai.BotTrainingFile',
      '10': 'trainingFileList'
    },
  ],
};

/// Descriptor for `ListBotFileResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listBotFileRespDescriptor = $convert.base64Decode(
    'Cg9MaXN0Qm90RmlsZVJlc3ASFAoFdG90YWwYASABKANSBXRvdGFsEkEKEnRyYWluaW5nX2ZpbG'
    'VfbGlzdBgCIAMoCzITLmFpLkJvdFRyYWluaW5nRmlsZVIQdHJhaW5pbmdGaWxlTGlzdA==');

@$core.Deprecated('Use deleteBotFileReqDescriptor instead')
const DeleteBotFileReq$json = {
  '1': 'DeleteBotFileReq',
  '2': [
    {'1': 'file_id', '3': 1, '4': 1, '5': 5, '10': 'fileId'},
  ],
};

/// Descriptor for `DeleteBotFileReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteBotFileReqDescriptor = $convert.base64Decode(
    'ChBEZWxldGVCb3RGaWxlUmVxEhcKB2ZpbGVfaWQYASABKAVSBmZpbGVJZA==');

@$core.Deprecated('Use deleteBotFilesReqDescriptor instead')
const DeleteBotFilesReq$json = {
  '1': 'DeleteBotFilesReq',
  '2': [
    {'1': 'bot_did', '3': 1, '4': 1, '5': 9, '10': 'botDid'},
    {'1': 'file_ids', '3': 2, '4': 3, '5': 5, '10': 'fileIds'},
  ],
};

/// Descriptor for `DeleteBotFilesReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteBotFilesReqDescriptor = $convert.base64Decode(
    'ChFEZWxldGVCb3RGaWxlc1JlcRIXCgdib3RfZGlkGAEgASgJUgZib3REaWQSGQoIZmlsZV9pZH'
    'MYAiADKAVSB2ZpbGVJZHM=');

@$core.Deprecated('Use deleteBotFilesByDidReqDescriptor instead')
const DeleteBotFilesByDidReq$json = {
  '1': 'DeleteBotFilesByDidReq',
  '2': [
    {'1': 'bot_dids', '3': 1, '4': 3, '5': 9, '10': 'botDids'},
  ],
};

/// Descriptor for `DeleteBotFilesByDidReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteBotFilesByDidReqDescriptor =
    $convert.base64Decode(
        'ChZEZWxldGVCb3RGaWxlc0J5RGlkUmVxEhkKCGJvdF9kaWRzGAEgAygJUgdib3REaWRz');

@$core.Deprecated('Use getBotFileReqDescriptor instead')
const GetBotFileReq$json = {
  '1': 'GetBotFileReq',
  '2': [
    {'1': 'file_id', '3': 1, '4': 1, '5': 5, '10': 'fileId'},
  ],
};

/// Descriptor for `GetBotFileReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBotFileReqDescriptor = $convert
    .base64Decode('Cg1HZXRCb3RGaWxlUmVxEhcKB2ZpbGVfaWQYASABKAVSBmZpbGVJZA==');

@$core.Deprecated('Use getBotFileRespDescriptor instead')
const GetBotFileResp$json = {
  '1': 'GetBotFileResp',
  '2': [
    {
      '1': 'file',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.ai.BotTrainingFile',
      '10': 'file'
    },
  ],
};

/// Descriptor for `GetBotFileResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBotFileRespDescriptor = $convert.base64Decode(
    'Cg5HZXRCb3RGaWxlUmVzcBInCgRmaWxlGAEgASgLMhMuYWkuQm90VHJhaW5pbmdGaWxlUgRmaW'
    'xl');

@$core.Deprecated('Use updateCotentReqDescriptor instead')
const UpdateCotentReq$json = {
  '1': 'UpdateCotentReq',
  '2': [
    {'1': 'bot_did', '3': 1, '4': 1, '5': 9, '10': 'botDid'},
    {'1': 'file_id', '3': 2, '4': 1, '5': 5, '10': 'fileId'},
    {'1': 'content', '3': 3, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `UpdateCotentReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateCotentReqDescriptor = $convert.base64Decode(
    'Cg9VcGRhdGVDb3RlbnRSZXESFwoHYm90X2RpZBgBIAEoCVIGYm90RGlkEhcKB2ZpbGVfaWQYAi'
    'ABKAVSBmZpbGVJZBIYCgdjb250ZW50GAMgASgJUgdjb250ZW50');

@$core.Deprecated('Use createCotentReqDescriptor instead')
const CreateCotentReq$json = {
  '1': 'CreateCotentReq',
  '2': [
    {'1': 'bot_did', '3': 1, '4': 1, '5': 9, '10': 'botDid'},
    {'1': 'content', '3': 2, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `CreateCotentReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createCotentReqDescriptor = $convert.base64Decode(
    'Cg9DcmVhdGVDb3RlbnRSZXESFwoHYm90X2RpZBgBIAEoCVIGYm90RGlkEhgKB2NvbnRlbnQYAi'
    'ABKAlSB2NvbnRlbnQ=');

@$core.Deprecated('Use createCotentRespDescriptor instead')
const CreateCotentResp$json = {
  '1': 'CreateCotentResp',
  '2': [
    {
      '1': 'file',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.ai.BotTrainingFile',
      '10': 'file'
    },
  ],
};

/// Descriptor for `CreateCotentResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createCotentRespDescriptor = $convert.base64Decode(
    'ChBDcmVhdGVDb3RlbnRSZXNwEicKBGZpbGUYASABKAsyEy5haS5Cb3RUcmFpbmluZ0ZpbGVSBG'
    'ZpbGU=');

@$core.Deprecated('Use editDigestReqDescriptor instead')
const EditDigestReq$json = {
  '1': 'EditDigestReq',
  '2': [
    {'1': 'file_id', '3': 1, '4': 1, '5': 5, '10': 'fileId'},
    {'1': 'bot_did', '3': 2, '4': 1, '5': 9, '10': 'botDid'},
    {'1': 'digest', '3': 3, '4': 1, '5': 9, '10': 'digest'},
  ],
};

/// Descriptor for `EditDigestReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editDigestReqDescriptor = $convert.base64Decode(
    'Cg1FZGl0RGlnZXN0UmVxEhcKB2ZpbGVfaWQYASABKAVSBmZpbGVJZBIXCgdib3RfZGlkGAIgAS'
    'gJUgZib3REaWQSFgoGZGlnZXN0GAMgASgJUgZkaWdlc3Q=');

@$core.Deprecated('Use drawConfigRespDescriptor instead')
const DrawConfigResp$json = {
  '1': 'DrawConfigResp',
  '2': [
    {'1': 'draw_style', '3': 1, '4': 3, '5': 9, '10': 'drawStyle'},
    {
      '1': 'draw_style_default',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'drawStyleDefault'
    },
    {'1': 'draw_quality', '3': 3, '4': 3, '5': 9, '10': 'drawQuality'},
    {
      '1': 'draw_quality_default',
      '3': 4,
      '4': 1,
      '5': 9,
      '10': 'drawQualityDefault'
    },
    {'1': 'draw_model', '3': 5, '4': 1, '5': 9, '10': 'drawModel'},
    {'1': 'draw_size', '3': 6, '4': 3, '5': 9, '10': 'drawSize'},
    {'1': 'draw_size_default', '3': 7, '4': 1, '5': 9, '10': 'drawSizeDefault'},
    {'1': 'draw_n', '3': 8, '4': 1, '5': 5, '10': 'drawN'},
  ],
};

/// Descriptor for `DrawConfigResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List drawConfigRespDescriptor = $convert.base64Decode(
    'Cg5EcmF3Q29uZmlnUmVzcBIdCgpkcmF3X3N0eWxlGAEgAygJUglkcmF3U3R5bGUSLAoSZHJhd1'
    '9zdHlsZV9kZWZhdWx0GAIgASgJUhBkcmF3U3R5bGVEZWZhdWx0EiEKDGRyYXdfcXVhbGl0eRgD'
    'IAMoCVILZHJhd1F1YWxpdHkSMAoUZHJhd19xdWFsaXR5X2RlZmF1bHQYBCABKAlSEmRyYXdRdW'
    'FsaXR5RGVmYXVsdBIdCgpkcmF3X21vZGVsGAUgASgJUglkcmF3TW9kZWwSGwoJZHJhd19zaXpl'
    'GAYgAygJUghkcmF3U2l6ZRIqChFkcmF3X3NpemVfZGVmYXVsdBgHIAEoCVIPZHJhd1NpemVEZW'
    'ZhdWx0EhUKBmRyYXdfbhgIIAEoBVIFZHJhd04=');

@$core.Deprecated('Use namesReqDescriptor instead')
const NamesReq$json = {
  '1': 'NamesReq',
  '2': [
    {'1': 'bot_did', '3': 1, '4': 1, '5': 9, '10': 'botDid'},
  ],
};

/// Descriptor for `NamesReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List namesReqDescriptor =
    $convert.base64Decode('CghOYW1lc1JlcRIXCgdib3RfZGlkGAEgASgJUgZib3REaWQ=');

@$core.Deprecated('Use namesRespDescriptor instead')
const NamesResp$json = {
  '1': 'NamesResp',
  '2': [
    {
      '1': 'functions',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.ai.NamesResp.Function',
      '10': 'functions'
    },
  ],
  '3': [NamesResp_Function$json],
};

@$core.Deprecated('Use namesRespDescriptor instead')
const NamesResp_Function$json = {
  '1': 'Function',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'enable', '3': 2, '4': 1, '5': 9, '10': 'enable'},
  ],
};

/// Descriptor for `NamesResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List namesRespDescriptor = $convert.base64Decode(
    'CglOYW1lc1Jlc3ASNAoJZnVuY3Rpb25zGAEgAygLMhYuYWkuTmFtZXNSZXNwLkZ1bmN0aW9uUg'
    'lmdW5jdGlvbnMaNgoIRnVuY3Rpb24SEgoEbmFtZRgBIAEoCVIEbmFtZRIWCgZlbmFibGUYAiAB'
    'KAlSBmVuYWJsZQ==');

@$core.Deprecated('Use createBotPluginReqDescriptor instead')
const CreateBotPluginReq$json = {
  '1': 'CreateBotPluginReq',
  '2': [
    {'1': 'bot_did', '3': 1, '4': 1, '5': 9, '10': 'botDid'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'type', '3': 3, '4': 1, '5': 9, '10': 'type'},
    {'1': 'url', '3': 4, '4': 1, '5': 9, '10': 'url'},
    {
      '1': 'function_description',
      '3': 5,
      '4': 1,
      '5': 9,
      '10': 'functionDescription'
    },
    {'1': 'draw_style', '3': 6, '4': 1, '5': 9, '10': 'drawStyle'},
    {'1': 'draw_quality', '3': 7, '4': 1, '5': 9, '10': 'drawQuality'},
    {'1': 'draw_size', '3': 8, '4': 1, '5': 9, '10': 'drawSize'},
    {'1': 'use_plugin_search', '3': 9, '4': 1, '5': 9, '10': 'usePluginSearch'},
    {
      '1': 'use_plugin_python',
      '3': 10,
      '4': 1,
      '5': 9,
      '10': 'usePluginPython'
    },
    {'1': 'use_plugin_draw', '3': 11, '4': 1, '5': 9, '10': 'usePluginDraw'},
  ],
};

/// Descriptor for `CreateBotPluginReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBotPluginReqDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVCb3RQbHVnaW5SZXESFwoHYm90X2RpZBgBIAEoCVIGYm90RGlkEhIKBG5hbWUYAi'
    'ABKAlSBG5hbWUSEgoEdHlwZRgDIAEoCVIEdHlwZRIQCgN1cmwYBCABKAlSA3VybBIxChRmdW5j'
    'dGlvbl9kZXNjcmlwdGlvbhgFIAEoCVITZnVuY3Rpb25EZXNjcmlwdGlvbhIdCgpkcmF3X3N0eW'
    'xlGAYgASgJUglkcmF3U3R5bGUSIQoMZHJhd19xdWFsaXR5GAcgASgJUgtkcmF3UXVhbGl0eRIb'
    'CglkcmF3X3NpemUYCCABKAlSCGRyYXdTaXplEioKEXVzZV9wbHVnaW5fc2VhcmNoGAkgASgJUg'
    '91c2VQbHVnaW5TZWFyY2gSKgoRdXNlX3BsdWdpbl9weXRob24YCiABKAlSD3VzZVBsdWdpblB5'
    'dGhvbhImCg91c2VfcGx1Z2luX2RyYXcYCyABKAlSDXVzZVBsdWdpbkRyYXc=');

@$core.Deprecated('Use botPluginListReqDescriptor instead')
const BotPluginListReq$json = {
  '1': 'BotPluginListReq',
  '2': [
    {'1': 'bot_did', '3': 1, '4': 1, '5': 9, '10': 'botDid'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {
      '1': 'pagination',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.hi.Pagination',
      '10': 'pagination'
    },
  ],
};

/// Descriptor for `BotPluginListReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botPluginListReqDescriptor = $convert.base64Decode(
    'ChBCb3RQbHVnaW5MaXN0UmVxEhcKB2JvdF9kaWQYASABKAlSBmJvdERpZBISCgRuYW1lGAIgAS'
    'gJUgRuYW1lEi4KCnBhZ2luYXRpb24YAyABKAsyDi5oaS5QYWdpbmF0aW9uUgpwYWdpbmF0aW9u');

@$core.Deprecated('Use botPluginInfoDescriptor instead')
const BotPluginInfo$json = {
  '1': 'BotPluginInfo',
  '2': [
    {'1': 'bot_did', '3': 1, '4': 1, '5': 9, '10': 'botDid'},
    {'1': 'uuid', '3': 2, '4': 1, '5': 9, '10': 'uuid'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'method', '3': 4, '4': 1, '5': 9, '10': 'method'},
    {'1': 'type', '3': 5, '4': 1, '5': 9, '10': 'type'},
    {'1': 'url', '3': 6, '4': 1, '5': 9, '10': 'url'},
    {'1': 'note', '3': 7, '4': 1, '5': 9, '10': 'note'},
    {'1': 'function_name', '3': 8, '4': 1, '5': 9, '10': 'functionName'},
    {
      '1': 'function_description',
      '3': 9,
      '4': 1,
      '5': 9,
      '10': 'functionDescription'
    },
    {'1': 'draw_style', '3': 10, '4': 1, '5': 9, '10': 'drawStyle'},
    {'1': 'draw_quality', '3': 11, '4': 1, '5': 9, '10': 'drawQuality'},
    {'1': 'draw_model', '3': 12, '4': 1, '5': 9, '10': 'drawModel'},
    {'1': 'draw_size', '3': 13, '4': 1, '5': 9, '10': 'drawSize'},
    {'1': 'draw_n', '3': 14, '4': 1, '5': 5, '10': 'drawN'},
    {'1': 'created_at', '3': 15, '4': 1, '5': 3, '10': 'createdAt'},
  ],
};

/// Descriptor for `BotPluginInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botPluginInfoDescriptor = $convert.base64Decode(
    'Cg1Cb3RQbHVnaW5JbmZvEhcKB2JvdF9kaWQYASABKAlSBmJvdERpZBISCgR1dWlkGAIgASgJUg'
    'R1dWlkEhIKBG5hbWUYAyABKAlSBG5hbWUSFgoGbWV0aG9kGAQgASgJUgZtZXRob2QSEgoEdHlw'
    'ZRgFIAEoCVIEdHlwZRIQCgN1cmwYBiABKAlSA3VybBISCgRub3RlGAcgASgJUgRub3RlEiMKDW'
    'Z1bmN0aW9uX25hbWUYCCABKAlSDGZ1bmN0aW9uTmFtZRIxChRmdW5jdGlvbl9kZXNjcmlwdGlv'
    'bhgJIAEoCVITZnVuY3Rpb25EZXNjcmlwdGlvbhIdCgpkcmF3X3N0eWxlGAogASgJUglkcmF3U3'
    'R5bGUSIQoMZHJhd19xdWFsaXR5GAsgASgJUgtkcmF3UXVhbGl0eRIdCgpkcmF3X21vZGVsGAwg'
    'ASgJUglkcmF3TW9kZWwSGwoJZHJhd19zaXplGA0gASgJUghkcmF3U2l6ZRIVCgZkcmF3X24YDi'
    'ABKAVSBWRyYXdOEh0KCmNyZWF0ZWRfYXQYDyABKANSCWNyZWF0ZWRBdA==');

@$core.Deprecated('Use botPluginListRespDescriptor instead')
const BotPluginListResp$json = {
  '1': 'BotPluginListResp',
  '2': [
    {'1': 'total', '3': 1, '4': 1, '5': 3, '10': 'total'},
    {
      '1': 'plugin_info_list',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.ai.BotPluginInfo',
      '10': 'pluginInfoList'
    },
  ],
};

/// Descriptor for `BotPluginListResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botPluginListRespDescriptor = $convert.base64Decode(
    'ChFCb3RQbHVnaW5MaXN0UmVzcBIUCgV0b3RhbBgBIAEoA1IFdG90YWwSOwoQcGx1Z2luX2luZm'
    '9fbGlzdBgCIAMoCzIRLmFpLkJvdFBsdWdpbkluZm9SDnBsdWdpbkluZm9MaXN0');

@$core.Deprecated('Use deleteBotPluginReqDescriptor instead')
const DeleteBotPluginReq$json = {
  '1': 'DeleteBotPluginReq',
  '2': [
    {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
  ],
};

/// Descriptor for `DeleteBotPluginReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteBotPluginReqDescriptor = $convert
    .base64Decode('ChJEZWxldGVCb3RQbHVnaW5SZXESEgoEdXVpZBgBIAEoCVIEdXVpZA==');

@$core.Deprecated('Use deleteBotPluginByDidsReqDescriptor instead')
const DeleteBotPluginByDidsReq$json = {
  '1': 'DeleteBotPluginByDidsReq',
  '2': [
    {'1': 'bot_dids', '3': 1, '4': 3, '5': 9, '10': 'botDids'},
  ],
};

/// Descriptor for `DeleteBotPluginByDidsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteBotPluginByDidsReqDescriptor =
    $convert.base64Decode(
        'ChhEZWxldGVCb3RQbHVnaW5CeURpZHNSZXESGQoIYm90X2RpZHMYASADKAlSB2JvdERpZHM=');

@$core.Deprecated('Use editBotPluginReqDescriptor instead')
const EditBotPluginReq$json = {
  '1': 'EditBotPluginReq',
  '2': [
    {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    {'1': 'bot_did', '3': 2, '4': 1, '5': 9, '10': 'botDid'},
    {'1': 'type', '3': 3, '4': 1, '5': 9, '10': 'type'},
    {'1': 'url', '3': 4, '4': 1, '5': 9, '10': 'url'},
    {
      '1': 'function_description',
      '3': 5,
      '4': 1,
      '5': 9,
      '10': 'functionDescription'
    },
  ],
};

/// Descriptor for `EditBotPluginReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editBotPluginReqDescriptor = $convert.base64Decode(
    'ChBFZGl0Qm90UGx1Z2luUmVxEhIKBHV1aWQYASABKAlSBHV1aWQSFwoHYm90X2RpZBgCIAEoCV'
    'IGYm90RGlkEhIKBHR5cGUYAyABKAlSBHR5cGUSEAoDdXJsGAQgASgJUgN1cmwSMQoUZnVuY3Rp'
    'b25fZGVzY3JpcHRpb24YBSABKAlSE2Z1bmN0aW9uRGVzY3JpcHRpb24=');
