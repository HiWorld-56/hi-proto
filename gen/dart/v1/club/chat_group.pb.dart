// This is a generated file - do not edit.
//
// Generated from v1/club/chat_group.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../hi.pb.dart' as $3;
import 'mqtt.pb.dart' as $4;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class GroupInfoParam extends $pb.GeneratedMessage {
  factory GroupInfoParam({
    $core.String? groupCode,
  }) {
    final result = create();
    if (groupCode != null) result.groupCode = groupCode;
    return result;
  }

  GroupInfoParam._();

  factory GroupInfoParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GroupInfoParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GroupInfoParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'groupCode')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupInfoParam clone() => GroupInfoParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupInfoParam copyWith(void Function(GroupInfoParam) updates) =>
      super.copyWith((message) => updates(message as GroupInfoParam))
          as GroupInfoParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GroupInfoParam create() => GroupInfoParam._();
  @$core.override
  GroupInfoParam createEmptyInstance() => create();
  static $pb.PbList<GroupInfoParam> createRepeated() =>
      $pb.PbList<GroupInfoParam>();
  @$core.pragma('dart2js:noInline')
  static GroupInfoParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GroupInfoParam>(create);
  static GroupInfoParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get groupCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set groupCode($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGroupCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupCode() => $_clearField(1);
}

