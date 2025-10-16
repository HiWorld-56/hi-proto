// This is a generated file - do not edit.
//
// Generated from v1/club/mqtt.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use packetDescriptor instead')
const Packet$json = {
  '1': 'Packet',
  '2': [
    {
      '1': 'notice',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.club.Notice',
      '9': 0,
      '10': 'notice'
    },
    {
      '1': 'message',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.club.Message',
      '9': 0,
      '10': 'message'
    },
  ],
  '8': [
    {'1': 'kind'},
  ],
};

/// Descriptor for `Packet`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List packetDescriptor = $convert.base64Decode(
    'CgZQYWNrZXQSJgoGbm90aWNlGAEgASgLMgwuY2x1Yi5Ob3RpY2VIAFIGbm90aWNlEikKB21lc3'
    'NhZ2UYAiABKAsyDS5jbHViLk1lc3NhZ2VIAFIHbWVzc2FnZUIGCgRraW5k');

@$core.Deprecated('Use noticeDescriptor instead')
const Notice$json = {
  '1': 'Notice',
  '2': [
    {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    {'1': 'type', '3': 2, '4': 1, '5': 9, '10': 'type'},
    {'1': 'from', '3': 3, '4': 1, '5': 11, '6': '.hi.Unit', '10': 'from'},
    {'1': 'timestamp', '3': 4, '4': 1, '5': 3, '10': 'timestamp'},
    {'1': 'expiration', '3': 5, '4': 1, '5': 3, '10': 'expiration'},
    {'1': 'extra', '3': 6, '4': 1, '5': 11, '6': '.club.Extra', '10': 'extra'},
  ],
};

/// Descriptor for `Notice`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List noticeDescriptor = $convert.base64Decode(
    'CgZOb3RpY2USEgoEdXVpZBgBIAEoCVIEdXVpZBISCgR0eXBlGAIgASgJUgR0eXBlEhwKBGZyb2'
    '0YAyABKAsyCC5oaS5Vbml0UgRmcm9tEhwKCXRpbWVzdGFtcBgEIAEoA1IJdGltZXN0YW1wEh4K'
    'CmV4cGlyYXRpb24YBSABKANSCmV4cGlyYXRpb24SIQoFZXh0cmEYBiABKAsyCy5jbHViLkV4dH'
    'JhUgVleHRyYQ==');

@$core.Deprecated('Use messageDescriptor instead')
const Message$json = {
  '1': 'Message',
  '2': [
    {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    {'1': 'cid', '3': 2, '4': 1, '5': 9, '10': 'cid'},
    {'1': 'type', '3': 3, '4': 1, '5': 9, '10': 'type'},
    {'1': 'from', '3': 4, '4': 1, '5': 11, '6': '.hi.Unit', '10': 'from'},
    {
      '1': 'content',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.club.Content',
      '10': 'content'
    },
    {'1': 'timestamp', '3': 6, '4': 1, '5': 3, '10': 'timestamp'},
    {'1': 'extra', '3': 7, '4': 1, '5': 11, '6': '.club.Extra', '10': 'extra'},
  ],
};

/// Descriptor for `Message`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageDescriptor = $convert.base64Decode(
    'CgdNZXNzYWdlEhIKBHV1aWQYASABKAlSBHV1aWQSEAoDY2lkGAIgASgJUgNjaWQSEgoEdHlwZR'
    'gDIAEoCVIEdHlwZRIcCgRmcm9tGAQgASgLMgguaGkuVW5pdFIEZnJvbRInCgdjb250ZW50GAUg'
    'AygLMg0uY2x1Yi5Db250ZW50Ugdjb250ZW50EhwKCXRpbWVzdGFtcBgGIAEoA1IJdGltZXN0YW'
    '1wEiEKBWV4dHJhGAcgASgLMgsuY2x1Yi5FeHRyYVIFZXh0cmE=');

@$core.Deprecated('Use extraDescriptor instead')
const Extra$json = {
  '1': 'Extra',
  '2': [
    {
      '1': 'unit',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.hi.Unit',
      '9': 0,
      '10': 'unit'
    },
    {
      '1': 'mention',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.club.Mention',
      '9': 0,
      '10': 'mention'
    },
    {
      '1': 'member',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.club.Member',
      '9': 0,
      '10': 'member'
    },
    {
      '1': 'member_exit',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.club.MemberExit',
      '9': 0,
      '10': 'memberExit'
    },
    {
      '1': 'group_info',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.club.GroupInfo',
      '9': 0,
      '10': 'groupInfo'
    },
  ],
  '8': [
    {'1': 'kind'},
  ],
};

