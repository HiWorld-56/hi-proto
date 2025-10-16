// This is a generated file - do not edit.
//
// Generated from v1/club/chat_user.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use chatUserBaseInfoDescriptor instead')
const ChatUserBaseInfo$json = {
  '1': 'ChatUserBaseInfo',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'type', '3': 3, '4': 1, '5': 9, '10': 'type'},
    {'1': 'avatar', '3': 4, '4': 1, '5': 9, '10': 'avatar'},
    {'1': 'background', '3': 5, '4': 1, '5': 9, '10': 'background'},
    {'1': 'mqtt_username', '3': 6, '4': 1, '5': 9, '10': 'mqttUsername'},
    {'1': 'email', '3': 7, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `ChatUserBaseInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatUserBaseInfoDescriptor = $convert.base64Decode(
    'ChBDaGF0VXNlckJhc2VJbmZvEhAKA2RpZBgBIAEoCVIDZGlkEhIKBG5hbWUYAiABKAlSBG5hbW'
    'USEgoEdHlwZRgDIAEoCVIEdHlwZRIWCgZhdmF0YXIYBCABKAlSBmF2YXRhchIeCgpiYWNrZ3Jv'
    'dW5kGAUgASgJUgpiYWNrZ3JvdW5kEiMKDW1xdHRfdXNlcm5hbWUYBiABKAlSDG1xdHRVc2Vybm'
    'FtZRIUCgVlbWFpbBgHIAEoCVIFZW1haWw=');

@$core.Deprecated('Use userInfoParamDescriptor instead')
const UserInfoParam$json = {
  '1': 'UserInfoParam',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
  ],
};

/// Descriptor for `UserInfoParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userInfoParamDescriptor =
    $convert.base64Decode('Cg1Vc2VySW5mb1BhcmFtEhAKA2RpZBgBIAEoCVIDZGlk');

@$core.Deprecated('Use chatUserInfoDescriptor instead')
const ChatUserInfo$json = {
  '1': 'ChatUserInfo',
  '2': [
    {
      '1': 'base_info',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.club.ChatUserBaseInfo',
      '10': 'baseInfo'
    },
    {'1': 'role', '3': 2, '4': 1, '5': 5, '10': 'role'},
    {'1': 'permissions', '3': 3, '4': 3, '5': 9, '10': 'permissions'},
    {
      '1': 'attributes',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Any',
      '10': 'attributes'
    },
  ],
};

/// Descriptor for `ChatUserInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatUserInfoDescriptor = $convert.base64Decode(
    'CgxDaGF0VXNlckluZm8SMwoJYmFzZV9pbmZvGAEgASgLMhYuY2x1Yi5DaGF0VXNlckJhc2VJbm'
    'ZvUghiYXNlSW5mbxISCgRyb2xlGAIgASgFUgRyb2xlEiAKC3Blcm1pc3Npb25zGAMgAygJUgtw'
    'ZXJtaXNzaW9ucxI0CgphdHRyaWJ1dGVzGAQgASgLMhQuZ29vZ2xlLnByb3RvYnVmLkFueVIKYX'
    'R0cmlidXRlcw==');

@$core.Deprecated('Use chatBotAttributeDescriptor instead')
const ChatBotAttribute$json = {
  '1': 'ChatBotAttribute',
  '2': [
    {'1': 'creator_did', '3': 1, '4': 1, '5': 9, '10': 'creatorDid'},
    {'1': 'qa_num', '3': 2, '4': 1, '5': 5, '10': 'qaNum'},
    {'1': 'system_prompt', '3': 3, '4': 1, '5': 9, '10': 'systemPrompt'},
    {'1': 'user_prompt', '3': 4, '4': 1, '5': 9, '10': 'userPrompt'},
    {'1': 'freedom', '3': 5, '4': 1, '5': 1, '10': 'freedom'},
    {'1': 'gpt_model', '3': 6, '4': 1, '5': 9, '10': 'gptModel'},
    {'1': 'embedding_model', '3': 7, '4': 1, '5': 9, '10': 'embeddingModel'},
    {'1': 'created_at', '3': 8, '4': 1, '5': 9, '10': 'createdAt'},
    {'1': 'message_count', '3': 9, '4': 1, '5': 5, '10': 'messageCount'},
    {'1': 'follow_count', '3': 10, '4': 1, '5': 5, '10': 'followCount'},
    {'1': 'mem_model', '3': 11, '4': 1, '5': 9, '10': 'memModel'},
    {'1': 'use_mem', '3': 12, '4': 1, '5': 9, '10': 'useMem'},
    {'1': 'use_about', '3': 13, '4': 1, '5': 9, '10': 'useAbout'},
    {'1': 'org_name', '3': 14, '4': 1, '5': 9, '10': 'orgName'},
    {'1': 'org_logo', '3': 15, '4': 1, '5': 9, '10': 'orgLogo'},
    {'1': 'org_backgroud', '3': 16, '4': 1, '5': 9, '10': 'orgBackgroud'},
    {'1': 'about', '3': 17, '4': 1, '5': 9, '10': 'about'},
    {'1': 'stt_lang', '3': 18, '4': 1, '5': 9, '10': 'sttLang'},
    {'1': 'stt_model', '3': 19, '4': 1, '5': 9, '10': 'sttModel'},
    {'1': 'master', '3': 20, '4': 1, '5': 9, '10': 'master'},
  ],
};

