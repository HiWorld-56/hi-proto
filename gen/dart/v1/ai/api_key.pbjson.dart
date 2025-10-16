// This is a generated file - do not edit.
//
// Generated from v1/ai/api_key.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use apiKeyInfoDescriptor instead')
const ApiKeyInfo$json = {
  '1': 'ApiKeyInfo',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 9, '10': 'value'},
    {'1': 'did', '3': 2, '4': 1, '5': 9, '10': 'did'},
    {'1': 'rate_limit', '3': 3, '4': 1, '5': 5, '10': 'rateLimit'},
    {'1': 'is_active', '3': 4, '4': 1, '5': 5, '10': 'isActive'},
    {'1': 'note', '3': 5, '4': 1, '5': 5, '10': 'note'},
  ],
};

/// Descriptor for `ApiKeyInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List apiKeyInfoDescriptor = $convert.base64Decode(
    'CgpBcGlLZXlJbmZvEhQKBXZhbHVlGAEgASgJUgV2YWx1ZRIQCgNkaWQYAiABKAlSA2RpZBIdCg'
    'pyYXRlX2xpbWl0GAMgASgFUglyYXRlTGltaXQSGwoJaXNfYWN0aXZlGAQgASgFUghpc0FjdGl2'
    'ZRISCgRub3RlGAUgASgFUgRub3Rl');

@$core.Deprecated('Use createApiKeyRespDescriptor instead')
const CreateApiKeyResp$json = {
  '1': 'CreateApiKeyResp',
  '2': [
    {'1': 'info', '3': 1, '4': 1, '5': 11, '6': '.ai.ApiKeyInfo', '10': 'info'},
  ],
};

/// Descriptor for `CreateApiKeyResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createApiKeyRespDescriptor = $convert.base64Decode(
    'ChBDcmVhdGVBcGlLZXlSZXNwEiIKBGluZm8YASABKAsyDi5haS5BcGlLZXlJbmZvUgRpbmZv');

@$core.Deprecated('Use editApiKeyReqDescriptor instead')
const EditApiKeyReq$json = {
  '1': 'EditApiKeyReq',
  '2': [
    {'1': 'api_key', '3': 1, '4': 1, '5': 9, '10': 'apiKey'},
    {'1': 'note', '3': 2, '4': 1, '5': 9, '10': 'note'},
  ],
};

/// Descriptor for `EditApiKeyReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editApiKeyReqDescriptor = $convert.base64Decode(
    'Cg1FZGl0QXBpS2V5UmVxEhcKB2FwaV9rZXkYASABKAlSBmFwaUtleRISCgRub3RlGAIgASgJUg'
    'Rub3Rl');

@$core.Deprecated('Use editApiKeyRespDescriptor instead')
const EditApiKeyResp$json = {
  '1': 'EditApiKeyResp',
  '2': [
    {'1': 'info', '3': 1, '4': 1, '5': 11, '6': '.ai.ApiKeyInfo', '10': 'info'},
  ],
};

/// Descriptor for `EditApiKeyResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editApiKeyRespDescriptor = $convert.base64Decode(
    'Cg5FZGl0QXBpS2V5UmVzcBIiCgRpbmZvGAEgASgLMg4uYWkuQXBpS2V5SW5mb1IEaW5mbw==');

@$core.Deprecated('Use listApiKeyRespDescriptor instead')
const ListApiKeyResp$json = {
  '1': 'ListApiKeyResp',
  '2': [
    {'1': 'total', '3': 1, '4': 1, '5': 3, '10': 'total'},
    {
      '1': 'infos',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.ai.ApiKeyInfo',
      '10': 'infos'
    },
  ],
};

/// Descriptor for `ListApiKeyResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listApiKeyRespDescriptor = $convert.base64Decode(
    'Cg5MaXN0QXBpS2V5UmVzcBIUCgV0b3RhbBgBIAEoA1IFdG90YWwSJAoFaW5mb3MYAiADKAsyDi'
    '5haS5BcGlLZXlJbmZvUgVpbmZvcw==');

@$core.Deprecated('Use deleteApiKeyReqDescriptor instead')
const DeleteApiKeyReq$json = {
  '1': 'DeleteApiKeyReq',
  '2': [
    {'1': 'api_key', '3': 1, '4': 1, '5': 9, '10': 'apiKey'},
  ],
};

/// Descriptor for `DeleteApiKeyReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteApiKeyReqDescriptor = $convert
    .base64Decode('Cg9EZWxldGVBcGlLZXlSZXESFwoHYXBpX2tleRgBIAEoCVIGYXBpS2V5');

@$core.Deprecated('Use listBotReqDescriptor instead')
const ListBotReq$json = {
  '1': 'ListBotReq',
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

/// Descriptor for `ListBotReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listBotReqDescriptor = $convert.base64Decode(
    'CgpMaXN0Qm90UmVxEhcKB2JvdF9kaWQYASABKAlSBmJvdERpZBIuCgpwYWdpbmF0aW9uGAIgAS'
    'gLMg4uaGkuUGFnaW5hdGlvblIKcGFnaW5hdGlvbg==');