/// Descriptor for `Extra`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List extraDescriptor = $convert.base64Decode(
    'CgVFeHRyYRIeCgR1bml0GAEgASgLMgguaGkuVW5pdEgAUgR1bml0EikKB21lbnRpb24YAiABKA'
    'syDS5jbHViLk1lbnRpb25IAFIHbWVudGlvbhImCgZtZW1iZXIYAyABKAsyDC5jbHViLk1lbWJl'
    'ckgAUgZtZW1iZXISMwoLbWVtYmVyX2V4aXQYBCABKAsyEC5jbHViLk1lbWJlckV4aXRIAFIKbW'
    'VtYmVyRXhpdBIwCgpncm91cF9pbmZvGAUgASgLMg8uY2x1Yi5Hcm91cEluZm9IAFIJZ3JvdXBJ'
    'bmZvQgYKBGtpbmQ=');

@$core.Deprecated('Use mentionDescriptor instead')
const Mention$json = {
  '1': 'Mention',
  '2': [
    {'1': 'group', '3': 1, '4': 1, '5': 11, '6': '.hi.Unit', '10': 'group'},
    {'1': 'all', '3': 2, '4': 1, '5': 8, '10': 'all'},
    {'1': 'list', '3': 3, '4': 3, '5': 11, '6': '.hi.Unit', '10': 'list'},
  ],
};

/// Descriptor for `Mention`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mentionDescriptor = $convert.base64Decode(
    'CgdNZW50aW9uEh4KBWdyb3VwGAEgASgLMgguaGkuVW5pdFIFZ3JvdXASEAoDYWxsGAIgASgIUg'
    'NhbGwSHAoEbGlzdBgDIAMoCzIILmhpLlVuaXRSBGxpc3Q=');

@$core.Deprecated('Use memberDescriptor instead')
const Member$json = {
  '1': 'Member',
  '2': [
    {'1': 'group', '3': 1, '4': 1, '5': 11, '6': '.hi.Unit', '10': 'group'},
    {'1': 'user', '3': 2, '4': 1, '5': 11, '6': '.hi.Unit', '10': 'user'},
  ],
};

/// Descriptor for `Member`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List memberDescriptor = $convert.base64Decode(
    'CgZNZW1iZXISHgoFZ3JvdXAYASABKAsyCC5oaS5Vbml0UgVncm91cBIcCgR1c2VyGAIgASgLMg'
    'guaGkuVW5pdFIEdXNlcg==');

@$core.Deprecated('Use memberExitDescriptor instead')
const MemberExit$json = {
  '1': 'MemberExit',
  '2': [
    {
      '1': 'member',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.club.Member',
      '10': 'member'
    },
    {'1': 'type', '3': 2, '4': 1, '5': 9, '10': 'type'},
  ],
};

/// Descriptor for `MemberExit`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List memberExitDescriptor = $convert.base64Decode(
    'CgpNZW1iZXJFeGl0EiQKBm1lbWJlchgBIAEoCzIMLmNsdWIuTWVtYmVyUgZtZW1iZXISEgoEdH'
    'lwZRgCIAEoCVIEdHlwZQ==');

@$core.Deprecated('Use contentDescriptor instead')
const Content$json = {
  '1': 'Content',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 9, '10': 'type'},
    {'1': 'content', '3': 2, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `Content`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contentDescriptor = $convert.base64Decode(
    'CgdDb250ZW50EhIKBHR5cGUYASABKAlSBHR5cGUSGAoHY29udGVudBgCIAEoCVIHY29udGVudA'
    '==');

@$core.Deprecated('Use groupInfoDescriptor instead')
const GroupInfo$json = {
  '1': 'GroupInfo',
  '2': [
    {'1': 'base', '3': 1, '4': 1, '5': 11, '6': '.hi.Unit', '10': 'base'},
    {'1': 'back_ground', '3': 2, '4': 1, '5': 9, '10': 'backGround'},
    {'1': 'mute', '3': 3, '4': 1, '5': 8, '10': 'mute'},
  ],
};

/// Descriptor for `GroupInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List groupInfoDescriptor = $convert.base64Decode(
    'CglHcm91cEluZm8SHAoEYmFzZRgBIAEoCzIILmhpLlVuaXRSBGJhc2USHwoLYmFja19ncm91bm'
    'QYAiABKAlSCmJhY2tHcm91bmQSEgoEbXV0ZRgDIAEoCFIEbXV0ZQ==');