/// Descriptor for `ChatBotAttribute`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatBotAttributeDescriptor = $convert.base64Decode(
    'ChBDaGF0Qm90QXR0cmlidXRlEh8KC2NyZWF0b3JfZGlkGAEgASgJUgpjcmVhdG9yRGlkEhUKBn'
    'FhX251bRgCIAEoBVIFcWFOdW0SIwoNc3lzdGVtX3Byb21wdBgDIAEoCVIMc3lzdGVtUHJvbXB0'
    'Eh8KC3VzZXJfcHJvbXB0GAQgASgJUgp1c2VyUHJvbXB0EhgKB2ZyZWVkb20YBSABKAFSB2ZyZW'
    'Vkb20SGwoJZ3B0X21vZGVsGAYgASgJUghncHRNb2RlbBInCg9lbWJlZGRpbmdfbW9kZWwYByAB'
    'KAlSDmVtYmVkZGluZ01vZGVsEh0KCmNyZWF0ZWRfYXQYCCABKAlSCWNyZWF0ZWRBdBIjCg1tZX'
    'NzYWdlX2NvdW50GAkgASgFUgxtZXNzYWdlQ291bnQSIQoMZm9sbG93X2NvdW50GAogASgFUgtm'
    'b2xsb3dDb3VudBIbCgltZW1fbW9kZWwYCyABKAlSCG1lbU1vZGVsEhcKB3VzZV9tZW0YDCABKA'
    'lSBnVzZU1lbRIbCgl1c2VfYWJvdXQYDSABKAlSCHVzZUFib3V0EhkKCG9yZ19uYW1lGA4gASgJ'
    'UgdvcmdOYW1lEhkKCG9yZ19sb2dvGA8gASgJUgdvcmdMb2dvEiMKDW9yZ19iYWNrZ3JvdWQYEC'
    'ABKAlSDG9yZ0JhY2tncm91ZBIUCgVhYm91dBgRIAEoCVIFYWJvdXQSGQoIc3R0X2xhbmcYEiAB'
    'KAlSB3N0dExhbmcSGwoJc3R0X21vZGVsGBMgASgJUghzdHRNb2RlbBIWCgZtYXN0ZXIYFCABKA'
    'lSBm1hc3Rlcg==');

@$core.Deprecated('Use updateUserInfoParamDescriptor instead')
const UpdateUserInfoParam$json = {
  '1': 'UpdateUserInfoParam',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'avatar', '3': 2, '4': 1, '5': 9, '10': 'avatar'},
    {'1': 'background', '3': 3, '4': 1, '5': 9, '10': 'background'},
  ],
};

/// Descriptor for `UpdateUserInfoParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserInfoParamDescriptor = $convert.base64Decode(
    'ChNVcGRhdGVVc2VySW5mb1BhcmFtEhIKBG5hbWUYASABKAlSBG5hbWUSFgoGYXZhdGFyGAIgAS'
    'gJUgZhdmF0YXISHgoKYmFja2dyb3VuZBgDIAEoCVIKYmFja2dyb3VuZA==');

