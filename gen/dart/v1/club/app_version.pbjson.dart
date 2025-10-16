// This is a generated file - do not edit.
//
// Generated from v1/club/app_version.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use appVersionParamDescriptor instead')
const AppVersionParam$json = {
  '1': 'AppVersionParam',
  '2': [
    {'1': 'platform', '3': 1, '4': 1, '5': 9, '10': 'platform'},
  ],
};

/// Descriptor for `AppVersionParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List appVersionParamDescriptor = $convert.base64Decode(
    'Cg9BcHBWZXJzaW9uUGFyYW0SGgoIcGxhdGZvcm0YASABKAlSCHBsYXRmb3Jt');

@$core.Deprecated('Use appVersionInfoDescriptor instead')
const AppVersionInfo$json = {
  '1': 'AppVersionInfo',
  '2': [
    {'1': 'platform', '3': 1, '4': 1, '5': 9, '10': 'platform'},
    {
      '1': 'min_supported_version',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'minSupportedVersion'
    },
    {'1': 'latest_version', '3': 3, '4': 1, '5': 9, '10': 'latestVersion'},
    {'1': 'download_url', '3': 4, '4': 1, '5': 9, '10': 'downloadUrl'},
    {'1': 'changes', '3': 5, '4': 3, '5': 9, '10': 'changes'},
    {'1': 'release_time', '3': 6, '4': 1, '5': 3, '10': 'releaseTime'},
  ],
};

/// Descriptor for `AppVersionInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List appVersionInfoDescriptor = $convert.base64Decode(
    'Cg5BcHBWZXJzaW9uSW5mbxIaCghwbGF0Zm9ybRgBIAEoCVIIcGxhdGZvcm0SMgoVbWluX3N1cH'
    'BvcnRlZF92ZXJzaW9uGAIgASgJUhNtaW5TdXBwb3J0ZWRWZXJzaW9uEiUKDmxhdGVzdF92ZXJz'
    'aW9uGAMgASgJUg1sYXRlc3RWZXJzaW9uEiEKDGRvd25sb2FkX3VybBgEIAEoCVILZG93bmxvYW'
    'RVcmwSGAoHY2hhbmdlcxgFIAMoCVIHY2hhbmdlcxIhCgxyZWxlYXNlX3RpbWUYBiABKANSC3Jl'
    'bGVhc2VUaW1l');
