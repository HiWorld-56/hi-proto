// This is a generated file - do not edit.
//
// Generated from v1/club/login.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

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

@$core.Deprecated('Use loginParamDescriptor instead')
const LoginParam$json = {
  '1': 'LoginParam',
  '2': [
    {'1': 'signature', '3': 1, '4': 1, '5': 9, '10': 'signature'},
    {'1': 'data', '3': 2, '4': 1, '5': 12, '10': 'data'},
  ],
};

/// Descriptor for `LoginParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginParamDescriptor = $convert.base64Decode(
    'CgpMb2dpblBhcmFtEhwKCXNpZ25hdHVyZRgBIAEoCVIJc2lnbmF0dXJlEhIKBGRhdGEYAiABKA'
    'xSBGRhdGE=');

@$core.Deprecated('Use embeddedLoginDataDescriptor instead')
const EmbeddedLoginData$json = {
  '1': 'EmbeddedLoginData',
  '2': [
    {'1': 'nonce', '3': 1, '4': 1, '5': 9, '10': 'nonce'},
    {'1': 'did', '3': 2, '4': 1, '5': 9, '10': 'did'},
    {'1': 'app_name', '3': 3, '4': 1, '5': 9, '10': 'appName'},
    {'1': 'mac', '3': 4, '4': 1, '5': 9, '10': 'mac'},
    {'1': 'point', '3': 5, '4': 1, '5': 9, '10': 'point'},
  ],
};

/// Descriptor for `EmbeddedLoginData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List embeddedLoginDataDescriptor = $convert.base64Decode(
    'ChFFbWJlZGRlZExvZ2luRGF0YRIUCgVub25jZRgBIAEoCVIFbm9uY2USEAoDZGlkGAIgASgJUg'
    'NkaWQSGQoIYXBwX25hbWUYAyABKAlSB2FwcE5hbWUSEAoDbWFjGAQgASgJUgNtYWMSFAoFcG9p'
    'bnQYBSABKAlSBXBvaW50');

@$core.Deprecated('Use embeddedLoginRespDescriptor instead')
const EmbeddedLoginResp$json = {
  '1': 'EmbeddedLoginResp',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    {'1': 'refresh_token', '3': 2, '4': 1, '5': 9, '10': 'refreshToken'},
    {'1': 'avatar', '3': 3, '4': 1, '5': 9, '10': 'avatar'},
    {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    {'1': 'mqtt_username', '3': 5, '4': 1, '5': 9, '10': 'mqttUsername'},
    {'1': 'mqtt_client_id', '3': 6, '4': 1, '5': 9, '10': 'mqttClientId'},
    {'1': 'mqtt_password', '3': 7, '4': 1, '5': 9, '10': 'mqttPassword'},
    {'1': 'master', '3': 8, '4': 1, '5': 9, '10': 'master'},
  ],
};

/// Descriptor for `EmbeddedLoginResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List embeddedLoginRespDescriptor = $convert.base64Decode(
    'ChFFbWJlZGRlZExvZ2luUmVzcBIUCgV0b2tlbhgBIAEoCVIFdG9rZW4SIwoNcmVmcmVzaF90b2'
    'tlbhgCIAEoCVIMcmVmcmVzaFRva2VuEhYKBmF2YXRhchgDIAEoCVIGYXZhdGFyEhIKBG5hbWUY'
    'BCABKAlSBG5hbWUSIwoNbXF0dF91c2VybmFtZRgFIAEoCVIMbXF0dFVzZXJuYW1lEiQKDm1xdH'
    'RfY2xpZW50X2lkGAYgASgJUgxtcXR0Q2xpZW50SWQSIwoNbXF0dF9wYXNzd29yZBgHIAEoCVIM'
    'bXF0dFBhc3N3b3JkEhYKBm1hc3RlchgIIAEoCVIGbWFzdGVy');

@$core.Deprecated('Use walletLoginDataDescriptor instead')
const WalletLoginData$json = {
  '1': 'WalletLoginData',
  '2': [
    {'1': 'nonce', '3': 1, '4': 1, '5': 9, '10': 'nonce'},
    {'1': 'app_name', '3': 2, '4': 1, '5': 9, '10': 'appName'},
    {'1': 'mac', '3': 3, '4': 1, '5': 9, '10': 'mac'},
    {'1': 'point', '3': 4, '4': 1, '5': 9, '10': 'point'},
  ],
};

/// Descriptor for `WalletLoginData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List walletLoginDataDescriptor = $convert.base64Decode(
    'Cg9XYWxsZXRMb2dpbkRhdGESFAoFbm9uY2UYASABKAlSBW5vbmNlEhkKCGFwcF9uYW1lGAIgAS'
    'gJUgdhcHBOYW1lEhAKA21hYxgDIAEoCVIDbWFjEhQKBXBvaW50GAQgASgJUgVwb2ludA==');

