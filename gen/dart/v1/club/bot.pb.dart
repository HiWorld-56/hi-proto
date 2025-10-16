// This is a generated file - do not edit.
//
// Generated from v1/club/bot.proto.

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

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// 新建机器人参数
class CreateBotParam extends $pb.GeneratedMessage {
  factory CreateBotParam({
    $core.String? did,
    $core.String? name,
    $core.int? type,
    $core.String? avatar,
  }) {
    final result = create();
    if (did != null) result.did = did;
    if (name != null) result.name = name;
    if (type != null) result.type = type;
    if (avatar != null) result.avatar = avatar;
    return result;
  }

  CreateBotParam._();

  factory CreateBotParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateBotParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateBotParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'type', $pb.PbFieldType.O3)
    ..aOS(4, _omitFieldNames ? '' : 'avatar')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateBotParam clone() => CreateBotParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateBotParam copyWith(void Function(CreateBotParam) updates) =>
      super.copyWith((message) => updates(message as CreateBotParam))
          as CreateBotParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateBotParam create() => CreateBotParam._();
  @$core.override
  CreateBotParam createEmptyInstance() => create();
  static $pb.PbList<CreateBotParam> createRepeated() =>
      $pb.PbList<CreateBotParam>();
  @$core.pragma('dart2js:noInline')
  static CreateBotParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateBotParam>(create);
  static CreateBotParam? _defaultInstance;

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
  $core.int get type => $_getIZ(2);
  @$pb.TagNumber(3)
  set type($core.int value) => $_setSignedInt32(2, value);
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
}

class BotDID extends $pb.GeneratedMessage {
  factory BotDID({
    $core.String? did,
  }) {
    final result = create();
    if (did != null) result.did = did;
    return result;
  }

  BotDID._();

  factory BotDID.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BotDID.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BotDID',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotDID clone() => BotDID()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotDID copyWith(void Function(BotDID) updates) =>
      super.copyWith((message) => updates(message as BotDID)) as BotDID;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BotDID create() => BotDID._();
  @$core.override
  BotDID createEmptyInstance() => create();
  static $pb.PbList<BotDID> createRepeated() => $pb.PbList<BotDID>();
  @$core.pragma('dart2js:noInline')
  static BotDID getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BotDID>(create);
  static BotDID? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get did => $_getSZ(0);
  @$pb.TagNumber(1)
  set did($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearDid() => $_clearField(1);
}

class Models extends $pb.GeneratedMessage {
  factory Models({
    $core.Iterable<$core.String>? modelList,
  }) {
    final result = create();
    if (modelList != null) result.modelList.addAll(modelList);
    return result;
  }

  Models._();

  factory Models.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Models.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Models',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'modelList')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Models clone() => Models()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Models copyWith(void Function(Models) updates) =>
      super.copyWith((message) => updates(message as Models)) as Models;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Models create() => Models._();
  @$core.override
  Models createEmptyInstance() => create();
  static $pb.PbList<Models> createRepeated() => $pb.PbList<Models>();
  @$core.pragma('dart2js:noInline')
  static Models getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Models>(create);
  static Models? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get modelList => $_getList(0);
}

class AudioModels extends $pb.GeneratedMessage {
  factory AudioModels({
    $core.Iterable<$core.String>? audioModelList,
    $core.Iterable<$core.String>? sttLangList,
  }) {
    final result = create();
    if (audioModelList != null) result.audioModelList.addAll(audioModelList);
    if (sttLangList != null) result.sttLangList.addAll(sttLangList);
    return result;
  }

  AudioModels._();

  factory AudioModels.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AudioModels.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AudioModels',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'audioModelList')
    ..pPS(2, _omitFieldNames ? '' : 'sttLangList')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AudioModels clone() => AudioModels()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AudioModels copyWith(void Function(AudioModels) updates) =>
      super.copyWith((message) => updates(message as AudioModels))
          as AudioModels;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AudioModels create() => AudioModels._();
  @$core.override
  AudioModels createEmptyInstance() => create();
  static $pb.PbList<AudioModels> createRepeated() => $pb.PbList<AudioModels>();
  @$core.pragma('dart2js:noInline')
  static AudioModels getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AudioModels>(create);
  static AudioModels? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get audioModelList => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get sttLangList => $_getList(1);
}

/// 机器人信息
class BotInfo extends $pb.GeneratedMessage {
  factory BotInfo({
    $core.String? did,
    $core.String? name,
    $core.int? type,
    $core.String? avatar,
    $core.String? background,
    $core.String? apiKey,
    $core.String? userDid,
    $core.int? messageCount,
    $core.int? qaNum,
    $core.String? systemPrompt,
    $core.String? userPrompt,
    $core.double? freedom,
    $core.String? gptModel,
    $core.String? embeddingModel,
    $core.String? createdAt,
    $core.String? memModel,
    $core.String? useMem,
    $core.String? useTools,
    $core.String? note,
    $core.String? useAbout,
    $core.String? orgName,
    $core.String? orgLogo,
    $core.String? orgBackground,
    $core.String? about,
    $core.String? sttModel,
    $core.String? sttLang,
    $core.int? favorited,
  }) {
    final result = create();
    if (did != null) result.did = did;
    if (name != null) result.name = name;
    if (type != null) result.type = type;
    if (avatar != null) result.avatar = avatar;
    if (background != null) result.background = background;
    if (apiKey != null) result.apiKey = apiKey;
    if (userDid != null) result.userDid = userDid;
    if (messageCount != null) result.messageCount = messageCount;
    if (qaNum != null) result.qaNum = qaNum;
    if (systemPrompt != null) result.systemPrompt = systemPrompt;
    if (userPrompt != null) result.userPrompt = userPrompt;
    if (freedom != null) result.freedom = freedom;
    if (gptModel != null) result.gptModel = gptModel;
    if (embeddingModel != null) result.embeddingModel = embeddingModel;
    if (createdAt != null) result.createdAt = createdAt;
    if (memModel != null) result.memModel = memModel;
    if (useMem != null) result.useMem = useMem;
    if (useTools != null) result.useTools = useTools;
    if (note != null) result.note = note;
    if (useAbout != null) result.useAbout = useAbout;
    if (orgName != null) result.orgName = orgName;
    if (orgLogo != null) result.orgLogo = orgLogo;
    if (orgBackground != null) result.orgBackground = orgBackground;
    if (about != null) result.about = about;
    if (sttModel != null) result.sttModel = sttModel;
    if (sttLang != null) result.sttLang = sttLang;
    if (favorited != null) result.favorited = favorited;
    return result;
  }

  BotInfo._();

