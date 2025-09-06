// This is a generated file - do not edit.
//
// Generated from v1/did/base.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use coinDescriptor instead')
const Coin$json = {
  '1': 'Coin',
  '2': [
    {'1': 'icon', '3': 1, '4': 1, '5': 9, '10': 'icon'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'contract', '3': 3, '4': 1, '5': 9, '10': 'contract'},
  ],
};

/// Descriptor for `Coin`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List coinDescriptor = $convert.base64Decode(
    'CgRDb2luEhIKBGljb24YASABKAlSBGljb24SEgoEbmFtZRgCIAEoCVIEbmFtZRIaCghjb250cm'
    'FjdBgDIAEoCVIIY29udHJhY3Q=');

@$core.Deprecated('Use listCoinsRespDescriptor instead')
const ListCoinsResp$json = {
  '1': 'ListCoinsResp',
  '2': [
    {'1': 'list', '3': 1, '4': 3, '5': 11, '6': '.did.Coin', '10': 'list'},
  ],
};

/// Descriptor for `ListCoinsResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listCoinsRespDescriptor = $convert.base64Decode(
    'Cg1MaXN0Q29pbnNSZXNwEh0KBGxpc3QYASADKAsyCS5kaWQuQ29pblIEbGlzdA==');

@$core.Deprecated('Use lastetVersionReqDescriptor instead')
const LastetVersionReq$json = {
  '1': 'LastetVersionReq',
  '2': [
    {'1': 'platform', '3': 1, '4': 1, '5': 9, '10': 'platform'},
  ],
};

/// Descriptor for `LastetVersionReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lastetVersionReqDescriptor = $convert.base64Decode(
    'ChBMYXN0ZXRWZXJzaW9uUmVxEhoKCHBsYXRmb3JtGAEgASgJUghwbGF0Zm9ybQ==');

@$core.Deprecated('Use lastetVersionRespDescriptor instead')
const LastetVersionResp$json = {
  '1': 'LastetVersionResp',
  '2': [
    {
      '1': 'min_supported_version',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'minSupportedVersion'
    },
    {'1': 'latest_version', '3': 2, '4': 1, '5': 9, '10': 'latestVersion'},
    {'1': 'download_url', '3': 3, '4': 1, '5': 9, '10': 'downloadUrl'},
    {'1': 'changes', '3': 4, '4': 3, '5': 9, '10': 'changes'},
    {'1': 'release_time', '3': 5, '4': 1, '5': 3, '10': 'releaseTime'},
  ],
};

/// Descriptor for `LastetVersionResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lastetVersionRespDescriptor = $convert.base64Decode(
    'ChFMYXN0ZXRWZXJzaW9uUmVzcBIyChVtaW5fc3VwcG9ydGVkX3ZlcnNpb24YASABKAlSE21pbl'
    'N1cHBvcnRlZFZlcnNpb24SJQoObGF0ZXN0X3ZlcnNpb24YAiABKAlSDWxhdGVzdFZlcnNpb24S'
    'IQoMZG93bmxvYWRfdXJsGAMgASgJUgtkb3dubG9hZFVybBIYCgdjaGFuZ2VzGAQgAygJUgdjaG'
    'FuZ2VzEiEKDHJlbGVhc2VfdGltZRgFIAEoA1ILcmVsZWFzZVRpbWU=');
