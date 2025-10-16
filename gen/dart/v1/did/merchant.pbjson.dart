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
    {'1': 'logo', '3': 5, '4': 1, '5': 9, '10': 'logo'},
    {
      '1': 'public_coins',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.did.Coin',
      '10': 'publicCoins'
    },
    {
      '1': 'custom_tokens',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.did.Coin',
      '10': 'customTokens'
    },
    {'1': 'endpoint', '3': 8, '4': 1, '5': 9, '10': 'endpoint'},
    {'1': 'scheme', '3': 9, '4': 1, '5': 9, '10': 'scheme'},
    {'1': 'extend_token', '3': 10, '4': 1, '5': 9, '10': 'extendToken'},
    {'1': 'created_at', '3': 11, '4': 1, '5': 3, '10': 'createdAt'},
  ],
};

/// Descriptor for `MerchantInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List merchantInfoDescriptor = $convert.base64Decode(
    'CgxNZXJjaGFudEluZm8SIAoGbWFzdGVyGAIgASgLMgguaGkuVW5pdFIGbWFzdGVyEiAKBnNlcn'
    'ZlchgDIAEoCzIILmhpLlVuaXRSBnNlcnZlchISCgRuYW1lGAQgASgJUgRuYW1lEhIKBGxvZ28Y'
    'BSABKAlSBGxvZ28SLAoMcHVibGljX2NvaW5zGAYgAygLMgkuZGlkLkNvaW5SC3B1YmxpY0NvaW'
    '5zEi4KDWN1c3RvbV90b2tlbnMYByADKAsyCS5kaWQuQ29pblIMY3VzdG9tVG9rZW5zEhoKCGVu'
    'ZHBvaW50GAggASgJUghlbmRwb2ludBIWCgZzY2hlbWUYCSABKAlSBnNjaGVtZRIhCgxleHRlbm'
    'RfdG9rZW4YCiABKAlSC2V4dGVuZFRva2VuEh0KCmNyZWF0ZWRfYXQYCyABKANSCWNyZWF0ZWRB'
    'dA==');

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
    {'1': 'server', '3': 1, '4': 1, '5': 9, '10': 'server'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'logo', '3': 3, '4': 1, '5': 9, '10': 'logo'},
    {'1': 'coins', '3': 4, '4': 3, '5': 9, '10': 'coins'},
    {'1': 'endpoint', '3': 5, '4': 1, '5': 9, '10': 'endpoint'},
    {'1': 'scheme', '3': 6, '4': 1, '5': 9, '10': 'scheme'},
    {'1': 'comment', '3': 7, '4': 1, '5': 9, '10': 'comment'},
  ],
};

/// Descriptor for `MerchantSetReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List merchantSetReqDescriptor = $convert.base64Decode(
    'Cg5NZXJjaGFudFNldFJlcRIWCgZzZXJ2ZXIYASABKAlSBnNlcnZlchISCgRuYW1lGAIgASgJUg'
    'RuYW1lEhIKBGxvZ28YAyABKAlSBGxvZ28SFAoFY29pbnMYBCADKAlSBWNvaW5zEhoKCGVuZHBv'
    'aW50GAUgASgJUghlbmRwb2ludBIWCgZzY2hlbWUYBiABKAlSBnNjaGVtZRIYCgdjb21tZW50GA'
    'cgASgJUgdjb21tZW50');

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

@$core.Deprecated('Use userProfileGetRespDescriptor instead')
const UserProfileGetResp$json = {
  '1': 'UserProfileGetResp',
  '2': [
    {'1': 'profile', '3': 1, '4': 1, '5': 11, '6': '.hi.Unit', '10': 'profile'},
  ],
};

/// Descriptor for `UserProfileGetResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userProfileGetRespDescriptor = $convert.base64Decode(
    'ChJVc2VyUHJvZmlsZUdldFJlc3ASIgoHcHJvZmlsZRgBIAEoCzIILmhpLlVuaXRSB3Byb2ZpbG'
    'U=');

@$core.Deprecated('Use userProfileSetReqDescriptor instead')
const UserProfileSetReq$json = {
  '1': 'UserProfileSetReq',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'avatar', '3': 3, '4': 1, '5': 9, '10': 'avatar'},
  ],
};

/// Descriptor for `UserProfileSetReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userProfileSetReqDescriptor = $convert.base64Decode(
    'ChFVc2VyUHJvZmlsZVNldFJlcRIQCgNkaWQYASABKAlSA2RpZBISCgRuYW1lGAIgASgJUgRuYW'
    '1lEhYKBmF2YXRhchgDIAEoCVIGYXZhdGFy');

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

@$core.Deprecated('Use orderEventRespDescriptor instead')
const OrderEventResp$json = {
  '1': 'OrderEventResp',
  '2': [
    {'1': 'event', '3': 1, '4': 1, '5': 9, '10': 'event'},
    {'1': 'payload', '3': 2, '4': 1, '5': 9, '10': 'payload'},
  ],
};

/// Descriptor for `OrderEventResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List orderEventRespDescriptor = $convert.base64Decode(
    'Cg5PcmRlckV2ZW50UmVzcBIUCgVldmVudBgBIAEoCVIFZXZlbnQSGAoHcGF5bG9hZBgCIAEoCV'
    'IHcGF5bG9hZA==');