  factory BotInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BotInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BotInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'type', $pb.PbFieldType.O3)
    ..aOS(4, _omitFieldNames ? '' : 'avatar')
    ..aOS(5, _omitFieldNames ? '' : 'background')
    ..aOS(6, _omitFieldNames ? '' : 'apiKey')
    ..aOS(7, _omitFieldNames ? '' : 'userDid')
    ..a<$core.int>(8, _omitFieldNames ? '' : 'messageCount', $pb.PbFieldType.O3)
    ..a<$core.int>(9, _omitFieldNames ? '' : 'qaNum', $pb.PbFieldType.O3)
    ..aOS(10, _omitFieldNames ? '' : 'systemPrompt')
    ..aOS(11, _omitFieldNames ? '' : 'userPrompt')
    ..a<$core.double>(12, _omitFieldNames ? '' : 'freedom', $pb.PbFieldType.OD)
    ..aOS(13, _omitFieldNames ? '' : 'gptModel')
    ..aOS(14, _omitFieldNames ? '' : 'embeddingModel')
    ..aOS(15, _omitFieldNames ? '' : 'createdAt')
    ..aOS(16, _omitFieldNames ? '' : 'memModel')
    ..aOS(17, _omitFieldNames ? '' : 'useMem')
    ..aOS(18, _omitFieldNames ? '' : 'useTools')
    ..aOS(19, _omitFieldNames ? '' : 'note')
    ..aOS(20, _omitFieldNames ? '' : 'useAbout')
    ..aOS(21, _omitFieldNames ? '' : 'orgName')
    ..aOS(22, _omitFieldNames ? '' : 'orgLogo')
    ..aOS(23, _omitFieldNames ? '' : 'orgBackground')
    ..aOS(24, _omitFieldNames ? '' : 'about')
    ..aOS(25, _omitFieldNames ? '' : 'sttModel')
    ..aOS(26, _omitFieldNames ? '' : 'sttLang')
    ..a<$core.int>(27, _omitFieldNames ? '' : 'favorited', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotInfo clone() => BotInfo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotInfo copyWith(void Function(BotInfo) updates) =>
      super.copyWith((message) => updates(message as BotInfo)) as BotInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BotInfo create() => BotInfo._();
  @$core.override
  BotInfo createEmptyInstance() => create();
  static $pb.PbList<BotInfo> createRepeated() => $pb.PbList<BotInfo>();
  @$core.pragma('dart2js:noInline')
  static BotInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BotInfo>(create);
  static BotInfo? _defaultInstance;

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
  $core.int get type => $_getIZ(2);
  @$pb.TagNumber(3)
  set type($core.int value) => $_setSignedInt32(2, value);
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
  $core.String get apiKey => $_getSZ(5);
  @$pb.TagNumber(6)
  set apiKey($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasApiKey() => $_has(5);
  @$pb.TagNumber(6)
  void clearApiKey() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get userDid => $_getSZ(6);
  @$pb.TagNumber(7)
  set userDid($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasUserDid() => $_has(6);
  @$pb.TagNumber(7)
  void clearUserDid() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get messageCount => $_getIZ(7);
  @$pb.TagNumber(8)
  set messageCount($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasMessageCount() => $_has(7);
  @$pb.TagNumber(8)
  void clearMessageCount() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get qaNum => $_getIZ(8);
  @$pb.TagNumber(9)
  set qaNum($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasQaNum() => $_has(8);
  @$pb.TagNumber(9)
  void clearQaNum() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get systemPrompt => $_getSZ(9);
  @$pb.TagNumber(10)
  set systemPrompt($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasSystemPrompt() => $_has(9);
  @$pb.TagNumber(10)
  void clearSystemPrompt() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get userPrompt => $_getSZ(10);
  @$pb.TagNumber(11)
  set userPrompt($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasUserPrompt() => $_has(10);
  @$pb.TagNumber(11)
  void clearUserPrompt() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.double get freedom => $_getN(11);
  @$pb.TagNumber(12)
  set freedom($core.double value) => $_setDouble(11, value);
  @$pb.TagNumber(12)
  $core.bool hasFreedom() => $_has(11);
  @$pb.TagNumber(12)
  void clearFreedom() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get gptModel => $_getSZ(12);
  @$pb.TagNumber(13)
  set gptModel($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasGptModel() => $_has(12);
  @$pb.TagNumber(13)
  void clearGptModel() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.String get embeddingModel => $_getSZ(13);
  @$pb.TagNumber(14)
  set embeddingModel($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasEmbeddingModel() => $_has(13);
  @$pb.TagNumber(14)
  void clearEmbeddingModel() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.String get createdAt => $_getSZ(14);
  @$pb.TagNumber(15)
  set createdAt($core.String value) => $_setString(14, value);
  @$pb.TagNumber(15)
  $core.bool hasCreatedAt() => $_has(14);
  @$pb.TagNumber(15)
  void clearCreatedAt() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.String get memModel => $_getSZ(15);
  @$pb.TagNumber(16)
  set memModel($core.String value) => $_setString(15, value);
  @$pb.TagNumber(16)
  $core.bool hasMemModel() => $_has(15);
  @$pb.TagNumber(16)
  void clearMemModel() => $_clearField(16);

  @$pb.TagNumber(17)
  $core.String get useMem => $_getSZ(16);
  @$pb.TagNumber(17)
  set useMem($core.String value) => $_setString(16, value);
  @$pb.TagNumber(17)
  $core.bool hasUseMem() => $_has(16);
  @$pb.TagNumber(17)
  void clearUseMem() => $_clearField(17);

  @$pb.TagNumber(18)
  $core.String get useTools => $_getSZ(17);
  @$pb.TagNumber(18)
  set useTools($core.String value) => $_setString(17, value);
  @$pb.TagNumber(18)
  $core.bool hasUseTools() => $_has(17);
  @$pb.TagNumber(18)
  void clearUseTools() => $_clearField(18);

  @$pb.TagNumber(19)
  $core.String get note => $_getSZ(18);
  @$pb.TagNumber(19)
  set note($core.String value) => $_setString(18, value);
  @$pb.TagNumber(19)
  $core.bool hasNote() => $_has(18);
  @$pb.TagNumber(19)
  void clearNote() => $_clearField(19);

  @$pb.TagNumber(20)
  $core.String get useAbout => $_getSZ(19);
  @$pb.TagNumber(20)
  set useAbout($core.String value) => $_setString(19, value);
  @$pb.TagNumber(20)
  $core.bool hasUseAbout() => $_has(19);
  @$pb.TagNumber(20)
  void clearUseAbout() => $_clearField(20);

  @$pb.TagNumber(21)
  $core.String get orgName => $_getSZ(20);
  @$pb.TagNumber(21)
  set orgName($core.String value) => $_setString(20, value);
  @$pb.TagNumber(21)
  $core.bool hasOrgName() => $_has(20);
  @$pb.TagNumber(21)
  void clearOrgName() => $_clearField(21);

  @$pb.TagNumber(22)
  $core.String get orgLogo => $_getSZ(21);
  @$pb.TagNumber(22)
  set orgLogo($core.String value) => $_setString(21, value);
  @$pb.TagNumber(22)
  $core.bool hasOrgLogo() => $_has(21);
  @$pb.TagNumber(22)
  void clearOrgLogo() => $_clearField(22);

  @$pb.TagNumber(23)
  $core.String get orgBackground => $_getSZ(22);
  @$pb.TagNumber(23)
  set orgBackground($core.String value) => $_setString(22, value);
  @$pb.TagNumber(23)
  $core.bool hasOrgBackground() => $_has(22);
  @$pb.TagNumber(23)
  void clearOrgBackground() => $_clearField(23);

  @$pb.TagNumber(24)
  $core.String get about => $_getSZ(23);
  @$pb.TagNumber(24)
  set about($core.String value) => $_setString(23, value);
  @$pb.TagNumber(24)
  $core.bool hasAbout() => $_has(23);
  @$pb.TagNumber(24)
  void clearAbout() => $_clearField(24);

  @$pb.TagNumber(25)
  $core.String get sttModel => $_getSZ(24);
  @$pb.TagNumber(25)
  set sttModel($core.String value) => $_setString(24, value);
  @$pb.TagNumber(25)
  $core.bool hasSttModel() => $_has(24);
  @$pb.TagNumber(25)
  void clearSttModel() => $_clearField(25);

  @$pb.TagNumber(26)
  $core.String get sttLang => $_getSZ(25);
  @$pb.TagNumber(26)
  set sttLang($core.String value) => $_setString(25, value);
  @$pb.TagNumber(26)
  $core.bool hasSttLang() => $_has(25);
  @$pb.TagNumber(26)
  void clearSttLang() => $_clearField(26);

  @$pb.TagNumber(27)
  $core.int get favorited => $_getIZ(26);
  @$pb.TagNumber(27)
  set favorited($core.int value) => $_setSignedInt32(26, value);
  @$pb.TagNumber(27)
  $core.bool hasFavorited() => $_has(26);
  @$pb.TagNumber(27)
  void clearFavorited() => $_clearField(27);
}

/// TODO: 添加total字段
class BotInfoList extends $pb.GeneratedMessage {
  factory BotInfoList({
    $core.Iterable<BotInfo>? botInfoList,
  }) {
    final result = create();
    if (botInfoList != null) result.botInfoList.addAll(botInfoList);
    return result;
  }

  BotInfoList._();

  factory BotInfoList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BotInfoList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BotInfoList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..pc<BotInfo>(1, _omitFieldNames ? '' : 'botInfoList', $pb.PbFieldType.PM,
        subBuilder: BotInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotInfoList clone() => BotInfoList()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotInfoList copyWith(void Function(BotInfoList) updates) =>
      super.copyWith((message) => updates(message as BotInfoList))
          as BotInfoList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BotInfoList create() => BotInfoList._();
  @$core.override
  BotInfoList createEmptyInstance() => create();
  static $pb.PbList<BotInfoList> createRepeated() => $pb.PbList<BotInfoList>();
  @$core.pragma('dart2js:noInline')
  static BotInfoList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BotInfoList>(create);
  static BotInfoList? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<BotInfo> get botInfoList => $_getList(0);
}

class BotStatisticsInfo extends $pb.GeneratedMessage {
  factory BotStatisticsInfo({
    $core.int? messageCount,
    $core.int? useToken,
    $core.int? promptToken,
    $core.int? memToken,
  }) {
    final result = create();
    if (messageCount != null) result.messageCount = messageCount;
    if (useToken != null) result.useToken = useToken;
    if (promptToken != null) result.promptToken = promptToken;
    if (memToken != null) result.memToken = memToken;
    return result;
  }

  BotStatisticsInfo._();

  factory BotStatisticsInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BotStatisticsInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BotStatisticsInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'messageCount', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'useToken', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'promptToken', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'memToken', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotStatisticsInfo clone() => BotStatisticsInfo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotStatisticsInfo copyWith(void Function(BotStatisticsInfo) updates) =>
      super.copyWith((message) => updates(message as BotStatisticsInfo))
          as BotStatisticsInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BotStatisticsInfo create() => BotStatisticsInfo._();
  @$core.override
  BotStatisticsInfo createEmptyInstance() => create();
  static $pb.PbList<BotStatisticsInfo> createRepeated() =>
      $pb.PbList<BotStatisticsInfo>();
  @$core.pragma('dart2js:noInline')
  static BotStatisticsInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BotStatisticsInfo>(create);
  static BotStatisticsInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get messageCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set messageCount($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMessageCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessageCount() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get useToken => $_getIZ(1);
  @$pb.TagNumber(2)
  set useToken($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUseToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearUseToken() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get promptToken => $_getIZ(2);
  @$pb.TagNumber(3)
  set promptToken($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPromptToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearPromptToken() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get memToken => $_getIZ(3);
  @$pb.TagNumber(4)
  set memToken($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMemToken() => $_has(3);
  @$pb.TagNumber(4)
  void clearMemToken() => $_clearField(4);
}

class BotInfoListParam extends $pb.GeneratedMessage {
  factory BotInfoListParam({
    $core.String? botDid,
    $3.Pagination? pagination,
  }) {
    final result = create();
    if (botDid != null) result.botDid = botDid;
    if (pagination != null) result.pagination = pagination;
    return result;
  }

  BotInfoListParam._();

  factory BotInfoListParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BotInfoListParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BotInfoListParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'botDid')
    ..aOM<$3.Pagination>(2, _omitFieldNames ? '' : 'pagination',
        subBuilder: $3.Pagination.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotInfoListParam clone() => BotInfoListParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotInfoListParam copyWith(void Function(BotInfoListParam) updates) =>
      super.copyWith((message) => updates(message as BotInfoListParam))
          as BotInfoListParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BotInfoListParam create() => BotInfoListParam._();
  @$core.override
  BotInfoListParam createEmptyInstance() => create();
  static $pb.PbList<BotInfoListParam> createRepeated() =>
      $pb.PbList<BotInfoListParam>();
  @$core.pragma('dart2js:noInline')
  static BotInfoListParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BotInfoListParam>(create);
  static BotInfoListParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get botDid => $_getSZ(0);
  @$pb.TagNumber(1)
  set botDid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBotDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearBotDid() => $_clearField(1);

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

class FavoriteBotParam extends $pb.GeneratedMessage {
  factory FavoriteBotParam({
    $core.String? botDid,
    $core.int? operation,
  }) {
    final result = create();
    if (botDid != null) result.botDid = botDid;
    if (operation != null) result.operation = operation;
    return result;
  }

  FavoriteBotParam._();

  factory FavoriteBotParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FavoriteBotParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FavoriteBotParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'botDid')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'operation', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FavoriteBotParam clone() => FavoriteBotParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FavoriteBotParam copyWith(void Function(FavoriteBotParam) updates) =>
      super.copyWith((message) => updates(message as FavoriteBotParam))
          as FavoriteBotParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FavoriteBotParam create() => FavoriteBotParam._();
  @$core.override
  FavoriteBotParam createEmptyInstance() => create();
  static $pb.PbList<FavoriteBotParam> createRepeated() =>
      $pb.PbList<FavoriteBotParam>();
  @$core.pragma('dart2js:noInline')
  static FavoriteBotParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FavoriteBotParam>(create);
  static FavoriteBotParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get botDid => $_getSZ(0);
  @$pb.TagNumber(1)
  set botDid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBotDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearBotDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get operation => $_getIZ(1);
  @$pb.TagNumber(2)
  set operation($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOperation() => $_has(1);
  @$pb.TagNumber(2)
  void clearOperation() => $_clearField(2);
}

class BotListByDidsParam extends $pb.GeneratedMessage {
  factory BotListByDidsParam({
    $core.Iterable<$core.String>? botDidList,
    $3.Pagination? pagination,
  }) {
    final result = create();
    if (botDidList != null) result.botDidList.addAll(botDidList);
    if (pagination != null) result.pagination = pagination;
    return result;
  }

  BotListByDidsParam._();

  factory BotListByDidsParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BotListByDidsParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BotListByDidsParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'botDidList')
    ..aOM<$3.Pagination>(2, _omitFieldNames ? '' : 'pagination',
        subBuilder: $3.Pagination.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotListByDidsParam clone() => BotListByDidsParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotListByDidsParam copyWith(void Function(BotListByDidsParam) updates) =>
      super.copyWith((message) => updates(message as BotListByDidsParam))
          as BotListByDidsParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BotListByDidsParam create() => BotListByDidsParam._();
  @$core.override
  BotListByDidsParam createEmptyInstance() => create();
  static $pb.PbList<BotListByDidsParam> createRepeated() =>
      $pb.PbList<BotListByDidsParam>();
  @$core.pragma('dart2js:noInline')
  static BotListByDidsParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BotListByDidsParam>(create);
  static BotListByDidsParam? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get botDidList => $_getList(0);

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

/// 插件使用状态
class PluginStatus extends $pb.GeneratedMessage {
  factory PluginStatus({
    $core.String? name,
    $core.String? enable,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (enable != null) result.enable = enable;
    return result;
  }

  PluginStatus._();

  factory PluginStatus.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PluginStatus.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PluginStatus',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'enable')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PluginStatus clone() => PluginStatus()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PluginStatus copyWith(void Function(PluginStatus) updates) =>
      super.copyWith((message) => updates(message as PluginStatus))
          as PluginStatus;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PluginStatus create() => PluginStatus._();
  @$core.override
  PluginStatus createEmptyInstance() => create();
  static $pb.PbList<PluginStatus> createRepeated() =>
      $pb.PbList<PluginStatus>();
  @$core.pragma('dart2js:noInline')
  static PluginStatus getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PluginStatus>(create);
  static PluginStatus? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get enable => $_getSZ(1);
  @$pb.TagNumber(2)
  set enable($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEnable() => $_has(1);
  @$pb.TagNumber(2)
  void clearEnable() => $_clearField(2);
}

class DrawConfig extends $pb.GeneratedMessage {
  factory DrawConfig({
    $core.Iterable<$core.String>? styleOptions,
    $core.String? defaultStyle,
    $core.Iterable<$core.String>? qualityOptions,
    $core.String? defaultQuality,
    $core.String? model,
    $core.Iterable<$core.String>? sizeOptions,
    $core.String? defaultSize,
    $core.int? drawN,
  }) {
    final result = create();
    if (styleOptions != null) result.styleOptions.addAll(styleOptions);
    if (defaultStyle != null) result.defaultStyle = defaultStyle;
    if (qualityOptions != null) result.qualityOptions.addAll(qualityOptions);
    if (defaultQuality != null) result.defaultQuality = defaultQuality;
    if (model != null) result.model = model;
    if (sizeOptions != null) result.sizeOptions.addAll(sizeOptions);
    if (defaultSize != null) result.defaultSize = defaultSize;
    if (drawN != null) result.drawN = drawN;
    return result;
  }

  DrawConfig._();

  factory DrawConfig.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DrawConfig.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DrawConfig',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'styleOptions')
    ..aOS(2, _omitFieldNames ? '' : 'defaultStyle')
    ..pPS(3, _omitFieldNames ? '' : 'qualityOptions')
    ..aOS(4, _omitFieldNames ? '' : 'defaultQuality')
    ..aOS(5, _omitFieldNames ? '' : 'model')
    ..pPS(6, _omitFieldNames ? '' : 'sizeOptions')
    ..aOS(7, _omitFieldNames ? '' : 'defaultSize')
    ..a<$core.int>(8, _omitFieldNames ? '' : 'drawN', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DrawConfig clone() => DrawConfig()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DrawConfig copyWith(void Function(DrawConfig) updates) =>
      super.copyWith((message) => updates(message as DrawConfig)) as DrawConfig;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DrawConfig create() => DrawConfig._();
  @$core.override
  DrawConfig createEmptyInstance() => create();
  static $pb.PbList<DrawConfig> createRepeated() => $pb.PbList<DrawConfig>();
  @$core.pragma('dart2js:noInline')
  static DrawConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DrawConfig>(create);
  static DrawConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get styleOptions => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get defaultStyle => $_getSZ(1);
  @$pb.TagNumber(2)
  set defaultStyle($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDefaultStyle() => $_has(1);
  @$pb.TagNumber(2)
  void clearDefaultStyle() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get qualityOptions => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get defaultQuality => $_getSZ(3);
  @$pb.TagNumber(4)
  set defaultQuality($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDefaultQuality() => $_has(3);
  @$pb.TagNumber(4)
  void clearDefaultQuality() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get model => $_getSZ(4);
  @$pb.TagNumber(5)
  set model($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasModel() => $_has(4);
  @$pb.TagNumber(5)
  void clearModel() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<$core.String> get sizeOptions => $_getList(5);

  @$pb.TagNumber(7)
  $core.String get defaultSize => $_getSZ(6);
  @$pb.TagNumber(7)
  set defaultSize($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasDefaultSize() => $_has(6);
  @$pb.TagNumber(7)
  void clearDefaultSize() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get drawN => $_getIZ(7);
  @$pb.TagNumber(8)
  set drawN($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasDrawN() => $_has(7);
  @$pb.TagNumber(8)
  void clearDrawN() => $_clearField(8);
}

/// 硬件机器人绑定/解绑/绑定状态请求参数
class BindMasterParam extends $pb.GeneratedMessage {
  factory BindMasterParam({
    $core.String? master,
    $core.String? botDid,
  }) {
    final result = create();
    if (master != null) result.master = master;
    if (botDid != null) result.botDid = botDid;
    return result;
  }

  BindMasterParam._();

  factory BindMasterParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BindMasterParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BindMasterParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'master')
    ..aOS(2, _omitFieldNames ? '' : 'botDid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BindMasterParam clone() => BindMasterParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BindMasterParam copyWith(void Function(BindMasterParam) updates) =>
      super.copyWith((message) => updates(message as BindMasterParam))
          as BindMasterParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BindMasterParam create() => BindMasterParam._();
  @$core.override
  BindMasterParam createEmptyInstance() => create();
  static $pb.PbList<BindMasterParam> createRepeated() =>
      $pb.PbList<BindMasterParam>();
  @$core.pragma('dart2js:noInline')
  static BindMasterParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BindMasterParam>(create);
  static BindMasterParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get master => $_getSZ(0);
  @$pb.TagNumber(1)
  set master($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMaster() => $_has(0);
  @$pb.TagNumber(1)
  void clearMaster() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get botDid => $_getSZ(1);
  @$pb.TagNumber(2)
  set botDid($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBotDid() => $_has(1);
  @$pb.TagNumber(2)
  void clearBotDid() => $_clearField(2);
}

class BotBindStatus extends $pb.GeneratedMessage {
  factory BotBindStatus({
    $core.String? master,
  }) {
    final result = create();
    if (master != null) result.master = master;
    return result;
  }

  BotBindStatus._();

  factory BotBindStatus.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BotBindStatus.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BotBindStatus',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'master')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotBindStatus clone() => BotBindStatus()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotBindStatus copyWith(void Function(BotBindStatus) updates) =>
      super.copyWith((message) => updates(message as BotBindStatus))
          as BotBindStatus;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BotBindStatus create() => BotBindStatus._();
  @$core.override
  BotBindStatus createEmptyInstance() => create();
  static $pb.PbList<BotBindStatus> createRepeated() =>
      $pb.PbList<BotBindStatus>();
  @$core.pragma('dart2js:noInline')
  static BotBindStatus getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BotBindStatus>(create);
  static BotBindStatus? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get master => $_getSZ(0);
  @$pb.TagNumber(1)
  set master($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMaster() => $_has(0);
  @$pb.TagNumber(1)
  void clearMaster() => $_clearField(1);
}

/// ///////////////////////// 训练机器人 ///////////////////////////
///  训练机器人参数
class TrainingBotParam extends $pb.GeneratedMessage {
  factory TrainingBotParam({
    $core.Iterable<$fixnum.Int64>? fileIdList,
    $core.String? botDid,
  }) {
    final result = create();
    if (fileIdList != null) result.fileIdList.addAll(fileIdList);
    if (botDid != null) result.botDid = botDid;
    return result;
  }

  TrainingBotParam._();

  factory TrainingBotParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TrainingBotParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TrainingBotParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..p<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'fileIdList', $pb.PbFieldType.K6)
    ..aOS(2, _omitFieldNames ? '' : 'botDid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TrainingBotParam clone() => TrainingBotParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TrainingBotParam copyWith(void Function(TrainingBotParam) updates) =>
      super.copyWith((message) => updates(message as TrainingBotParam))
          as TrainingBotParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TrainingBotParam create() => TrainingBotParam._();
  @$core.override
  TrainingBotParam createEmptyInstance() => create();
  static $pb.PbList<TrainingBotParam> createRepeated() =>
      $pb.PbList<TrainingBotParam>();
  @$core.pragma('dart2js:noInline')
  static TrainingBotParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TrainingBotParam>(create);
  static TrainingBotParam? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$fixnum.Int64> get fileIdList => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get botDid => $_getSZ(1);
  @$pb.TagNumber(2)
  set botDid($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBotDid() => $_has(1);
  @$pb.TagNumber(2)
  void clearBotDid() => $_clearField(2);
}

/// 训练状态
class BotTrainingStatus extends $pb.GeneratedMessage {
  factory BotTrainingStatus({
    $core.String? status,
    $core.int? memCount,
    $core.int? sliceCount,
    $core.String? msg,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (memCount != null) result.memCount = memCount;
    if (sliceCount != null) result.sliceCount = sliceCount;
    if (msg != null) result.msg = msg;
    return result;
  }

  BotTrainingStatus._();

  factory BotTrainingStatus.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BotTrainingStatus.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BotTrainingStatus',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'status')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'memCount', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'sliceCount', $pb.PbFieldType.O3)
    ..aOS(4, _omitFieldNames ? '' : 'msg')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotTrainingStatus clone() => BotTrainingStatus()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotTrainingStatus copyWith(void Function(BotTrainingStatus) updates) =>
      super.copyWith((message) => updates(message as BotTrainingStatus))
          as BotTrainingStatus;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BotTrainingStatus create() => BotTrainingStatus._();
  @$core.override
  BotTrainingStatus createEmptyInstance() => create();
  static $pb.PbList<BotTrainingStatus> createRepeated() =>
      $pb.PbList<BotTrainingStatus>();
  @$core.pragma('dart2js:noInline')
  static BotTrainingStatus getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BotTrainingStatus>(create);
  static BotTrainingStatus? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get memCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set memCount($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMemCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearMemCount() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get sliceCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set sliceCount($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSliceCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearSliceCount() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get msg => $_getSZ(3);
  @$pb.TagNumber(4)
  set msg($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMsg() => $_has(3);
  @$pb.TagNumber(4)
  void clearMsg() => $_clearField(4);
}

/// 训练文件
class BotTrainingFile extends $pb.GeneratedMessage {
  factory BotTrainingFile({
    $fixnum.Int64? fileId,
    $core.String? userDid,
    $core.String? botDid,
    $core.String? content,
    $core.String? filePath,
    $core.String? title,
    $fixnum.Int64? size,
    $core.String? type,
    $core.int? isUse,
    $core.String? digest,
    $fixnum.Int64? trainingTime,
    $fixnum.Int64? createdAt,
    $fixnum.Int64? updatedAt,
  }) {
    final result = create();
    if (fileId != null) result.fileId = fileId;
    if (userDid != null) result.userDid = userDid;
    if (botDid != null) result.botDid = botDid;
    if (content != null) result.content = content;
    if (filePath != null) result.filePath = filePath;
    if (title != null) result.title = title;
    if (size != null) result.size = size;
    if (type != null) result.type = type;
    if (isUse != null) result.isUse = isUse;
    if (digest != null) result.digest = digest;
    if (trainingTime != null) result.trainingTime = trainingTime;
    if (createdAt != null) result.createdAt = createdAt;
    if (updatedAt != null) result.updatedAt = updatedAt;
    return result;
  }

  BotTrainingFile._();

  factory BotTrainingFile.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BotTrainingFile.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BotTrainingFile',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'fileId')
    ..aOS(2, _omitFieldNames ? '' : 'userDid')
    ..aOS(3, _omitFieldNames ? '' : 'botDid')
    ..aOS(4, _omitFieldNames ? '' : 'content')
    ..aOS(5, _omitFieldNames ? '' : 'filePath')
    ..aOS(6, _omitFieldNames ? '' : 'title')
    ..aInt64(7, _omitFieldNames ? '' : 'size')
    ..aOS(8, _omitFieldNames ? '' : 'type')
    ..a<$core.int>(9, _omitFieldNames ? '' : 'isUse', $pb.PbFieldType.O3)
    ..aOS(10, _omitFieldNames ? '' : 'digest')
    ..aInt64(11, _omitFieldNames ? '' : 'trainingTime')
    ..aInt64(12, _omitFieldNames ? '' : 'createdAt')
    ..aInt64(13, _omitFieldNames ? '' : 'updatedAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotTrainingFile clone() => BotTrainingFile()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotTrainingFile copyWith(void Function(BotTrainingFile) updates) =>
      super.copyWith((message) => updates(message as BotTrainingFile))
          as BotTrainingFile;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BotTrainingFile create() => BotTrainingFile._();
  @$core.override
  BotTrainingFile createEmptyInstance() => create();
  static $pb.PbList<BotTrainingFile> createRepeated() =>
      $pb.PbList<BotTrainingFile>();
  @$core.pragma('dart2js:noInline')
  static BotTrainingFile getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BotTrainingFile>(create);
  static BotTrainingFile? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get fileId => $_getI64(0);
  @$pb.TagNumber(1)
  set fileId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFileId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get userDid => $_getSZ(1);
  @$pb.TagNumber(2)
  set userDid($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserDid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserDid() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get botDid => $_getSZ(2);
  @$pb.TagNumber(3)
  set botDid($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasBotDid() => $_has(2);
  @$pb.TagNumber(3)
  void clearBotDid() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get content => $_getSZ(3);
  @$pb.TagNumber(4)
  set content($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasContent() => $_has(3);
  @$pb.TagNumber(4)
  void clearContent() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get filePath => $_getSZ(4);
  @$pb.TagNumber(5)
  set filePath($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFilePath() => $_has(4);
  @$pb.TagNumber(5)
  void clearFilePath() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get title => $_getSZ(5);
  @$pb.TagNumber(6)
  set title($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTitle() => $_has(5);
  @$pb.TagNumber(6)
  void clearTitle() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get size => $_getI64(6);
  @$pb.TagNumber(7)
  set size($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasSize() => $_has(6);
  @$pb.TagNumber(7)
  void clearSize() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get type => $_getSZ(7);
  @$pb.TagNumber(8)
  set type($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasType() => $_has(7);
  @$pb.TagNumber(8)
  void clearType() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get isUse => $_getIZ(8);
  @$pb.TagNumber(9)
  set isUse($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasIsUse() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsUse() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get digest => $_getSZ(9);
  @$pb.TagNumber(10)
  set digest($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasDigest() => $_has(9);
  @$pb.TagNumber(10)
  void clearDigest() => $_clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get trainingTime => $_getI64(10);
  @$pb.TagNumber(11)
  set trainingTime($fixnum.Int64 value) => $_setInt64(10, value);
  @$pb.TagNumber(11)
  $core.bool hasTrainingTime() => $_has(10);
  @$pb.TagNumber(11)
  void clearTrainingTime() => $_clearField(11);

  @$pb.TagNumber(12)
  $fixnum.Int64 get createdAt => $_getI64(11);
  @$pb.TagNumber(12)
  set createdAt($fixnum.Int64 value) => $_setInt64(11, value);
  @$pb.TagNumber(12)
  $core.bool hasCreatedAt() => $_has(11);
  @$pb.TagNumber(12)
  void clearCreatedAt() => $_clearField(12);

  @$pb.TagNumber(13)
  $fixnum.Int64 get updatedAt => $_getI64(12);
  @$pb.TagNumber(13)
  set updatedAt($fixnum.Int64 value) => $_setInt64(12, value);
  @$pb.TagNumber(13)
  $core.bool hasUpdatedAt() => $_has(12);
  @$pb.TagNumber(13)
  void clearUpdatedAt() => $_clearField(13);
}

class BotTrainingFileList extends $pb.GeneratedMessage {
  factory BotTrainingFileList({
    $core.Iterable<BotTrainingFile>? trainingFileList,
  }) {
    final result = create();
    if (trainingFileList != null)
      result.trainingFileList.addAll(trainingFileList);
    return result;
  }

  BotTrainingFileList._();

  factory BotTrainingFileList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BotTrainingFileList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BotTrainingFileList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..pc<BotTrainingFile>(
        1, _omitFieldNames ? '' : 'trainingFileList', $pb.PbFieldType.PM,
        subBuilder: BotTrainingFile.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotTrainingFileList clone() => BotTrainingFileList()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotTrainingFileList copyWith(void Function(BotTrainingFileList) updates) =>
      super.copyWith((message) => updates(message as BotTrainingFileList))
          as BotTrainingFileList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BotTrainingFileList create() => BotTrainingFileList._();
  @$core.override
  BotTrainingFileList createEmptyInstance() => create();
  static $pb.PbList<BotTrainingFileList> createRepeated() =>
      $pb.PbList<BotTrainingFileList>();
  @$core.pragma('dart2js:noInline')
  static BotTrainingFileList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BotTrainingFileList>(create);
  static BotTrainingFileList? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<BotTrainingFile> get trainingFileList => $_getList(0);
}

class TrainingFileListParam extends $pb.GeneratedMessage {
  factory TrainingFileListParam({
    $core.String? botDid,
    $core.bool? use,
    $3.Pagination? pagination,
  }) {
    final result = create();
    if (botDid != null) result.botDid = botDid;
    if (use != null) result.use = use;
    if (pagination != null) result.pagination = pagination;
    return result;
  }

  TrainingFileListParam._();

  factory TrainingFileListParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TrainingFileListParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TrainingFileListParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'botDid')
    ..aOB(2, _omitFieldNames ? '' : 'use')
    ..aOM<$3.Pagination>(3, _omitFieldNames ? '' : 'pagination',
        subBuilder: $3.Pagination.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TrainingFileListParam clone() =>
      TrainingFileListParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TrainingFileListParam copyWith(
          void Function(TrainingFileListParam) updates) =>
      super.copyWith((message) => updates(message as TrainingFileListParam))
          as TrainingFileListParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TrainingFileListParam create() => TrainingFileListParam._();
  @$core.override
  TrainingFileListParam createEmptyInstance() => create();
  static $pb.PbList<TrainingFileListParam> createRepeated() =>
      $pb.PbList<TrainingFileListParam>();
  @$core.pragma('dart2js:noInline')
  static TrainingFileListParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TrainingFileListParam>(create);
  static TrainingFileListParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get botDid => $_getSZ(0);
  @$pb.TagNumber(1)
  set botDid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBotDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearBotDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get use => $_getBF(1);
  @$pb.TagNumber(2)
  set use($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUse() => $_has(1);
  @$pb.TagNumber(2)
  void clearUse() => $_clearField(2);

  @$pb.TagNumber(3)
  $3.Pagination get pagination => $_getN(2);
  @$pb.TagNumber(3)
  set pagination($3.Pagination value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasPagination() => $_has(2);
  @$pb.TagNumber(3)
  void clearPagination() => $_clearField(3);
  @$pb.TagNumber(3)
  $3.Pagination ensurePagination() => $_ensure(2);
}

class TrainingFileID extends $pb.GeneratedMessage {
  factory TrainingFileID({
    $fixnum.Int64? id,
  }) {
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  TrainingFileID._();

  factory TrainingFileID.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TrainingFileID.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TrainingFileID',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TrainingFileID clone() => TrainingFileID()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TrainingFileID copyWith(void Function(TrainingFileID) updates) =>
      super.copyWith((message) => updates(message as TrainingFileID))
          as TrainingFileID;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TrainingFileID create() => TrainingFileID._();
  @$core.override
  TrainingFileID createEmptyInstance() => create();
  static $pb.PbList<TrainingFileID> createRepeated() =>
      $pb.PbList<TrainingFileID>();
  @$core.pragma('dart2js:noInline')
  static TrainingFileID getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TrainingFileID>(create);
  static TrainingFileID? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

class DeleteTrainingFileParam extends $pb.GeneratedMessage {
  factory DeleteTrainingFileParam({
    $core.String? botDid,
    $fixnum.Int64? fileId,
  }) {
    final result = create();
    if (botDid != null) result.botDid = botDid;
    if (fileId != null) result.fileId = fileId;
    return result;
  }

  DeleteTrainingFileParam._();

  factory DeleteTrainingFileParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteTrainingFileParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteTrainingFileParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'botDid')
    ..aInt64(2, _omitFieldNames ? '' : 'fileId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteTrainingFileParam clone() =>
      DeleteTrainingFileParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteTrainingFileParam copyWith(
          void Function(DeleteTrainingFileParam) updates) =>
      super.copyWith((message) => updates(message as DeleteTrainingFileParam))
          as DeleteTrainingFileParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteTrainingFileParam create() => DeleteTrainingFileParam._();
  @$core.override
  DeleteTrainingFileParam createEmptyInstance() => create();
  static $pb.PbList<DeleteTrainingFileParam> createRepeated() =>
      $pb.PbList<DeleteTrainingFileParam>();
  @$core.pragma('dart2js:noInline')
  static DeleteTrainingFileParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteTrainingFileParam>(create);
  static DeleteTrainingFileParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get botDid => $_getSZ(0);
  @$pb.TagNumber(1)
  set botDid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBotDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearBotDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get fileId => $_getI64(1);
  @$pb.TagNumber(2)
  set fileId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFileId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFileId() => $_clearField(2);
}

class DeleteTrainingFilesParam extends $pb.GeneratedMessage {
  factory DeleteTrainingFilesParam({
    $core.String? botDid,
    $core.Iterable<$fixnum.Int64>? fileIdList,
  }) {
    final result = create();
    if (botDid != null) result.botDid = botDid;
    if (fileIdList != null) result.fileIdList.addAll(fileIdList);
    return result;
  }

  DeleteTrainingFilesParam._();

  factory DeleteTrainingFilesParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteTrainingFilesParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteTrainingFilesParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'botDid')
    ..p<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'fileIdList', $pb.PbFieldType.K6)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteTrainingFilesParam clone() =>
      DeleteTrainingFilesParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteTrainingFilesParam copyWith(
          void Function(DeleteTrainingFilesParam) updates) =>
      super.copyWith((message) => updates(message as DeleteTrainingFilesParam))
          as DeleteTrainingFilesParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteTrainingFilesParam create() => DeleteTrainingFilesParam._();
  @$core.override
  DeleteTrainingFilesParam createEmptyInstance() => create();
  static $pb.PbList<DeleteTrainingFilesParam> createRepeated() =>
      $pb.PbList<DeleteTrainingFilesParam>();
  @$core.pragma('dart2js:noInline')
  static DeleteTrainingFilesParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteTrainingFilesParam>(create);
  static DeleteTrainingFilesParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get botDid => $_getSZ(0);
  @$pb.TagNumber(1)
  set botDid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBotDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearBotDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$fixnum.Int64> get fileIdList => $_getList(1);
}

class UpdateCotentParam extends $pb.GeneratedMessage {
  factory UpdateCotentParam({
    $core.String? botDid,
    $fixnum.Int64? fileId,
    $core.String? content,
  }) {
    final result = create();
    if (botDid != null) result.botDid = botDid;
    if (fileId != null) result.fileId = fileId;
    if (content != null) result.content = content;
    return result;
  }

  UpdateCotentParam._();

  factory UpdateCotentParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateCotentParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateCotentParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'botDid')
    ..aInt64(2, _omitFieldNames ? '' : 'fileId')
    ..aOS(3, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateCotentParam clone() => UpdateCotentParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateCotentParam copyWith(void Function(UpdateCotentParam) updates) =>
      super.copyWith((message) => updates(message as UpdateCotentParam))
          as UpdateCotentParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateCotentParam create() => UpdateCotentParam._();
  @$core.override
  UpdateCotentParam createEmptyInstance() => create();
  static $pb.PbList<UpdateCotentParam> createRepeated() =>
      $pb.PbList<UpdateCotentParam>();
  @$core.pragma('dart2js:noInline')
  static UpdateCotentParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateCotentParam>(create);
  static UpdateCotentParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get botDid => $_getSZ(0);
  @$pb.TagNumber(1)
  set botDid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBotDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearBotDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get fileId => $_getI64(1);
  @$pb.TagNumber(2)
  set fileId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFileId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFileId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get content => $_getSZ(2);
  @$pb.TagNumber(3)
  set content($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => $_clearField(3);
}

class CreateCotentParam extends $pb.GeneratedMessage {
  factory CreateCotentParam({
    $core.String? botDid,
    $core.String? content,
  }) {
    final result = create();
    if (botDid != null) result.botDid = botDid;
    if (content != null) result.content = content;
    return result;
  }

  CreateCotentParam._();

  factory CreateCotentParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateCotentParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateCotentParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'botDid')
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateCotentParam clone() => CreateCotentParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateCotentParam copyWith(void Function(CreateCotentParam) updates) =>
      super.copyWith((message) => updates(message as CreateCotentParam))
          as CreateCotentParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateCotentParam create() => CreateCotentParam._();
  @$core.override
  CreateCotentParam createEmptyInstance() => create();
  static $pb.PbList<CreateCotentParam> createRepeated() =>
      $pb.PbList<CreateCotentParam>();
  @$core.pragma('dart2js:noInline')
  static CreateCotentParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateCotentParam>(create);
  static CreateCotentParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get botDid => $_getSZ(0);
  @$pb.TagNumber(1)
  set botDid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBotDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearBotDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => $_clearField(2);
}

class EditDigestParam extends $pb.GeneratedMessage {
  factory EditDigestParam({
    $fixnum.Int64? fileId,
    $core.String? botDid,
    $core.String? digest,
  }) {
    final result = create();
    if (fileId != null) result.fileId = fileId;
    if (botDid != null) result.botDid = botDid;
    if (digest != null) result.digest = digest;
    return result;
  }

  EditDigestParam._();

  factory EditDigestParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EditDigestParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EditDigestParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'fileId')
    ..aOS(2, _omitFieldNames ? '' : 'botDid')
    ..aOS(3, _omitFieldNames ? '' : 'digest')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EditDigestParam clone() => EditDigestParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EditDigestParam copyWith(void Function(EditDigestParam) updates) =>
      super.copyWith((message) => updates(message as EditDigestParam))
          as EditDigestParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EditDigestParam create() => EditDigestParam._();
  @$core.override
  EditDigestParam createEmptyInstance() => create();
  static $pb.PbList<EditDigestParam> createRepeated() =>
      $pb.PbList<EditDigestParam>();
  @$core.pragma('dart2js:noInline')
  static EditDigestParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EditDigestParam>(create);
  static EditDigestParam? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get fileId => $_getI64(0);
  @$pb.TagNumber(1)
  set fileId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFileId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get botDid => $_getSZ(1);
  @$pb.TagNumber(2)
  set botDid($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBotDid() => $_has(1);
  @$pb.TagNumber(2)
  void clearBotDid() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get digest => $_getSZ(2);
  @$pb.TagNumber(3)
  set digest($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDigest() => $_has(2);
  @$pb.TagNumber(3)
  void clearDigest() => $_clearField(3);
}

class CreateTrainingFileParam extends $pb.GeneratedMessage {
  factory CreateTrainingFileParam({
    $core.String? botDid,
    $core.String? filename,
    $core.List<$core.int>? fileContent,
  }) {
    final result = create();
    if (botDid != null) result.botDid = botDid;
    if (filename != null) result.filename = filename;
    if (fileContent != null) result.fileContent = fileContent;
    return result;
  }

  CreateTrainingFileParam._();

  factory CreateTrainingFileParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateTrainingFileParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateTrainingFileParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'botDid')
    ..aOS(2, _omitFieldNames ? '' : 'filename')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'fileContent', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateTrainingFileParam clone() =>
      CreateTrainingFileParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateTrainingFileParam copyWith(
          void Function(CreateTrainingFileParam) updates) =>
      super.copyWith((message) => updates(message as CreateTrainingFileParam))
          as CreateTrainingFileParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateTrainingFileParam create() => CreateTrainingFileParam._();
  @$core.override
  CreateTrainingFileParam createEmptyInstance() => create();
  static $pb.PbList<CreateTrainingFileParam> createRepeated() =>
      $pb.PbList<CreateTrainingFileParam>();
  @$core.pragma('dart2js:noInline')
  static CreateTrainingFileParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateTrainingFileParam>(create);
  static CreateTrainingFileParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get botDid => $_getSZ(0);
  @$pb.TagNumber(1)
  set botDid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBotDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearBotDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get filename => $_getSZ(1);
  @$pb.TagNumber(2)
  set filename($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFilename() => $_has(1);
  @$pb.TagNumber(2)
  void clearFilename() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get fileContent => $_getN(2);
  @$pb.TagNumber(3)
  set fileContent($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFileContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearFileContent() => $_clearField(3);
}

/// ///////////////////////// 机器人插件 ///////////////////////////
class Funcation extends $pb.GeneratedMessage {
  factory Funcation({
    $core.String? name,
    $core.String? enable,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (enable != null) result.enable = enable;
    return result;
  }

  Funcation._();

  factory Funcation.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Funcation.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Funcation',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'enable')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Funcation clone() => Funcation()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Funcation copyWith(void Function(Funcation) updates) =>
      super.copyWith((message) => updates(message as Funcation)) as Funcation;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Funcation create() => Funcation._();
  @$core.override
  Funcation createEmptyInstance() => create();
  static $pb.PbList<Funcation> createRepeated() => $pb.PbList<Funcation>();
  @$core.pragma('dart2js:noInline')
  static Funcation getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Funcation>(create);
  static Funcation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get enable => $_getSZ(1);
  @$pb.TagNumber(2)
  set enable($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEnable() => $_has(1);
  @$pb.TagNumber(2)
  void clearEnable() => $_clearField(2);
}

class FuncationList extends $pb.GeneratedMessage {
  factory FuncationList({
    $core.Iterable<Funcation>? funcationList,
  }) {
    final result = create();
    if (funcationList != null) result.funcationList.addAll(funcationList);
    return result;
  }

  FuncationList._();

  factory FuncationList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FuncationList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FuncationList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..pc<Funcation>(
        1, _omitFieldNames ? '' : 'funcationList', $pb.PbFieldType.PM,
        subBuilder: Funcation.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FuncationList clone() => FuncationList()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FuncationList copyWith(void Function(FuncationList) updates) =>
      super.copyWith((message) => updates(message as FuncationList))
          as FuncationList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FuncationList create() => FuncationList._();
  @$core.override
  FuncationList createEmptyInstance() => create();
  static $pb.PbList<FuncationList> createRepeated() =>
      $pb.PbList<FuncationList>();
  @$core.pragma('dart2js:noInline')
  static FuncationList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FuncationList>(create);
  static FuncationList? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Funcation> get funcationList => $_getList(0);
}

class BotDrawConfig extends $pb.GeneratedMessage {
  factory BotDrawConfig({
    $core.Iterable<$core.String>? drawStyle,
    $core.String? drawStyleDefault,
    $core.Iterable<$core.String>? drawQuality,
    $core.String? drawQualityDefault,
    $core.String? drawModel,
    $core.Iterable<$core.String>? drawSize,
    $core.String? drawSizeDefault,
    $core.int? drawN,
  }) {
    final result = create();
    if (drawStyle != null) result.drawStyle.addAll(drawStyle);
    if (drawStyleDefault != null) result.drawStyleDefault = drawStyleDefault;
    if (drawQuality != null) result.drawQuality.addAll(drawQuality);
    if (drawQualityDefault != null)
      result.drawQualityDefault = drawQualityDefault;
    if (drawModel != null) result.drawModel = drawModel;
    if (drawSize != null) result.drawSize.addAll(drawSize);
    if (drawSizeDefault != null) result.drawSizeDefault = drawSizeDefault;
    if (drawN != null) result.drawN = drawN;
    return result;
  }

  BotDrawConfig._();

  factory BotDrawConfig.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BotDrawConfig.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BotDrawConfig',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'drawStyle')
    ..aOS(2, _omitFieldNames ? '' : 'drawStyleDefault')
    ..pPS(3, _omitFieldNames ? '' : 'drawQuality')
    ..aOS(4, _omitFieldNames ? '' : 'drawQualityDefault')
    ..aOS(5, _omitFieldNames ? '' : 'drawModel')
    ..pPS(6, _omitFieldNames ? '' : 'drawSize')
    ..aOS(7, _omitFieldNames ? '' : 'drawSizeDefault')
    ..a<$core.int>(8, _omitFieldNames ? '' : 'drawN', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotDrawConfig clone() => BotDrawConfig()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotDrawConfig copyWith(void Function(BotDrawConfig) updates) =>
      super.copyWith((message) => updates(message as BotDrawConfig))
          as BotDrawConfig;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BotDrawConfig create() => BotDrawConfig._();
  @$core.override
  BotDrawConfig createEmptyInstance() => create();
  static $pb.PbList<BotDrawConfig> createRepeated() =>
      $pb.PbList<BotDrawConfig>();
  @$core.pragma('dart2js:noInline')
  static BotDrawConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BotDrawConfig>(create);
  static BotDrawConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get drawStyle => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get drawStyleDefault => $_getSZ(1);
  @$pb.TagNumber(2)
  set drawStyleDefault($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDrawStyleDefault() => $_has(1);
  @$pb.TagNumber(2)
  void clearDrawStyleDefault() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get drawQuality => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get drawQualityDefault => $_getSZ(3);
  @$pb.TagNumber(4)
  set drawQualityDefault($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDrawQualityDefault() => $_has(3);
  @$pb.TagNumber(4)
  void clearDrawQualityDefault() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get drawModel => $_getSZ(4);
  @$pb.TagNumber(5)
  set drawModel($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDrawModel() => $_has(4);
  @$pb.TagNumber(5)
  void clearDrawModel() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<$core.String> get drawSize => $_getList(5);

  @$pb.TagNumber(7)
  $core.String get drawSizeDefault => $_getSZ(6);
  @$pb.TagNumber(7)
  set drawSizeDefault($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasDrawSizeDefault() => $_has(6);
  @$pb.TagNumber(7)
  void clearDrawSizeDefault() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get drawN => $_getIZ(7);
  @$pb.TagNumber(8)
  set drawN($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasDrawN() => $_has(7);
  @$pb.TagNumber(8)
  void clearDrawN() => $_clearField(8);
}

class CreatePluginParam extends $pb.GeneratedMessage {
  factory CreatePluginParam({
    $core.String? botDid,
    $core.String? name,
    $core.String? type,
    $core.String? url,
    $core.String? functionDescription,
    $core.String? drawStyle,
    $core.String? drawQuality,
    $core.String? drawSize,
    $core.String? usePluginSearch,
    $core.String? usePluginPython,
    $core.String? usePluginDraw,
  }) {
    final result = create();
    if (botDid != null) result.botDid = botDid;
    if (name != null) result.name = name;
    if (type != null) result.type = type;
    if (url != null) result.url = url;
    if (functionDescription != null)
      result.functionDescription = functionDescription;
    if (drawStyle != null) result.drawStyle = drawStyle;
    if (drawQuality != null) result.drawQuality = drawQuality;
    if (drawSize != null) result.drawSize = drawSize;
    if (usePluginSearch != null) result.usePluginSearch = usePluginSearch;
    if (usePluginPython != null) result.usePluginPython = usePluginPython;
    if (usePluginDraw != null) result.usePluginDraw = usePluginDraw;
    return result;
  }

  CreatePluginParam._();

  factory CreatePluginParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreatePluginParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreatePluginParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'botDid')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'type')
    ..aOS(4, _omitFieldNames ? '' : 'url')
    ..aOS(5, _omitFieldNames ? '' : 'functionDescription')
    ..aOS(6, _omitFieldNames ? '' : 'drawStyle')
    ..aOS(7, _omitFieldNames ? '' : 'drawQuality')
    ..aOS(8, _omitFieldNames ? '' : 'drawSize')
    ..aOS(9, _omitFieldNames ? '' : 'usePluginSearch')
    ..aOS(10, _omitFieldNames ? '' : 'usePluginPython')
    ..aOS(11, _omitFieldNames ? '' : 'usePluginDraw')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreatePluginParam clone() => CreatePluginParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreatePluginParam copyWith(void Function(CreatePluginParam) updates) =>
      super.copyWith((message) => updates(message as CreatePluginParam))
          as CreatePluginParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePluginParam create() => CreatePluginParam._();
  @$core.override
  CreatePluginParam createEmptyInstance() => create();
  static $pb.PbList<CreatePluginParam> createRepeated() =>
      $pb.PbList<CreatePluginParam>();
  @$core.pragma('dart2js:noInline')
  static CreatePluginParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreatePluginParam>(create);
  static CreatePluginParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get botDid => $_getSZ(0);
  @$pb.TagNumber(1)
  set botDid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBotDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearBotDid() => $_clearField(1);

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
  $core.String get url => $_getSZ(3);
  @$pb.TagNumber(4)
  set url($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearUrl() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get functionDescription => $_getSZ(4);
  @$pb.TagNumber(5)
  set functionDescription($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFunctionDescription() => $_has(4);
  @$pb.TagNumber(5)
  void clearFunctionDescription() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get drawStyle => $_getSZ(5);
  @$pb.TagNumber(6)
  set drawStyle($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDrawStyle() => $_has(5);
  @$pb.TagNumber(6)
  void clearDrawStyle() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get drawQuality => $_getSZ(6);
  @$pb.TagNumber(7)
  set drawQuality($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasDrawQuality() => $_has(6);
  @$pb.TagNumber(7)
  void clearDrawQuality() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get drawSize => $_getSZ(7);
  @$pb.TagNumber(8)
  set drawSize($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasDrawSize() => $_has(7);
  @$pb.TagNumber(8)
  void clearDrawSize() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get usePluginSearch => $_getSZ(8);
  @$pb.TagNumber(9)
  set usePluginSearch($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasUsePluginSearch() => $_has(8);
  @$pb.TagNumber(9)
  void clearUsePluginSearch() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get usePluginPython => $_getSZ(9);
  @$pb.TagNumber(10)
  set usePluginPython($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasUsePluginPython() => $_has(9);
  @$pb.TagNumber(10)
  void clearUsePluginPython() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get usePluginDraw => $_getSZ(10);
  @$pb.TagNumber(11)
  set usePluginDraw($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasUsePluginDraw() => $_has(10);
  @$pb.TagNumber(11)
  void clearUsePluginDraw() => $_clearField(11);
}

class DeletePluginParam extends $pb.GeneratedMessage {
  factory DeletePluginParam({
    $core.String? uuid,
  }) {
    final result = create();
    if (uuid != null) result.uuid = uuid;
    return result;
  }

  DeletePluginParam._();

  factory DeletePluginParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeletePluginParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeletePluginParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeletePluginParam clone() => DeletePluginParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeletePluginParam copyWith(void Function(DeletePluginParam) updates) =>
      super.copyWith((message) => updates(message as DeletePluginParam))
          as DeletePluginParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeletePluginParam create() => DeletePluginParam._();
  @$core.override
  DeletePluginParam createEmptyInstance() => create();
  static $pb.PbList<DeletePluginParam> createRepeated() =>
      $pb.PbList<DeletePluginParam>();
  @$core.pragma('dart2js:noInline')
  static DeletePluginParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeletePluginParam>(create);
  static DeletePluginParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => $_clearField(1);
}

class EditPluginParam extends $pb.GeneratedMessage {
  factory EditPluginParam({
    $core.String? uuid,
    $core.String? botDid,
    $core.String? type,
    $core.String? url,
    $core.String? functionDescription,
  }) {
    final result = create();
    if (uuid != null) result.uuid = uuid;
    if (botDid != null) result.botDid = botDid;
    if (type != null) result.type = type;
    if (url != null) result.url = url;
    if (functionDescription != null)
      result.functionDescription = functionDescription;
    return result;
  }

  EditPluginParam._();

  factory EditPluginParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EditPluginParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EditPluginParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..aOS(2, _omitFieldNames ? '' : 'botDid')
    ..aOS(3, _omitFieldNames ? '' : 'type')
    ..aOS(4, _omitFieldNames ? '' : 'url')
    ..aOS(5, _omitFieldNames ? '' : 'functionDescription')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EditPluginParam clone() => EditPluginParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EditPluginParam copyWith(void Function(EditPluginParam) updates) =>
      super.copyWith((message) => updates(message as EditPluginParam))
          as EditPluginParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EditPluginParam create() => EditPluginParam._();
  @$core.override
  EditPluginParam createEmptyInstance() => create();
  static $pb.PbList<EditPluginParam> createRepeated() =>
      $pb.PbList<EditPluginParam>();
  @$core.pragma('dart2js:noInline')
  static EditPluginParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EditPluginParam>(create);
  static EditPluginParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get botDid => $_getSZ(1);
  @$pb.TagNumber(2)
  set botDid($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBotDid() => $_has(1);
  @$pb.TagNumber(2)
  void clearBotDid() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get type => $_getSZ(2);
  @$pb.TagNumber(3)
  set type($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get url => $_getSZ(3);
  @$pb.TagNumber(4)
  set url($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearUrl() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get functionDescription => $_getSZ(4);
  @$pb.TagNumber(5)
  set functionDescription($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFunctionDescription() => $_has(4);
  @$pb.TagNumber(5)
  void clearFunctionDescription() => $_clearField(5);
}

class PluginListParam extends $pb.GeneratedMessage {
  factory PluginListParam({
    $core.String? botDid,
    $core.String? name,
    $3.Pagination? pagination,
  }) {
    final result = create();
    if (botDid != null) result.botDid = botDid;
    if (name != null) result.name = name;
    if (pagination != null) result.pagination = pagination;
    return result;
  }

  PluginListParam._();

  factory PluginListParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PluginListParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PluginListParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'botDid')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOM<$3.Pagination>(3, _omitFieldNames ? '' : 'pagination',
        subBuilder: $3.Pagination.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PluginListParam clone() => PluginListParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PluginListParam copyWith(void Function(PluginListParam) updates) =>
      super.copyWith((message) => updates(message as PluginListParam))
          as PluginListParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PluginListParam create() => PluginListParam._();
  @$core.override
  PluginListParam createEmptyInstance() => create();
  static $pb.PbList<PluginListParam> createRepeated() =>
      $pb.PbList<PluginListParam>();
  @$core.pragma('dart2js:noInline')
  static PluginListParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PluginListParam>(create);
  static PluginListParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get botDid => $_getSZ(0);
  @$pb.TagNumber(1)
  set botDid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBotDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearBotDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $3.Pagination get pagination => $_getN(2);
  @$pb.TagNumber(3)
  set pagination($3.Pagination value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasPagination() => $_has(2);
  @$pb.TagNumber(3)
  void clearPagination() => $_clearField(3);
  @$pb.TagNumber(3)
  $3.Pagination ensurePagination() => $_ensure(2);
}

class PluginInfo extends $pb.GeneratedMessage {
  factory PluginInfo({
    $core.String? botDid,
    $core.String? uuid,
    $core.String? name,
    $core.String? method,
    $core.String? type,
    $core.String? url,
    $core.String? note,
    $core.String? functionName,
    $core.String? functionDescription,
    $core.String? drawStyle,
    $core.String? drawQuality,
    $core.String? drawModel,
    $core.String? drawSize,
    $core.int? drawN,
    $fixnum.Int64? createdAt,
  }) {
    final result = create();
    if (botDid != null) result.botDid = botDid;
    if (uuid != null) result.uuid = uuid;
    if (name != null) result.name = name;
    if (method != null) result.method = method;
    if (type != null) result.type = type;
    if (url != null) result.url = url;
    if (note != null) result.note = note;
    if (functionName != null) result.functionName = functionName;
    if (functionDescription != null)
      result.functionDescription = functionDescription;
    if (drawStyle != null) result.drawStyle = drawStyle;
    if (drawQuality != null) result.drawQuality = drawQuality;
    if (drawModel != null) result.drawModel = drawModel;
    if (drawSize != null) result.drawSize = drawSize;
    if (drawN != null) result.drawN = drawN;
    if (createdAt != null) result.createdAt = createdAt;
    return result;
  }

  PluginInfo._();

  factory PluginInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PluginInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PluginInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'botDid')
    ..aOS(2, _omitFieldNames ? '' : 'uuid')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'method')
    ..aOS(5, _omitFieldNames ? '' : 'type')
    ..aOS(6, _omitFieldNames ? '' : 'url')
    ..aOS(7, _omitFieldNames ? '' : 'note')
    ..aOS(8, _omitFieldNames ? '' : 'functionName')
    ..aOS(9, _omitFieldNames ? '' : 'functionDescription')
    ..aOS(10, _omitFieldNames ? '' : 'drawStyle')
    ..aOS(11, _omitFieldNames ? '' : 'drawQuality')
    ..aOS(12, _omitFieldNames ? '' : 'drawModel')
    ..aOS(13, _omitFieldNames ? '' : 'drawSize')
    ..a<$core.int>(14, _omitFieldNames ? '' : 'drawN', $pb.PbFieldType.O3)
    ..aInt64(15, _omitFieldNames ? '' : 'createdAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PluginInfo clone() => PluginInfo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PluginInfo copyWith(void Function(PluginInfo) updates) =>
      super.copyWith((message) => updates(message as PluginInfo)) as PluginInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PluginInfo create() => PluginInfo._();
  @$core.override
  PluginInfo createEmptyInstance() => create();
  static $pb.PbList<PluginInfo> createRepeated() => $pb.PbList<PluginInfo>();
  @$core.pragma('dart2js:noInline')
  static PluginInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PluginInfo>(create);
  static PluginInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get botDid => $_getSZ(0);
  @$pb.TagNumber(1)
  set botDid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBotDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearBotDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get uuid => $_getSZ(1);
  @$pb.TagNumber(2)
  set uuid($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUuid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUuid() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get method => $_getSZ(3);
  @$pb.TagNumber(4)
  set method($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMethod() => $_has(3);
  @$pb.TagNumber(4)
  void clearMethod() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get type => $_getSZ(4);
  @$pb.TagNumber(5)
  set type($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasType() => $_has(4);
  @$pb.TagNumber(5)
  void clearType() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get url => $_getSZ(5);
  @$pb.TagNumber(6)
  set url($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearUrl() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get note => $_getSZ(6);
  @$pb.TagNumber(7)
  set note($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasNote() => $_has(6);
  @$pb.TagNumber(7)
  void clearNote() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get functionName => $_getSZ(7);
  @$pb.TagNumber(8)
  set functionName($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasFunctionName() => $_has(7);
  @$pb.TagNumber(8)
  void clearFunctionName() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get functionDescription => $_getSZ(8);
  @$pb.TagNumber(9)
  set functionDescription($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasFunctionDescription() => $_has(8);
  @$pb.TagNumber(9)
  void clearFunctionDescription() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get drawStyle => $_getSZ(9);
  @$pb.TagNumber(10)
  set drawStyle($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasDrawStyle() => $_has(9);
  @$pb.TagNumber(10)
  void clearDrawStyle() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get drawQuality => $_getSZ(10);
  @$pb.TagNumber(11)
  set drawQuality($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasDrawQuality() => $_has(10);
  @$pb.TagNumber(11)
  void clearDrawQuality() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get drawModel => $_getSZ(11);
  @$pb.TagNumber(12)
  set drawModel($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasDrawModel() => $_has(11);
  @$pb.TagNumber(12)
  void clearDrawModel() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get drawSize => $_getSZ(12);
  @$pb.TagNumber(13)
  set drawSize($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasDrawSize() => $_has(12);
  @$pb.TagNumber(13)
  void clearDrawSize() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.int get drawN => $_getIZ(13);
  @$pb.TagNumber(14)
  set drawN($core.int value) => $_setSignedInt32(13, value);
  @$pb.TagNumber(14)
  $core.bool hasDrawN() => $_has(13);
  @$pb.TagNumber(14)
  void clearDrawN() => $_clearField(14);

  @$pb.TagNumber(15)
  $fixnum.Int64 get createdAt => $_getI64(14);
  @$pb.TagNumber(15)
  set createdAt($fixnum.Int64 value) => $_setInt64(14, value);
  @$pb.TagNumber(15)
  $core.bool hasCreatedAt() => $_has(14);
  @$pb.TagNumber(15)
  void clearCreatedAt() => $_clearField(15);
}

class PluginInfoList extends $pb.GeneratedMessage {
  factory PluginInfoList({
    $fixnum.Int64? total,
    $core.Iterable<PluginInfo>? pluginInfoList,
  }) {
    final result = create();
    if (total != null) result.total = total;
    if (pluginInfoList != null) result.pluginInfoList.addAll(pluginInfoList);
    return result;
  }

  PluginInfoList._();

  factory PluginInfoList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PluginInfoList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PluginInfoList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'total')
    ..pc<PluginInfo>(
        2, _omitFieldNames ? '' : 'pluginInfoList', $pb.PbFieldType.PM,
        subBuilder: PluginInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PluginInfoList clone() => PluginInfoList()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PluginInfoList copyWith(void Function(PluginInfoList) updates) =>
      super.copyWith((message) => updates(message as PluginInfoList))
          as PluginInfoList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PluginInfoList create() => PluginInfoList._();
  @$core.override
  PluginInfoList createEmptyInstance() => create();
  static $pb.PbList<PluginInfoList> createRepeated() =>
      $pb.PbList<PluginInfoList>();
  @$core.pragma('dart2js:noInline')
  static PluginInfoList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PluginInfoList>(create);
  static PluginInfoList? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get total => $_getI64(0);
  @$pb.TagNumber(1)
  set total($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotal() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotal() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<PluginInfo> get pluginInfoList => $_getList(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