@$core.Deprecated('Use walletLoginParamDescriptor instead')
const WalletLoginParam$json = {
  '1': 'WalletLoginParam',
  '2': [
    {'1': 'signature', '3': 1, '4': 1, '5': 9, '10': 'signature'},
    {
      '1': 'data',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.club.WalletLoginData',
      '10': 'data'
    },
  ],
};

/// Descriptor for `WalletLoginParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List walletLoginParamDescriptor = $convert.base64Decode(
    'ChBXYWxsZXRMb2dpblBhcmFtEhwKCXNpZ25hdHVyZRgBIAEoCVIJc2lnbmF0dXJlEikKBGRhdG'
    'EYAiABKAsyFS5jbHViLldhbGxldExvZ2luRGF0YVIEZGF0YQ==');

@$core.Deprecated('Use walletLoginRespDescriptor instead')
const WalletLoginResp$json = {
  '1': 'WalletLoginResp',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'avatar', '3': 3, '4': 1, '5': 9, '10': 'avatar'},
    {'1': 'token', '3': 4, '4': 1, '5': 9, '10': 'token'},
    {'1': 'refresh_token', '3': 5, '4': 1, '5': 9, '10': 'refreshToken'},
    {'1': 'mqtt_username', '3': 6, '4': 1, '5': 9, '10': 'mqttUsername'},
    {'1': 'mqtt_client_id', '3': 7, '4': 1, '5': 9, '10': 'mqttClientId'},
    {'1': 'permissions', '3': 8, '4': 3, '5': 9, '10': 'permissions'},
  ],
};

/// Descriptor for `WalletLoginResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List walletLoginRespDescriptor = $convert.base64Decode(
    'Cg9XYWxsZXRMb2dpblJlc3ASEAoDZGlkGAEgASgJUgNkaWQSEgoEbmFtZRgCIAEoCVIEbmFtZR'
    'IWCgZhdmF0YXIYAyABKAlSBmF2YXRhchIUCgV0b2tlbhgEIAEoCVIFdG9rZW4SIwoNcmVmcmVz'
    'aF90b2tlbhgFIAEoCVIMcmVmcmVzaFRva2VuEiMKDW1xdHRfdXNlcm5hbWUYBiABKAlSDG1xdH'
    'RVc2VybmFtZRIkCg5tcXR0X2NsaWVudF9pZBgHIAEoCVIMbXF0dENsaWVudElkEiAKC3Blcm1p'
    'c3Npb25zGAggAygJUgtwZXJtaXNzaW9ucw==');

@$core.Deprecated('Use qrLoginParamDescriptor instead')
const QrLoginParam$json = {
  '1': 'QrLoginParam',
  '2': [
    {'1': 'conversation_id', '3': 1, '4': 1, '5': 9, '10': 'conversationId'},
  ],
};

/// Descriptor for `QrLoginParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List qrLoginParamDescriptor = $convert.base64Decode(
    'CgxRckxvZ2luUGFyYW0SJwoPY29udmVyc2F0aW9uX2lkGAEgASgJUg5jb252ZXJzYXRpb25JZA'
    '==');

@$core.Deprecated('Use refreshTokenParamDescriptor instead')
const RefreshTokenParam$json = {
  '1': 'RefreshTokenParam',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'refresh_token', '3': 2, '4': 1, '5': 9, '10': 'refreshToken'},
    {'1': 'app_name', '3': 3, '4': 1, '5': 9, '10': 'appName'},
    {'1': 'mac', '3': 4, '4': 1, '5': 9, '10': 'mac'},
    {'1': 'point', '3': 5, '4': 1, '5': 9, '10': 'point'},
  ],
};

/// Descriptor for `RefreshTokenParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshTokenParamDescriptor = $convert.base64Decode(
    'ChFSZWZyZXNoVG9rZW5QYXJhbRIQCgNkaWQYASABKAlSA2RpZBIjCg1yZWZyZXNoX3Rva2VuGA'
    'IgASgJUgxyZWZyZXNoVG9rZW4SGQoIYXBwX25hbWUYAyABKAlSB2FwcE5hbWUSEAoDbWFjGAQg'
    'ASgJUgNtYWMSFAoFcG9pbnQYBSABKAlSBXBvaW50');

@$core.Deprecated('Use refreshTokenRespDescriptor instead')
const RefreshTokenResp$json = {
  '1': 'RefreshTokenResp',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'token', '3': 2, '4': 1, '5': 9, '10': 'token'},
    {'1': 'refresh_token', '3': 3, '4': 1, '5': 9, '10': 'refreshToken'},
  ],
};

/// Descriptor for `RefreshTokenResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshTokenRespDescriptor = $convert.base64Decode(
    'ChBSZWZyZXNoVG9rZW5SZXNwEhAKA2RpZBgBIAEoCVIDZGlkEhQKBXRva2VuGAIgASgJUgV0b2'
    'tlbhIjCg1yZWZyZXNoX3Rva2VuGAMgASgJUgxyZWZyZXNoVG9rZW4=');

