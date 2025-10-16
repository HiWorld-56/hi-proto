// This is a generated file - do not edit.
//
// Generated from v1/club/chat_user.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/any.pb.dart' as $3;
import '../hi.pb.dart' as $2;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class ChatUserBaseInfo extends $pb.GeneratedMessage {
  factory ChatUserBaseInfo({
    $core.String? did,
    $core.String? name,
    $core.String? type,
    $core.String? avatar,
    $core.String? background,
    $core.String? mqttUsername,
    $core.String? email,
  }) {
    final result = create();
    if (did != null) result.did = did;
    if (name != null) result.name = name;
    if (type != null) result.type = type;
    if (avatar != null) result.avatar = avatar;
    if (background != null) result.background = background;
    if (mqttUsername != null) result.mqttUsername = mqttUsername;
    if (email != null) result.email = email;
    return result;
  }

  ChatUserBaseInfo._();

  factory ChatUserBaseInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatUserBaseInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatUserBaseInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'type')
    ..aOS(4, _omitFieldNames ? '' : 'avatar')
    ..aOS(5, _omitFieldNames ? '' : 'background')
    ..aOS(6, _omitFieldNames ? '' : 'mqttUsername')
    ..aOS(7, _omitFieldNames ? '' : 'email')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatUserBaseInfo clone() => ChatUserBaseInfo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatUserBaseInfo copyWith(void Function(ChatUserBaseInfo) updates) =>
      super.copyWith((message) => updates(message as ChatUserBaseInfo))
          as ChatUserBaseInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatUserBaseInfo create() => ChatUserBaseInfo._();
  @$core.override
  ChatUserBaseInfo createEmptyInstance() => create();
  static $pb.PbList<ChatUserBaseInfo> createRepeated() =>
      $pb.PbList<ChatUserBaseInfo>();
  @$core.pragma('dart2js:noInline')
  static ChatUserBaseInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatUserBaseInfo>(create);
  static ChatUserBaseInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get did => $_getSZ(0);
  @$pb.TagNumber(1)
  set did($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get type => $_getSZ(2);
  @$pb.TagNumber(3)
  set type($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get avatar => $_getSZ(3);
  @$pb.TagNumber(4)
  set avatar($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAvatar() => $_has(3);
  @$pb.TagNumber(4)
  void clearAvatar() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get background => $_getSZ(4);
  @$pb.TagNumber(5)
  set background($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBackground() => $_has(4);
  @$pb.TagNumber(5)
  void clearBackground() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get mqttUsername => $_getSZ(5);
  @$pb.TagNumber(6)
  set mqttUsername($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasMqttUsername() => $_has(5);
  @$pb.TagNumber(6)
  void clearMqttUsername() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get email => $_getSZ(6);
  @$pb.TagNumber(7)
  set email($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasEmail() => $_has(6);
  @$pb.TagNumber(7)
  void clearEmail() => $_clearField(7);
}

class UserInfoParam extends $pb.GeneratedMessage {
  factory UserInfoParam({
    $core.String? did,
  }) {
    final result = create();
    if (did != null) result.did = did;
    return result;
  }

  UserInfoParam._();

  factory UserInfoParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserInfoParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserInfoParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserInfoParam clone() => UserInfoParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserInfoParam copyWith(void Function(UserInfoParam) updates) =>
      super.copyWith((message) => updates(message as UserInfoParam))
          as UserInfoParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserInfoParam create() => UserInfoParam._();
  @$core.override
  UserInfoParam createEmptyInstance() => create();
  static $pb.PbList<UserInfoParam> createRepeated() =>
      $pb.PbList<UserInfoParam>();
  @$core.pragma('dart2js:noInline')
  static UserInfoParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserInfoParam>(create);
  static UserInfoParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get did => $_getSZ(0);
  @$pb.TagNumber(1)
  set did($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearDid() => $_clearField(1);
}

class ChatUserInfo extends $pb.GeneratedMessage {
  factory ChatUserInfo({
    ChatUserBaseInfo? baseInfo,
    $core.int? role,
    $core.Iterable<$core.String>? permissions,
    $3.Any? attributes,
  }) {
    final result = create();
    if (baseInfo != null) result.baseInfo = baseInfo;
    if (role != null) result.role = role;
    if (permissions != null) result.permissions.addAll(permissions);
    if (attributes != null) result.attributes = attributes;
    return result;
  }

  ChatUserInfo._();

  factory ChatUserInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatUserInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatUserInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOM<ChatUserBaseInfo>(1, _omitFieldNames ? '' : 'baseInfo',
        subBuilder: ChatUserBaseInfo.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'role', $pb.PbFieldType.O3)
    ..pPS(3, _omitFieldNames ? '' : 'permissions')
    ..aOM<$3.Any>(4, _omitFieldNames ? '' : 'attributes',
        subBuilder: $3.Any.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatUserInfo clone() => ChatUserInfo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatUserInfo copyWith(void Function(ChatUserInfo) updates) =>
      super.copyWith((message) => updates(message as ChatUserInfo))
          as ChatUserInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatUserInfo create() => ChatUserInfo._();
  @$core.override
  ChatUserInfo createEmptyInstance() => create();
  static $pb.PbList<ChatUserInfo> createRepeated() =>
      $pb.PbList<ChatUserInfo>();
  @$core.pragma('dart2js:noInline')
  static ChatUserInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatUserInfo>(create);
  static ChatUserInfo? _defaultInstance;

  @$pb.TagNumber(1)
  ChatUserBaseInfo get baseInfo => $_getN(0);
  @$pb.TagNumber(1)
  set baseInfo(ChatUserBaseInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasBaseInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearBaseInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  ChatUserBaseInfo ensureBaseInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get role => $_getIZ(1);
  @$pb.TagNumber(2)
  set role($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRole() => $_has(1);
  @$pb.TagNumber(2)
  void clearRole() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get permissions => $_getList(2);

  @$pb.TagNumber(4)
  $3.Any get attributes => $_getN(3);
  @$pb.TagNumber(4)
  set attributes($3.Any value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasAttributes() => $_has(3);
  @$pb.TagNumber(4)
  void clearAttributes() => $_clearField(4);
  @$pb.TagNumber(4)
  $3.Any ensureAttributes() => $_ensure(3);
}

class ChatBotAttribute extends $pb.GeneratedMessage {
  factory ChatBotAttribute({
    $core.String? creatorDid,
    $core.int? qaNum,
    $core.String? systemPrompt,
    $core.String? userPrompt,
    $core.double? freedom,
    $core.String? gptModel,
    $core.String? embeddingModel,
    $core.String? createdAt,
    $core.int? messageCount,
    $core.int? followCount,
    $core.String? memModel,
    $core.String? useMem,
    $core.String? useAbout,
    $core.String? orgName,
    $core.String? orgLogo,
    $core.String? orgBackgroud,
    $core.String? about,
    $core.String? sttLang,
    $core.String? sttModel,
    $core.String? master,
  }) {
    final result = create();
    if (creatorDid != null) result.creatorDid = creatorDid;
    if (qaNum != null) result.qaNum = qaNum;
    if (systemPrompt != null) result.systemPrompt = systemPrompt;
    if (userPrompt != null) result.userPrompt = userPrompt;
    if (freedom != null) result.freedom = freedom;
    if (gptModel != null) result.gptModel = gptModel;
    if (embeddingModel != null) result.embeddingModel = embeddingModel;
    if (createdAt != null) result.createdAt = createdAt;
    if (messageCount != null) result.messageCount = messageCount;
    if (followCount != null) result.followCount = followCount;
    if (memModel != null) result.memModel = memModel;
    if (useMem != null) result.useMem = useMem;
    if (useAbout != null) result.useAbout = useAbout;
    if (orgName != null) result.orgName = orgName;
    if (orgLogo != null) result.orgLogo = orgLogo;
    if (orgBackgroud != null) result.orgBackgroud = orgBackgroud;
    if (about != null) result.about = about;
    if (sttLang != null) result.sttLang = sttLang;
    if (sttModel != null) result.sttModel = sttModel;
    if (master != null) result.master = master;
    return result;
  }

  ChatBotAttribute._();

  factory ChatBotAttribute.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatBotAttribute.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatBotAttribute',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'creatorDid')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'qaNum', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'systemPrompt')
    ..aOS(4, _omitFieldNames ? '' : 'userPrompt')
    ..a<$core.double>(5, _omitFieldNames ? '' : 'freedom', $pb.PbFieldType.OD)
    ..aOS(6, _omitFieldNames ? '' : 'gptModel')
    ..aOS(7, _omitFieldNames ? '' : 'embeddingModel')
    ..aOS(8, _omitFieldNames ? '' : 'createdAt')
    ..a<$core.int>(9, _omitFieldNames ? '' : 'messageCount', $pb.PbFieldType.O3)
    ..a<$core.int>(10, _omitFieldNames ? '' : 'followCount', $pb.PbFieldType.O3)
    ..aOS(11, _omitFieldNames ? '' : 'memModel')
    ..aOS(12, _omitFieldNames ? '' : 'useMem')
    ..aOS(13, _omitFieldNames ? '' : 'useAbout')
    ..aOS(14, _omitFieldNames ? '' : 'orgName')
    ..aOS(15, _omitFieldNames ? '' : 'orgLogo')
    ..aOS(16, _omitFieldNames ? '' : 'orgBackgroud')
    ..aOS(17, _omitFieldNames ? '' : 'about')
    ..aOS(18, _omitFieldNames ? '' : 'sttLang')
    ..aOS(19, _omitFieldNames ? '' : 'sttModel')
    ..aOS(20, _omitFieldNames ? '' : 'master')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatBotAttribute clone() => ChatBotAttribute()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatBotAttribute copyWith(void Function(ChatBotAttribute) updates) =>
      super.copyWith((message) => updates(message as ChatBotAttribute))
          as ChatBotAttribute;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatBotAttribute create() => ChatBotAttribute._();
  @$core.override
  ChatBotAttribute createEmptyInstance() => create();
  static $pb.PbList<ChatBotAttribute> createRepeated() =>
      $pb.PbList<ChatBotAttribute>();
  @$core.pragma('dart2js:noInline')
  static ChatBotAttribute getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatBotAttribute>(create);
  static ChatBotAttribute? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get creatorDid => $_getSZ(0);
  @$pb.TagNumber(1)
  set creatorDid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCreatorDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearCreatorDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get qaNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set qaNum($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasQaNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearQaNum() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get systemPrompt => $_getSZ(2);
  @$pb.TagNumber(3)
  set systemPrompt($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSystemPrompt() => $_has(2);
  @$pb.TagNumber(3)
  void clearSystemPrompt() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get userPrompt => $_getSZ(3);
  @$pb.TagNumber(4)
  set userPrompt($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUserPrompt() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserPrompt() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get freedom => $_getN(4);
  @$pb.TagNumber(5)
  set freedom($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFreedom() => $_has(4);
  @$pb.TagNumber(5)
  void clearFreedom() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get gptModel => $_getSZ(5);
  @$pb.TagNumber(6)
  set gptModel($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasGptModel() => $_has(5);
  @$pb.TagNumber(6)
  void clearGptModel() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get embeddingModel => $_getSZ(6);
  @$pb.TagNumber(7)
  set embeddingModel($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasEmbeddingModel() => $_has(6);
  @$pb.TagNumber(7)
  void clearEmbeddingModel() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get createdAt => $_getSZ(7);
  @$pb.TagNumber(8)
  set createdAt($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasCreatedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearCreatedAt() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get messageCount => $_getIZ(8);
  @$pb.TagNumber(9)
  set messageCount($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasMessageCount() => $_has(8);
  @$pb.TagNumber(9)
  void clearMessageCount() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get followCount => $_getIZ(9);
  @$pb.TagNumber(10)
  set followCount($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasFollowCount() => $_has(9);
  @$pb.TagNumber(10)
  void clearFollowCount() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get memModel => $_getSZ(10);
  @$pb.TagNumber(11)
  set memModel($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasMemModel() => $_has(10);
  @$pb.TagNumber(11)
  void clearMemModel() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get useMem => $_getSZ(11);
  @$pb.TagNumber(12)
  set useMem($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasUseMem() => $_has(11);
  @$pb.TagNumber(12)
  void clearUseMem() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get useAbout => $_getSZ(12);
  @$pb.TagNumber(13)
  set useAbout($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasUseAbout() => $_has(12);
  @$pb.TagNumber(13)
  void clearUseAbout() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.String get orgName => $_getSZ(13);
  @$pb.TagNumber(14)
  set orgName($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasOrgName() => $_has(13);
  @$pb.TagNumber(14)
  void clearOrgName() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.String get orgLogo => $_getSZ(14);
  @$pb.TagNumber(15)
  set orgLogo($core.String value) => $_setString(14, value);
  @$pb.TagNumber(15)
  $core.bool hasOrgLogo() => $_has(14);
  @$pb.TagNumber(15)
  void clearOrgLogo() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.String get orgBackgroud => $_getSZ(15);
  @$pb.TagNumber(16)
  set orgBackgroud($core.String value) => $_setString(15, value);
  @$pb.TagNumber(16)
  $core.bool hasOrgBackgroud() => $_has(15);
  @$pb.TagNumber(16)
  void clearOrgBackgroud() => $_clearField(16);

  @$pb.TagNumber(17)
  $core.String get about => $_getSZ(16);
  @$pb.TagNumber(17)
  set about($core.String value) => $_setString(16, value);
  @$pb.TagNumber(17)
  $core.bool hasAbout() => $_has(16);
  @$pb.TagNumber(17)
  void clearAbout() => $_clearField(17);

  @$pb.TagNumber(18)
  $core.String get sttLang => $_getSZ(17);
  @$pb.TagNumber(18)
  set sttLang($core.String value) => $_setString(17, value);
  @$pb.TagNumber(18)
  $core.bool hasSttLang() => $_has(17);
  @$pb.TagNumber(18)
  void clearSttLang() => $_clearField(18);

  @$pb.TagNumber(19)
  $core.String get sttModel => $_getSZ(18);
  @$pb.TagNumber(19)
  set sttModel($core.String value) => $_setString(18, value);
  @$pb.TagNumber(19)
  $core.bool hasSttModel() => $_has(18);
  @$pb.TagNumber(19)
  void clearSttModel() => $_clearField(19);

  @$pb.TagNumber(20)
  $core.String get master => $_getSZ(19);
  @$pb.TagNumber(20)
  set master($core.String value) => $_setString(19, value);
  @$pb.TagNumber(20)
  $core.bool hasMaster() => $_has(19);
  @$pb.TagNumber(20)
  void clearMaster() => $_clearField(20);
}

class UpdateUserInfoParam extends $pb.GeneratedMessage {
  factory UpdateUserInfoParam({
    $core.String? name,
    $core.String? avatar,
    $core.String? background,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (avatar != null) result.avatar = avatar;
    if (background != null) result.background = background;
    return result;
  }

  UpdateUserInfoParam._();

  factory UpdateUserInfoParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateUserInfoParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateUserInfoParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'avatar')
    ..aOS(3, _omitFieldNames ? '' : 'background')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateUserInfoParam clone() => UpdateUserInfoParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateUserInfoParam copyWith(void Function(UpdateUserInfoParam) updates) =>
      super.copyWith((message) => updates(message as UpdateUserInfoParam))
          as UpdateUserInfoParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateUserInfoParam create() => UpdateUserInfoParam._();
  @$core.override
  UpdateUserInfoParam createEmptyInstance() => create();
  static $pb.PbList<UpdateUserInfoParam> createRepeated() =>
      $pb.PbList<UpdateUserInfoParam>();
  @$core.pragma('dart2js:noInline')
  static UpdateUserInfoParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateUserInfoParam>(create);
  static UpdateUserInfoParam? _defaultInstance;

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
  $core.String get background => $_getSZ(2);
  @$pb.TagNumber(3)
  set background($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasBackground() => $_has(2);
  @$pb.TagNumber(3)
  void clearBackground() => $_clearField(3);
}

class SystemMessageListParam extends $pb.GeneratedMessage {
  factory SystemMessageListParam({
    $core.String? messageStatus,
    $2.Pagination? pagination,
  }) {
    final result = create();
    if (messageStatus != null) result.messageStatus = messageStatus;
    if (pagination != null) result.pagination = pagination;
    return result;
  }

  SystemMessageListParam._();

  factory SystemMessageListParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SystemMessageListParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SystemMessageListParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'messageStatus')
    ..aOM<$2.Pagination>(2, _omitFieldNames ? '' : 'pagination',
        subBuilder: $2.Pagination.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SystemMessageListParam clone() =>
      SystemMessageListParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SystemMessageListParam copyWith(
          void Function(SystemMessageListParam) updates) =>
      super.copyWith((message) => updates(message as SystemMessageListParam))
          as SystemMessageListParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SystemMessageListParam create() => SystemMessageListParam._();
  @$core.override
  SystemMessageListParam createEmptyInstance() => create();
  static $pb.PbList<SystemMessageListParam> createRepeated() =>
      $pb.PbList<SystemMessageListParam>();
  @$core.pragma('dart2js:noInline')
  static SystemMessageListParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SystemMessageListParam>(create);
  static SystemMessageListParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get messageStatus => $_getSZ(0);
  @$pb.TagNumber(1)
  set messageStatus($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMessageStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessageStatus() => $_clearField(1);

  @$pb.TagNumber(2)
  $2.Pagination get pagination => $_getN(1);
  @$pb.TagNumber(2)
  set pagination($2.Pagination value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(2)
  void clearPagination() => $_clearField(2);
  @$pb.TagNumber(2)
  $2.Pagination ensurePagination() => $_ensure(1);
}

class SystemMessage extends $pb.GeneratedMessage {
  factory SystemMessage({
    $core.String? uuid,
    SystemMessageExtra? extra,
    $core.String? type,
    $core.String? status,
    $fixnum.Int64? timestamp,
    $fixnum.Int64? expireTimestamp,
  }) {
    final result = create();
    if (uuid != null) result.uuid = uuid;
    if (extra != null) result.extra = extra;
    if (type != null) result.type = type;
    if (status != null) result.status = status;
    if (timestamp != null) result.timestamp = timestamp;
    if (expireTimestamp != null) result.expireTimestamp = expireTimestamp;
    return result;
  }

  SystemMessage._();

  factory SystemMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SystemMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SystemMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..aOM<SystemMessageExtra>(2, _omitFieldNames ? '' : 'extra',
        subBuilder: SystemMessageExtra.create)
    ..aOS(3, _omitFieldNames ? '' : 'type')
    ..aOS(4, _omitFieldNames ? '' : 'status')
    ..aInt64(5, _omitFieldNames ? '' : 'timestamp')
    ..aInt64(6, _omitFieldNames ? '' : 'expireTimestamp')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SystemMessage clone() => SystemMessage()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SystemMessage copyWith(void Function(SystemMessage) updates) =>
      super.copyWith((message) => updates(message as SystemMessage))
          as SystemMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SystemMessage create() => SystemMessage._();
  @$core.override
  SystemMessage createEmptyInstance() => create();
  static $pb.PbList<SystemMessage> createRepeated() =>
      $pb.PbList<SystemMessage>();
  @$core.pragma('dart2js:noInline')
  static SystemMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SystemMessage>(create);
  static SystemMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => $_clearField(1);

  @$pb.TagNumber(2)
  SystemMessageExtra get extra => $_getN(1);
  @$pb.TagNumber(2)
  set extra(SystemMessageExtra value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasExtra() => $_has(1);
  @$pb.TagNumber(2)
  void clearExtra() => $_clearField(2);
  @$pb.TagNumber(2)
  SystemMessageExtra ensureExtra() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get type => $_getSZ(2);
  @$pb.TagNumber(3)
  set type($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get status => $_getSZ(3);
  @$pb.TagNumber(4)
  set status($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get timestamp => $_getI64(4);
  @$pb.TagNumber(5)
  set timestamp($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTimestamp() => $_has(4);
  @$pb.TagNumber(5)
  void clearTimestamp() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get expireTimestamp => $_getI64(5);
  @$pb.TagNumber(6)
  set expireTimestamp($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasExpireTimestamp() => $_has(5);
  @$pb.TagNumber(6)
  void clearExpireTimestamp() => $_clearField(6);
}

class SystemMessageExtra extends $pb.GeneratedMessage {
  factory SystemMessageExtra({
    $2.Unit? group,
    $2.Unit? user,
  }) {
    final result = create();
    if (group != null) result.group = group;
    if (user != null) result.user = user;
    return result;
  }

  SystemMessageExtra._();

  factory SystemMessageExtra.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SystemMessageExtra.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SystemMessageExtra',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOM<$2.Unit>(1, _omitFieldNames ? '' : 'group',
        subBuilder: $2.Unit.create)
    ..aOM<$2.Unit>(2, _omitFieldNames ? '' : 'user', subBuilder: $2.Unit.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SystemMessageExtra clone() => SystemMessageExtra()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SystemMessageExtra copyWith(void Function(SystemMessageExtra) updates) =>
      super.copyWith((message) => updates(message as SystemMessageExtra))
          as SystemMessageExtra;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SystemMessageExtra create() => SystemMessageExtra._();
  @$core.override
  SystemMessageExtra createEmptyInstance() => create();
  static $pb.PbList<SystemMessageExtra> createRepeated() =>
      $pb.PbList<SystemMessageExtra>();
  @$core.pragma('dart2js:noInline')
  static SystemMessageExtra getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SystemMessageExtra>(create);
  static SystemMessageExtra? _defaultInstance;

  @$pb.TagNumber(1)
  $2.Unit get group => $_getN(0);
  @$pb.TagNumber(1)
  set group($2.Unit value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasGroup() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroup() => $_clearField(1);
  @$pb.TagNumber(1)
  $2.Unit ensureGroup() => $_ensure(0);

  @$pb.TagNumber(2)
  $2.Unit get user => $_getN(1);
  @$pb.TagNumber(2)
  set user($2.Unit value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser() => $_clearField(2);
  @$pb.TagNumber(2)
  $2.Unit ensureUser() => $_ensure(1);
}

class SystemMessages extends $pb.GeneratedMessage {
  factory SystemMessages({
    $core.bool? hasNew,
    $core.Iterable<SystemMessage>? messageList,
  }) {
    final result = create();
    if (hasNew != null) result.hasNew = hasNew;
    if (messageList != null) result.messageList.addAll(messageList);
    return result;
  }

  SystemMessages._();

  factory SystemMessages.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SystemMessages.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SystemMessages',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'hasNew')
    ..pc<SystemMessage>(
        2, _omitFieldNames ? '' : 'messageList', $pb.PbFieldType.PM,
        subBuilder: SystemMessage.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SystemMessages clone() => SystemMessages()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SystemMessages copyWith(void Function(SystemMessages) updates) =>
      super.copyWith((message) => updates(message as SystemMessages))
          as SystemMessages;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SystemMessages create() => SystemMessages._();
  @$core.override
  SystemMessages createEmptyInstance() => create();
  static $pb.PbList<SystemMessages> createRepeated() =>
      $pb.PbList<SystemMessages>();
  @$core.pragma('dart2js:noInline')
  static SystemMessages getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SystemMessages>(create);
  static SystemMessages? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get hasNew => $_getBF(0);
  @$pb.TagNumber(1)
  set hasNew($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHasNew() => $_has(0);
  @$pb.TagNumber(1)
  void clearHasNew() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<SystemMessage> get messageList => $_getList(1);
}

class DeleteSystemMessageParam extends $pb.GeneratedMessage {
  factory DeleteSystemMessageParam({
    $core.String? uuid,
  }) {
    final result = create();
    if (uuid != null) result.uuid = uuid;
    return result;
  }

  DeleteSystemMessageParam._();

  factory DeleteSystemMessageParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteSystemMessageParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteSystemMessageParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteSystemMessageParam clone() =>
      DeleteSystemMessageParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteSystemMessageParam copyWith(
          void Function(DeleteSystemMessageParam) updates) =>
      super.copyWith((message) => updates(message as DeleteSystemMessageParam))
          as DeleteSystemMessageParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteSystemMessageParam create() => DeleteSystemMessageParam._();
  @$core.override
  DeleteSystemMessageParam createEmptyInstance() => create();
  static $pb.PbList<DeleteSystemMessageParam> createRepeated() =>
      $pb.PbList<DeleteSystemMessageParam>();
  @$core.pragma('dart2js:noInline')
  static DeleteSystemMessageParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteSystemMessageParam>(create);
  static DeleteSystemMessageParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => $_clearField(1);
}

class HandleSystemMessageParam extends $pb.GeneratedMessage {
  factory HandleSystemMessageParam({
    $core.String? uuid,
    $core.int? status,
  }) {
    final result = create();
    if (uuid != null) result.uuid = uuid;
    if (status != null) result.status = status;
    return result;
  }

  HandleSystemMessageParam._();

  factory HandleSystemMessageParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HandleSystemMessageParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HandleSystemMessageParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'status', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HandleSystemMessageParam clone() =>
      HandleSystemMessageParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HandleSystemMessageParam copyWith(
          void Function(HandleSystemMessageParam) updates) =>
      super.copyWith((message) => updates(message as HandleSystemMessageParam))
          as HandleSystemMessageParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HandleSystemMessageParam create() => HandleSystemMessageParam._();
  @$core.override
  HandleSystemMessageParam createEmptyInstance() => create();
  static $pb.PbList<HandleSystemMessageParam> createRepeated() =>
      $pb.PbList<HandleSystemMessageParam>();
  @$core.pragma('dart2js:noInline')
  static HandleSystemMessageParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HandleSystemMessageParam>(create);
  static HandleSystemMessageParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get status => $_getIZ(1);
  @$pb.TagNumber(2)
  set status($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);
}

class ChatUserInfoList extends $pb.GeneratedMessage {
  factory ChatUserInfoList({
    $core.Iterable<ChatUserInfo>? userInfoList,
  }) {
    final result = create();
    if (userInfoList != null) result.userInfoList.addAll(userInfoList);
    return result;
  }

  ChatUserInfoList._();

  factory ChatUserInfoList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatUserInfoList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatUserInfoList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..pc<ChatUserInfo>(
        1, _omitFieldNames ? '' : 'userInfoList', $pb.PbFieldType.PM,
        subBuilder: ChatUserInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatUserInfoList clone() => ChatUserInfoList()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatUserInfoList copyWith(void Function(ChatUserInfoList) updates) =>
      super.copyWith((message) => updates(message as ChatUserInfoList))
          as ChatUserInfoList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatUserInfoList create() => ChatUserInfoList._();
  @$core.override
  ChatUserInfoList createEmptyInstance() => create();
  static $pb.PbList<ChatUserInfoList> createRepeated() =>
      $pb.PbList<ChatUserInfoList>();
  @$core.pragma('dart2js:noInline')
  static ChatUserInfoList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatUserInfoList>(create);
  static ChatUserInfoList? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ChatUserInfo> get userInfoList => $_getList(0);
}

class FriendParam extends $pb.GeneratedMessage {
  factory FriendParam({
    $core.String? userDid,
    $core.String? userType,
  }) {
    final result = create();
    if (userDid != null) result.userDid = userDid;
    if (userType != null) result.userType = userType;
    return result;
  }

  FriendParam._();

  factory FriendParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FriendParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FriendParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userDid')
    ..aOS(2, _omitFieldNames ? '' : 'userType')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FriendParam clone() => FriendParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FriendParam copyWith(void Function(FriendParam) updates) =>
      super.copyWith((message) => updates(message as FriendParam))
          as FriendParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FriendParam create() => FriendParam._();
  @$core.override
  FriendParam createEmptyInstance() => create();
  static $pb.PbList<FriendParam> createRepeated() => $pb.PbList<FriendParam>();
  @$core.pragma('dart2js:noInline')
  static FriendParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FriendParam>(create);
  static FriendParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userDid => $_getSZ(0);
  @$pb.TagNumber(1)
  set userDid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get userType => $_getSZ(1);
  @$pb.TagNumber(2)
  set userType($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserType() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserType() => $_clearField(2);
}

class EmailParam extends $pb.GeneratedMessage {
  factory EmailParam({
    $core.String? email,
    $core.String? password,
  }) {
    final result = create();
    if (email != null) result.email = email;
    if (password != null) result.password = password;
    return result;
  }

  EmailParam._();

  factory EmailParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EmailParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EmailParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'email')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmailParam clone() => EmailParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmailParam copyWith(void Function(EmailParam) updates) =>
      super.copyWith((message) => updates(message as EmailParam)) as EmailParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EmailParam create() => EmailParam._();
  @$core.override
  EmailParam createEmptyInstance() => create();
  static $pb.PbList<EmailParam> createRepeated() => $pb.PbList<EmailParam>();
  @$core.pragma('dart2js:noInline')
  static EmailParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EmailParam>(create);
  static EmailParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => $_clearField(2);
}

class SendAboutParam extends $pb.GeneratedMessage {
  factory SendAboutParam({
    $core.String? singleGroupCode,
    $core.String? botDid,
  }) {
    final result = create();
    if (singleGroupCode != null) result.singleGroupCode = singleGroupCode;
    if (botDid != null) result.botDid = botDid;
    return result;
  }

  SendAboutParam._();

  factory SendAboutParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SendAboutParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SendAboutParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'singleGroupCode')
    ..aOS(2, _omitFieldNames ? '' : 'botDid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendAboutParam clone() => SendAboutParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendAboutParam copyWith(void Function(SendAboutParam) updates) =>
      super.copyWith((message) => updates(message as SendAboutParam))
          as SendAboutParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendAboutParam create() => SendAboutParam._();
  @$core.override
  SendAboutParam createEmptyInstance() => create();
  static $pb.PbList<SendAboutParam> createRepeated() =>
      $pb.PbList<SendAboutParam>();
  @$core.pragma('dart2js:noInline')
  static SendAboutParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendAboutParam>(create);
  static SendAboutParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get singleGroupCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set singleGroupCode($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSingleGroupCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearSingleGroupCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get botDid => $_getSZ(1);
  @$pb.TagNumber(2)
  set botDid($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBotDid() => $_has(1);
  @$pb.TagNumber(2)
  void clearBotDid() => $_clearField(2);
}

class SendCardParam extends $pb.GeneratedMessage {
  factory SendCardParam({
    $core.String? singleGroupCode,
    $core.String? peerUserDid,
  }) {
    final result = create();
    if (singleGroupCode != null) result.singleGroupCode = singleGroupCode;
    if (peerUserDid != null) result.peerUserDid = peerUserDid;
    return result;
  }

  SendCardParam._();

  factory SendCardParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SendCardParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SendCardParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'singleGroupCode')
    ..aOS(2, _omitFieldNames ? '' : 'peerUserDid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendCardParam clone() => SendCardParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendCardParam copyWith(void Function(SendCardParam) updates) =>
      super.copyWith((message) => updates(message as SendCardParam))
          as SendCardParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendCardParam create() => SendCardParam._();
  @$core.override
  SendCardParam createEmptyInstance() => create();
  static $pb.PbList<SendCardParam> createRepeated() =>
      $pb.PbList<SendCardParam>();
  @$core.pragma('dart2js:noInline')
  static SendCardParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendCardParam>(create);
  static SendCardParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get singleGroupCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set singleGroupCode($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSingleGroupCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearSingleGroupCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get peerUserDid => $_getSZ(1);
  @$pb.TagNumber(2)
  set peerUserDid($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPeerUserDid() => $_has(1);
  @$pb.TagNumber(2)
  void clearPeerUserDid() => $_clearField(2);
}

class BotGroupCodeParam extends $pb.GeneratedMessage {
  factory BotGroupCodeParam({
    $core.String? botDid,
  }) {
    final result = create();
    if (botDid != null) result.botDid = botDid;
    return result;
  }

  BotGroupCodeParam._();

  factory BotGroupCodeParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BotGroupCodeParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BotGroupCodeParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'botDid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotGroupCodeParam clone() => BotGroupCodeParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotGroupCodeParam copyWith(void Function(BotGroupCodeParam) updates) =>
      super.copyWith((message) => updates(message as BotGroupCodeParam))
          as BotGroupCodeParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BotGroupCodeParam create() => BotGroupCodeParam._();
  @$core.override
  BotGroupCodeParam createEmptyInstance() => create();
  static $pb.PbList<BotGroupCodeParam> createRepeated() =>
      $pb.PbList<BotGroupCodeParam>();
  @$core.pragma('dart2js:noInline')
  static BotGroupCodeParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BotGroupCodeParam>(create);
  static BotGroupCodeParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get botDid => $_getSZ(0);
  @$pb.TagNumber(1)
  set botDid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBotDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearBotDid() => $_clearField(1);
}

class BotGroupCodeList extends $pb.GeneratedMessage {
  factory BotGroupCodeList({
    $core.Iterable<$core.String>? groupCodeList,
  }) {
    final result = create();
    if (groupCodeList != null) result.groupCodeList.addAll(groupCodeList);
    return result;
  }

  BotGroupCodeList._();

  factory BotGroupCodeList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BotGroupCodeList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BotGroupCodeList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'groupCodeList')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotGroupCodeList clone() => BotGroupCodeList()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotGroupCodeList copyWith(void Function(BotGroupCodeList) updates) =>
      super.copyWith((message) => updates(message as BotGroupCodeList))
          as BotGroupCodeList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BotGroupCodeList create() => BotGroupCodeList._();
  @$core.override
  BotGroupCodeList createEmptyInstance() => create();
  static $pb.PbList<BotGroupCodeList> createRepeated() =>
      $pb.PbList<BotGroupCodeList>();
  @$core.pragma('dart2js:noInline')
  static BotGroupCodeList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BotGroupCodeList>(create);
  static BotGroupCodeList? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get groupCodeList => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
