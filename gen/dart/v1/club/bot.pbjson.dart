// This is a generated file - do not edit.
//
// Generated from v1/club/bot.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createBotParamDescriptor instead')
const CreateBotParam$json = {
  '1': 'CreateBotParam',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'type', '3': 3, '4': 1, '5': 5, '10': 'type'},
    {'1': 'avatar', '3': 4, '4': 1, '5': 9, '10': 'avatar'},
  ],
};

/// Descriptor for `CreateBotParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBotParamDescriptor = $convert.base64Decode(
    'Cg5DcmVhdGVCb3RQYXJhbRIQCgNkaWQYASABKAlSA2RpZBISCgRuYW1lGAIgASgJUgRuYW1lEh'
    'IKBHR5cGUYAyABKAVSBHR5cGUSFgoGYXZhdGFyGAQgASgJUgZhdmF0YXI=');

@$core.Deprecated('Use botDIDDescriptor instead')
const BotDID$json = {
  '1': 'BotDID',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
  ],
};

/// Descriptor for `BotDID`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botDIDDescriptor =
    $convert.base64Decode('CgZCb3RESUQSEAoDZGlkGAEgASgJUgNkaWQ=');

@$core.Deprecated('Use modelsDescriptor instead')
const Models$json = {
  '1': 'Models',
  '2': [
    {'1': 'model_list', '3': 1, '4': 3, '5': 9, '10': 'modelList'},
  ],
};

/// Descriptor for `Models`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List modelsDescriptor = $convert
    .base64Decode('CgZNb2RlbHMSHQoKbW9kZWxfbGlzdBgBIAMoCVIJbW9kZWxMaXN0');

@$core.Deprecated('Use audioModelsDescriptor instead')
const AudioModels$json = {
  '1': 'AudioModels',
  '2': [
    {'1': 'audio_model_list', '3': 1, '4': 3, '5': 9, '10': 'audioModelList'},
    {'1': 'stt_lang_list', '3': 2, '4': 3, '5': 9, '10': 'sttLangList'},
  ],
};

/// Descriptor for `AudioModels`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List audioModelsDescriptor = $convert.base64Decode(
    'CgtBdWRpb01vZGVscxIoChBhdWRpb19tb2RlbF9saXN0GAEgAygJUg5hdWRpb01vZGVsTGlzdB'
    'IiCg1zdHRfbGFuZ19saXN0GAIgAygJUgtzdHRMYW5nTGlzdA==');

@$core.Deprecated('Use botInfoDescriptor instead')
const BotInfo$json = {
  '1': 'BotInfo',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'type', '3': 3, '4': 1, '5': 5, '10': 'type'},
    {'1': 'avatar', '3': 4, '4': 1, '5': 9, '10': 'avatar'},
    {'1': 'background', '3': 5, '4': 1, '5': 9, '10': 'background'},
    {'1': 'api_key', '3': 6, '4': 1, '5': 9, '10': 'apiKey'},
    {'1': 'user_did', '3': 7, '4': 1, '5': 9, '10': 'userDid'},
    {'1': 'message_count', '3': 8, '4': 1, '5': 5, '10': 'messageCount'},
    {'1': 'qa_num', '3': 9, '4': 1, '5': 5, '10': 'qaNum'},
    {'1': 'system_prompt', '3': 10, '4': 1, '5': 9, '10': 'systemPrompt'},
    {'1': 'user_prompt', '3': 11, '4': 1, '5': 9, '10': 'userPrompt'},
    {'1': 'freedom', '3': 12, '4': 1, '5': 1, '10': 'freedom'},
    {'1': 'gpt_model', '3': 13, '4': 1, '5': 9, '10': 'gptModel'},
    {'1': 'embedding_model', '3': 14, '4': 1, '5': 9, '10': 'embeddingModel'},
    {'1': 'created_at', '3': 15, '4': 1, '5': 9, '10': 'createdAt'},
    {'1': 'mem_model', '3': 16, '4': 1, '5': 9, '10': 'memModel'},
    {'1': 'use_mem', '3': 17, '4': 1, '5': 9, '10': 'useMem'},
    {'1': 'use_tools', '3': 18, '4': 1, '5': 9, '10': 'useTools'},
    {'1': 'note', '3': 19, '4': 1, '5': 9, '10': 'note'},
    {'1': 'use_about', '3': 20, '4': 1, '5': 9, '10': 'useAbout'},
    {'1': 'org_name', '3': 21, '4': 1, '5': 9, '10': 'orgName'},
    {'1': 'org_logo', '3': 22, '4': 1, '5': 9, '10': 'orgLogo'},
    {'1': 'org_background', '3': 23, '4': 1, '5': 9, '10': 'orgBackground'},
    {'1': 'about', '3': 24, '4': 1, '5': 9, '10': 'about'},
    {'1': 'stt_model', '3': 25, '4': 1, '5': 9, '10': 'sttModel'},
    {'1': 'stt_lang', '3': 26, '4': 1, '5': 9, '10': 'sttLang'},
    {'1': 'favorited', '3': 27, '4': 1, '5': 5, '10': 'favorited'},
  ],
};

