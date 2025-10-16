// This is a generated file - do not edit.
//
// Generated from v1/club/chat_group.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use groupInfoParamDescriptor instead')
const GroupInfoParam$json = {
  '1': 'GroupInfoParam',
  '2': [
    {'1': 'group_code', '3': 1, '4': 1, '5': 9, '10': 'groupCode'},
  ],
};

/// Descriptor for `GroupInfoParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List groupInfoParamDescriptor = $convert.base64Decode(
    'Cg5Hcm91cEluZm9QYXJhbRIdCgpncm91cF9jb2RlGAEgASgJUglncm91cENvZGU=');

@$core.Deprecated('Use groupBaseInfoDescriptor instead')
const GroupBaseInfo$json = {
  '1': 'GroupBaseInfo',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'avatar', '3': 2, '4': 1, '5': 9, '10': 'avatar'},
    {'1': 'code', '3': 3, '4': 1, '5': 9, '10': 'code'},
    {'1': 'type', '3': 4, '4': 1, '5': 9, '10': 'type'},
    {'1': 'background', '3': 5, '4': 1, '5': 9, '10': 'background'},
    {'1': 'display', '3': 6, '4': 1, '5': 5, '10': 'display'},
    {'1': 'speak_status', '3': 7, '4': 1, '5': 5, '10': 'speakStatus'},
    {'1': 'created_at', '3': 8, '4': 1, '5': 3, '10': 'createdAt'},
    {'1': 'updated_at', '3': 9, '4': 1, '5': 3, '10': 'updatedAt'},
  ],
};

/// Descriptor for `GroupBaseInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List groupBaseInfoDescriptor = $convert.base64Decode(
    'Cg1Hcm91cEJhc2VJbmZvEhIKBG5hbWUYASABKAlSBG5hbWUSFgoGYXZhdGFyGAIgASgJUgZhdm'
    'F0YXISEgoEY29kZRgDIAEoCVIEY29kZRISCgR0eXBlGAQgASgJUgR0eXBlEh4KCmJhY2tncm91'
    'bmQYBSABKAlSCmJhY2tncm91bmQSGAoHZGlzcGxheRgGIAEoBVIHZGlzcGxheRIhCgxzcGVha1'
    '9zdGF0dXMYByABKAVSC3NwZWFrU3RhdHVzEh0KCmNyZWF0ZWRfYXQYCCABKANSCWNyZWF0ZWRB'
    'dBIdCgp1cGRhdGVkX2F0GAkgASgDUgl1cGRhdGVkQXQ=');

@$core.Deprecated('Use chatGroupInfoDescriptor instead')
const ChatGroupInfo$json = {
  '1': 'ChatGroupInfo',
  '2': [
    {
      '1': 'base_info',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.club.GroupBaseInfo',
      '10': 'baseInfo'
    },
    {'1': 'user_did', '3': 2, '4': 1, '5': 9, '10': 'userDid'},
    {'1': 'user_type', '3': 3, '4': 1, '5': 9, '10': 'userType'},
    {'1': 'peer_user_did', '3': 4, '4': 1, '5': 9, '10': 'peerUserDid'},
    {'1': 'peer_user_type', '3': 5, '4': 1, '5': 9, '10': 'peerUserType'},
    {'1': 'peer_user_name', '3': 6, '4': 1, '5': 9, '10': 'peerUserName'},
    {'1': 'peer_user_avatar', '3': 7, '4': 1, '5': 9, '10': 'peerUserAvatar'},
    {'1': 'role', '3': 8, '4': 1, '5': 5, '10': 'role'},
    {'1': 'muted', '3': 9, '4': 1, '5': 5, '10': 'muted'},
  ],
};