@$core.Deprecated('Use systemMessageListParamDescriptor instead')
const SystemMessageListParam$json = {
  '1': 'SystemMessageListParam',
  '2': [
    {'1': 'message_status', '3': 1, '4': 1, '5': 9, '10': 'messageStatus'},
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

/// Descriptor for `SystemMessageListParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List systemMessageListParamDescriptor = $convert.base64Decode(
    'ChZTeXN0ZW1NZXNzYWdlTGlzdFBhcmFtEiUKDm1lc3NhZ2Vfc3RhdHVzGAEgASgJUg1tZXNzYW'
    'dlU3RhdHVzEi4KCnBhZ2luYXRpb24YAiABKAsyDi5oaS5QYWdpbmF0aW9uUgpwYWdpbmF0aW9u');

@$core.Deprecated('Use systemMessageDescriptor instead')
const SystemMessage$json = {
  '1': 'SystemMessage',
  '2': [
    {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    {
      '1': 'extra',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.club.SystemMessageExtra',
      '10': 'extra'
    },
    {'1': 'type', '3': 3, '4': 1, '5': 9, '10': 'type'},
    {'1': 'status', '3': 4, '4': 1, '5': 9, '10': 'status'},
    {'1': 'timestamp', '3': 5, '4': 1, '5': 3, '10': 'timestamp'},
    {'1': 'expire_timestamp', '3': 6, '4': 1, '5': 3, '10': 'expireTimestamp'},
  ],
};

/// Descriptor for `SystemMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List systemMessageDescriptor = $convert.base64Decode(
    'Cg1TeXN0ZW1NZXNzYWdlEhIKBHV1aWQYASABKAlSBHV1aWQSLgoFZXh0cmEYAiABKAsyGC5jbH'
    'ViLlN5c3RlbU1lc3NhZ2VFeHRyYVIFZXh0cmESEgoEdHlwZRgDIAEoCVIEdHlwZRIWCgZzdGF0'
    'dXMYBCABKAlSBnN0YXR1cxIcCgl0aW1lc3RhbXAYBSABKANSCXRpbWVzdGFtcBIpChBleHBpcm'
    'VfdGltZXN0YW1wGAYgASgDUg9leHBpcmVUaW1lc3RhbXA=');

@$core.Deprecated('Use systemMessageExtraDescriptor instead')
const SystemMessageExtra$json = {
  '1': 'SystemMessageExtra',
  '2': [
    {'1': 'group', '3': 1, '4': 1, '5': 11, '6': '.hi.Unit', '10': 'group'},
    {'1': 'user', '3': 2, '4': 1, '5': 11, '6': '.hi.Unit', '10': 'user'},
  ],
};

/// Descriptor for `SystemMessageExtra`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List systemMessageExtraDescriptor = $convert.base64Decode(
    'ChJTeXN0ZW1NZXNzYWdlRXh0cmESHgoFZ3JvdXAYASABKAsyCC5oaS5Vbml0UgVncm91cBIcCg'
    'R1c2VyGAIgASgLMgguaGkuVW5pdFIEdXNlcg==');

@$core.Deprecated('Use systemMessagesDescriptor instead')
const SystemMessages$json = {
  '1': 'SystemMessages',
  '2': [
    {'1': 'has_new', '3': 1, '4': 1, '5': 8, '10': 'hasNew'},
    {
      '1': 'message_list',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.club.SystemMessage',
      '10': 'messageList'
    },
  ],
};

/// Descriptor for `SystemMessages`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List systemMessagesDescriptor = $convert.base64Decode(
    'Cg5TeXN0ZW1NZXNzYWdlcxIXCgdoYXNfbmV3GAEgASgIUgZoYXNOZXcSNgoMbWVzc2FnZV9saX'
    'N0GAIgAygLMhMuY2x1Yi5TeXN0ZW1NZXNzYWdlUgttZXNzYWdlTGlzdA==');