/// Descriptor for `BotInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botInfoDescriptor = $convert.base64Decode(
    'CgdCb3RJbmZvEhAKA2RpZBgBIAEoCVIDZGlkEhIKBG5hbWUYAiABKAlSBG5hbWUSEgoEdHlwZR'
    'gDIAEoBVIEdHlwZRIWCgZhdmF0YXIYBCABKAlSBmF2YXRhchIeCgpiYWNrZ3JvdW5kGAUgASgJ'
    'UgpiYWNrZ3JvdW5kEhcKB2FwaV9rZXkYBiABKAlSBmFwaUtleRIZCgh1c2VyX2RpZBgHIAEoCV'
    'IHdXNlckRpZBIjCg1tZXNzYWdlX2NvdW50GAggASgFUgxtZXNzYWdlQ291bnQSFQoGcWFfbnVt'
    'GAkgASgFUgVxYU51bRIjCg1zeXN0ZW1fcHJvbXB0GAogASgJUgxzeXN0ZW1Qcm9tcHQSHwoLdX'
    'Nlcl9wcm9tcHQYCyABKAlSCnVzZXJQcm9tcHQSGAoHZnJlZWRvbRgMIAEoAVIHZnJlZWRvbRIb'
    'CglncHRfbW9kZWwYDSABKAlSCGdwdE1vZGVsEicKD2VtYmVkZGluZ19tb2RlbBgOIAEoCVIOZW'
    '1iZWRkaW5nTW9kZWwSHQoKY3JlYXRlZF9hdBgPIAEoCVIJY3JlYXRlZEF0EhsKCW1lbV9tb2Rl'
    'bBgQIAEoCVIIbWVtTW9kZWwSFwoHdXNlX21lbRgRIAEoCVIGdXNlTWVtEhsKCXVzZV90b29scx'
    'gSIAEoCVIIdXNlVG9vbHMSEgoEbm90ZRgTIAEoCVIEbm90ZRIbCgl1c2VfYWJvdXQYFCABKAlS'
    'CHVzZUFib3V0EhkKCG9yZ19uYW1lGBUgASgJUgdvcmdOYW1lEhkKCG9yZ19sb2dvGBYgASgJUg'
    'dvcmdMb2dvEiUKDm9yZ19iYWNrZ3JvdW5kGBcgASgJUg1vcmdCYWNrZ3JvdW5kEhQKBWFib3V0'
    'GBggASgJUgVhYm91dBIbCglzdHRfbW9kZWwYGSABKAlSCHN0dE1vZGVsEhkKCHN0dF9sYW5nGB'
    'ogASgJUgdzdHRMYW5nEhwKCWZhdm9yaXRlZBgbIAEoBVIJZmF2b3JpdGVk');

@$core.Deprecated('Use botInfoListDescriptor instead')
const BotInfoList$json = {
  '1': 'BotInfoList',
  '2': [
    {
      '1': 'bot_info_list',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.club.BotInfo',
      '10': 'botInfoList'
    },
  ],
};

/// Descriptor for `BotInfoList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botInfoListDescriptor = $convert.base64Decode(
    'CgtCb3RJbmZvTGlzdBIxCg1ib3RfaW5mb19saXN0GAEgAygLMg0uY2x1Yi5Cb3RJbmZvUgtib3'
    'RJbmZvTGlzdA==');