/// Descriptor for `ChatGroupInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatGroupInfoDescriptor = $convert.base64Decode(
    'Cg1DaGF0R3JvdXBJbmZvEjAKCWJhc2VfaW5mbxgBIAEoCzITLmNsdWIuR3JvdXBCYXNlSW5mb1'
    'IIYmFzZUluZm8SGQoIdXNlcl9kaWQYAiABKAlSB3VzZXJEaWQSGwoJdXNlcl90eXBlGAMgASgJ'
    'Ugh1c2VyVHlwZRIiCg1wZWVyX3VzZXJfZGlkGAQgASgJUgtwZWVyVXNlckRpZBIkCg5wZWVyX3'
    'VzZXJfdHlwZRgFIAEoCVIMcGVlclVzZXJUeXBlEiQKDnBlZXJfdXNlcl9uYW1lGAYgASgJUgxw'
    'ZWVyVXNlck5hbWUSKAoQcGVlcl91c2VyX2F2YXRhchgHIAEoCVIOcGVlclVzZXJBdmF0YXISEg'
    'oEcm9sZRgIIAEoBVIEcm9sZRIUCgVtdXRlZBgJIAEoBVIFbXV0ZWQ=');

@$core.Deprecated('Use createGroupParamDescriptor instead')
const CreateGroupParam$json = {
  '1': 'CreateGroupParam',
  '2': [
    {
      '1': 'group_info',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.club.ChatGroupInfo',
      '10': 'groupInfo'
    },
    {'1': 'user_dids', '3': 2, '4': 3, '5': 9, '10': 'userDids'},
    {'1': 'bot_dids', '3': 3, '4': 3, '5': 9, '10': 'botDids'},
  ],
};

/// Descriptor for `CreateGroupParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createGroupParamDescriptor = $convert.base64Decode(
    'ChBDcmVhdGVHcm91cFBhcmFtEjIKCmdyb3VwX2luZm8YASABKAsyEy5jbHViLkNoYXRHcm91cE'
    'luZm9SCWdyb3VwSW5mbxIbCgl1c2VyX2RpZHMYAiADKAlSCHVzZXJEaWRzEhkKCGJvdF9kaWRz'
    'GAMgAygJUgdib3REaWRz');

@$core.Deprecated('Use createSingleGroupParamDescriptor instead')
const CreateSingleGroupParam$json = {
  '1': 'CreateSingleGroupParam',
  '2': [
    {
      '1': 'group_info',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.club.ChatGroupInfo',
      '10': 'groupInfo'
    },
    {'1': 'peer_user_did', '3': 2, '4': 1, '5': 9, '10': 'peerUserDid'},
    {'1': 'peer_user_type', '3': 3, '4': 1, '5': 9, '10': 'peerUserType'},
  ],
};

/// Descriptor for `CreateSingleGroupParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createSingleGroupParamDescriptor = $convert.base64Decode(
    'ChZDcmVhdGVTaW5nbGVHcm91cFBhcmFtEjIKCmdyb3VwX2luZm8YASABKAsyEy5jbHViLkNoYX'
    'RHcm91cEluZm9SCWdyb3VwSW5mbxIiCg1wZWVyX3VzZXJfZGlkGAIgASgJUgtwZWVyVXNlckRp'
    'ZBIkCg5wZWVyX3VzZXJfdHlwZRgDIAEoCVIMcGVlclVzZXJUeXBl');

@$core.Deprecated('Use updateGroupParamDescriptor instead')
const UpdateGroupParam$json = {
  '1': 'UpdateGroupParam',
  '2': [
    {'1': 'group_code', '3': 1, '4': 1, '5': 9, '10': 'groupCode'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'avatar', '3': 3, '4': 1, '5': 9, '10': 'avatar'},
    {'1': 'background', '3': 4, '4': 1, '5': 9, '10': 'background'},
    {'1': 'clear_background', '3': 5, '4': 1, '5': 8, '10': 'clearBackground'},
    {'1': 'display', '3': 6, '4': 1, '5': 5, '10': 'display'},
    {'1': 'speak_status', '3': 7, '4': 1, '5': 5, '10': 'speakStatus'},
  ],
};