/// 查询群信息的响应结构
class GroupBaseInfo extends $pb.GeneratedMessage {
  factory GroupBaseInfo({
    $core.String? name,
    $core.String? avatar,
    $core.String? code,
    $core.String? type,
    $core.String? background,
    $core.int? display,
    $core.int? speakStatus,
    $fixnum.Int64? createdAt,
    $fixnum.Int64? updatedAt,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (avatar != null) result.avatar = avatar;
    if (code != null) result.code = code;
    if (type != null) result.type = type;
    if (background != null) result.background = background;
    if (display != null) result.display = display;
    if (speakStatus != null) result.speakStatus = speakStatus;
    if (createdAt != null) result.createdAt = createdAt;
    if (updatedAt != null) result.updatedAt = updatedAt;
    return result;
  }

  GroupBaseInfo._();

  factory GroupBaseInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GroupBaseInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GroupBaseInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'avatar')
    ..aOS(3, _omitFieldNames ? '' : 'code')
    ..aOS(4, _omitFieldNames ? '' : 'type')
    ..aOS(5, _omitFieldNames ? '' : 'background')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'display', $pb.PbFieldType.O3)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'speakStatus', $pb.PbFieldType.O3)
    ..aInt64(8, _omitFieldNames ? '' : 'createdAt')
    ..aInt64(9, _omitFieldNames ? '' : 'updatedAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupBaseInfo clone() => GroupBaseInfo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupBaseInfo copyWith(void Function(GroupBaseInfo) updates) =>
      super.copyWith((message) => updates(message as GroupBaseInfo))
          as GroupBaseInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GroupBaseInfo create() => GroupBaseInfo._();
  @$core.override
  GroupBaseInfo createEmptyInstance() => create();
  static $pb.PbList<GroupBaseInfo> createRepeated() =>
      $pb.PbList<GroupBaseInfo>();
  @$core.pragma('dart2js:noInline')
  static GroupBaseInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GroupBaseInfo>(create);
  static GroupBaseInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get avatar => $_getSZ(1);
  @$pb.TagNumber(2)
  set avatar($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAvatar() => $_has(1);
  @$pb.TagNumber(2)
  void clearAvatar() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get code => $_getSZ(2);
  @$pb.TagNumber(3)
  set code($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearCode() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get type => $_getSZ(3);
  @$pb.TagNumber(4)
  set type($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get background => $_getSZ(4);
  @$pb.TagNumber(5)
  set background($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBackground() => $_has(4);
  @$pb.TagNumber(5)
  void clearBackground() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get display => $_getIZ(5);
  @$pb.TagNumber(6)
  set display($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDisplay() => $_has(5);
  @$pb.TagNumber(6)
  void clearDisplay() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get speakStatus => $_getIZ(6);
  @$pb.TagNumber(7)
  set speakStatus($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasSpeakStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearSpeakStatus() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get createdAt => $_getI64(7);
  @$pb.TagNumber(8)
  set createdAt($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasCreatedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearCreatedAt() => $_clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get updatedAt => $_getI64(8);
  @$pb.TagNumber(9)
  set updatedAt($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(9)
  $core.bool hasUpdatedAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearUpdatedAt() => $_clearField(9);
}

class ChatGroupInfo extends $pb.GeneratedMessage {
  factory ChatGroupInfo({
    GroupBaseInfo? baseInfo,
    $core.String? userDid,
    $core.String? userType,
    $core.String? peerUserDid,
    $core.String? peerUserType,
    $core.String? peerUserName,
    $core.String? peerUserAvatar,
    $core.int? role,
    $core.int? muted,
  }) {
    final result = create();
    if (baseInfo != null) result.baseInfo = baseInfo;
    if (userDid != null) result.userDid = userDid;
    if (userType != null) result.userType = userType;
    if (peerUserDid != null) result.peerUserDid = peerUserDid;
    if (peerUserType != null) result.peerUserType = peerUserType;
    if (peerUserName != null) result.peerUserName = peerUserName;
    if (peerUserAvatar != null) result.peerUserAvatar = peerUserAvatar;
    if (role != null) result.role = role;
    if (muted != null) result.muted = muted;
    return result;
  }

  ChatGroupInfo._();

  factory ChatGroupInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatGroupInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatGroupInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOM<GroupBaseInfo>(1, _omitFieldNames ? '' : 'baseInfo',
        subBuilder: GroupBaseInfo.create)
    ..aOS(2, _omitFieldNames ? '' : 'userDid')
    ..aOS(3, _omitFieldNames ? '' : 'userType')
    ..aOS(4, _omitFieldNames ? '' : 'peerUserDid')
    ..aOS(5, _omitFieldNames ? '' : 'peerUserType')
    ..aOS(6, _omitFieldNames ? '' : 'peerUserName')
    ..aOS(7, _omitFieldNames ? '' : 'peerUserAvatar')
    ..a<$core.int>(8, _omitFieldNames ? '' : 'role', $pb.PbFieldType.O3)
    ..a<$core.int>(9, _omitFieldNames ? '' : 'muted', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatGroupInfo clone() => ChatGroupInfo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatGroupInfo copyWith(void Function(ChatGroupInfo) updates) =>
      super.copyWith((message) => updates(message as ChatGroupInfo))
          as ChatGroupInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatGroupInfo create() => ChatGroupInfo._();
  @$core.override
  ChatGroupInfo createEmptyInstance() => create();
  static $pb.PbList<ChatGroupInfo> createRepeated() =>
      $pb.PbList<ChatGroupInfo>();
  @$core.pragma('dart2js:noInline')
  static ChatGroupInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatGroupInfo>(create);
  static ChatGroupInfo? _defaultInstance;

  @$pb.TagNumber(1)
  GroupBaseInfo get baseInfo => $_getN(0);
  @$pb.TagNumber(1)
  set baseInfo(GroupBaseInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasBaseInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearBaseInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  GroupBaseInfo ensureBaseInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get userDid => $_getSZ(1);
  @$pb.TagNumber(2)
  set userDid($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserDid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserDid() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get userType => $_getSZ(2);
  @$pb.TagNumber(3)
  set userType($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUserType() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserType() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get peerUserDid => $_getSZ(3);
  @$pb.TagNumber(4)
  set peerUserDid($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPeerUserDid() => $_has(3);
  @$pb.TagNumber(4)
  void clearPeerUserDid() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get peerUserType => $_getSZ(4);
  @$pb.TagNumber(5)
  set peerUserType($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPeerUserType() => $_has(4);
  @$pb.TagNumber(5)
  void clearPeerUserType() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get peerUserName => $_getSZ(5);
  @$pb.TagNumber(6)
  set peerUserName($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPeerUserName() => $_has(5);
  @$pb.TagNumber(6)
  void clearPeerUserName() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get peerUserAvatar => $_getSZ(6);
  @$pb.TagNumber(7)
  set peerUserAvatar($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasPeerUserAvatar() => $_has(6);
  @$pb.TagNumber(7)
  void clearPeerUserAvatar() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get role => $_getIZ(7);
  @$pb.TagNumber(8)
  set role($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasRole() => $_has(7);
  @$pb.TagNumber(8)
  void clearRole() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get muted => $_getIZ(8);
  @$pb.TagNumber(9)
  set muted($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasMuted() => $_has(8);
  @$pb.TagNumber(9)
  void clearMuted() => $_clearField(9);
}

/// 创建群聊
class CreateGroupParam extends $pb.GeneratedMessage {
  factory CreateGroupParam({
    ChatGroupInfo? groupInfo,
    $core.Iterable<$core.String>? userDids,
    $core.Iterable<$core.String>? botDids,
  }) {
    final result = create();
    if (groupInfo != null) result.groupInfo = groupInfo;
    if (userDids != null) result.userDids.addAll(userDids);
    if (botDids != null) result.botDids.addAll(botDids);
    return result;
  }

  CreateGroupParam._();

  factory CreateGroupParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateGroupParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateGroupParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOM<ChatGroupInfo>(1, _omitFieldNames ? '' : 'groupInfo',
        subBuilder: ChatGroupInfo.create)
    ..pPS(2, _omitFieldNames ? '' : 'userDids')
    ..pPS(3, _omitFieldNames ? '' : 'botDids')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateGroupParam clone() => CreateGroupParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateGroupParam copyWith(void Function(CreateGroupParam) updates) =>
      super.copyWith((message) => updates(message as CreateGroupParam))
          as CreateGroupParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateGroupParam create() => CreateGroupParam._();
  @$core.override
  CreateGroupParam createEmptyInstance() => create();
  static $pb.PbList<CreateGroupParam> createRepeated() =>
      $pb.PbList<CreateGroupParam>();
  @$core.pragma('dart2js:noInline')
  static CreateGroupParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateGroupParam>(create);
  static CreateGroupParam? _defaultInstance;

  @$pb.TagNumber(1)
  ChatGroupInfo get groupInfo => $_getN(0);
  @$pb.TagNumber(1)
  set groupInfo(ChatGroupInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasGroupInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  ChatGroupInfo ensureGroupInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get userDids => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get botDids => $_getList(2);
}

/// 创建单聊
class CreateSingleGroupParam extends $pb.GeneratedMessage {
  factory CreateSingleGroupParam({
    ChatGroupInfo? groupInfo,
    $core.String? peerUserDid,
    $core.String? peerUserType,
  }) {
    final result = create();
    if (groupInfo != null) result.groupInfo = groupInfo;
    if (peerUserDid != null) result.peerUserDid = peerUserDid;
    if (peerUserType != null) result.peerUserType = peerUserType;
    return result;
  }

  CreateSingleGroupParam._();

  factory CreateSingleGroupParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateSingleGroupParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateSingleGroupParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOM<ChatGroupInfo>(1, _omitFieldNames ? '' : 'groupInfo',
        subBuilder: ChatGroupInfo.create)
    ..aOS(2, _omitFieldNames ? '' : 'peerUserDid')
    ..aOS(3, _omitFieldNames ? '' : 'peerUserType')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSingleGroupParam clone() =>
      CreateSingleGroupParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSingleGroupParam copyWith(
          void Function(CreateSingleGroupParam) updates) =>
      super.copyWith((message) => updates(message as CreateSingleGroupParam))
          as CreateSingleGroupParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSingleGroupParam create() => CreateSingleGroupParam._();
  @$core.override
  CreateSingleGroupParam createEmptyInstance() => create();
  static $pb.PbList<CreateSingleGroupParam> createRepeated() =>
      $pb.PbList<CreateSingleGroupParam>();
  @$core.pragma('dart2js:noInline')
  static CreateSingleGroupParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateSingleGroupParam>(create);
  static CreateSingleGroupParam? _defaultInstance;

  @$pb.TagNumber(1)
  ChatGroupInfo get groupInfo => $_getN(0);
  @$pb.TagNumber(1)
  set groupInfo(ChatGroupInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasGroupInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  ChatGroupInfo ensureGroupInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get peerUserDid => $_getSZ(1);
  @$pb.TagNumber(2)
  set peerUserDid($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPeerUserDid() => $_has(1);
  @$pb.TagNumber(2)
  void clearPeerUserDid() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get peerUserType => $_getSZ(2);
  @$pb.TagNumber(3)
  set peerUserType($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPeerUserType() => $_has(2);
  @$pb.TagNumber(3)
  void clearPeerUserType() => $_clearField(3);
}

/// 更新群信息
class UpdateGroupParam extends $pb.GeneratedMessage {
  factory UpdateGroupParam({
    $core.String? groupCode,
    $core.String? name,
    $core.String? avatar,
    $core.String? background,
    $core.bool? clearBackground_5,
    $core.int? display,
    $core.int? speakStatus,
  }) {
    final result = create();
    if (groupCode != null) result.groupCode = groupCode;
    if (name != null) result.name = name;
    if (avatar != null) result.avatar = avatar;
    if (background != null) result.background = background;
    if (clearBackground_5 != null) result.clearBackground_5 = clearBackground_5;
    if (display != null) result.display = display;
    if (speakStatus != null) result.speakStatus = speakStatus;
    return result;
  }

  UpdateGroupParam._();

  factory UpdateGroupParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateGroupParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateGroupParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'groupCode')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'avatar')
    ..aOS(4, _omitFieldNames ? '' : 'background')
    ..aOB(5, _omitFieldNames ? '' : 'clearBackground')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'display', $pb.PbFieldType.O3)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'speakStatus', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateGroupParam clone() => UpdateGroupParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateGroupParam copyWith(void Function(UpdateGroupParam) updates) =>
      super.copyWith((message) => updates(message as UpdateGroupParam))
          as UpdateGroupParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateGroupParam create() => UpdateGroupParam._();
  @$core.override
  UpdateGroupParam createEmptyInstance() => create();
  static $pb.PbList<UpdateGroupParam> createRepeated() =>
      $pb.PbList<UpdateGroupParam>();
  @$core.pragma('dart2js:noInline')
  static UpdateGroupParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateGroupParam>(create);
  static UpdateGroupParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get groupCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set groupCode($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGroupCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get avatar => $_getSZ(2);
  @$pb.TagNumber(3)
  set avatar($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAvatar() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvatar() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get background => $_getSZ(3);
  @$pb.TagNumber(4)
  set background($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBackground() => $_has(3);
  @$pb.TagNumber(4)
  void clearBackground() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get clearBackground_5 => $_getBF(4);
  @$pb.TagNumber(5)
  set clearBackground_5($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasClearBackground_5() => $_has(4);
  @$pb.TagNumber(5)
  void clearClearBackground_5() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get display => $_getIZ(5);
  @$pb.TagNumber(6)
  set display($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDisplay() => $_has(5);
  @$pb.TagNumber(6)
  void clearDisplay() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get speakStatus => $_getIZ(6);
  @$pb.TagNumber(7)
  set speakStatus($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasSpeakStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearSpeakStatus() => $_clearField(7);
}

/// 组聊天消息列表参数
class MessageListParam extends $pb.GeneratedMessage {
  factory MessageListParam({
    $core.String? uuid,
    $fixnum.Int64? lastTime,
    $core.String? groupCode,
    $core.String? groupType,
  }) {
    final result = create();
    if (uuid != null) result.uuid = uuid;
    if (lastTime != null) result.lastTime = lastTime;
    if (groupCode != null) result.groupCode = groupCode;
    if (groupType != null) result.groupType = groupType;
    return result;
  }

  MessageListParam._();

  factory MessageListParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MessageListParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MessageListParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..aInt64(2, _omitFieldNames ? '' : 'lastTime')
    ..aOS(3, _omitFieldNames ? '' : 'groupCode')
    ..aOS(4, _omitFieldNames ? '' : 'groupType')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageListParam clone() => MessageListParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageListParam copyWith(void Function(MessageListParam) updates) =>
      super.copyWith((message) => updates(message as MessageListParam))
          as MessageListParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MessageListParam create() => MessageListParam._();
  @$core.override
  MessageListParam createEmptyInstance() => create();
  static $pb.PbList<MessageListParam> createRepeated() =>
      $pb.PbList<MessageListParam>();
  @$core.pragma('dart2js:noInline')
  static MessageListParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MessageListParam>(create);
  static MessageListParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get lastTime => $_getI64(1);
  @$pb.TagNumber(2)
  set lastTime($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLastTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastTime() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get groupCode => $_getSZ(2);
  @$pb.TagNumber(3)
  set groupCode($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGroupCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearGroupCode() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get groupType => $_getSZ(3);
  @$pb.TagNumber(4)
  set groupType($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGroupType() => $_has(3);
  @$pb.TagNumber(4)
  void clearGroupType() => $_clearField(4);
}

class GroupInfoList extends $pb.GeneratedMessage {
  factory GroupInfoList({
    $core.Iterable<ChatGroupInfo>? groupInfoList,
  }) {
    final result = create();
    if (groupInfoList != null) result.groupInfoList.addAll(groupInfoList);
    return result;
  }

  GroupInfoList._();

  factory GroupInfoList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GroupInfoList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GroupInfoList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..pc<ChatGroupInfo>(
        1, _omitFieldNames ? '' : 'groupInfoList', $pb.PbFieldType.PM,
        subBuilder: ChatGroupInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupInfoList clone() => GroupInfoList()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupInfoList copyWith(void Function(GroupInfoList) updates) =>
      super.copyWith((message) => updates(message as GroupInfoList))
          as GroupInfoList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GroupInfoList create() => GroupInfoList._();
  @$core.override
  GroupInfoList createEmptyInstance() => create();
  static $pb.PbList<GroupInfoList> createRepeated() =>
      $pb.PbList<GroupInfoList>();
  @$core.pragma('dart2js:noInline')
  static GroupInfoList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GroupInfoList>(create);
  static GroupInfoList? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ChatGroupInfo> get groupInfoList => $_getList(0);
}

class GroupMemberParam extends $pb.GeneratedMessage {
  factory GroupMemberParam({
    $core.String? groupCode,
    $3.Pagination? pagination,
  }) {
    final result = create();
    if (groupCode != null) result.groupCode = groupCode;
    if (pagination != null) result.pagination = pagination;
    return result;
  }

  GroupMemberParam._();

  factory GroupMemberParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GroupMemberParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GroupMemberParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'groupCode')
    ..aOM<$3.Pagination>(2, _omitFieldNames ? '' : 'pagination',
        subBuilder: $3.Pagination.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupMemberParam clone() => GroupMemberParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupMemberParam copyWith(void Function(GroupMemberParam) updates) =>
      super.copyWith((message) => updates(message as GroupMemberParam))
          as GroupMemberParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GroupMemberParam create() => GroupMemberParam._();
  @$core.override
  GroupMemberParam createEmptyInstance() => create();
  static $pb.PbList<GroupMemberParam> createRepeated() =>
      $pb.PbList<GroupMemberParam>();
  @$core.pragma('dart2js:noInline')
  static GroupMemberParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GroupMemberParam>(create);
  static GroupMemberParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get groupCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set groupCode($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGroupCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $3.Pagination get pagination => $_getN(1);
  @$pb.TagNumber(2)
  set pagination($3.Pagination value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(2)
  void clearPagination() => $_clearField(2);
  @$pb.TagNumber(2)
  $3.Pagination ensurePagination() => $_ensure(1);
}

class MemberTotalParam extends $pb.GeneratedMessage {
  factory MemberTotalParam({
    $core.String? groupCode,
  }) {
    final result = create();
    if (groupCode != null) result.groupCode = groupCode;
    return result;
  }

  MemberTotalParam._();

  factory MemberTotalParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MemberTotalParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MemberTotalParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'groupCode')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MemberTotalParam clone() => MemberTotalParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MemberTotalParam copyWith(void Function(MemberTotalParam) updates) =>
      super.copyWith((message) => updates(message as MemberTotalParam))
          as MemberTotalParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MemberTotalParam create() => MemberTotalParam._();
  @$core.override
  MemberTotalParam createEmptyInstance() => create();
  static $pb.PbList<MemberTotalParam> createRepeated() =>
      $pb.PbList<MemberTotalParam>();
  @$core.pragma('dart2js:noInline')
  static MemberTotalParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MemberTotalParam>(create);
  static MemberTotalParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get groupCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set groupCode($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGroupCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupCode() => $_clearField(1);
}

class MemberTotal extends $pb.GeneratedMessage {
  factory MemberTotal({
    $core.int? total,
  }) {
    final result = create();
    if (total != null) result.total = total;
    return result;
  }

  MemberTotal._();

  factory MemberTotal.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MemberTotal.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MemberTotal',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'total', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MemberTotal clone() => MemberTotal()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MemberTotal copyWith(void Function(MemberTotal) updates) =>
      super.copyWith((message) => updates(message as MemberTotal))
          as MemberTotal;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MemberTotal create() => MemberTotal._();
  @$core.override
  MemberTotal createEmptyInstance() => create();
  static $pb.PbList<MemberTotal> createRepeated() => $pb.PbList<MemberTotal>();
  @$core.pragma('dart2js:noInline')
  static MemberTotal getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MemberTotal>(create);
  static MemberTotal? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get total => $_getIZ(0);
  @$pb.TagNumber(1)
  set total($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotal() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotal() => $_clearField(1);
}

class GroupInviteParam extends $pb.GeneratedMessage {
  factory GroupInviteParam({
    $core.String? groupCode,
    $core.Iterable<$core.String>? botDids,
    $core.Iterable<$core.String>? userDids,
  }) {
    final result = create();
    if (groupCode != null) result.groupCode = groupCode;
    if (botDids != null) result.botDids.addAll(botDids);
    if (userDids != null) result.userDids.addAll(userDids);
    return result;
  }

  GroupInviteParam._();

  factory GroupInviteParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GroupInviteParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GroupInviteParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'groupCode')
    ..pPS(3, _omitFieldNames ? '' : 'botDids')
    ..pPS(4, _omitFieldNames ? '' : 'userDids')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupInviteParam clone() => GroupInviteParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupInviteParam copyWith(void Function(GroupInviteParam) updates) =>
      super.copyWith((message) => updates(message as GroupInviteParam))
          as GroupInviteParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GroupInviteParam create() => GroupInviteParam._();
  @$core.override
  GroupInviteParam createEmptyInstance() => create();
  static $pb.PbList<GroupInviteParam> createRepeated() =>
      $pb.PbList<GroupInviteParam>();
  @$core.pragma('dart2js:noInline')
  static GroupInviteParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GroupInviteParam>(create);
  static GroupInviteParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get groupCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set groupCode($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGroupCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupCode() => $_clearField(1);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get botDids => $_getList(1);

  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get userDids => $_getList(2);
}

class GroupJoinParam extends $pb.GeneratedMessage {
  factory GroupJoinParam({
    $core.String? groupCode,
  }) {
    final result = create();
    if (groupCode != null) result.groupCode = groupCode;
    return result;
  }

  GroupJoinParam._();

  factory GroupJoinParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GroupJoinParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GroupJoinParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'groupCode')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupJoinParam clone() => GroupJoinParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupJoinParam copyWith(void Function(GroupJoinParam) updates) =>
      super.copyWith((message) => updates(message as GroupJoinParam))
          as GroupJoinParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GroupJoinParam create() => GroupJoinParam._();
  @$core.override
  GroupJoinParam createEmptyInstance() => create();
  static $pb.PbList<GroupJoinParam> createRepeated() =>
      $pb.PbList<GroupJoinParam>();
  @$core.pragma('dart2js:noInline')
  static GroupJoinParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GroupJoinParam>(create);
  static GroupJoinParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get groupCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set groupCode($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGroupCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupCode() => $_clearField(1);
}

class GroupQuitParam extends $pb.GeneratedMessage {
  factory GroupQuitParam({
    $core.String? groupCode,
  }) {
    final result = create();
    if (groupCode != null) result.groupCode = groupCode;
    return result;
  }

  GroupQuitParam._();

  factory GroupQuitParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GroupQuitParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GroupQuitParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'groupCode')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupQuitParam clone() => GroupQuitParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupQuitParam copyWith(void Function(GroupQuitParam) updates) =>
      super.copyWith((message) => updates(message as GroupQuitParam))
          as GroupQuitParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GroupQuitParam create() => GroupQuitParam._();
  @$core.override
  GroupQuitParam createEmptyInstance() => create();
  static $pb.PbList<GroupQuitParam> createRepeated() =>
      $pb.PbList<GroupQuitParam>();
  @$core.pragma('dart2js:noInline')
  static GroupQuitParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GroupQuitParam>(create);
  static GroupQuitParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get groupCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set groupCode($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGroupCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupCode() => $_clearField(1);
}

class GroupRemoveParam extends $pb.GeneratedMessage {
  factory GroupRemoveParam({
    $core.String? groupCode,
    $core.Iterable<$core.String>? botDids,
    $core.Iterable<$core.String>? userDids,
  }) {
    final result = create();
    if (groupCode != null) result.groupCode = groupCode;
    if (botDids != null) result.botDids.addAll(botDids);
    if (userDids != null) result.userDids.addAll(userDids);
    return result;
  }

  GroupRemoveParam._();

  factory GroupRemoveParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GroupRemoveParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GroupRemoveParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'groupCode')
    ..pPS(3, _omitFieldNames ? '' : 'botDids')
    ..pPS(4, _omitFieldNames ? '' : 'userDids')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupRemoveParam clone() => GroupRemoveParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupRemoveParam copyWith(void Function(GroupRemoveParam) updates) =>
      super.copyWith((message) => updates(message as GroupRemoveParam))
          as GroupRemoveParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GroupRemoveParam create() => GroupRemoveParam._();
  @$core.override
  GroupRemoveParam createEmptyInstance() => create();
  static $pb.PbList<GroupRemoveParam> createRepeated() =>
      $pb.PbList<GroupRemoveParam>();
  @$core.pragma('dart2js:noInline')
  static GroupRemoveParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GroupRemoveParam>(create);
  static GroupRemoveParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get groupCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set groupCode($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGroupCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupCode() => $_clearField(1);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get botDids => $_getList(1);

  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get userDids => $_getList(2);
}

class MessageList extends $pb.GeneratedMessage {
  factory MessageList({
    $core.Iterable<$4.Packet>? messageList,
  }) {
    final result = create();
    if (messageList != null) result.messageList.addAll(messageList);
    return result;
  }

  MessageList._();

  factory MessageList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MessageList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MessageList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..pc<$4.Packet>(1, _omitFieldNames ? '' : 'messageList', $pb.PbFieldType.PM,
        subBuilder: $4.Packet.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageList clone() => MessageList()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageList copyWith(void Function(MessageList) updates) =>
      super.copyWith((message) => updates(message as MessageList))
          as MessageList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MessageList create() => MessageList._();
  @$core.override
  MessageList createEmptyInstance() => create();
  static $pb.PbList<MessageList> createRepeated() => $pb.PbList<MessageList>();
  @$core.pragma('dart2js:noInline')
  static MessageList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MessageList>(create);
  static MessageList? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$4.Packet> get messageList => $_getList(0);
}

class LastUUIDParam extends $pb.GeneratedMessage {
  factory LastUUIDParam({
    $core.String? lastUuid,
    $core.String? groupCode,
    $core.String? groupType,
  }) {
    final result = create();
    if (lastUuid != null) result.lastUuid = lastUuid;
    if (groupCode != null) result.groupCode = groupCode;
    if (groupType != null) result.groupType = groupType;
    return result;
  }

  LastUUIDParam._();

  factory LastUUIDParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LastUUIDParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LastUUIDParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'lastUuid')
    ..aOS(2, _omitFieldNames ? '' : 'groupCode')
    ..aOS(3, _omitFieldNames ? '' : 'groupType')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LastUUIDParam clone() => LastUUIDParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LastUUIDParam copyWith(void Function(LastUUIDParam) updates) =>
      super.copyWith((message) => updates(message as LastUUIDParam))
          as LastUUIDParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LastUUIDParam create() => LastUUIDParam._();
  @$core.override
  LastUUIDParam createEmptyInstance() => create();
  static $pb.PbList<LastUUIDParam> createRepeated() =>
      $pb.PbList<LastUUIDParam>();
  @$core.pragma('dart2js:noInline')
  static LastUUIDParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LastUUIDParam>(create);
  static LastUUIDParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get lastUuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set lastUuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLastUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearLastUuid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get groupCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set groupCode($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGroupCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupCode() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get groupType => $_getSZ(2);
  @$pb.TagNumber(3)
  set groupType($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGroupType() => $_has(2);
  @$pb.TagNumber(3)
  void clearGroupType() => $_clearField(3);
}

class LastUUIDListParam extends $pb.GeneratedMessage {
  factory LastUUIDListParam({
    $core.Iterable<LastUUIDParam>? lastUuidList,
  }) {
    final result = create();
    if (lastUuidList != null) result.lastUuidList.addAll(lastUuidList);
    return result;
  }

  LastUUIDListParam._();

  factory LastUUIDListParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LastUUIDListParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LastUUIDListParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..pc<LastUUIDParam>(
        1, _omitFieldNames ? '' : 'lastUuidList', $pb.PbFieldType.PM,
        subBuilder: LastUUIDParam.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LastUUIDListParam clone() => LastUUIDListParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LastUUIDListParam copyWith(void Function(LastUUIDListParam) updates) =>
      super.copyWith((message) => updates(message as LastUUIDListParam))
          as LastUUIDListParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LastUUIDListParam create() => LastUUIDListParam._();
  @$core.override
  LastUUIDListParam createEmptyInstance() => create();
  static $pb.PbList<LastUUIDListParam> createRepeated() =>
      $pb.PbList<LastUUIDListParam>();
  @$core.pragma('dart2js:noInline')
  static LastUUIDListParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LastUUIDListParam>(create);
  static LastUUIDListParam? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<LastUUIDParam> get lastUuidList => $_getList(0);
}

class SetGroupAdminParam extends $pb.GeneratedMessage {
  factory SetGroupAdminParam({
    $core.String? groupCode,
    $core.Iterable<$core.String>? peerUserDids,
    $core.int? role,
  }) {
    final result = create();
    if (groupCode != null) result.groupCode = groupCode;
    if (peerUserDids != null) result.peerUserDids.addAll(peerUserDids);
    if (role != null) result.role = role;
    return result;
  }

  SetGroupAdminParam._();

  factory SetGroupAdminParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetGroupAdminParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetGroupAdminParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'groupCode')
    ..pPS(2, _omitFieldNames ? '' : 'peerUserDids')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'role', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetGroupAdminParam clone() => SetGroupAdminParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetGroupAdminParam copyWith(void Function(SetGroupAdminParam) updates) =>
      super.copyWith((message) => updates(message as SetGroupAdminParam))
          as SetGroupAdminParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetGroupAdminParam create() => SetGroupAdminParam._();
  @$core.override
  SetGroupAdminParam createEmptyInstance() => create();
  static $pb.PbList<SetGroupAdminParam> createRepeated() =>
      $pb.PbList<SetGroupAdminParam>();
  @$core.pragma('dart2js:noInline')
  static SetGroupAdminParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetGroupAdminParam>(create);
  static SetGroupAdminParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get groupCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set groupCode($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGroupCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get peerUserDids => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get role => $_getIZ(2);
  @$pb.TagNumber(3)
  set role($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRole() => $_has(2);
  @$pb.TagNumber(3)
  void clearRole() => $_clearField(3);
}

class SetUserMutedParam extends $pb.GeneratedMessage {
  factory SetUserMutedParam({
    $core.String? groupCode,
    $core.int? muted,
  }) {
    final result = create();
    if (groupCode != null) result.groupCode = groupCode;
    if (muted != null) result.muted = muted;
    return result;
  }

  SetUserMutedParam._();

  factory SetUserMutedParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetUserMutedParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetUserMutedParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'groupCode')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'muted', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetUserMutedParam clone() => SetUserMutedParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetUserMutedParam copyWith(void Function(SetUserMutedParam) updates) =>
      super.copyWith((message) => updates(message as SetUserMutedParam))
          as SetUserMutedParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetUserMutedParam create() => SetUserMutedParam._();
  @$core.override
  SetUserMutedParam createEmptyInstance() => create();
  static $pb.PbList<SetUserMutedParam> createRepeated() =>
      $pb.PbList<SetUserMutedParam>();
  @$core.pragma('dart2js:noInline')
  static SetUserMutedParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetUserMutedParam>(create);
  static SetUserMutedParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get groupCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set groupCode($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGroupCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get muted => $_getIZ(1);
  @$pb.TagNumber(2)
  set muted($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMuted() => $_has(1);
  @$pb.TagNumber(2)
  void clearMuted() => $_clearField(2);
}

class GroupCodeParam extends $pb.GeneratedMessage {
  factory GroupCodeParam({
    $core.String? groupCode,
  }) {
    final result = create();
    if (groupCode != null) result.groupCode = groupCode;
    return result;
  }

  GroupCodeParam._();

  factory GroupCodeParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GroupCodeParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GroupCodeParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'groupCode')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupCodeParam clone() => GroupCodeParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupCodeParam copyWith(void Function(GroupCodeParam) updates) =>
      super.copyWith((message) => updates(message as GroupCodeParam))
          as GroupCodeParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GroupCodeParam create() => GroupCodeParam._();
  @$core.override
  GroupCodeParam createEmptyInstance() => create();
  static $pb.PbList<GroupCodeParam> createRepeated() =>
      $pb.PbList<GroupCodeParam>();
  @$core.pragma('dart2js:noInline')
  static GroupCodeParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GroupCodeParam>(create);
  static GroupCodeParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get groupCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set groupCode($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGroupCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupCode() => $_clearField(1);
}

class BotGroupListParam extends $pb.GeneratedMessage {
  factory BotGroupListParam({
    $core.String? botDid,
  }) {
    final result = create();
    if (botDid != null) result.botDid = botDid;
    return result;
  }

  BotGroupListParam._();

  factory BotGroupListParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BotGroupListParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BotGroupListParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'botDid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotGroupListParam clone() => BotGroupListParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotGroupListParam copyWith(void Function(BotGroupListParam) updates) =>
      super.copyWith((message) => updates(message as BotGroupListParam))
          as BotGroupListParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BotGroupListParam create() => BotGroupListParam._();
  @$core.override
  BotGroupListParam createEmptyInstance() => create();
  static $pb.PbList<BotGroupListParam> createRepeated() =>
      $pb.PbList<BotGroupListParam>();
  @$core.pragma('dart2js:noInline')
  static BotGroupListParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BotGroupListParam>(create);
  static BotGroupListParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get botDid => $_getSZ(0);
  @$pb.TagNumber(1)
  set botDid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBotDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearBotDid() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