@$core.Deprecated('Use botStatisticsInfoDescriptor instead')
const BotStatisticsInfo$json = {
  '1': 'BotStatisticsInfo',
  '2': [
    {'1': 'message_count', '3': 1, '4': 1, '5': 5, '10': 'messageCount'},
    {'1': 'use_token', '3': 2, '4': 1, '5': 5, '10': 'useToken'},
    {'1': 'prompt_token', '3': 3, '4': 1, '5': 5, '10': 'promptToken'},
    {'1': 'mem_token', '3': 4, '4': 1, '5': 5, '10': 'memToken'},
  ],
};

/// Descriptor for `BotStatisticsInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botStatisticsInfoDescriptor = $convert.base64Decode(
    'ChFCb3RTdGF0aXN0aWNzSW5mbxIjCg1tZXNzYWdlX2NvdW50GAEgASgFUgxtZXNzYWdlQ291bn'
    'QSGwoJdXNlX3Rva2VuGAIgASgFUgh1c2VUb2tlbhIhCgxwcm9tcHRfdG9rZW4YAyABKAVSC3By'
    'b21wdFRva2VuEhsKCW1lbV90b2tlbhgEIAEoBVIIbWVtVG9rZW4=');

@$core.Deprecated('Use botInfoListParamDescriptor instead')
const BotInfoListParam$json = {
  '1': 'BotInfoListParam',
  '2': [
    {'1': 'bot_did', '3': 1, '4': 1, '5': 9, '10': 'botDid'},
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

/// Descriptor for `BotInfoListParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botInfoListParamDescriptor = $convert.base64Decode(
    'ChBCb3RJbmZvTGlzdFBhcmFtEhcKB2JvdF9kaWQYASABKAlSBmJvdERpZBIuCgpwYWdpbmF0aW'
    '9uGAIgASgLMg4uaGkuUGFnaW5hdGlvblIKcGFnaW5hdGlvbg==');

@$core.Deprecated('Use favoriteBotParamDescriptor instead')
const FavoriteBotParam$json = {
  '1': 'FavoriteBotParam',
  '2': [
    {'1': 'bot_did', '3': 1, '4': 1, '5': 9, '10': 'botDid'},
    {'1': 'operation', '3': 2, '4': 1, '5': 5, '10': 'operation'},
  ],
};

/// Descriptor for `FavoriteBotParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List favoriteBotParamDescriptor = $convert.base64Decode(
    'ChBGYXZvcml0ZUJvdFBhcmFtEhcKB2JvdF9kaWQYASABKAlSBmJvdERpZBIcCglvcGVyYXRpb2'
    '4YAiABKAVSCW9wZXJhdGlvbg==');

@$core.Deprecated('Use botListByDidsParamDescriptor instead')
const BotListByDidsParam$json = {
  '1': 'BotListByDidsParam',
  '2': [
    {'1': 'bot_did_list', '3': 1, '4': 3, '5': 9, '10': 'botDidList'},
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

/// Descriptor for `BotListByDidsParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botListByDidsParamDescriptor = $convert.base64Decode(
    'ChJCb3RMaXN0QnlEaWRzUGFyYW0SIAoMYm90X2RpZF9saXN0GAEgAygJUgpib3REaWRMaXN0Ei'
    '4KCnBhZ2luYXRpb24YAiABKAsyDi5oaS5QYWdpbmF0aW9uUgpwYWdpbmF0aW9u');

@$core.Deprecated('Use pluginStatusDescriptor instead')
const PluginStatus$json = {
  '1': 'PluginStatus',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'enable', '3': 2, '4': 1, '5': 9, '10': 'enable'},
  ],
};

/// Descriptor for `PluginStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pluginStatusDescriptor = $convert.base64Decode(
    'CgxQbHVnaW5TdGF0dXMSEgoEbmFtZRgBIAEoCVIEbmFtZRIWCgZlbmFibGUYAiABKAlSBmVuYW'
    'JsZQ==');

@$core.Deprecated('Use drawConfigDescriptor instead')
const DrawConfig$json = {
  '1': 'DrawConfig',
  '2': [
    {'1': 'style_options', '3': 1, '4': 3, '5': 9, '10': 'styleOptions'},
    {'1': 'default_style', '3': 2, '4': 1, '5': 9, '10': 'defaultStyle'},
    {'1': 'quality_options', '3': 3, '4': 3, '5': 9, '10': 'qualityOptions'},
    {'1': 'default_quality', '3': 4, '4': 1, '5': 9, '10': 'defaultQuality'},
    {'1': 'model', '3': 5, '4': 1, '5': 9, '10': 'model'},
    {'1': 'size_options', '3': 6, '4': 3, '5': 9, '10': 'sizeOptions'},
    {'1': 'default_size', '3': 7, '4': 1, '5': 9, '10': 'defaultSize'},
    {'1': 'draw_n', '3': 8, '4': 1, '5': 5, '10': 'drawN'},
  ],
};

