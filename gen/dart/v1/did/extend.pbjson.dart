// This is a generated file - do not edit.
//
// Generated from v1/did/extend.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use userExtendSettingRespDescriptor instead')
const UserExtendSettingResp$json = {
  '1': 'UserExtendSettingResp',
  '2': [
    {'1': 'token', '3': 2, '4': 1, '5': 9, '10': 'token'},
    {'1': 'table', '3': 3, '4': 1, '5': 9, '10': 'table'},
  ],
};

/// Descriptor for `UserExtendSettingResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userExtendSettingRespDescriptor = $convert.base64Decode(
    'ChVVc2VyRXh0ZW5kU2V0dGluZ1Jlc3ASFAoFdG9rZW4YAiABKAlSBXRva2VuEhQKBXRhYmxlGA'
    'MgASgJUgV0YWJsZQ==');

@$core.Deprecated('Use userExtendInfoDescriptor instead')
const UserExtendInfo$json = {
  '1': 'UserExtendInfo',
  '2': [
    {'1': 'logo', '3': 2, '4': 1, '5': 9, '10': 'logo'},
    {'1': 'level', '3': 3, '4': 1, '5': 5, '10': 'level'},
    {'1': 'card', '3': 4, '4': 1, '5': 9, '10': 'card'},
    {'1': 'extend', '3': 5, '4': 1, '5': 9, '10': 'extend'},
  ],
};

/// Descriptor for `UserExtendInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userExtendInfoDescriptor = $convert.base64Decode(
    'Cg5Vc2VyRXh0ZW5kSW5mbxISCgRsb2dvGAIgASgJUgRsb2dvEhQKBWxldmVsGAMgASgFUgVsZX'
    'ZlbBISCgRjYXJkGAQgASgJUgRjYXJkEhYKBmV4dGVuZBgFIAEoCVIGZXh0ZW5k');

@$core.Deprecated('Use userExtendUpdateReqDescriptor instead')
const UserExtendUpdateReq$json = {
  '1': 'UserExtendUpdateReq',
  '2': [
    {
      '1': 'unit',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.did.UserExtendUpdateReq.Unit',
      '10': 'unit'
    },
  ],
  '3': [UserExtendUpdateReq_Unit$json],
};

@$core.Deprecated('Use userExtendUpdateReqDescriptor instead')
const UserExtendUpdateReq_Unit$json = {
  '1': 'Unit',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {
      '1': 'info',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.did.UserExtendInfo',
      '10': 'info'
    },
  ],
};

/// Descriptor for `UserExtendUpdateReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userExtendUpdateReqDescriptor = $convert.base64Decode(
    'ChNVc2VyRXh0ZW5kVXBkYXRlUmVxEjEKBHVuaXQYAiADKAsyHS5kaWQuVXNlckV4dGVuZFVwZG'
    'F0ZVJlcS5Vbml0UgR1bml0GkEKBFVuaXQSEAoDZGlkGAEgASgJUgNkaWQSJwoEaW5mbxgCIAEo'
    'CzITLmRpZC5Vc2VyRXh0ZW5kSW5mb1IEaW5mbw==');

@$core.Deprecated('Use userExtendListReqDescriptor instead')
const UserExtendListReq$json = {
  '1': 'UserExtendListReq',
  '2': [
    {'1': 'list', '3': 1, '4': 3, '5': 9, '10': 'list'},
  ],
};

/// Descriptor for `UserExtendListReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userExtendListReqDescriptor = $convert
    .base64Decode('ChFVc2VyRXh0ZW5kTGlzdFJlcRISCgRsaXN0GAEgAygJUgRsaXN0');

@$core.Deprecated('Use userExtendListRespDescriptor instead')
const UserExtendListResp$json = {
  '1': 'UserExtendListResp',
  '2': [
    {
      '1': 'unit',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.did.UserExtendListResp.Unit',
      '10': 'unit'
    },
  ],
  '3': [UserExtendListResp_Unit$json],
};

@$core.Deprecated('Use userExtendListRespDescriptor instead')
const UserExtendListResp_Unit$json = {
  '1': 'Unit',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {
      '1': 'info',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.did.UserExtendInfo',
      '10': 'info'
    },
  ],
};

/// Descriptor for `UserExtendListResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userExtendListRespDescriptor = $convert.base64Decode(
    'ChJVc2VyRXh0ZW5kTGlzdFJlc3ASMAoEdW5pdBgCIAMoCzIcLmRpZC5Vc2VyRXh0ZW5kTGlzdF'
    'Jlc3AuVW5pdFIEdW5pdBpBCgRVbml0EhAKA2RpZBgBIAEoCVIDZGlkEicKBGluZm8YAiABKAsy'
    'Ey5kaWQuVXNlckV4dGVuZEluZm9SBGluZm8=');

@$core.Deprecated('Use userExtendDeleteReqDescriptor instead')
const UserExtendDeleteReq$json = {
  '1': 'UserExtendDeleteReq',
  '2': [
    {'1': 'list', '3': 1, '4': 3, '5': 9, '10': 'list'},
  ],
};

/// Descriptor for `UserExtendDeleteReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userExtendDeleteReqDescriptor = $convert
    .base64Decode('ChNVc2VyRXh0ZW5kRGVsZXRlUmVxEhIKBGxpc3QYASADKAlSBGxpc3Q=');