/// Descriptor for `UpdateGroupParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateGroupParamDescriptor = $convert.base64Decode(
    'ChBVcGRhdGVHcm91cFBhcmFtEh0KCmdyb3VwX2NvZGUYASABKAlSCWdyb3VwQ29kZRISCgRuYW'
    '1lGAIgASgJUgRuYW1lEhYKBmF2YXRhchgDIAEoCVIGYXZhdGFyEh4KCmJhY2tncm91bmQYBCAB'
    'KAlSCmJhY2tncm91bmQSKQoQY2xlYXJfYmFja2dyb3VuZBgFIAEoCFIPY2xlYXJCYWNrZ3JvdW'
    '5kEhgKB2Rpc3BsYXkYBiABKAVSB2Rpc3BsYXkSIQoMc3BlYWtfc3RhdHVzGAcgASgFUgtzcGVh'
    'a1N0YXR1cw==');

@$core.Deprecated('Use messageListParamDescriptor instead')
const MessageListParam$json = {
  '1': 'MessageListParam',
  '2': [
    {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    {'1': 'last_time', '3': 2, '4': 1, '5': 3, '10': 'lastTime'},
    {'1': 'group_code', '3': 3, '4': 1, '5': 9, '10': 'groupCode'},
    {'1': 'group_type', '3': 4, '4': 1, '5': 9, '10': 'groupType'},
  ],
};

/// Descriptor for `MessageListParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageListParamDescriptor = $convert.base64Decode(
    'ChBNZXNzYWdlTGlzdFBhcmFtEhIKBHV1aWQYASABKAlSBHV1aWQSGwoJbGFzdF90aW1lGAIgAS'
    'gDUghsYXN0VGltZRIdCgpncm91cF9jb2RlGAMgASgJUglncm91cENvZGUSHQoKZ3JvdXBfdHlw'
    'ZRgEIAEoCVIJZ3JvdXBUeXBl');

@$core.Deprecated('Use groupInfoListDescriptor instead')
const GroupInfoList$json = {
  '1': 'GroupInfoList',
  '2': [
    {
      '1': 'group_info_list',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.club.ChatGroupInfo',
      '10': 'groupInfoList'
    },
  ],
};

/// Descriptor for `GroupInfoList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List groupInfoListDescriptor = $convert.base64Decode(
    'Cg1Hcm91cEluZm9MaXN0EjsKD2dyb3VwX2luZm9fbGlzdBgBIAMoCzITLmNsdWIuQ2hhdEdyb3'
    'VwSW5mb1INZ3JvdXBJbmZvTGlzdA==');

@$core.Deprecated('Use groupMemberParamDescriptor instead')
const GroupMemberParam$json = {
  '1': 'GroupMemberParam',
  '2': [
    {'1': 'group_code', '3': 1, '4': 1, '5': 9, '10': 'groupCode'},
    {
      '1': 'pagination',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.hi.Pagination',
      '10': 'pagination'
    },
  ],
};

/// Descriptor for `GroupMemberParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List groupMemberParamDescriptor = $convert.base64Decode(
    'ChBHcm91cE1lbWJlclBhcmFtEh0KCmdyb3VwX2NvZGUYASABKAlSCWdyb3VwQ29kZRIuCgpwYW'
    'dpbmF0aW9uGAIgASgLMg4uaGkuUGFnaW5hdGlvblIKcGFnaW5hdGlvbg==');

@$core.Deprecated('Use memberTotalParamDescriptor instead')
const MemberTotalParam$json = {
  '1': 'MemberTotalParam',
  '2': [
    {'1': 'group_code', '3': 1, '4': 1, '5': 9, '10': 'groupCode'},
  ],
};

/// Descriptor for `MemberTotalParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List memberTotalParamDescriptor = $convert.base64Decode(
    'ChBNZW1iZXJUb3RhbFBhcmFtEh0KCmdyb3VwX2NvZGUYASABKAlSCWdyb3VwQ29kZQ==');

@$core.Deprecated('Use memberTotalDescriptor instead')
const MemberTotal$json = {
  '1': 'MemberTotal',
  '2': [
    {'1': 'total', '3': 1, '4': 1, '5': 5, '10': 'total'},
  ],
};

/// Descriptor for `MemberTotal`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List memberTotalDescriptor =
    $convert.base64Decode('CgtNZW1iZXJUb3RhbBIUCgV0b3RhbBgBIAEoBVIFdG90YWw=');