/// Descriptor for `DrawConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List drawConfigDescriptor = $convert.base64Decode(
    'CgpEcmF3Q29uZmlnEiMKDXN0eWxlX29wdGlvbnMYASADKAlSDHN0eWxlT3B0aW9ucxIjCg1kZW'
    'ZhdWx0X3N0eWxlGAIgASgJUgxkZWZhdWx0U3R5bGUSJwoPcXVhbGl0eV9vcHRpb25zGAMgAygJ'
    'Ug5xdWFsaXR5T3B0aW9ucxInCg9kZWZhdWx0X3F1YWxpdHkYBCABKAlSDmRlZmF1bHRRdWFsaX'
    'R5EhQKBW1vZGVsGAUgASgJUgVtb2RlbBIhCgxzaXplX29wdGlvbnMYBiADKAlSC3NpemVPcHRp'
    'b25zEiEKDGRlZmF1bHRfc2l6ZRgHIAEoCVILZGVmYXVsdFNpemUSFQoGZHJhd19uGAggASgFUg'
    'VkcmF3Tg==');

@$core.Deprecated('Use bindMasterParamDescriptor instead')
const BindMasterParam$json = {
  '1': 'BindMasterParam',
  '2': [
    {'1': 'master', '3': 1, '4': 1, '5': 9, '10': 'master'},
    {'1': 'bot_did', '3': 2, '4': 1, '5': 9, '10': 'botDid'},
  ],
};

/// Descriptor for `BindMasterParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bindMasterParamDescriptor = $convert.base64Decode(
    'Cg9CaW5kTWFzdGVyUGFyYW0SFgoGbWFzdGVyGAEgASgJUgZtYXN0ZXISFwoHYm90X2RpZBgCIA'
    'EoCVIGYm90RGlk');

@$core.Deprecated('Use botBindStatusDescriptor instead')
const BotBindStatus$json = {
  '1': 'BotBindStatus',
  '2': [
    {'1': 'master', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'master', '17': true},
  ],
  '8': [
    {'1': '_master'},
  ],
};

/// Descriptor for `BotBindStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botBindStatusDescriptor = $convert.base64Decode(
    'Cg1Cb3RCaW5kU3RhdHVzEhsKBm1hc3RlchgBIAEoCUgAUgZtYXN0ZXKIAQFCCQoHX21hc3Rlcg'
    '==');

@$core.Deprecated('Use trainingBotParamDescriptor instead')
const TrainingBotParam$json = {
  '1': 'TrainingBotParam',
  '2': [
    {'1': 'file_id_list', '3': 1, '4': 3, '5': 3, '10': 'fileIdList'},
    {'1': 'bot_did', '3': 2, '4': 1, '5': 9, '10': 'botDid'},
  ],
};

/// Descriptor for `TrainingBotParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trainingBotParamDescriptor = $convert.base64Decode(
    'ChBUcmFpbmluZ0JvdFBhcmFtEiAKDGZpbGVfaWRfbGlzdBgBIAMoA1IKZmlsZUlkTGlzdBIXCg'
    'dib3RfZGlkGAIgASgJUgZib3REaWQ=');

@$core.Deprecated('Use botTrainingStatusDescriptor instead')
const BotTrainingStatus$json = {
  '1': 'BotTrainingStatus',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    {'1': 'mem_count', '3': 2, '4': 1, '5': 5, '10': 'memCount'},
    {'1': 'slice_count', '3': 3, '4': 1, '5': 5, '10': 'sliceCount'},
    {'1': 'msg', '3': 4, '4': 1, '5': 9, '10': 'msg'},
  ],
};

