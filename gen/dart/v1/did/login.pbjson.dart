// This is a generated file - do not edit.
//
// Generated from v1/did/login.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use loginReqDescriptor instead')
const LoginReq$json = {
  '1': 'LoginReq',
  '2': [
    {'1': 'node', '3': 1, '4': 1, '5': 11, '6': '.hi.Node', '10': 'node'},
    {'1': 'nonce', '3': 2, '4': 1, '5': 9, '10': 'nonce'},
  ],
};

/// Descriptor for `LoginReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginReqDescriptor = $convert.base64Decode(
    'CghMb2dpblJlcRIcCgRub2RlGAEgASgLMgguaGkuTm9kZVIEbm9kZRIUCgVub25jZRgCIAEoCV'
    'IFbm9uY2U=');

@$core.Deprecated('Use loginRespDescriptor instead')
const LoginResp$json = {
  '1': 'LoginResp',
  '2': [
    {'1': 'usr', '3': 1, '4': 1, '5': 11, '6': '.hi.Unit', '10': 'usr'},
    {'1': 'token', '3': 2, '4': 1, '5': 11, '6': '.hi.Token', '10': 'token'},
    {'1': 'mqtt', '3': 3, '4': 1, '5': 11, '6': '.hi.Mqtt', '10': 'mqtt'},
  ],
};

/// Descriptor for `LoginResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRespDescriptor = $convert.base64Decode(
    'CglMb2dpblJlc3ASGgoDdXNyGAEgASgLMgguaGkuVW5pdFIDdXNyEh8KBXRva2VuGAIgASgLMg'
    'kuaGkuVG9rZW5SBXRva2VuEhwKBG1xdHQYAyABKAsyCC5oaS5NcXR0UgRtcXR0');

@$core.Deprecated('Use loginDataDescriptor instead')
const LoginData$json = {
  '1': 'LoginData',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'did', '3': 2, '4': 1, '5': 9, '10': 'did'},
  ],
};

/// Descriptor for `LoginData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginDataDescriptor = $convert.base64Decode(
    'CglMb2dpbkRhdGESDgoCaWQYASABKAlSAmlkEhAKA2RpZBgCIAEoCVIDZGlk');
