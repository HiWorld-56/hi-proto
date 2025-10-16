// This is a generated file - do not edit.
//
// Generated from v1/ai/plugin/plugin.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use searchReqDescriptor instead')
const SearchReq$json = {
  '1': 'SearchReq',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 9, '10': 'type'},
    {'1': 'url', '3': 2, '4': 1, '5': 9, '10': 'url'},
    {'1': 'uuid', '3': 3, '4': 1, '5': 9, '10': 'uuid'},
    {'1': 'keyword', '3': 4, '4': 1, '5': 9, '10': 'keyword'},
  ],
};

/// Descriptor for `SearchReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchReqDescriptor = $convert.base64Decode(
    'CglTZWFyY2hSZXESEgoEdHlwZRgBIAEoCVIEdHlwZRIQCgN1cmwYAiABKAlSA3VybBISCgR1dW'
    'lkGAMgASgJUgR1dWlkEhgKB2tleXdvcmQYBCABKAlSB2tleXdvcmQ=');

@$core.Deprecated('Use searchRespDescriptor instead')
const SearchResp$json = {
  '1': 'SearchResp',
  '2': [
    {
      '1': 'contents',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.ai.MessagesContent',
      '10': 'contents'
    },
  ],
};

/// Descriptor for `SearchResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchRespDescriptor = $convert.base64Decode(
    'CgpTZWFyY2hSZXNwEi8KCGNvbnRlbnRzGAEgAygLMhMuYWkuTWVzc2FnZXNDb250ZW50Ughjb2'
    '50ZW50cw==');

@$core.Deprecated('Use pythonReqDescriptor instead')
const PythonReq$json = {
  '1': 'PythonReq',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 9, '10': 'code'},
    {'1': 'code_params', '3': 2, '4': 1, '5': 9, '10': 'codeParams'},
    {'1': 'uuid', '3': 3, '4': 1, '5': 9, '10': 'uuid'},
  ],
};

/// Descriptor for `PythonReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pythonReqDescriptor = $convert.base64Decode(
    'CglQeXRob25SZXESEgoEY29kZRgBIAEoCVIEY29kZRIfCgtjb2RlX3BhcmFtcxgCIAEoCVIKY2'
    '9kZVBhcmFtcxISCgR1dWlkGAMgASgJUgR1dWlk');

@$core.Deprecated('Use pythonRespDescriptor instead')
const PythonResp$json = {
  '1': 'PythonResp',
  '2': [
    {
      '1': 'contents',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.ai.MessagesContent',
      '10': 'contents'
    },
  ],
};

/// Descriptor for `PythonResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pythonRespDescriptor = $convert.base64Decode(
    'CgpQeXRob25SZXNwEi8KCGNvbnRlbnRzGAEgAygLMhMuYWkuTWVzc2FnZXNDb250ZW50Ughjb2'
    '50ZW50cw==');