/// Descriptor for `BotTrainingStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botTrainingStatusDescriptor = $convert.base64Decode(
    'ChFCb3RUcmFpbmluZ1N0YXR1cxIWCgZzdGF0dXMYASABKAlSBnN0YXR1cxIbCgltZW1fY291bn'
    'QYAiABKAVSCG1lbUNvdW50Eh8KC3NsaWNlX2NvdW50GAMgASgFUgpzbGljZUNvdW50EhAKA21z'
    'ZxgEIAEoCVIDbXNn');

@$core.Deprecated('Use botTrainingFileDescriptor instead')
const BotTrainingFile$json = {
  '1': 'BotTrainingFile',
  '2': [
    {'1': 'file_id', '3': 1, '4': 1, '5': 3, '10': 'fileId'},
    {'1': 'user_did', '3': 2, '4': 1, '5': 9, '10': 'userDid'},
    {'1': 'bot_did', '3': 3, '4': 1, '5': 9, '10': 'botDid'},
    {'1': 'content', '3': 4, '4': 1, '5': 9, '10': 'content'},
    {'1': 'file_path', '3': 5, '4': 1, '5': 9, '10': 'filePath'},
    {'1': 'title', '3': 6, '4': 1, '5': 9, '10': 'title'},
    {'1': 'size', '3': 7, '4': 1, '5': 3, '10': 'size'},
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
    'Cg9Cb3RUcmFpbmluZ0ZpbGUSFwoHZmlsZV9pZBgBIAEoA1IGZmlsZUlkEhkKCHVzZXJfZGlkGA'
    'IgASgJUgd1c2VyRGlkEhcKB2JvdF9kaWQYAyABKAlSBmJvdERpZBIYCgdjb250ZW50GAQgASgJ'
    'Ugdjb250ZW50EhsKCWZpbGVfcGF0aBgFIAEoCVIIZmlsZVBhdGgSFAoFdGl0bGUYBiABKAlSBX'
    'RpdGxlEhIKBHNpemUYByABKANSBHNpemUSEgoEdHlwZRgIIAEoCVIEdHlwZRIVCgZpc191c2UY'
    'CSABKAVSBWlzVXNlEhYKBmRpZ2VzdBgKIAEoCVIGZGlnZXN0EiMKDXRyYWluaW5nX3RpbWUYCy'
    'ABKANSDHRyYWluaW5nVGltZRIdCgpjcmVhdGVkX2F0GAwgASgDUgljcmVhdGVkQXQSHQoKdXBk'
    'YXRlZF9hdBgNIAEoA1IJdXBkYXRlZEF0');

@$core.Deprecated('Use botTrainingFileListDescriptor instead')
const BotTrainingFileList$json = {
  '1': 'BotTrainingFileList',
  '2': [
    {
      '1': 'training_file_list',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.club.BotTrainingFile',
      '10': 'trainingFileList'
    },
  ],
};

/// Descriptor for `BotTrainingFileList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botTrainingFileListDescriptor = $convert.base64Decode(
    'ChNCb3RUcmFpbmluZ0ZpbGVMaXN0EkMKEnRyYWluaW5nX2ZpbGVfbGlzdBgBIAMoCzIVLmNsdW'
    'IuQm90VHJhaW5pbmdGaWxlUhB0cmFpbmluZ0ZpbGVMaXN0');

@$core.Deprecated('Use trainingFileListParamDescriptor instead')
const TrainingFileListParam$json = {
  '1': 'TrainingFileListParam',
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

/// Descriptor for `TrainingFileListParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trainingFileListParamDescriptor = $convert.base64Decode(
    'ChVUcmFpbmluZ0ZpbGVMaXN0UGFyYW0SFwoHYm90X2RpZBgBIAEoCVIGYm90RGlkEhAKA3VzZR'
    'gCIAEoCFIDdXNlEi4KCnBhZ2luYXRpb24YAyABKAsyDi5oaS5QYWdpbmF0aW9uUgpwYWdpbmF0'
    'aW9u');