@$core.Deprecated('Use loginConversationParamDescriptor instead')
const LoginConversationParam$json = {
  '1': 'LoginConversationParam',
  '2': [
    {'1': 'app_name', '3': 3, '4': 1, '5': 9, '10': 'appName'},
    {'1': 'mac', '3': 4, '4': 1, '5': 9, '10': 'mac'},
    {'1': 'point', '3': 5, '4': 1, '5': 9, '10': 'point'},
  ],
};

/// Descriptor for `LoginConversationParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginConversationParamDescriptor =
    $convert.base64Decode(
        'ChZMb2dpbkNvbnZlcnNhdGlvblBhcmFtEhkKCGFwcF9uYW1lGAMgASgJUgdhcHBOYW1lEhAKA2'
        '1hYxgEIAEoCVIDbWFjEhQKBXBvaW50GAUgASgJUgVwb2ludA==');

@$core.Deprecated('Use loginConversationIDDescriptor instead')
const LoginConversationID$json = {
  '1': 'LoginConversationID',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `LoginConversationID`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginConversationIDDescriptor = $convert
    .base64Decode('ChNMb2dpbkNvbnZlcnNhdGlvbklEEg4KAmlkGAEgASgJUgJpZA==');

@$core.Deprecated('Use loginConversationDescriptor instead')
const LoginConversation$json = {
  '1': 'LoginConversation',
  '2': [
    {'1': 'req_id', '3': 1, '4': 1, '5': 9, '10': 'reqId'},
    {'1': 'token', '3': 2, '4': 1, '5': 9, '10': 'token'},
    {'1': 'refresh_token', '3': 3, '4': 1, '5': 9, '10': 'refreshToken'},
    {'1': 'app_name', '3': 4, '4': 1, '5': 9, '10': 'appName'},
    {'1': 'mac', '3': 5, '4': 1, '5': 9, '10': 'mac'},
    {'1': 'point', '3': 6, '4': 1, '5': 9, '10': 'point'},
    {'1': 'did', '3': 7, '4': 1, '5': 9, '10': 'did'},
    {'1': 'avatar', '3': 8, '4': 1, '5': 9, '10': 'avatar'},
    {'1': 'name', '3': 9, '4': 1, '5': 9, '10': 'name'},
    {'1': 'mqtt_username', '3': 10, '4': 1, '5': 9, '10': 'mqttUsername'},
    {'1': 'mqtt_client_id', '3': 11, '4': 1, '5': 9, '10': 'mqttClientId'},
    {
      '1': 'mqtt_client_password',
      '3': 12,
      '4': 1,
      '5': 9,
      '10': 'mqttClientPassword'
    },
    {'1': 'email', '3': 13, '4': 1, '5': 9, '10': 'email'},
    {'1': 'permissions', '3': 14, '4': 3, '5': 9, '10': 'permissions'},
  ],
};

/// Descriptor for `LoginConversation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginConversationDescriptor = $convert.base64Decode(
    'ChFMb2dpbkNvbnZlcnNhdGlvbhIVCgZyZXFfaWQYASABKAlSBXJlcUlkEhQKBXRva2VuGAIgAS'
    'gJUgV0b2tlbhIjCg1yZWZyZXNoX3Rva2VuGAMgASgJUgxyZWZyZXNoVG9rZW4SGQoIYXBwX25h'
    'bWUYBCABKAlSB2FwcE5hbWUSEAoDbWFjGAUgASgJUgNtYWMSFAoFcG9pbnQYBiABKAlSBXBvaW'
    '50EhAKA2RpZBgHIAEoCVIDZGlkEhYKBmF2YXRhchgIIAEoCVIGYXZhdGFyEhIKBG5hbWUYCSAB'
    'KAlSBG5hbWUSIwoNbXF0dF91c2VybmFtZRgKIAEoCVIMbXF0dFVzZXJuYW1lEiQKDm1xdHRfY2'
    'xpZW50X2lkGAsgASgJUgxtcXR0Q2xpZW50SWQSMAoUbXF0dF9jbGllbnRfcGFzc3dvcmQYDCAB'
    'KAlSEm1xdHRDbGllbnRQYXNzd29yZBIUCgVlbWFpbBgNIAEoCVIFZW1haWwSIAoLcGVybWlzc2'
    'lvbnMYDiADKAlSC3Blcm1pc3Npb25z');

@$core.Deprecated('Use clubWebQrLoginDataDescriptor instead')
const ClubWebQrLoginData$json = {
  '1': 'ClubWebQrLoginData',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'cid', '3': 2, '4': 1, '5': 9, '10': 'cid'},
  ],
};

/// Descriptor for `ClubWebQrLoginData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clubWebQrLoginDataDescriptor = $convert.base64Decode(
    'ChJDbHViV2ViUXJMb2dpbkRhdGESEAoDZGlkGAEgASgJUgNkaWQSEAoDY2lkGAIgASgJUgNjaW'
    'Q=');