@$core.Deprecated('Use deleteSystemMessageParamDescriptor instead')
const DeleteSystemMessageParam$json = {
  '1': 'DeleteSystemMessageParam',
  '2': [
    {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
  ],
};

/// Descriptor for `DeleteSystemMessageParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteSystemMessageParamDescriptor =
    $convert.base64Decode(
        'ChhEZWxldGVTeXN0ZW1NZXNzYWdlUGFyYW0SEgoEdXVpZBgBIAEoCVIEdXVpZA==');

@$core.Deprecated('Use handleSystemMessageParamDescriptor instead')
const HandleSystemMessageParam$json = {
  '1': 'HandleSystemMessageParam',
  '2': [
    {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    {'1': 'status', '3': 2, '4': 1, '5': 5, '10': 'status'},
  ],
};

/// Descriptor for `HandleSystemMessageParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List handleSystemMessageParamDescriptor =
    $convert.base64Decode(
        'ChhIYW5kbGVTeXN0ZW1NZXNzYWdlUGFyYW0SEgoEdXVpZBgBIAEoCVIEdXVpZBIWCgZzdGF0dX'
        'MYAiABKAVSBnN0YXR1cw==');

@$core.Deprecated('Use chatUserInfoListDescriptor instead')
const ChatUserInfoList$json = {
  '1': 'ChatUserInfoList',
  '2': [
    {
      '1': 'user_info_list',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.club.ChatUserInfo',
      '10': 'userInfoList'
    },
  ],
};

/// Descriptor for `ChatUserInfoList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatUserInfoListDescriptor = $convert.base64Decode(
    'ChBDaGF0VXNlckluZm9MaXN0EjgKDnVzZXJfaW5mb19saXN0GAEgAygLMhIuY2x1Yi5DaGF0VX'
    'NlckluZm9SDHVzZXJJbmZvTGlzdA==');

@$core.Deprecated('Use friendParamDescriptor instead')
const FriendParam$json = {
  '1': 'FriendParam',
  '2': [
    {'1': 'user_did', '3': 1, '4': 1, '5': 9, '10': 'userDid'},
    {'1': 'user_type', '3': 2, '4': 1, '5': 9, '10': 'userType'},
  ],
};

/// Descriptor for `FriendParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List friendParamDescriptor = $convert.base64Decode(
    'CgtGcmllbmRQYXJhbRIZCgh1c2VyX2RpZBgBIAEoCVIHdXNlckRpZBIbCgl1c2VyX3R5cGUYAi'
    'ABKAlSCHVzZXJUeXBl');

@$core.Deprecated('Use emailParamDescriptor instead')
const EmailParam$json = {
  '1': 'EmailParam',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `EmailParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emailParamDescriptor = $convert.base64Decode(
    'CgpFbWFpbFBhcmFtEhQKBWVtYWlsGAEgASgJUgVlbWFpbBIaCghwYXNzd29yZBgCIAEoCVIIcG'
    'Fzc3dvcmQ=');

@$core.Deprecated('Use sendAboutParamDescriptor instead')
const SendAboutParam$json = {
  '1': 'SendAboutParam',
  '2': [
    {'1': 'single_group_code', '3': 1, '4': 1, '5': 9, '10': 'singleGroupCode'},
    {'1': 'bot_did', '3': 2, '4': 1, '5': 9, '10': 'botDid'},
  ],
};

/// Descriptor for `SendAboutParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendAboutParamDescriptor = $convert.base64Decode(
    'Cg5TZW5kQWJvdXRQYXJhbRIqChFzaW5nbGVfZ3JvdXBfY29kZRgBIAEoCVIPc2luZ2xlR3JvdX'
    'BDb2RlEhcKB2JvdF9kaWQYAiABKAlSBmJvdERpZA==');

@$core.Deprecated('Use sendCardParamDescriptor instead')
const SendCardParam$json = {
  '1': 'SendCardParam',
  '2': [
    {'1': 'single_group_code', '3': 1, '4': 1, '5': 9, '10': 'singleGroupCode'},
    {'1': 'peer_user_did', '3': 2, '4': 1, '5': 9, '10': 'peerUserDid'},
  ],
};

/// Descriptor for `SendCardParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendCardParamDescriptor = $convert.base64Decode(
    'Cg1TZW5kQ2FyZFBhcmFtEioKEXNpbmdsZV9ncm91cF9jb2RlGAEgASgJUg9zaW5nbGVHcm91cE'
    'NvZGUSIgoNcGVlcl91c2VyX2RpZBgCIAEoCVILcGVlclVzZXJEaWQ=');

@$core.Deprecated('Use botGroupCodeParamDescriptor instead')
const BotGroupCodeParam$json = {
  '1': 'BotGroupCodeParam',
  '2': [
    {'1': 'bot_did', '3': 1, '4': 1, '5': 9, '10': 'botDid'},
  ],
};

/// Descriptor for `BotGroupCodeParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botGroupCodeParamDescriptor = $convert.base64Decode(
    'ChFCb3RHcm91cENvZGVQYXJhbRIXCgdib3RfZGlkGAEgASgJUgZib3REaWQ=');

@$core.Deprecated('Use botGroupCodeListDescriptor instead')
const BotGroupCodeList$json = {
  '1': 'BotGroupCodeList',
  '2': [
    {'1': 'group_code_list', '3': 1, '4': 3, '5': 9, '10': 'groupCodeList'},
  ],
};

/// Descriptor for `BotGroupCodeList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botGroupCodeListDescriptor = $convert.base64Decode(
    'ChBCb3RHcm91cENvZGVMaXN0EiYKD2dyb3VwX2NvZGVfbGlzdBgBIAMoCVINZ3JvdXBDb2RlTG'
    'lzdA==');