@$core.Deprecated('Use trainingFileIDDescriptor instead')
const TrainingFileID$json = {
  '1': 'TrainingFileID',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `TrainingFileID`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trainingFileIDDescriptor =
    $convert.base64Decode('Cg5UcmFpbmluZ0ZpbGVJRBIOCgJpZBgBIAEoA1ICaWQ=');

@$core.Deprecated('Use deleteTrainingFileParamDescriptor instead')
const DeleteTrainingFileParam$json = {
  '1': 'DeleteTrainingFileParam',
  '2': [
    {'1': 'bot_did', '3': 1, '4': 1, '5': 9, '10': 'botDid'},
    {'1': 'file_id', '3': 2, '4': 1, '5': 3, '10': 'fileId'},
  ],
};

/// Descriptor for `DeleteTrainingFileParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteTrainingFileParamDescriptor =
    $convert.base64Decode(
        'ChdEZWxldGVUcmFpbmluZ0ZpbGVQYXJhbRIXCgdib3RfZGlkGAEgASgJUgZib3REaWQSFwoHZm'
        'lsZV9pZBgCIAEoA1IGZmlsZUlk');

@$core.Deprecated('Use deleteTrainingFilesParamDescriptor instead')
const DeleteTrainingFilesParam$json = {
  '1': 'DeleteTrainingFilesParam',
  '2': [
    {'1': 'bot_did', '3': 1, '4': 1, '5': 9, '10': 'botDid'},
    {'1': 'file_id_list', '3': 2, '4': 3, '5': 3, '10': 'fileIdList'},
  ],
};

/// Descriptor for `DeleteTrainingFilesParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteTrainingFilesParamDescriptor =
    $convert.base64Decode(
        'ChhEZWxldGVUcmFpbmluZ0ZpbGVzUGFyYW0SFwoHYm90X2RpZBgBIAEoCVIGYm90RGlkEiAKDG'
        'ZpbGVfaWRfbGlzdBgCIAMoA1IKZmlsZUlkTGlzdA==');

@$core.Deprecated('Use updateCotentParamDescriptor instead')
const UpdateCotentParam$json = {
  '1': 'UpdateCotentParam',
  '2': [
    {'1': 'bot_did', '3': 1, '4': 1, '5': 9, '10': 'botDid'},
    {'1': 'file_id', '3': 2, '4': 1, '5': 3, '10': 'fileId'},
    {'1': 'content', '3': 3, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `UpdateCotentParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateCotentParamDescriptor = $convert.base64Decode(
    'ChFVcGRhdGVDb3RlbnRQYXJhbRIXCgdib3RfZGlkGAEgASgJUgZib3REaWQSFwoHZmlsZV9pZB'
    'gCIAEoA1IGZmlsZUlkEhgKB2NvbnRlbnQYAyABKAlSB2NvbnRlbnQ=');

@$core.Deprecated('Use createCotentParamDescriptor instead')
const CreateCotentParam$json = {
  '1': 'CreateCotentParam',
  '2': [
    {'1': 'bot_did', '3': 1, '4': 1, '5': 9, '10': 'botDid'},
    {'1': 'content', '3': 2, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `CreateCotentParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createCotentParamDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVDb3RlbnRQYXJhbRIXCgdib3RfZGlkGAEgASgJUgZib3REaWQSGAoHY29udGVudB'
    'gCIAEoCVIHY29udGVudA==');

@$core.Deprecated('Use editDigestParamDescriptor instead')
const EditDigestParam$json = {
  '1': 'EditDigestParam',
  '2': [
    {'1': 'file_id', '3': 1, '4': 1, '5': 3, '10': 'fileId'},
    {'1': 'bot_did', '3': 2, '4': 1, '5': 9, '10': 'botDid'},
    {'1': 'digest', '3': 3, '4': 1, '5': 9, '10': 'digest'},
  ],
};

/// Descriptor for `EditDigestParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editDigestParamDescriptor = $convert.base64Decode(
    'Cg9FZGl0RGlnZXN0UGFyYW0SFwoHZmlsZV9pZBgBIAEoA1IGZmlsZUlkEhcKB2JvdF9kaWQYAi'
    'ABKAlSBmJvdERpZBIWCgZkaWdlc3QYAyABKAlSBmRpZ2VzdA==');

@$core.Deprecated('Use createTrainingFileParamDescriptor instead')
const CreateTrainingFileParam$json = {
  '1': 'CreateTrainingFileParam',
  '2': [
    {'1': 'bot_did', '3': 1, '4': 1, '5': 9, '10': 'botDid'},
    {'1': 'filename', '3': 2, '4': 1, '5': 9, '10': 'filename'},
    {'1': 'file_content', '3': 3, '4': 1, '5': 12, '10': 'fileContent'},
  ],
};

/// Descriptor for `CreateTrainingFileParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createTrainingFileParamDescriptor = $convert.base64Decode(
    'ChdDcmVhdGVUcmFpbmluZ0ZpbGVQYXJhbRIXCgdib3RfZGlkGAEgASgJUgZib3REaWQSGgoIZm'
    'lsZW5hbWUYAiABKAlSCGZpbGVuYW1lEiEKDGZpbGVfY29udGVudBgDIAEoDFILZmlsZUNvbnRl'
    'bnQ=');

@$core.Deprecated('Use funcationDescriptor instead')
const Funcation$json = {
  '1': 'Funcation',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'enable', '3': 2, '4': 1, '5': 9, '10': 'enable'},
  ],
};