@$core.Deprecated('Use groupInviteParamDescriptor instead')
const GroupInviteParam$json = {
  '1': 'GroupInviteParam',
  '2': [
    {'1': 'group_code', '3': 1, '4': 1, '5': 9, '10': 'groupCode'},
    {'1': 'bot_dids', '3': 3, '4': 3, '5': 9, '10': 'botDids'},
    {'1': 'user_dids', '3': 4, '4': 3, '5': 9, '10': 'userDids'},
  ],
};

/// Descriptor for `GroupInviteParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List groupInviteParamDescriptor = $convert.base64Decode(
    'ChBHcm91cEludml0ZVBhcmFtEh0KCmdyb3VwX2NvZGUYASABKAlSCWdyb3VwQ29kZRIZCghib3'
    'RfZGlkcxgDIAMoCVIHYm90RGlkcxIbCgl1c2VyX2RpZHMYBCADKAlSCHVzZXJEaWRz');

@$core.Deprecated('Use groupJoinParamDescriptor instead')
const GroupJoinParam$json = {
  '1': 'GroupJoinParam',
  '2': [
    {'1': 'group_code', '3': 1, '4': 1, '5': 9, '10': 'groupCode'},
  ],
};

/// Descriptor for `GroupJoinParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List groupJoinParamDescriptor = $convert.base64Decode(
    'Cg5Hcm91cEpvaW5QYXJhbRIdCgpncm91cF9jb2RlGAEgASgJUglncm91cENvZGU=');

@$core.Deprecated('Use groupQuitParamDescriptor instead')
const GroupQuitParam$json = {
  '1': 'GroupQuitParam',
  '2': [
    {'1': 'group_code', '3': 1, '4': 1, '5': 9, '10': 'groupCode'},
  ],
};

/// Descriptor for `GroupQuitParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List groupQuitParamDescriptor = $convert.base64Decode(
    'Cg5Hcm91cFF1aXRQYXJhbRIdCgpncm91cF9jb2RlGAEgASgJUglncm91cENvZGU=');

@$core.Deprecated('Use groupRemoveParamDescriptor instead')
const GroupRemoveParam$json = {
  '1': 'GroupRemoveParam',
  '2': [
    {'1': 'group_code', '3': 1, '4': 1, '5': 9, '10': 'groupCode'},
    {'1': 'bot_dids', '3': 3, '4': 3, '5': 9, '10': 'botDids'},
    {'1': 'user_dids', '3': 4, '4': 3, '5': 9, '10': 'userDids'},
  ],
};

/// Descriptor for `GroupRemoveParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List groupRemoveParamDescriptor = $convert.base64Decode(
    'ChBHcm91cFJlbW92ZVBhcmFtEh0KCmdyb3VwX2NvZGUYASABKAlSCWdyb3VwQ29kZRIZCghib3'
    'RfZGlkcxgDIAMoCVIHYm90RGlkcxIbCgl1c2VyX2RpZHMYBCADKAlSCHVzZXJEaWRz');

@$core.Deprecated('Use messageListDescriptor instead')
const MessageList$json = {
  '1': 'MessageList',
  '2': [
    {
      '1': 'message_list',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.club.Packet',
      '10': 'messageList'
    },
  ],
};

/// Descriptor for `MessageList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageListDescriptor = $convert.base64Decode(
    'CgtNZXNzYWdlTGlzdBIvCgxtZXNzYWdlX2xpc3QYASADKAsyDC5jbHViLlBhY2tldFILbWVzc2'
    'FnZUxpc3Q=');

@$core.Deprecated('Use lastUUIDParamDescriptor instead')
const LastUUIDParam$json = {
  '1': 'LastUUIDParam',
  '2': [
    {'1': 'last_uuid', '3': 1, '4': 1, '5': 9, '10': 'lastUuid'},
    {'1': 'group_code', '3': 2, '4': 1, '5': 9, '10': 'groupCode'},
    {'1': 'group_type', '3': 3, '4': 1, '5': 9, '10': 'groupType'},
  ],
};

