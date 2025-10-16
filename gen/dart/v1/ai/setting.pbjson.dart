// This is a generated file - do not edit.
//
// Generated from v1/ai/setting.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use settingInfoDescriptor instead')
const SettingInfo$json = {
  '1': 'SettingInfo',
  '2': [
    {'1': 'proxy_url', '3': 1, '4': 1, '5': 9, '10': 'proxyUrl'},
    {'1': 'enable', '3': 2, '4': 1, '5': 9, '10': 'enable'},
    {'1': 'endpoint', '3': 3, '4': 1, '5': 9, '10': 'endpoint'},
  ],
};

/// Descriptor for `SettingInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List settingInfoDescriptor = $convert.base64Decode(
    'CgtTZXR0aW5nSW5mbxIbCglwcm94eV91cmwYASABKAlSCHByb3h5VXJsEhYKBmVuYWJsZRgCIA'
    'EoCVIGZW5hYmxlEhoKCGVuZHBvaW50GAMgASgJUghlbmRwb2ludA==');

@$core.Deprecated('Use editSettingsReqDescriptor instead')
const EditSettingsReq$json = {
  '1': 'EditSettingsReq',
  '2': [
    {
      '1': 'info',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.ai.SettingInfo',
      '10': 'info'
    },
  ],
};

/// Descriptor for `EditSettingsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editSettingsReqDescriptor = $convert.base64Decode(
    'Cg9FZGl0U2V0dGluZ3NSZXESIwoEaW5mbxgBIAEoCzIPLmFpLlNldHRpbmdJbmZvUgRpbmZv');

@$core.Deprecated('Use getSettingsRespDescriptor instead')
const GetSettingsResp$json = {
  '1': 'GetSettingsResp',
  '2': [
    {
      '1': 'info',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.ai.SettingInfo',
      '10': 'info'
    },
  ],
};

/// Descriptor for `GetSettingsResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSettingsRespDescriptor = $convert.base64Decode(
    'Cg9HZXRTZXR0aW5nc1Jlc3ASIwoEaW5mbxgBIAEoCzIPLmFpLlNldHRpbmdJbmZvUgRpbmZv');