/// Descriptor for `Funcation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List funcationDescriptor = $convert.base64Decode(
    'CglGdW5jYXRpb24SEgoEbmFtZRgBIAEoCVIEbmFtZRIWCgZlbmFibGUYAiABKAlSBmVuYWJsZQ'
    '==');

@$core.Deprecated('Use funcationListDescriptor instead')
const FuncationList$json = {
  '1': 'FuncationList',
  '2': [
    {
      '1': 'funcation_list',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.club.Funcation',
      '10': 'funcationList'
    },
  ],
};

/// Descriptor for `FuncationList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List funcationListDescriptor = $convert.base64Decode(
    'Cg1GdW5jYXRpb25MaXN0EjYKDmZ1bmNhdGlvbl9saXN0GAEgAygLMg8uY2x1Yi5GdW5jYXRpb2'
    '5SDWZ1bmNhdGlvbkxpc3Q=');

@$core.Deprecated('Use botDrawConfigDescriptor instead')
const BotDrawConfig$json = {
  '1': 'BotDrawConfig',
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

/// Descriptor for `BotDrawConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botDrawConfigDescriptor = $convert.base64Decode(
    'Cg1Cb3REcmF3Q29uZmlnEh0KCmRyYXdfc3R5bGUYASADKAlSCWRyYXdTdHlsZRIsChJkcmF3X3'
    'N0eWxlX2RlZmF1bHQYAiABKAlSEGRyYXdTdHlsZURlZmF1bHQSIQoMZHJhd19xdWFsaXR5GAMg'
    'AygJUgtkcmF3UXVhbGl0eRIwChRkcmF3X3F1YWxpdHlfZGVmYXVsdBgEIAEoCVISZHJhd1F1YW'
    'xpdHlEZWZhdWx0Eh0KCmRyYXdfbW9kZWwYBSABKAlSCWRyYXdNb2RlbBIbCglkcmF3X3NpemUY'
    'BiADKAlSCGRyYXdTaXplEioKEWRyYXdfc2l6ZV9kZWZhdWx0GAcgASgJUg9kcmF3U2l6ZURlZm'
    'F1bHQSFQoGZHJhd19uGAggASgFUgVkcmF3Tg==');

@$core.Deprecated('Use createPluginParamDescriptor instead')
const CreatePluginParam$json = {
  '1': 'CreatePluginParam',
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

/// Descriptor for `CreatePluginParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPluginParamDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVQbHVnaW5QYXJhbRIXCgdib3RfZGlkGAEgASgJUgZib3REaWQSEgoEbmFtZRgCIA'
    'EoCVIEbmFtZRISCgR0eXBlGAMgASgJUgR0eXBlEhAKA3VybBgEIAEoCVIDdXJsEjEKFGZ1bmN0'
    'aW9uX2Rlc2NyaXB0aW9uGAUgASgJUhNmdW5jdGlvbkRlc2NyaXB0aW9uEh0KCmRyYXdfc3R5bG'
    'UYBiABKAlSCWRyYXdTdHlsZRIhCgxkcmF3X3F1YWxpdHkYByABKAlSC2RyYXdRdWFsaXR5EhsK'
    'CWRyYXdfc2l6ZRgIIAEoCVIIZHJhd1NpemUSKgoRdXNlX3BsdWdpbl9zZWFyY2gYCSABKAlSD3'
    'VzZVBsdWdpblNlYXJjaBIqChF1c2VfcGx1Z2luX3B5dGhvbhgKIAEoCVIPdXNlUGx1Z2luUHl0'
    'aG9uEiYKD3VzZV9wbHVnaW5fZHJhdxgLIAEoCVINdXNlUGx1Z2luRHJhdw==');

