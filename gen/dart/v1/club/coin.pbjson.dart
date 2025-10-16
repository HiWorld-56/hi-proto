// This is a generated file - do not edit.
//
// Generated from v1/club/coin.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use iconInfoDescriptor instead')
const IconInfo$json = {
  '1': 'IconInfo',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'icon', '3': 2, '4': 1, '5': 9, '10': 'icon'},
  ],
};

/// Descriptor for `IconInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List iconInfoDescriptor = $convert.base64Decode(
    'CghJY29uSW5mbxISCgRuYW1lGAEgASgJUgRuYW1lEhIKBGljb24YAiABKAlSBGljb24=');

@$core.Deprecated('Use iconListDescriptor instead')
const IconList$json = {
  '1': 'IconList',
  '2': [
    {
      '1': 'icon_list',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.club.IconInfo',
      '10': 'iconList'
    },
  ],
};

/// Descriptor for `IconList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List iconListDescriptor = $convert.base64Decode(
    'CghJY29uTGlzdBIrCglpY29uX2xpc3QYASADKAsyDi5jbHViLkljb25JbmZvUghpY29uTGlzdA'
    '==');