/// Descriptor for `LastUUIDParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lastUUIDParamDescriptor = $convert.base64Decode(
    'Cg1MYXN0VVVJRFBhcmFtEhsKCWxhc3RfdXVpZBgBIAEoCVIIbGFzdFV1aWQSHQoKZ3JvdXBfY2'
    '9kZRgCIAEoCVIJZ3JvdXBDb2RlEh0KCmdyb3VwX3R5cGUYAyABKAlSCWdyb3VwVHlwZQ==');

@$core.Deprecated('Use lastUUIDListParamDescriptor instead')
const LastUUIDListParam$json = {
  '1': 'LastUUIDListParam',
  '2': [
    {
      '1': 'last_uuid_list',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.club.LastUUIDParam',
      '10': 'lastUuidList'
    },
  ],
};

/// Descriptor for `LastUUIDListParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lastUUIDListParamDescriptor = $convert.base64Decode(
    'ChFMYXN0VVVJRExpc3RQYXJhbRI5Cg5sYXN0X3V1aWRfbGlzdBgBIAMoCzITLmNsdWIuTGFzdF'
    'VVSURQYXJhbVIMbGFzdFV1aWRMaXN0');

@$core.Deprecated('Use setGroupAdminParamDescriptor instead')
const SetGroupAdminParam$json = {
  '1': 'SetGroupAdminParam',
  '2': [
    {'1': 'group_code', '3': 1, '4': 1, '5': 9, '10': 'groupCode'},
    {'1': 'peer_user_dids', '3': 2, '4': 3, '5': 9, '10': 'peerUserDids'},
    {'1': 'role', '3': 3, '4': 1, '5': 5, '10': 'role'},
  ],
};

/// Descriptor for `SetGroupAdminParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setGroupAdminParamDescriptor = $convert.base64Decode(
    'ChJTZXRHcm91cEFkbWluUGFyYW0SHQoKZ3JvdXBfY29kZRgBIAEoCVIJZ3JvdXBDb2RlEiQKDn'
    'BlZXJfdXNlcl9kaWRzGAIgAygJUgxwZWVyVXNlckRpZHMSEgoEcm9sZRgDIAEoBVIEcm9sZQ==');

@$core.Deprecated('Use setUserMutedParamDescriptor instead')
const SetUserMutedParam$json = {
  '1': 'SetUserMutedParam',
  '2': [
    {'1': 'group_code', '3': 1, '4': 1, '5': 9, '10': 'groupCode'},
    {'1': 'muted', '3': 2, '4': 1, '5': 5, '10': 'muted'},
  ],
};

/// Descriptor for `SetUserMutedParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setUserMutedParamDescriptor = $convert.base64Decode(
    'ChFTZXRVc2VyTXV0ZWRQYXJhbRIdCgpncm91cF9jb2RlGAEgASgJUglncm91cENvZGUSFAoFbX'
    'V0ZWQYAiABKAVSBW11dGVk');

@$core.Deprecated('Use groupCodeParamDescriptor instead')
const GroupCodeParam$json = {
  '1': 'GroupCodeParam',
  '2': [
    {'1': 'group_code', '3': 1, '4': 1, '5': 9, '10': 'groupCode'},
  ],
};

/// Descriptor for `GroupCodeParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List groupCodeParamDescriptor = $convert.base64Decode(
    'Cg5Hcm91cENvZGVQYXJhbRIdCgpncm91cF9jb2RlGAEgASgJUglncm91cENvZGU=');

@$core.Deprecated('Use botGroupListParamDescriptor instead')
const BotGroupListParam$json = {
  '1': 'BotGroupListParam',
  '2': [
    {'1': 'bot_did', '3': 1, '4': 1, '5': 9, '10': 'botDid'},
  ],
};

/// Descriptor for `BotGroupListParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botGroupListParamDescriptor = $convert.base64Decode(
    'ChFCb3RHcm91cExpc3RQYXJhbRIXCgdib3RfZGlkGAEgASgJUgZib3REaWQ=');
