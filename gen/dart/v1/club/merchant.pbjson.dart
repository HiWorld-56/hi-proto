// This is a generated file - do not edit.
//
// Generated from v1/club/merchant.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use merchantInfoDescriptor instead')
const MerchantInfo$json = {
  '1': 'MerchantInfo',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'logo', '3': 3, '4': 1, '5': 9, '10': 'logo'},
    {'1': 'native_coins', '3': 4, '4': 3, '5': 9, '10': 'nativeCoins'},
    {'1': 'token_coins', '3': 5, '4': 3, '5': 9, '10': 'tokenCoins'},
    {'1': 'comment', '3': 6, '4': 1, '5': 9, '10': 'comment'},
    {'1': 'created_at', '3': 7, '4': 1, '5': 3, '10': 'createdAt'},
  ],
};

/// Descriptor for `MerchantInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List merchantInfoDescriptor = $convert.base64Decode(
    'CgxNZXJjaGFudEluZm8SEAoDZGlkGAEgASgJUgNkaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRISCg'
    'Rsb2dvGAMgASgJUgRsb2dvEiEKDG5hdGl2ZV9jb2lucxgEIAMoCVILbmF0aXZlQ29pbnMSHwoL'
    'dG9rZW5fY29pbnMYBSADKAlSCnRva2VuQ29pbnMSGAoHY29tbWVudBgGIAEoCVIHY29tbWVudB'
    'IdCgpjcmVhdGVkX2F0GAcgASgDUgljcmVhdGVkQXQ=');

@$core.Deprecated('Use merchantListDescriptor instead')
const MerchantList$json = {
  '1': 'MerchantList',
  '2': [
    {
      '1': 'merchant_list',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.club.MerchantInfo',
      '10': 'merchantList'
    },
  ],
};

/// Descriptor for `MerchantList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List merchantListDescriptor = $convert.base64Decode(
    'CgxNZXJjaGFudExpc3QSNwoNbWVyY2hhbnRfbGlzdBgBIAMoCzISLmNsdWIuTWVyY2hhbnRJbm'
    'ZvUgxtZXJjaGFudExpc3Q=');