@$core.Deprecated('Use deletePluginParamDescriptor instead')
const DeletePluginParam$json = {
  '1': 'DeletePluginParam',
  '2': [
    {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
  ],
};

/// Descriptor for `DeletePluginParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deletePluginParamDescriptor = $convert
    .base64Decode('ChFEZWxldGVQbHVnaW5QYXJhbRISCgR1dWlkGAEgASgJUgR1dWlk');

@$core.Deprecated('Use editPluginParamDescriptor instead')
const EditPluginParam$json = {
  '1': 'EditPluginParam',
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

/// Descriptor for `EditPluginParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editPluginParamDescriptor = $convert.base64Decode(
    'Cg9FZGl0UGx1Z2luUGFyYW0SEgoEdXVpZBgBIAEoCVIEdXVpZBIXCgdib3RfZGlkGAIgASgJUg'
    'Zib3REaWQSEgoEdHlwZRgDIAEoCVIEdHlwZRIQCgN1cmwYBCABKAlSA3VybBIxChRmdW5jdGlv'
    'bl9kZXNjcmlwdGlvbhgFIAEoCVITZnVuY3Rpb25EZXNjcmlwdGlvbg==');

@$core.Deprecated('Use pluginListParamDescriptor instead')
const PluginListParam$json = {
  '1': 'PluginListParam',
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

/// Descriptor for `PluginListParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pluginListParamDescriptor = $convert.base64Decode(
    'Cg9QbHVnaW5MaXN0UGFyYW0SFwoHYm90X2RpZBgBIAEoCVIGYm90RGlkEhIKBG5hbWUYAiABKA'
    'lSBG5hbWUSLgoKcGFnaW5hdGlvbhgDIAEoCzIOLmhpLlBhZ2luYXRpb25SCnBhZ2luYXRpb24=');

@$core.Deprecated('Use pluginInfoDescriptor instead')
const PluginInfo$json = {
  '1': 'PluginInfo',
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

/// Descriptor for `PluginInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pluginInfoDescriptor = $convert.base64Decode(
    'CgpQbHVnaW5JbmZvEhcKB2JvdF9kaWQYASABKAlSBmJvdERpZBISCgR1dWlkGAIgASgJUgR1dW'
    'lkEhIKBG5hbWUYAyABKAlSBG5hbWUSFgoGbWV0aG9kGAQgASgJUgZtZXRob2QSEgoEdHlwZRgF'
    'IAEoCVIEdHlwZRIQCgN1cmwYBiABKAlSA3VybBISCgRub3RlGAcgASgJUgRub3RlEiMKDWZ1bm'
    'N0aW9uX25hbWUYCCABKAlSDGZ1bmN0aW9uTmFtZRIxChRmdW5jdGlvbl9kZXNjcmlwdGlvbhgJ'
    'IAEoCVITZnVuY3Rpb25EZXNjcmlwdGlvbhIdCgpkcmF3X3N0eWxlGAogASgJUglkcmF3U3R5bG'
    'USIQoMZHJhd19xdWFsaXR5GAsgASgJUgtkcmF3UXVhbGl0eRIdCgpkcmF3X21vZGVsGAwgASgJ'
    'UglkcmF3TW9kZWwSGwoJZHJhd19zaXplGA0gASgJUghkcmF3U2l6ZRIVCgZkcmF3X24YDiABKA'
    'VSBWRyYXdOEh0KCmNyZWF0ZWRfYXQYDyABKANSCWNyZWF0ZWRBdA==');

@$core.Deprecated('Use pluginInfoListDescriptor instead')
const PluginInfoList$json = {
  '1': 'PluginInfoList',
  '2': [
    {'1': 'total', '3': 1, '4': 1, '5': 3, '10': 'total'},
    {
      '1': 'plugin_info_list',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.club.PluginInfo',
      '10': 'pluginInfoList'
    },
  ],
};

/// Descriptor for `PluginInfoList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pluginInfoListDescriptor = $convert.base64Decode(
    'Cg5QbHVnaW5JbmZvTGlzdBIUCgV0b3RhbBgBIAEoA1IFdG90YWwSOgoQcGx1Z2luX2luZm9fbG'
    'lzdBgCIAMoCzIQLmNsdWIuUGx1Z2luSW5mb1IOcGx1Z2luSW5mb0xpc3Q=');
