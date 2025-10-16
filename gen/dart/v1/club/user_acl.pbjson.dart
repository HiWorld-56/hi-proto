// This is a generated file - do not edit.
//
// Generated from v1/club/user_acl.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use dIDListDescriptor instead')
const DIDList$json = {
  '1': 'DIDList',
  '2': [
    {'1': 'did_list', '3': 1, '4': 3, '5': 9, '10': 'didList'},
  ],
};

/// Descriptor for `DIDList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dIDListDescriptor =
    $convert.base64Decode('CgdESURMaXN0EhkKCGRpZF9saXN0GAEgAygJUgdkaWRMaXN0');

@$core.Deprecated('Use userAccessParamDescriptor instead')
const UserAccessParam$json = {
  '1': 'UserAccessParam',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'type', '3': 2, '4': 1, '5': 9, '10': 'type'},
  ],
};

/// Descriptor for `UserAccessParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userAccessParamDescriptor = $convert.base64Decode(
    'Cg9Vc2VyQWNjZXNzUGFyYW0SEAoDZGlkGAEgASgJUgNkaWQSEgoEdHlwZRgCIAEoCVIEdHlwZQ'
    '==');

@$core.Deprecated('Use userAccessListParamDescriptor instead')
const UserAccessListParam$json = {
  '1': 'UserAccessListParam',
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

/// Descriptor for `UserAccessListParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userAccessListParamDescriptor = $convert.base64Decode(
    'ChNVc2VyQWNjZXNzTGlzdFBhcmFtEhAKA2RpZBgBIAEoCVIDZGlkEhIKBHR5cGUYAiABKAlSBH'
    'R5cGUSLgoKcGFnaW5hdGlvbhgDIAEoCzIOLmhpLlBhZ2luYXRpb25SCnBhZ2luYXRpb24=');

@$core.Deprecated('Use userAccessDescriptor instead')
const UserAccess$json = {
  '1': 'UserAccess',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'note', '3': 2, '4': 1, '5': 9, '10': 'note'},
    {'1': 'type', '3': 3, '4': 1, '5': 5, '10': 'type'},
    {'1': 'permissions', '3': 4, '4': 3, '5': 9, '10': 'permissions'},
  ],
};

/// Descriptor for `UserAccess`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userAccessDescriptor = $convert.base64Decode(
    'CgpVc2VyQWNjZXNzEhAKA2RpZBgBIAEoCVIDZGlkEhIKBG5vdGUYAiABKAlSBG5vdGUSEgoEdH'
    'lwZRgDIAEoBVIEdHlwZRIgCgtwZXJtaXNzaW9ucxgEIAMoCVILcGVybWlzc2lvbnM=');

@$core.Deprecated('Use userAccessListDescriptor instead')
const UserAccessList$json = {
  '1': 'UserAccessList',
  '2': [
    {
      '1': 'user_access_list',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.club.UserAccess',
      '10': 'userAccessList'
    },
  ],
};

/// Descriptor for `UserAccessList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userAccessListDescriptor = $convert.base64Decode(
    'Cg5Vc2VyQWNjZXNzTGlzdBI6ChB1c2VyX2FjY2Vzc19saXN0GAEgAygLMhAuY2x1Yi5Vc2VyQW'
    'NjZXNzUg51c2VyQWNjZXNzTGlzdA==');

@$core.Deprecated('Use accessTypeListDescriptor instead')
const AccessTypeList$json = {
  '1': 'AccessTypeList',
  '2': [
    {'1': 'type_list', '3': 1, '4': 3, '5': 9, '10': 'typeList'},
  ],
};

/// Descriptor for `AccessTypeList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accessTypeListDescriptor = $convert.base64Decode(
    'Cg5BY2Nlc3NUeXBlTGlzdBIbCgl0eXBlX2xpc3QYASADKAlSCHR5cGVMaXN0');

@$core.Deprecated('Use updateAccessParamDescriptor instead')
const UpdateAccessParam$json = {
  '1': 'UpdateAccessParam',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'note', '3': 2, '4': 1, '5': 9, '10': 'note'},
  ],
};

/// Descriptor for `UpdateAccessParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateAccessParamDescriptor = $convert.base64Decode(
    'ChFVcGRhdGVBY2Nlc3NQYXJhbRIQCgNkaWQYASABKAlSA2RpZBISCgRub3RlGAIgASgJUgRub3'
    'Rl');
