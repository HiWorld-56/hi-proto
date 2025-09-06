// This is a generated file - do not edit.
//
// Generated from v1/did/merchant.proto.

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
    {'1': 'master', '3': 2, '4': 1, '5': 11, '6': '.hi.Unit', '10': 'master'},
    {'1': 'server', '3': 3, '4': 1, '5': 11, '6': '.hi.Unit', '10': 'server'},
    {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    {'1': 'coin', '3': 5, '4': 1, '5': 11, '6': '.did.Coin', '10': 'coin'},
    {'1': 'endpoint', '3': 6, '4': 1, '5': 9, '10': 'endpoint'},
    {'1': 'scheme', '3': 7, '4': 1, '5': 9, '10': 'scheme'},
    {'1': 'extend_token', '3': 8, '4': 1, '5': 9, '10': 'extendToken'},
    {'1': 'create_at', '3': 9, '4': 1, '5': 9, '10': 'createAt'},
  ],
};

/// Descriptor for `MerchantInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List merchantInfoDescriptor = $convert.base64Decode(
    'CgxNZXJjaGFudEluZm8SIAoGbWFzdGVyGAIgASgLMgguaGkuVW5pdFIGbWFzdGVyEiAKBnNlcn'
    'ZlchgDIAEoCzIILmhpLlVuaXRSBnNlcnZlchISCgRuYW1lGAQgASgJUgRuYW1lEh0KBGNvaW4Y'
    'BSABKAsyCS5kaWQuQ29pblIEY29pbhIaCghlbmRwb2ludBgGIAEoCVIIZW5kcG9pbnQSFgoGc2'
    'NoZW1lGAcgASgJUgZzY2hlbWUSIQoMZXh0ZW5kX3Rva2VuGAggASgJUgtleHRlbmRUb2tlbhIb'
    'CgljcmVhdGVfYXQYCSABKAlSCGNyZWF0ZUF0');

@$core.Deprecated('Use merchantGetRespDescriptor instead')
const MerchantGetResp$json = {
  '1': 'MerchantGetResp',
  '2': [
    {
      '1': 'info',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.did.MerchantInfo',
      '10': 'info'
    },
  ],
};

/// Descriptor for `MerchantGetResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List merchantGetRespDescriptor = $convert.base64Decode(
    'Cg9NZXJjaGFudEdldFJlc3ASJQoEaW5mbxgBIAEoCzIRLmRpZC5NZXJjaGFudEluZm9SBGluZm'
    '8=');

@$core.Deprecated('Use merchantSetReqDescriptor instead')
const MerchantSetReq$json = {
  '1': 'MerchantSetReq',
  '2': [
    {'1': 'server', '3': 3, '4': 1, '5': 9, '10': 'server'},
    {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    {'1': 'coin', '3': 5, '4': 1, '5': 9, '10': 'coin'},
    {'1': 'endpoint', '3': 6, '4': 1, '5': 9, '10': 'endpoint'},
    {'1': 'scheme', '3': 7, '4': 1, '5': 9, '10': 'scheme'},
  ],
};

/// Descriptor for `MerchantSetReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List merchantSetReqDescriptor = $convert.base64Decode(
    'Cg5NZXJjaGFudFNldFJlcRIWCgZzZXJ2ZXIYAyABKAlSBnNlcnZlchISCgRuYW1lGAQgASgJUg'
    'RuYW1lEhIKBGNvaW4YBSABKAlSBGNvaW4SGgoIZW5kcG9pbnQYBiABKAlSCGVuZHBvaW50EhYK'
    'BnNjaGVtZRgHIAEoCVIGc2NoZW1l');

@$core.Deprecated('Use merchantListRespDescriptor instead')
const MerchantListResp$json = {
  '1': 'MerchantListResp',
  '2': [
    {
      '1': 'list',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.did.MerchantInfo',
      '10': 'list'
    },
  ],
};

/// Descriptor for `MerchantListResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List merchantListRespDescriptor = $convert.base64Decode(
    'ChBNZXJjaGFudExpc3RSZXNwEiUKBGxpc3QYASADKAsyES5kaWQuTWVyY2hhbnRJbmZvUgRsaX'
    'N0');

@$core.Deprecated('Use merchantNotifyReqDescriptor instead')
const MerchantNotifyReq$json = {
  '1': 'MerchantNotifyReq',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'nonce', '3': 2, '4': 1, '5': 9, '10': 'nonce'},
  ],
};

/// Descriptor for `MerchantNotifyReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List merchantNotifyReqDescriptor = $convert.base64Decode(
    'ChFNZXJjaGFudE5vdGlmeVJlcRIQCgNkaWQYASABKAlSA2RpZBIUCgVub25jZRgCIAEoCVIFbm'
    '9uY2U=');
