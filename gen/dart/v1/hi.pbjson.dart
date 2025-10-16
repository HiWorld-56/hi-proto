// This is a generated file - do not edit.
//
// Generated from v1/hi.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use web3DataDescriptor instead')
const Web3Data$json = {
  '1': 'Web3Data',
  '2': [
    {'1': 'data', '3': 1, '4': 1, '5': 12, '10': 'data'},
    {'1': 'signature', '3': 2, '4': 1, '5': 9, '10': 'signature'},
  ],
};

/// Descriptor for `Web3Data`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List web3DataDescriptor = $convert.base64Decode(
    'CghXZWIzRGF0YRISCgRkYXRhGAEgASgMUgRkYXRhEhwKCXNpZ25hdHVyZRgCIAEoCVIJc2lnbm'
    'F0dXJl');

@$core.Deprecated('Use dIDDescriptor instead')
const DID$json = {
  '1': 'DID',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `DID`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dIDDescriptor =
    $convert.base64Decode('CgNESUQSDgoCaWQYASABKAlSAmlk');

@$core.Deprecated('Use unitDescriptor instead')
const Unit$json = {
  '1': 'Unit',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 9, '10': 'type'},
    {'1': 'did', '3': 2, '4': 1, '5': 9, '10': 'did'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'avatar', '3': 4, '4': 1, '5': 9, '10': 'avatar'},
    {'1': 'update', '3': 5, '4': 1, '5': 3, '10': 'update'},
  ],
};

/// Descriptor for `Unit`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unitDescriptor = $convert.base64Decode(
    'CgRVbml0EhIKBHR5cGUYASABKAlSBHR5cGUSEAoDZGlkGAIgASgJUgNkaWQSEgoEbmFtZRgDIA'
    'EoCVIEbmFtZRIWCgZhdmF0YXIYBCABKAlSBmF2YXRhchIWCgZ1cGRhdGUYBSABKANSBnVwZGF0'
    'ZQ==');

@$core.Deprecated('Use mqttDescriptor instead')
const Mqtt$json = {
  '1': 'Mqtt',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
    {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `Mqtt`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mqttDescriptor = $convert.base64Decode(
    'CgRNcXR0Eg4KAmlkGAEgASgJUgJpZBIaCgh1c2VybmFtZRgCIAEoCVIIdXNlcm5hbWUSGgoIcG'
    'Fzc3dvcmQYAyABKAlSCHBhc3N3b3Jk');

@$core.Deprecated('Use tokenDescriptor instead')
const Token$json = {
  '1': 'Token',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    {'1': 'refresh_token', '3': 2, '4': 1, '5': 9, '10': 'refreshToken'},
  ],
};

/// Descriptor for `Token`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenDescriptor = $convert.base64Decode(
    'CgVUb2tlbhIUCgV0b2tlbhgBIAEoCVIFdG9rZW4SIwoNcmVmcmVzaF90b2tlbhgCIAEoCVIMcm'
    'VmcmVzaFRva2Vu');

@$core.Deprecated('Use nonceDescriptor instead')
const Nonce$json = {
  '1': 'Nonce',
  '2': [
    {'1': 'nonce', '3': 1, '4': 1, '5': 9, '10': 'nonce'},
  ],
};

/// Descriptor for `Nonce`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nonceDescriptor =
    $convert.base64Decode('CgVOb25jZRIUCgVub25jZRgBIAEoCVIFbm9uY2U=');

@$core.Deprecated('Use reqIDDescriptor instead')
const ReqID$json = {
  '1': 'ReqID',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `ReqID`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reqIDDescriptor =
    $convert.base64Decode('CgVSZXFJRBIOCgJpZBgBIAEoCVICaWQ=');

@$core.Deprecated('Use stateDescriptor instead')
const State$json = {
  '1': 'State',
  '2': [
    {'1': 'state', '3': 1, '4': 1, '5': 8, '10': 'state'},
  ],
};

/// Descriptor for `State`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stateDescriptor =
    $convert.base64Decode('CgVTdGF0ZRIUCgVzdGF0ZRgBIAEoCFIFc3RhdGU=');

@$core.Deprecated('Use numberDescriptor instead')
const Number$json = {
  '1': 'Number',
  '2': [
    {'1': 'n', '3': 1, '4': 1, '5': 3, '10': 'n'},
  ],
};

/// Descriptor for `Number`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List numberDescriptor =
    $convert.base64Decode('CgZOdW1iZXISDAoBbhgBIAEoA1IBbg==');

@$core.Deprecated('Use nodeDescriptor instead')
const Node$json = {
  '1': 'Node',
  '2': [
    {'1': 'app', '3': 1, '4': 1, '5': 9, '10': 'app'},
    {'1': 'dev', '3': 2, '4': 1, '5': 9, '10': 'dev'},
    {'1': 'mac', '3': 3, '4': 1, '5': 9, '10': 'mac'},
  ],
};

/// Descriptor for `Node`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nodeDescriptor = $convert.base64Decode(
    'CgROb2RlEhAKA2FwcBgBIAEoCVIDYXBwEhAKA2RldhgCIAEoCVIDZGV2EhAKA21hYxgDIAEoCV'
    'IDbWFj');

@$core.Deprecated('Use paginationDescriptor instead')
const Pagination$json = {
  '1': 'Pagination',
  '2': [
    {'1': 'page', '3': 1, '4': 1, '5': 5, '10': 'page'},
    {'1': 'limit', '3': 2, '4': 1, '5': 5, '10': 'limit'},
  ],
};

/// Descriptor for `Pagination`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paginationDescriptor = $convert.base64Decode(
    'CgpQYWdpbmF0aW9uEhIKBHBhZ2UYASABKAVSBHBhZ2USFAoFbGltaXQYAiABKAVSBWxpbWl0');

@$core.Deprecated('Use refreshTokenReqDescriptor instead')
const RefreshTokenReq$json = {
  '1': 'RefreshTokenReq',
  '2': [
    {'1': 'node', '3': 1, '4': 1, '5': 11, '6': '.hi.Node', '10': 'node'},
    {'1': 'did', '3': 2, '4': 1, '5': 9, '10': 'did'},
    {'1': 'refresh_token', '3': 3, '4': 1, '5': 9, '10': 'refreshToken'},
  ],
};

/// Descriptor for `RefreshTokenReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshTokenReqDescriptor = $convert.base64Decode(
    'Cg9SZWZyZXNoVG9rZW5SZXESHAoEbm9kZRgBIAEoCzIILmhpLk5vZGVSBG5vZGUSEAoDZGlkGA'
    'IgASgJUgNkaWQSIwoNcmVmcmVzaF90b2tlbhgDIAEoCVIMcmVmcmVzaFRva2Vu');
