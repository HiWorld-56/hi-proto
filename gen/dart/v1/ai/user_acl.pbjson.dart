// This is a generated file - do not edit.
//
// Generated from v1/ai/user_acl.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use addSuperUserReqDescriptor instead')
const AddSuperUserReq$json = {
  '1': 'AddSuperUserReq',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'type', '3': 2, '4': 1, '5': 9, '10': 'type'},
  ],
};

/// Descriptor for `AddSuperUserReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addSuperUserReqDescriptor = $convert.base64Decode(
    'Cg9BZGRTdXBlclVzZXJSZXESEAoDZGlkGAEgASgJUgNkaWQSEgoEdHlwZRgCIAEoCVIEdHlwZQ'
    '==');

@$core.Deprecated('Use deleteSuperUserReqDescriptor instead')
const DeleteSuperUserReq$json = {
  '1': 'DeleteSuperUserReq',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'type', '3': 2, '4': 1, '5': 9, '10': 'type'},
  ],
};

/// Descriptor for `DeleteSuperUserReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteSuperUserReqDescriptor = $convert.base64Decode(
    'ChJEZWxldGVTdXBlclVzZXJSZXESEAoDZGlkGAEgASgJUgNkaWQSEgoEdHlwZRgCIAEoCVIEdH'
    'lwZQ==');

@$core.Deprecated('Use listSuperUserReqDescriptor instead')
const ListSuperUserReq$json = {
  '1': 'ListSuperUserReq',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'type', '3': 2, '4': 1, '5': 9, '10': 'type'},
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

/// Descriptor for `ListSuperUserReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listSuperUserReqDescriptor = $convert.base64Decode(
    'ChBMaXN0U3VwZXJVc2VyUmVxEhAKA2RpZBgBIAEoCVIDZGlkEhIKBHR5cGUYAiABKAlSBHR5cG'
    'USLgoKcGFnaW5hdGlvbhgDIAEoCzIOLmhpLlBhZ2luYXRpb25SCnBhZ2luYXRpb24=');

@$core.Deprecated('Use superUserInfoDescriptor instead')
const SuperUserInfo$json = {
  '1': 'SuperUserInfo',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'type', '3': 2, '4': 1, '5': 5, '10': 'type'},
    {'1': 'permissions', '3': 3, '4': 3, '5': 9, '10': 'permissions'},
    {'1': 'note', '3': 4, '4': 1, '5': 9, '10': 'note'},
  ],
};

/// Descriptor for `SuperUserInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List superUserInfoDescriptor = $convert.base64Decode(
    'Cg1TdXBlclVzZXJJbmZvEhAKA2RpZBgBIAEoCVIDZGlkEhIKBHR5cGUYAiABKAVSBHR5cGUSIA'
    'oLcGVybWlzc2lvbnMYAyADKAlSC3Blcm1pc3Npb25zEhIKBG5vdGUYBCABKAlSBG5vdGU=');

@$core.Deprecated('Use listSuperUserRespDescriptor instead')
const ListSuperUserResp$json = {
  '1': 'ListSuperUserResp',
  '2': [
    {'1': 'total', '3': 1, '4': 1, '5': 3, '10': 'total'},
    {
      '1': 'infos',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.ai.SuperUserInfo',
      '10': 'infos'
    },
  ],
};

/// Descriptor for `ListSuperUserResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listSuperUserRespDescriptor = $convert.base64Decode(
    'ChFMaXN0U3VwZXJVc2VyUmVzcBIUCgV0b3RhbBgBIAEoA1IFdG90YWwSJwoFaW5mb3MYAiADKA'
    'syES5haS5TdXBlclVzZXJJbmZvUgVpbmZvcw==');

@$core.Deprecated('Use listSuperUserTypeRespDescriptor instead')
const ListSuperUserTypeResp$json = {
  '1': 'ListSuperUserTypeResp',
  '2': [
    {'1': 'types', '3': 1, '4': 3, '5': 9, '10': 'types'},
  ],
};

/// Descriptor for `ListSuperUserTypeResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listSuperUserTypeRespDescriptor =
    $convert.base64Decode(
        'ChVMaXN0U3VwZXJVc2VyVHlwZVJlc3ASFAoFdHlwZXMYASADKAlSBXR5cGVz');

@$core.Deprecated('Use editSuperUserReqDescriptor instead')
const EditSuperUserReq$json = {
  '1': 'EditSuperUserReq',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'note', '3': 2, '4': 1, '5': 9, '10': 'note'},
  ],
};

/// Descriptor for `EditSuperUserReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editSuperUserReqDescriptor = $convert.base64Decode(
    'ChBFZGl0U3VwZXJVc2VyUmVxEhAKA2RpZBgBIAEoCVIDZGlkEhIKBG5vdGUYAiABKAlSBG5vdG'
    'U=');
