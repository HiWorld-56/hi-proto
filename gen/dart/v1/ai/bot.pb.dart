// This is a generated file - do not edit.
//
// Generated from v1/ai/bot.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../hi.pb.dart' as $2;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// ///////////////////////////// 机器人 ///////////////////////////////
///  机器人配置
class BotConfig extends $pb.GeneratedMessage {
  factory BotConfig({
    $core.String? systemPrompt,
    $core.String? userPrompt,
    $core.double? freedom,
    $core.String? gptModel,
    $core.String? sttModel,
    $core.String? sttLang,
    $core.String? ttsModel,
    $core.String? embeddingModel,
    $core.int? qaNum,
    $core.String? memModel,
    $core.String? useMem,
    $core.String? usePluginSearch,
    $core.String? usePluginPython,
    $core.String? usePluginDraw,
  }) {
    final result = create();
    if (systemPrompt != null) result.systemPrompt = systemPrompt;
    if (userPrompt != null) result.userPrompt = userPrompt;
    if (freedom != null) result.freedom = freedom;
    if (gptModel != null) result.gptModel = gptModel;
    if (sttModel != null) result.sttModel = sttModel;
    if (sttLang != null) result.sttLang = sttLang;
    if (ttsModel != null) result.ttsModel = ttsModel;
    if (embeddingModel != null) result.embeddingModel = embeddingModel;
    if (qaNum != null) result.qaNum = qaNum;
    if (memModel != null) result.memModel = memModel;
    if (useMem != null) result.useMem = useMem;
    if (usePluginSearch != null) result.usePluginSearch = usePluginSearch;
    if (usePluginPython != null) result.usePluginPython = usePluginPython;
    if (usePluginDraw != null) result.usePluginDraw = usePluginDraw;
    return result;
  }

  BotConfig._();

  factory BotConfig.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BotConfig.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BotConfig',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'systemPrompt')
    ..aOS(2, _omitFieldNames ? '' : 'userPrompt')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'freedom', $pb.PbFieldType.OF)
    ..aOS(4, _omitFieldNames ? '' : 'gptModel')
    ..aOS(5, _omitFieldNames ? '' : 'sttModel')
    ..aOS(6, _omitFieldNames ? '' : 'sttLang')
    ..aOS(7, _omitFieldNames ? '' : 'ttsModel')
    ..aOS(8, _omitFieldNames ? '' : 'embeddingModel')
    ..a<$core.int>(9, _omitFieldNames ? '' : 'qaNum', $pb.PbFieldType.O3)
    ..aOS(10, _omitFieldNames ? '' : 'memModel')
    ..aOS(11, _omitFieldNames ? '' : 'useMem')
    ..aOS(12, _omitFieldNames ? '' : 'usePluginSearch')
    ..aOS(13, _omitFieldNames ? '' : 'usePluginPython')
    ..aOS(14, _omitFieldNames ? '' : 'usePluginDraw')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotConfig clone() => BotConfig()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotConfig copyWith(void Function(BotConfig) updates) =>
      super.copyWith((message) => updates(message as BotConfig)) as BotConfig;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BotConfig create() => BotConfig._();
  @$core.override
  BotConfig createEmptyInstance() => create();
  static $pb.PbList<BotConfig> createRepeated() => $pb.PbList<BotConfig>();
  @$core.pragma('dart2js:noInline')
  static BotConfig getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BotConfig>(create);
  static BotConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get systemPrompt => $_getSZ(0);
  @$pb.TagNumber(1)
  set systemPrompt($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSystemPrompt() => $_has(0);
  @$pb.TagNumber(1)
  void clearSystemPrompt() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get userPrompt => $_getSZ(1);
  @$pb.TagNumber(2)
  set userPrompt($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserPrompt() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserPrompt() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get freedom => $_getN(2);
  @$pb.TagNumber(3)
  set freedom($core.double value) => $_setFloat(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFreedom() => $_has(2);
  @$pb.TagNumber(3)
  void clearFreedom() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get gptModel => $_getSZ(3);
  @$pb.TagNumber(4)
  set gptModel($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGptModel() => $_has(3);
  @$pb.TagNumber(4)
  void clearGptModel() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get sttModel => $_getSZ(4);
  @$pb.TagNumber(5)
  set sttModel($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasSttModel() => $_has(4);
  @$pb.TagNumber(5)
  void clearSttModel() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get sttLang => $_getSZ(5);
  @$pb.TagNumber(6)
  set sttLang($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasSttLang() => $_has(5);
  @$pb.TagNumber(6)
  void clearSttLang() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get ttsModel => $_getSZ(6);
  @$pb.TagNumber(7)
  set ttsModel($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasTtsModel() => $_has(6);
  @$pb.TagNumber(7)
  void clearTtsModel() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get embeddingModel => $_getSZ(7);
  @$pb.TagNumber(8)
  set embeddingModel($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasEmbeddingModel() => $_has(7);
  @$pb.TagNumber(8)
  void clearEmbeddingModel() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get qaNum => $_getIZ(8);
  @$pb.TagNumber(9)
  set qaNum($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasQaNum() => $_has(8);
  @$pb.TagNumber(9)
  void clearQaNum() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get memModel => $_getSZ(9);
  @$pb.TagNumber(10)
  set memModel($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasMemModel() => $_has(9);
  @$pb.TagNumber(10)
  void clearMemModel() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get useMem => $_getSZ(10);
  @$pb.TagNumber(11)
  set useMem($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasUseMem() => $_has(10);
  @$pb.TagNumber(11)
  void clearUseMem() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get usePluginSearch => $_getSZ(11);
  @$pb.TagNumber(12)
  set usePluginSearch($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasUsePluginSearch() => $_has(11);
  @$pb.TagNumber(12)
  void clearUsePluginSearch() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get usePluginPython => $_getSZ(12);
  @$pb.TagNumber(13)
  set usePluginPython($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasUsePluginPython() => $_has(12);
  @$pb.TagNumber(13)
  void clearUsePluginPython() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.String get usePluginDraw => $_getSZ(13);
  @$pb.TagNumber(14)
  set usePluginDraw($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasUsePluginDraw() => $_has(13);
  @$pb.TagNumber(14)
  void clearUsePluginDraw() => $_clearField(14);
}

class BotExtra extends $pb.GeneratedMessage {
  factory BotExtra({
    $core.String? creatorDid,
    $core.String? apiKey,
    $core.String? note,
    $core.String? bindApiKey,
    $core.String? orgName,
    $core.String? orgLogo,
    $core.String? about,
    $core.String? orgBackground,
    $core.int? useTokens,
    $core.int? promptTokens,
    $core.int? memTokens,
    $fixnum.Int64? createdAt,
    $core.int? favorited,
  }) {
    final result = create();
    if (creatorDid != null) result.creatorDid = creatorDid;
    if (apiKey != null) result.apiKey = apiKey;
    if (note != null) result.note = note;
    if (bindApiKey != null) result.bindApiKey = bindApiKey;
    if (orgName != null) result.orgName = orgName;
    if (orgLogo != null) result.orgLogo = orgLogo;
    if (about != null) result.about = about;
    if (orgBackground != null) result.orgBackground = orgBackground;
    if (useTokens != null) result.useTokens = useTokens;
    if (promptTokens != null) result.promptTokens = promptTokens;
    if (memTokens != null) result.memTokens = memTokens;
    if (createdAt != null) result.createdAt = createdAt;
    if (favorited != null) result.favorited = favorited;
    return result;
  }

  BotExtra._();

  factory BotExtra.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BotExtra.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BotExtra',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'creatorDid')
    ..aOS(2, _omitFieldNames ? '' : 'apiKey')
    ..aOS(3, _omitFieldNames ? '' : 'note')
    ..aOS(4, _omitFieldNames ? '' : 'bindApiKey')
    ..aOS(5, _omitFieldNames ? '' : 'orgName')
    ..aOS(6, _omitFieldNames ? '' : 'orgLogo')
    ..aOS(7, _omitFieldNames ? '' : 'about')
    ..aOS(8, _omitFieldNames ? '' : 'orgBackground')
    ..a<$core.int>(9, _omitFieldNames ? '' : 'useTokens', $pb.PbFieldType.O3)
    ..a<$core.int>(
        10, _omitFieldNames ? '' : 'promptTokens', $pb.PbFieldType.O3)
    ..a<$core.int>(11, _omitFieldNames ? '' : 'memTokens', $pb.PbFieldType.O3)
    ..aInt64(12, _omitFieldNames ? '' : 'createdAt')
    ..a<$core.int>(13, _omitFieldNames ? '' : 'favorited', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotExtra clone() => BotExtra()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotExtra copyWith(void Function(BotExtra) updates) =>
      super.copyWith((message) => updates(message as BotExtra)) as BotExtra;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BotExtra create() => BotExtra._();
  @$core.override
  BotExtra createEmptyInstance() => create();
  static $pb.PbList<BotExtra> createRepeated() => $pb.PbList<BotExtra>();
  @$core.pragma('dart2js:noInline')
  static BotExtra getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BotExtra>(create);
  static BotExtra? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get creatorDid => $_getSZ(0);
  @$pb.TagNumber(1)
  set creatorDid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCreatorDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearCreatorDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get apiKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set apiKey($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasApiKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearApiKey() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get note => $_getSZ(2);
  @$pb.TagNumber(3)
  set note($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNote() => $_has(2);
  @$pb.TagNumber(3)
  void clearNote() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get bindApiKey => $_getSZ(3);
  @$pb.TagNumber(4)
  set bindApiKey($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBindApiKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearBindApiKey() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get orgName => $_getSZ(4);
  @$pb.TagNumber(5)
  set orgName($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasOrgName() => $_has(4);
  @$pb.TagNumber(5)
  void clearOrgName() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get orgLogo => $_getSZ(5);
  @$pb.TagNumber(6)
  set orgLogo($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasOrgLogo() => $_has(5);
  @$pb.TagNumber(6)
  void clearOrgLogo() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get about => $_getSZ(6);
  @$pb.TagNumber(7)
  set about($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasAbout() => $_has(6);
  @$pb.TagNumber(7)
  void clearAbout() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get orgBackground => $_getSZ(7);
  @$pb.TagNumber(8)
  set orgBackground($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasOrgBackground() => $_has(7);
  @$pb.TagNumber(8)
  void clearOrgBackground() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get useTokens => $_getIZ(8);
  @$pb.TagNumber(9)
  set useTokens($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasUseTokens() => $_has(8);
  @$pb.TagNumber(9)
  void clearUseTokens() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get promptTokens => $_getIZ(9);
  @$pb.TagNumber(10)
  set promptTokens($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasPromptTokens() => $_has(9);
  @$pb.TagNumber(10)
  void clearPromptTokens() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.int get memTokens => $_getIZ(10);
  @$pb.TagNumber(11)
  set memTokens($core.int value) => $_setSignedInt32(10, value);
  @$pb.TagNumber(11)
  $core.bool hasMemTokens() => $_has(10);
  @$pb.TagNumber(11)
  void clearMemTokens() => $_clearField(11);

  @$pb.TagNumber(12)
  $fixnum.Int64 get createdAt => $_getI64(11);
  @$pb.TagNumber(12)
  set createdAt($fixnum.Int64 value) => $_setInt64(11, value);
  @$pb.TagNumber(12)
  $core.bool hasCreatedAt() => $_has(11);
  @$pb.TagNumber(12)
  void clearCreatedAt() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.int get favorited => $_getIZ(12);
  @$pb.TagNumber(13)
  set favorited($core.int value) => $_setSignedInt32(12, value);
  @$pb.TagNumber(13)
  $core.bool hasFavorited() => $_has(12);
  @$pb.TagNumber(13)
  void clearFavorited() => $_clearField(13);
}

class BotInfo extends $pb.GeneratedMessage {
  factory BotInfo({
    $2.Unit? profile,
    BotConfig? config,
    BotExtra? extra,
  }) {
    final result = create();
    if (profile != null) result.profile = profile;
    if (config != null) result.config = config;
    if (extra != null) result.extra = extra;
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOM<$2.Unit>(1, _omitFieldNames ? '' : 'profile',
        subBuilder: $2.Unit.create)
    ..aOM<BotConfig>(2, _omitFieldNames ? '' : 'config',
        subBuilder: BotConfig.create)
    ..aOM<BotExtra>(3, _omitFieldNames ? '' : 'extra',
        subBuilder: BotExtra.create)
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
  $2.Unit get profile => $_getN(0);
  @$pb.TagNumber(1)
  set profile($2.Unit value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProfile() => $_has(0);
  @$pb.TagNumber(1)
  void clearProfile() => $_clearField(1);
  @$pb.TagNumber(1)
  $2.Unit ensureProfile() => $_ensure(0);

  @$pb.TagNumber(2)
  BotConfig get config => $_getN(1);
  @$pb.TagNumber(2)
  set config(BotConfig value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasConfig() => $_has(1);
  @$pb.TagNumber(2)
  void clearConfig() => $_clearField(2);
  @$pb.TagNumber(2)
  BotConfig ensureConfig() => $_ensure(1);

  @$pb.TagNumber(3)
  BotExtra get extra => $_getN(2);
  @$pb.TagNumber(3)
  set extra(BotExtra value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasExtra() => $_has(2);
  @$pb.TagNumber(3)
  void clearExtra() => $_clearField(3);
  @$pb.TagNumber(3)
  BotExtra ensureExtra() => $_ensure(2);
}

class LLMModelsResp extends $pb.GeneratedMessage {
  factory LLMModelsResp({
    $core.Iterable<$core.String>? models,
  }) {
    final result = create();
    if (models != null) result.models.addAll(models);
    return result;
  }

  LLMModelsResp._();

  factory LLMModelsResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LLMModelsResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LLMModelsResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'models')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LLMModelsResp clone() => LLMModelsResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LLMModelsResp copyWith(void Function(LLMModelsResp) updates) =>
      super.copyWith((message) => updates(message as LLMModelsResp))
          as LLMModelsResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LLMModelsResp create() => LLMModelsResp._();
  @$core.override
  LLMModelsResp createEmptyInstance() => create();
  static $pb.PbList<LLMModelsResp> createRepeated() =>
      $pb.PbList<LLMModelsResp>();
  @$core.pragma('dart2js:noInline')
  static LLMModelsResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LLMModelsResp>(create);
  static LLMModelsResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get models => $_getList(0);
}

class BotConfigResp extends $pb.GeneratedMessage {
  factory BotConfigResp({
    BotConfig? config,
  }) {
    final result = create();
    if (config != null) result.config = config;
    return result;
  }

  BotConfigResp._();

  factory BotConfigResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BotConfigResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BotConfigResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOM<BotConfig>(1, _omitFieldNames ? '' : 'config',
        subBuilder: BotConfig.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotConfigResp clone() => BotConfigResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotConfigResp copyWith(void Function(BotConfigResp) updates) =>
      super.copyWith((message) => updates(message as BotConfigResp))
          as BotConfigResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BotConfigResp create() => BotConfigResp._();
  @$core.override
  BotConfigResp createEmptyInstance() => create();
  static $pb.PbList<BotConfigResp> createRepeated() =>
      $pb.PbList<BotConfigResp>();
  @$core.pragma('dart2js:noInline')
  static BotConfigResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BotConfigResp>(create);
  static BotConfigResp? _defaultInstance;

  @$pb.TagNumber(1)
  BotConfig get config => $_getN(0);
  @$pb.TagNumber(1)
  set config(BotConfig value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasConfig() => $_has(0);
  @$pb.TagNumber(1)
  void clearConfig() => $_clearField(1);
  @$pb.TagNumber(1)
  BotConfig ensureConfig() => $_ensure(0);
}

class EmbeddingModelsResp extends $pb.GeneratedMessage {
  factory EmbeddingModelsResp({
    $core.Iterable<$core.String>? models,
  }) {
    final result = create();
    if (models != null) result.models.addAll(models);
    return result;
  }

  EmbeddingModelsResp._();

  factory EmbeddingModelsResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EmbeddingModelsResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EmbeddingModelsResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'models')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmbeddingModelsResp clone() => EmbeddingModelsResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmbeddingModelsResp copyWith(void Function(EmbeddingModelsResp) updates) =>
      super.copyWith((message) => updates(message as EmbeddingModelsResp))
          as EmbeddingModelsResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EmbeddingModelsResp create() => EmbeddingModelsResp._();
  @$core.override
  EmbeddingModelsResp createEmptyInstance() => create();
  static $pb.PbList<EmbeddingModelsResp> createRepeated() =>
      $pb.PbList<EmbeddingModelsResp>();
  @$core.pragma('dart2js:noInline')
  static EmbeddingModelsResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EmbeddingModelsResp>(create);
  static EmbeddingModelsResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get models => $_getList(0);
}

class AudioModelsResp extends $pb.GeneratedMessage {
  factory AudioModelsResp({
    $core.Iterable<$core.String>? models,
    $core.Iterable<$core.String>? sttLangs,
  }) {
    final result = create();
    if (models != null) result.models.addAll(models);
    if (sttLangs != null) result.sttLangs.addAll(sttLangs);
    return result;
  }

  AudioModelsResp._();

  factory AudioModelsResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AudioModelsResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AudioModelsResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'models')
    ..pPS(2, _omitFieldNames ? '' : 'sttLangs')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AudioModelsResp clone() => AudioModelsResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AudioModelsResp copyWith(void Function(AudioModelsResp) updates) =>
      super.copyWith((message) => updates(message as AudioModelsResp))
          as AudioModelsResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AudioModelsResp create() => AudioModelsResp._();
  @$core.override
  AudioModelsResp createEmptyInstance() => create();
  static $pb.PbList<AudioModelsResp> createRepeated() =>
      $pb.PbList<AudioModelsResp>();
  @$core.pragma('dart2js:noInline')
  static AudioModelsResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AudioModelsResp>(create);
  static AudioModelsResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get models => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get sttLangs => $_getList(1);
}

class TextModelsResp extends $pb.GeneratedMessage {
  factory TextModelsResp({
    $core.Iterable<$core.String>? models,
  }) {
    final result = create();
    if (models != null) result.models.addAll(models);
    return result;
  }

  TextModelsResp._();

  factory TextModelsResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TextModelsResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TextModelsResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'models')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextModelsResp clone() => TextModelsResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextModelsResp copyWith(void Function(TextModelsResp) updates) =>
      super.copyWith((message) => updates(message as TextModelsResp))
          as TextModelsResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TextModelsResp create() => TextModelsResp._();
  @$core.override
  TextModelsResp createEmptyInstance() => create();
  static $pb.PbList<TextModelsResp> createRepeated() =>
      $pb.PbList<TextModelsResp>();
  @$core.pragma('dart2js:noInline')
  static TextModelsResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TextModelsResp>(create);
  static TextModelsResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get models => $_getList(0);
}

class CreateBotReq extends $pb.GeneratedMessage {
  factory CreateBotReq({
    $core.String? did,
    $core.String? name,
    $core.String? type,
    $core.String? avatar,
    $core.String? background,
    $core.int? qaNum,
    $core.String? systemPrompt,
    $core.String? userPrompt,
    $core.double? freedom,
    $core.String? gptModel,
    $core.String? embeddingModel,
  }) {
    final result = create();
    if (did != null) result.did = did;
    if (name != null) result.name = name;
    if (type != null) result.type = type;
    if (avatar != null) result.avatar = avatar;
    if (background != null) result.background = background;
    if (qaNum != null) result.qaNum = qaNum;
    if (systemPrompt != null) result.systemPrompt = systemPrompt;
    if (userPrompt != null) result.userPrompt = userPrompt;
    if (freedom != null) result.freedom = freedom;
    if (gptModel != null) result.gptModel = gptModel;
    if (embeddingModel != null) result.embeddingModel = embeddingModel;
    return result;
  }

  CreateBotReq._();

  factory CreateBotReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateBotReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateBotReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'type')
    ..aOS(4, _omitFieldNames ? '' : 'avatar')
    ..aOS(5, _omitFieldNames ? '' : 'background')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'qaNum', $pb.PbFieldType.O3)
    ..aOS(7, _omitFieldNames ? '' : 'systemPrompt')
    ..aOS(8, _omitFieldNames ? '' : 'userPrompt')
    ..a<$core.double>(9, _omitFieldNames ? '' : 'freedom', $pb.PbFieldType.OF)
    ..aOS(10, _omitFieldNames ? '' : 'gptModel')
    ..aOS(11, _omitFieldNames ? '' : 'embeddingModel')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateBotReq clone() => CreateBotReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateBotReq copyWith(void Function(CreateBotReq) updates) =>
      super.copyWith((message) => updates(message as CreateBotReq))
          as CreateBotReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateBotReq create() => CreateBotReq._();
  @$core.override
  CreateBotReq createEmptyInstance() => create();
  static $pb.PbList<CreateBotReq> createRepeated() =>
      $pb.PbList<CreateBotReq>();
  @$core.pragma('dart2js:noInline')
  static CreateBotReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateBotReq>(create);
  static CreateBotReq? _defaultInstance;

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
  $core.int get qaNum => $_getIZ(5);
  @$pb.TagNumber(6)
  set qaNum($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasQaNum() => $_has(5);
  @$pb.TagNumber(6)
  void clearQaNum() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get systemPrompt => $_getSZ(6);
  @$pb.TagNumber(7)
  set systemPrompt($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasSystemPrompt() => $_has(6);
  @$pb.TagNumber(7)
  void clearSystemPrompt() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get userPrompt => $_getSZ(7);
  @$pb.TagNumber(8)
  set userPrompt($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasUserPrompt() => $_has(7);
  @$pb.TagNumber(8)
  void clearUserPrompt() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.double get freedom => $_getN(8);
  @$pb.TagNumber(9)
  set freedom($core.double value) => $_setFloat(8, value);
  @$pb.TagNumber(9)
  $core.bool hasFreedom() => $_has(8);
  @$pb.TagNumber(9)
  void clearFreedom() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get gptModel => $_getSZ(9);
  @$pb.TagNumber(10)
  set gptModel($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasGptModel() => $_has(9);
  @$pb.TagNumber(10)
  void clearGptModel() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get embeddingModel => $_getSZ(10);
  @$pb.TagNumber(11)
  set embeddingModel($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasEmbeddingModel() => $_has(10);
  @$pb.TagNumber(11)
  void clearEmbeddingModel() => $_clearField(11);
}

class CreateBotResp extends $pb.GeneratedMessage {
  factory CreateBotResp({
    $2.Unit? profile,
    BotConfig? config,
    $core.String? creatorDid,
  }) {
    final result = create();
    if (profile != null) result.profile = profile;
    if (config != null) result.config = config;
    if (creatorDid != null) result.creatorDid = creatorDid;
    return result;
  }

  CreateBotResp._();

  factory CreateBotResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateBotResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateBotResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOM<$2.Unit>(1, _omitFieldNames ? '' : 'profile',
        subBuilder: $2.Unit.create)
    ..aOM<BotConfig>(2, _omitFieldNames ? '' : 'config',
        subBuilder: BotConfig.create)
    ..aOS(3, _omitFieldNames ? '' : 'creatorDid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateBotResp clone() => CreateBotResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateBotResp copyWith(void Function(CreateBotResp) updates) =>
      super.copyWith((message) => updates(message as CreateBotResp))
          as CreateBotResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateBotResp create() => CreateBotResp._();
  @$core.override
  CreateBotResp createEmptyInstance() => create();
  static $pb.PbList<CreateBotResp> createRepeated() =>
      $pb.PbList<CreateBotResp>();
  @$core.pragma('dart2js:noInline')
  static CreateBotResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateBotResp>(create);
  static CreateBotResp? _defaultInstance;

  @$pb.TagNumber(1)
  $2.Unit get profile => $_getN(0);
  @$pb.TagNumber(1)
  set profile($2.Unit value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProfile() => $_has(0);
  @$pb.TagNumber(1)
  void clearProfile() => $_clearField(1);
  @$pb.TagNumber(1)
  $2.Unit ensureProfile() => $_ensure(0);

  @$pb.TagNumber(2)
  BotConfig get config => $_getN(1);
  @$pb.TagNumber(2)
  set config(BotConfig value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasConfig() => $_has(1);
  @$pb.TagNumber(2)
  void clearConfig() => $_clearField(2);
  @$pb.TagNumber(2)
  BotConfig ensureConfig() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get creatorDid => $_getSZ(2);
  @$pb.TagNumber(3)
  set creatorDid($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCreatorDid() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreatorDid() => $_clearField(3);
}

class EditBotReq extends $pb.GeneratedMessage {
  factory EditBotReq({
    $core.String? did,
    $core.String? name,
    $core.String? avatar,
    $core.String? background,
    BotConfig? botConfig,
    $core.String? orgName,
    $core.String? orgLogo,
    $core.String? orgBackground,
    $core.String? about,
    $core.String? note,
  }) {
    final result = create();
    if (did != null) result.did = did;
    if (name != null) result.name = name;
    if (avatar != null) result.avatar = avatar;
    if (background != null) result.background = background;
    if (botConfig != null) result.botConfig = botConfig;
    if (orgName != null) result.orgName = orgName;
    if (orgLogo != null) result.orgLogo = orgLogo;
    if (orgBackground != null) result.orgBackground = orgBackground;
    if (about != null) result.about = about;
    if (note != null) result.note = note;
    return result;
  }

  EditBotReq._();

  factory EditBotReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EditBotReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EditBotReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'avatar')
    ..aOS(4, _omitFieldNames ? '' : 'background')
    ..aOM<BotConfig>(5, _omitFieldNames ? '' : 'botConfig',
        subBuilder: BotConfig.create)
    ..aOS(6, _omitFieldNames ? '' : 'orgName')
    ..aOS(7, _omitFieldNames ? '' : 'orgLogo')
    ..aOS(8, _omitFieldNames ? '' : 'orgBackground')
    ..aOS(9, _omitFieldNames ? '' : 'about')
    ..aOS(10, _omitFieldNames ? '' : 'note')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EditBotReq clone() => EditBotReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EditBotReq copyWith(void Function(EditBotReq) updates) =>
      super.copyWith((message) => updates(message as EditBotReq)) as EditBotReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EditBotReq create() => EditBotReq._();
  @$core.override
  EditBotReq createEmptyInstance() => create();
  static $pb.PbList<EditBotReq> createRepeated() => $pb.PbList<EditBotReq>();
  @$core.pragma('dart2js:noInline')
  static EditBotReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EditBotReq>(create);
  static EditBotReq? _defaultInstance;

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
  BotConfig get botConfig => $_getN(4);
  @$pb.TagNumber(5)
  set botConfig(BotConfig value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasBotConfig() => $_has(4);
  @$pb.TagNumber(5)
  void clearBotConfig() => $_clearField(5);
  @$pb.TagNumber(5)
  BotConfig ensureBotConfig() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get orgName => $_getSZ(5);
  @$pb.TagNumber(6)
  set orgName($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasOrgName() => $_has(5);
  @$pb.TagNumber(6)
  void clearOrgName() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get orgLogo => $_getSZ(6);
  @$pb.TagNumber(7)
  set orgLogo($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasOrgLogo() => $_has(6);
  @$pb.TagNumber(7)
  void clearOrgLogo() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get orgBackground => $_getSZ(7);
  @$pb.TagNumber(8)
  set orgBackground($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasOrgBackground() => $_has(7);
  @$pb.TagNumber(8)
  void clearOrgBackground() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get about => $_getSZ(8);
  @$pb.TagNumber(9)
  set about($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasAbout() => $_has(8);
  @$pb.TagNumber(9)
  void clearAbout() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get note => $_getSZ(9);
  @$pb.TagNumber(10)
  set note($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasNote() => $_has(9);
  @$pb.TagNumber(10)
  void clearNote() => $_clearField(10);
}

class ListBotResp extends $pb.GeneratedMessage {
  factory ListBotResp({
    $fixnum.Int64? total,
    $core.Iterable<BotInfo>? infos,
  }) {
    final result = create();
    if (total != null) result.total = total;
    if (infos != null) result.infos.addAll(infos);
    return result;
  }

  ListBotResp._();

  factory ListBotResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListBotResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListBotResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'total')
    ..pc<BotInfo>(2, _omitFieldNames ? '' : 'infos', $pb.PbFieldType.PM,
        subBuilder: BotInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListBotResp clone() => ListBotResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListBotResp copyWith(void Function(ListBotResp) updates) =>
      super.copyWith((message) => updates(message as ListBotResp))
          as ListBotResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListBotResp create() => ListBotResp._();
  @$core.override
  ListBotResp createEmptyInstance() => create();
  static $pb.PbList<ListBotResp> createRepeated() => $pb.PbList<ListBotResp>();
  @$core.pragma('dart2js:noInline')
  static ListBotResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListBotResp>(create);
  static ListBotResp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get total => $_getI64(0);
  @$pb.TagNumber(1)
  set total($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotal() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotal() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<BotInfo> get infos => $_getList(1);
}

class ListBotByDidsReq extends $pb.GeneratedMessage {
  factory ListBotByDidsReq({
    $core.Iterable<$core.String>? botDids,
    $2.Pagination? pagination,
  }) {
    final result = create();
    if (botDids != null) result.botDids.addAll(botDids);
    if (pagination != null) result.pagination = pagination;
    return result;
  }

  ListBotByDidsReq._();

  factory ListBotByDidsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListBotByDidsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListBotByDidsReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'botDids')
    ..aOM<$2.Pagination>(2, _omitFieldNames ? '' : 'pagination',
        subBuilder: $2.Pagination.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListBotByDidsReq clone() => ListBotByDidsReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListBotByDidsReq copyWith(void Function(ListBotByDidsReq) updates) =>
      super.copyWith((message) => updates(message as ListBotByDidsReq))
          as ListBotByDidsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListBotByDidsReq create() => ListBotByDidsReq._();
  @$core.override
  ListBotByDidsReq createEmptyInstance() => create();
  static $pb.PbList<ListBotByDidsReq> createRepeated() =>
      $pb.PbList<ListBotByDidsReq>();
  @$core.pragma('dart2js:noInline')
  static ListBotByDidsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListBotByDidsReq>(create);
  static ListBotByDidsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get botDids => $_getList(0);

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

class ListBotByDidsResp extends $pb.GeneratedMessage {
  factory ListBotByDidsResp({
    $fixnum.Int64? total,
    $core.Iterable<BotInfo>? infos,
  }) {
    final result = create();
    if (total != null) result.total = total;
    if (infos != null) result.infos.addAll(infos);
    return result;
  }

  ListBotByDidsResp._();

  factory ListBotByDidsResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListBotByDidsResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListBotByDidsResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'total')
    ..pc<BotInfo>(2, _omitFieldNames ? '' : 'infos', $pb.PbFieldType.PM,
        subBuilder: BotInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListBotByDidsResp clone() => ListBotByDidsResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListBotByDidsResp copyWith(void Function(ListBotByDidsResp) updates) =>
      super.copyWith((message) => updates(message as ListBotByDidsResp))
          as ListBotByDidsResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListBotByDidsResp create() => ListBotByDidsResp._();
  @$core.override
  ListBotByDidsResp createEmptyInstance() => create();
  static $pb.PbList<ListBotByDidsResp> createRepeated() =>
      $pb.PbList<ListBotByDidsResp>();
  @$core.pragma('dart2js:noInline')
  static ListBotByDidsResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListBotByDidsResp>(create);
  static ListBotByDidsResp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get total => $_getI64(0);
  @$pb.TagNumber(1)
  set total($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotal() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotal() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<BotInfo> get infos => $_getList(1);
}

class DeleteBotReq extends $pb.GeneratedMessage {
  factory DeleteBotReq({
    $core.String? botDid,
  }) {
    final result = create();
    if (botDid != null) result.botDid = botDid;
    return result;
  }

  DeleteBotReq._();

  factory DeleteBotReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteBotReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteBotReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'botDid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteBotReq clone() => DeleteBotReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteBotReq copyWith(void Function(DeleteBotReq) updates) =>
      super.copyWith((message) => updates(message as DeleteBotReq))
          as DeleteBotReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteBotReq create() => DeleteBotReq._();
  @$core.override
  DeleteBotReq createEmptyInstance() => create();
  static $pb.PbList<DeleteBotReq> createRepeated() =>
      $pb.PbList<DeleteBotReq>();
  @$core.pragma('dart2js:noInline')
  static DeleteBotReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteBotReq>(create);
  static DeleteBotReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get botDid => $_getSZ(0);
  @$pb.TagNumber(1)
  set botDid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBotDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearBotDid() => $_clearField(1);
}

class FindBotReq extends $pb.GeneratedMessage {
  factory FindBotReq({
    $core.String? botDid,
  }) {
    final result = create();
    if (botDid != null) result.botDid = botDid;
    return result;
  }

  FindBotReq._();

  factory FindBotReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FindBotReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FindBotReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'botDid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindBotReq clone() => FindBotReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindBotReq copyWith(void Function(FindBotReq) updates) =>
      super.copyWith((message) => updates(message as FindBotReq)) as FindBotReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindBotReq create() => FindBotReq._();
  @$core.override
  FindBotReq createEmptyInstance() => create();
  static $pb.PbList<FindBotReq> createRepeated() => $pb.PbList<FindBotReq>();
  @$core.pragma('dart2js:noInline')
  static FindBotReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FindBotReq>(create);
  static FindBotReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get botDid => $_getSZ(0);
  @$pb.TagNumber(1)
  set botDid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBotDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearBotDid() => $_clearField(1);
}

class FindBotResp extends $pb.GeneratedMessage {
  factory FindBotResp({
    BotInfo? info,
  }) {
    final result = create();
    if (info != null) result.info = info;
    return result;
  }

  FindBotResp._();

  factory FindBotResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FindBotResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FindBotResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOM<BotInfo>(1, _omitFieldNames ? '' : 'info', subBuilder: BotInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindBotResp clone() => FindBotResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindBotResp copyWith(void Function(FindBotResp) updates) =>
      super.copyWith((message) => updates(message as FindBotResp))
          as FindBotResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindBotResp create() => FindBotResp._();
  @$core.override
  FindBotResp createEmptyInstance() => create();
  static $pb.PbList<FindBotResp> createRepeated() => $pb.PbList<FindBotResp>();
  @$core.pragma('dart2js:noInline')
  static FindBotResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FindBotResp>(create);
  static FindBotResp? _defaultInstance;

  @$pb.TagNumber(1)
  BotInfo get info => $_getN(0);
  @$pb.TagNumber(1)
  set info(BotInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  BotInfo ensureInfo() => $_ensure(0);
}

class FindBotCountReq extends $pb.GeneratedMessage {
  factory FindBotCountReq({
    $core.String? botDid,
  }) {
    final result = create();
    if (botDid != null) result.botDid = botDid;
    return result;
  }

  FindBotCountReq._();

  factory FindBotCountReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FindBotCountReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FindBotCountReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'botDid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindBotCountReq clone() => FindBotCountReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindBotCountReq copyWith(void Function(FindBotCountReq) updates) =>
      super.copyWith((message) => updates(message as FindBotCountReq))
          as FindBotCountReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindBotCountReq create() => FindBotCountReq._();
  @$core.override
  FindBotCountReq createEmptyInstance() => create();
  static $pb.PbList<FindBotCountReq> createRepeated() =>
      $pb.PbList<FindBotCountReq>();
  @$core.pragma('dart2js:noInline')
  static FindBotCountReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FindBotCountReq>(create);
  static FindBotCountReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get botDid => $_getSZ(0);
  @$pb.TagNumber(1)
  set botDid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBotDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearBotDid() => $_clearField(1);
}

class FindBotCountResp extends $pb.GeneratedMessage {
  factory FindBotCountResp({
    $core.int? messageCount,
    $core.int? useTokens,
    $core.int? promptTokens,
    $core.int? memTokens,
  }) {
    final result = create();
    if (messageCount != null) result.messageCount = messageCount;
    if (useTokens != null) result.useTokens = useTokens;
    if (promptTokens != null) result.promptTokens = promptTokens;
    if (memTokens != null) result.memTokens = memTokens;
    return result;
  }

  FindBotCountResp._();

  factory FindBotCountResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FindBotCountResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FindBotCountResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'messageCount', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'useTokens', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'promptTokens', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'memTokens', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindBotCountResp clone() => FindBotCountResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindBotCountResp copyWith(void Function(FindBotCountResp) updates) =>
      super.copyWith((message) => updates(message as FindBotCountResp))
          as FindBotCountResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindBotCountResp create() => FindBotCountResp._();
  @$core.override
  FindBotCountResp createEmptyInstance() => create();
  static $pb.PbList<FindBotCountResp> createRepeated() =>
      $pb.PbList<FindBotCountResp>();
  @$core.pragma('dart2js:noInline')
  static FindBotCountResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FindBotCountResp>(create);
  static FindBotCountResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get messageCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set messageCount($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMessageCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessageCount() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get useTokens => $_getIZ(1);
  @$pb.TagNumber(2)
  set useTokens($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUseTokens() => $_has(1);
  @$pb.TagNumber(2)
  void clearUseTokens() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get promptTokens => $_getIZ(2);
  @$pb.TagNumber(3)
  set promptTokens($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPromptTokens() => $_has(2);
  @$pb.TagNumber(3)
  void clearPromptTokens() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get memTokens => $_getIZ(3);
  @$pb.TagNumber(4)
  set memTokens($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMemTokens() => $_has(3);
  @$pb.TagNumber(4)
  void clearMemTokens() => $_clearField(4);
}

class TransferReq extends $pb.GeneratedMessage {
  factory TransferReq({
    $core.String? botDid,
    $core.String? toUserDid,
  }) {
    final result = create();
    if (botDid != null) result.botDid = botDid;
    if (toUserDid != null) result.toUserDid = toUserDid;
    return result;
  }

  TransferReq._();

  factory TransferReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TransferReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransferReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'botDid')
    ..aOS(2, _omitFieldNames ? '' : 'toUserDid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransferReq clone() => TransferReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransferReq copyWith(void Function(TransferReq) updates) =>
      super.copyWith((message) => updates(message as TransferReq))
          as TransferReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransferReq create() => TransferReq._();
  @$core.override
  TransferReq createEmptyInstance() => create();
  static $pb.PbList<TransferReq> createRepeated() => $pb.PbList<TransferReq>();
  @$core.pragma('dart2js:noInline')
  static TransferReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransferReq>(create);
  static TransferReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get botDid => $_getSZ(0);
  @$pb.TagNumber(1)
  set botDid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBotDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearBotDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get toUserDid => $_getSZ(1);
  @$pb.TagNumber(2)
  set toUserDid($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasToUserDid() => $_has(1);
  @$pb.TagNumber(2)
  void clearToUserDid() => $_clearField(2);
}

class BindApikeyReq extends $pb.GeneratedMessage {
  factory BindApikeyReq({
    $core.String? operate,
    $core.String? botDid,
  }) {
    final result = create();
    if (operate != null) result.operate = operate;
    if (botDid != null) result.botDid = botDid;
    return result;
  }

  BindApikeyReq._();

  factory BindApikeyReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BindApikeyReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BindApikeyReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'operate')
    ..aOS(2, _omitFieldNames ? '' : 'botDid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BindApikeyReq clone() => BindApikeyReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BindApikeyReq copyWith(void Function(BindApikeyReq) updates) =>
      super.copyWith((message) => updates(message as BindApikeyReq))
          as BindApikeyReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BindApikeyReq create() => BindApikeyReq._();
  @$core.override
  BindApikeyReq createEmptyInstance() => create();
  static $pb.PbList<BindApikeyReq> createRepeated() =>
      $pb.PbList<BindApikeyReq>();
  @$core.pragma('dart2js:noInline')
  static BindApikeyReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BindApikeyReq>(create);
  static BindApikeyReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get operate => $_getSZ(0);
  @$pb.TagNumber(1)
  set operate($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOperate() => $_has(0);
  @$pb.TagNumber(1)
  void clearOperate() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get botDid => $_getSZ(1);
  @$pb.TagNumber(2)
  set botDid($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBotDid() => $_has(1);
  @$pb.TagNumber(2)
  void clearBotDid() => $_clearField(2);
}

class UpdatesToDefaultReq extends $pb.GeneratedMessage {
  factory UpdatesToDefaultReq({
    $core.Iterable<$core.String>? botDids,
  }) {
    final result = create();
    if (botDids != null) result.botDids.addAll(botDids);
    return result;
  }

  UpdatesToDefaultReq._();

  factory UpdatesToDefaultReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdatesToDefaultReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdatesToDefaultReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'botDids')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdatesToDefaultReq clone() => UpdatesToDefaultReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdatesToDefaultReq copyWith(void Function(UpdatesToDefaultReq) updates) =>
      super.copyWith((message) => updates(message as UpdatesToDefaultReq))
          as UpdatesToDefaultReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatesToDefaultReq create() => UpdatesToDefaultReq._();
  @$core.override
  UpdatesToDefaultReq createEmptyInstance() => create();
  static $pb.PbList<UpdatesToDefaultReq> createRepeated() =>
      $pb.PbList<UpdatesToDefaultReq>();
  @$core.pragma('dart2js:noInline')
  static UpdatesToDefaultReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdatesToDefaultReq>(create);
  static UpdatesToDefaultReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get botDids => $_getList(0);
}

class FavoriteBotReq extends $pb.GeneratedMessage {
  factory FavoriteBotReq({
    $core.String? botDid,
    $core.int? operation,
  }) {
    final result = create();
    if (botDid != null) result.botDid = botDid;
    if (operation != null) result.operation = operation;
    return result;
  }

  FavoriteBotReq._();

  factory FavoriteBotReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FavoriteBotReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FavoriteBotReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'botDid')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'operation', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FavoriteBotReq clone() => FavoriteBotReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FavoriteBotReq copyWith(void Function(FavoriteBotReq) updates) =>
      super.copyWith((message) => updates(message as FavoriteBotReq))
          as FavoriteBotReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FavoriteBotReq create() => FavoriteBotReq._();
  @$core.override
  FavoriteBotReq createEmptyInstance() => create();
  static $pb.PbList<FavoriteBotReq> createRepeated() =>
      $pb.PbList<FavoriteBotReq>();
  @$core.pragma('dart2js:noInline')
  static FavoriteBotReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FavoriteBotReq>(create);
  static FavoriteBotReq? _defaultInstance;

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

class FavoriteBotListReq extends $pb.GeneratedMessage {
  factory FavoriteBotListReq({
    $2.Pagination? pagination,
  }) {
    final result = create();
    if (pagination != null) result.pagination = pagination;
    return result;
  }

  FavoriteBotListReq._();

  factory FavoriteBotListReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FavoriteBotListReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FavoriteBotListReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOM<$2.Pagination>(1, _omitFieldNames ? '' : 'pagination',
        subBuilder: $2.Pagination.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FavoriteBotListReq clone() => FavoriteBotListReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FavoriteBotListReq copyWith(void Function(FavoriteBotListReq) updates) =>
      super.copyWith((message) => updates(message as FavoriteBotListReq))
          as FavoriteBotListReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FavoriteBotListReq create() => FavoriteBotListReq._();
  @$core.override
  FavoriteBotListReq createEmptyInstance() => create();
  static $pb.PbList<FavoriteBotListReq> createRepeated() =>
      $pb.PbList<FavoriteBotListReq>();
  @$core.pragma('dart2js:noInline')
  static FavoriteBotListReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FavoriteBotListReq>(create);
  static FavoriteBotListReq? _defaultInstance;

  @$pb.TagNumber(1)
  $2.Pagination get pagination => $_getN(0);
  @$pb.TagNumber(1)
  set pagination($2.Pagination value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPagination() => $_has(0);
  @$pb.TagNumber(1)
  void clearPagination() => $_clearField(1);
  @$pb.TagNumber(1)
  $2.Pagination ensurePagination() => $_ensure(0);
}

class FavoriteBotListResp extends $pb.GeneratedMessage {
  factory FavoriteBotListResp({
    $fixnum.Int64? total,
    $core.Iterable<BotInfo>? infos,
  }) {
    final result = create();
    if (total != null) result.total = total;
    if (infos != null) result.infos.addAll(infos);
    return result;
  }

  FavoriteBotListResp._();

  factory FavoriteBotListResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FavoriteBotListResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FavoriteBotListResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'total')
    ..pc<BotInfo>(2, _omitFieldNames ? '' : 'infos', $pb.PbFieldType.PM,
        subBuilder: BotInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FavoriteBotListResp clone() => FavoriteBotListResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FavoriteBotListResp copyWith(void Function(FavoriteBotListResp) updates) =>
      super.copyWith((message) => updates(message as FavoriteBotListResp))
          as FavoriteBotListResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FavoriteBotListResp create() => FavoriteBotListResp._();
  @$core.override
  FavoriteBotListResp createEmptyInstance() => create();
  static $pb.PbList<FavoriteBotListResp> createRepeated() =>
      $pb.PbList<FavoriteBotListResp>();
  @$core.pragma('dart2js:noInline')
  static FavoriteBotListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FavoriteBotListResp>(create);
  static FavoriteBotListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get total => $_getI64(0);
  @$pb.TagNumber(1)
  set total($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotal() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotal() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<BotInfo> get infos => $_getList(1);
}

class FavoriteBotListByDIDsReq extends $pb.GeneratedMessage {
  factory FavoriteBotListByDIDsReq({
    $core.Iterable<$core.String>? botDids,
    $2.Pagination? pagination,
  }) {
    final result = create();
    if (botDids != null) result.botDids.addAll(botDids);
    if (pagination != null) result.pagination = pagination;
    return result;
  }

  FavoriteBotListByDIDsReq._();

  factory FavoriteBotListByDIDsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FavoriteBotListByDIDsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FavoriteBotListByDIDsReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'botDids')
    ..aOM<$2.Pagination>(2, _omitFieldNames ? '' : 'pagination',
        subBuilder: $2.Pagination.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FavoriteBotListByDIDsReq clone() =>
      FavoriteBotListByDIDsReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FavoriteBotListByDIDsReq copyWith(
          void Function(FavoriteBotListByDIDsReq) updates) =>
      super.copyWith((message) => updates(message as FavoriteBotListByDIDsReq))
          as FavoriteBotListByDIDsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FavoriteBotListByDIDsReq create() => FavoriteBotListByDIDsReq._();
  @$core.override
  FavoriteBotListByDIDsReq createEmptyInstance() => create();
  static $pb.PbList<FavoriteBotListByDIDsReq> createRepeated() =>
      $pb.PbList<FavoriteBotListByDIDsReq>();
  @$core.pragma('dart2js:noInline')
  static FavoriteBotListByDIDsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FavoriteBotListByDIDsReq>(create);
  static FavoriteBotListByDIDsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get botDids => $_getList(0);

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

class FavoriteBotListByDIDsResp extends $pb.GeneratedMessage {
  factory FavoriteBotListByDIDsResp({
    $fixnum.Int64? total,
    $core.Iterable<BotInfo>? infos,
  }) {
    final result = create();
    if (total != null) result.total = total;
    if (infos != null) result.infos.addAll(infos);
    return result;
  }

  FavoriteBotListByDIDsResp._();

  factory FavoriteBotListByDIDsResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FavoriteBotListByDIDsResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FavoriteBotListByDIDsResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'total')
    ..pc<BotInfo>(2, _omitFieldNames ? '' : 'infos', $pb.PbFieldType.PM,
        subBuilder: BotInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FavoriteBotListByDIDsResp clone() =>
      FavoriteBotListByDIDsResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FavoriteBotListByDIDsResp copyWith(
          void Function(FavoriteBotListByDIDsResp) updates) =>
      super.copyWith((message) => updates(message as FavoriteBotListByDIDsResp))
          as FavoriteBotListByDIDsResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FavoriteBotListByDIDsResp create() => FavoriteBotListByDIDsResp._();
  @$core.override
  FavoriteBotListByDIDsResp createEmptyInstance() => create();
  static $pb.PbList<FavoriteBotListByDIDsResp> createRepeated() =>
      $pb.PbList<FavoriteBotListByDIDsResp>();
  @$core.pragma('dart2js:noInline')
  static FavoriteBotListByDIDsResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FavoriteBotListByDIDsResp>(create);
  static FavoriteBotListByDIDsResp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get total => $_getI64(0);
  @$pb.TagNumber(1)
  set total($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotal() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotal() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<BotInfo> get infos => $_getList(1);
}

/// ///////////////////////////// 训练机器人 ///////////////////////////////
class TrainingBotReq extends $pb.GeneratedMessage {
  factory TrainingBotReq({
    $core.Iterable<$core.int>? fileIds,
    $core.String? botDid,
  }) {
    final result = create();
    if (fileIds != null) result.fileIds.addAll(fileIds);
    if (botDid != null) result.botDid = botDid;
    return result;
  }

  TrainingBotReq._();

  factory TrainingBotReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TrainingBotReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TrainingBotReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'fileIds', $pb.PbFieldType.K3)
    ..aOS(2, _omitFieldNames ? '' : 'botDid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TrainingBotReq clone() => TrainingBotReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TrainingBotReq copyWith(void Function(TrainingBotReq) updates) =>
      super.copyWith((message) => updates(message as TrainingBotReq))
          as TrainingBotReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TrainingBotReq create() => TrainingBotReq._();
  @$core.override
  TrainingBotReq createEmptyInstance() => create();
  static $pb.PbList<TrainingBotReq> createRepeated() =>
      $pb.PbList<TrainingBotReq>();
  @$core.pragma('dart2js:noInline')
  static TrainingBotReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TrainingBotReq>(create);
  static TrainingBotReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.int> get fileIds => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get botDid => $_getSZ(1);
  @$pb.TagNumber(2)
  set botDid($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBotDid() => $_has(1);
  @$pb.TagNumber(2)
  void clearBotDid() => $_clearField(2);
}

class TrainingStatusReq extends $pb.GeneratedMessage {
  factory TrainingStatusReq({
    $core.String? botDid,
  }) {
    final result = create();
    if (botDid != null) result.botDid = botDid;
    return result;
  }

  TrainingStatusReq._();

  factory TrainingStatusReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TrainingStatusReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TrainingStatusReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'botDid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TrainingStatusReq clone() => TrainingStatusReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TrainingStatusReq copyWith(void Function(TrainingStatusReq) updates) =>
      super.copyWith((message) => updates(message as TrainingStatusReq))
          as TrainingStatusReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TrainingStatusReq create() => TrainingStatusReq._();
  @$core.override
  TrainingStatusReq createEmptyInstance() => create();
  static $pb.PbList<TrainingStatusReq> createRepeated() =>
      $pb.PbList<TrainingStatusReq>();
  @$core.pragma('dart2js:noInline')
  static TrainingStatusReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TrainingStatusReq>(create);
  static TrainingStatusReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get botDid => $_getSZ(0);
  @$pb.TagNumber(1)
  set botDid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBotDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearBotDid() => $_clearField(1);
}

class TrainingStatusResp extends $pb.GeneratedMessage {
  factory TrainingStatusResp({
    $core.String? status,
    $core.int? memCount,
    $core.int? sliceCount,
    $core.String? message,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (memCount != null) result.memCount = memCount;
    if (sliceCount != null) result.sliceCount = sliceCount;
    if (message != null) result.message = message;
    return result;
  }

  TrainingStatusResp._();

  factory TrainingStatusResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TrainingStatusResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TrainingStatusResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'status')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'memCount', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'sliceCount', $pb.PbFieldType.O3)
    ..aOS(4, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TrainingStatusResp clone() => TrainingStatusResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TrainingStatusResp copyWith(void Function(TrainingStatusResp) updates) =>
      super.copyWith((message) => updates(message as TrainingStatusResp))
          as TrainingStatusResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TrainingStatusResp create() => TrainingStatusResp._();
  @$core.override
  TrainingStatusResp createEmptyInstance() => create();
  static $pb.PbList<TrainingStatusResp> createRepeated() =>
      $pb.PbList<TrainingStatusResp>();
  @$core.pragma('dart2js:noInline')
  static TrainingStatusResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TrainingStatusResp>(create);
  static TrainingStatusResp? _defaultInstance;

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
  $core.String get message => $_getSZ(3);
  @$pb.TagNumber(4)
  set message($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessage() => $_clearField(4);
}

class TrainingClearReq extends $pb.GeneratedMessage {
  factory TrainingClearReq({
    $core.String? botDid,
  }) {
    final result = create();
    if (botDid != null) result.botDid = botDid;
    return result;
  }

  TrainingClearReq._();

  factory TrainingClearReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TrainingClearReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TrainingClearReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'botDid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TrainingClearReq clone() => TrainingClearReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TrainingClearReq copyWith(void Function(TrainingClearReq) updates) =>
      super.copyWith((message) => updates(message as TrainingClearReq))
          as TrainingClearReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TrainingClearReq create() => TrainingClearReq._();
  @$core.override
  TrainingClearReq createEmptyInstance() => create();
  static $pb.PbList<TrainingClearReq> createRepeated() =>
      $pb.PbList<TrainingClearReq>();
  @$core.pragma('dart2js:noInline')
  static TrainingClearReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TrainingClearReq>(create);
  static TrainingClearReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get botDid => $_getSZ(0);
  @$pb.TagNumber(1)
  set botDid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBotDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearBotDid() => $_clearField(1);
}

class CreateBotFileReq extends $pb.GeneratedMessage {
  factory CreateBotFileReq({
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

  CreateBotFileReq._();

  factory CreateBotFileReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateBotFileReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateBotFileReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'botDid')
    ..aOS(2, _omitFieldNames ? '' : 'filename')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'fileContent', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateBotFileReq clone() => CreateBotFileReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateBotFileReq copyWith(void Function(CreateBotFileReq) updates) =>
      super.copyWith((message) => updates(message as CreateBotFileReq))
          as CreateBotFileReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateBotFileReq create() => CreateBotFileReq._();
  @$core.override
  CreateBotFileReq createEmptyInstance() => create();
  static $pb.PbList<CreateBotFileReq> createRepeated() =>
      $pb.PbList<CreateBotFileReq>();
  @$core.pragma('dart2js:noInline')
  static CreateBotFileReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateBotFileReq>(create);
  static CreateBotFileReq? _defaultInstance;

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

class BotTrainingFile extends $pb.GeneratedMessage {
  factory BotTrainingFile({
    $core.int? fileId,
    $core.String? userDid,
    $core.String? botDid,
    $core.String? content,
    $core.String? filePath,
    $core.String? title,
    $core.int? size,
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'fileId', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'userDid')
    ..aOS(3, _omitFieldNames ? '' : 'botDid')
    ..aOS(4, _omitFieldNames ? '' : 'content')
    ..aOS(5, _omitFieldNames ? '' : 'filePath')
    ..aOS(6, _omitFieldNames ? '' : 'title')
    ..a<$core.int>(7, _omitFieldNames ? '' : 'size', $pb.PbFieldType.O3)
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
  $core.int get fileId => $_getIZ(0);
  @$pb.TagNumber(1)
  set fileId($core.int value) => $_setSignedInt32(0, value);
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
  $core.int get size => $_getIZ(6);
  @$pb.TagNumber(7)
  set size($core.int value) => $_setSignedInt32(6, value);
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

class ListBotFileReq extends $pb.GeneratedMessage {
  factory ListBotFileReq({
    $core.String? botDid,
    $core.bool? use,
    $2.Pagination? pagination,
  }) {
    final result = create();
    if (botDid != null) result.botDid = botDid;
    if (use != null) result.use = use;
    if (pagination != null) result.pagination = pagination;
    return result;
  }

  ListBotFileReq._();

  factory ListBotFileReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListBotFileReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListBotFileReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'botDid')
    ..aOB(2, _omitFieldNames ? '' : 'use')
    ..aOM<$2.Pagination>(3, _omitFieldNames ? '' : 'pagination',
        subBuilder: $2.Pagination.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListBotFileReq clone() => ListBotFileReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListBotFileReq copyWith(void Function(ListBotFileReq) updates) =>
      super.copyWith((message) => updates(message as ListBotFileReq))
          as ListBotFileReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListBotFileReq create() => ListBotFileReq._();
  @$core.override
  ListBotFileReq createEmptyInstance() => create();
  static $pb.PbList<ListBotFileReq> createRepeated() =>
      $pb.PbList<ListBotFileReq>();
  @$core.pragma('dart2js:noInline')
  static ListBotFileReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListBotFileReq>(create);
  static ListBotFileReq? _defaultInstance;

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
  $2.Pagination get pagination => $_getN(2);
  @$pb.TagNumber(3)
  set pagination($2.Pagination value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasPagination() => $_has(2);
  @$pb.TagNumber(3)
  void clearPagination() => $_clearField(3);
  @$pb.TagNumber(3)
  $2.Pagination ensurePagination() => $_ensure(2);
}

class ListBotFileResp extends $pb.GeneratedMessage {
  factory ListBotFileResp({
    $fixnum.Int64? total,
    $core.Iterable<BotTrainingFile>? trainingFileList,
  }) {
    final result = create();
    if (total != null) result.total = total;
    if (trainingFileList != null)
      result.trainingFileList.addAll(trainingFileList);
    return result;
  }

  ListBotFileResp._();

  factory ListBotFileResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListBotFileResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListBotFileResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'total')
    ..pc<BotTrainingFile>(
        2, _omitFieldNames ? '' : 'trainingFileList', $pb.PbFieldType.PM,
        subBuilder: BotTrainingFile.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListBotFileResp clone() => ListBotFileResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListBotFileResp copyWith(void Function(ListBotFileResp) updates) =>
      super.copyWith((message) => updates(message as ListBotFileResp))
          as ListBotFileResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListBotFileResp create() => ListBotFileResp._();
  @$core.override
  ListBotFileResp createEmptyInstance() => create();
  static $pb.PbList<ListBotFileResp> createRepeated() =>
      $pb.PbList<ListBotFileResp>();
  @$core.pragma('dart2js:noInline')
  static ListBotFileResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListBotFileResp>(create);
  static ListBotFileResp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get total => $_getI64(0);
  @$pb.TagNumber(1)
  set total($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotal() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotal() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<BotTrainingFile> get trainingFileList => $_getList(1);
}

class DeleteBotFileReq extends $pb.GeneratedMessage {
  factory DeleteBotFileReq({
    $core.int? fileId,
  }) {
    final result = create();
    if (fileId != null) result.fileId = fileId;
    return result;
  }

  DeleteBotFileReq._();

  factory DeleteBotFileReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteBotFileReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteBotFileReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'fileId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteBotFileReq clone() => DeleteBotFileReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteBotFileReq copyWith(void Function(DeleteBotFileReq) updates) =>
      super.copyWith((message) => updates(message as DeleteBotFileReq))
          as DeleteBotFileReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteBotFileReq create() => DeleteBotFileReq._();
  @$core.override
  DeleteBotFileReq createEmptyInstance() => create();
  static $pb.PbList<DeleteBotFileReq> createRepeated() =>
      $pb.PbList<DeleteBotFileReq>();
  @$core.pragma('dart2js:noInline')
  static DeleteBotFileReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteBotFileReq>(create);
  static DeleteBotFileReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get fileId => $_getIZ(0);
  @$pb.TagNumber(1)
  set fileId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFileId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileId() => $_clearField(1);
}

class DeleteBotFilesReq extends $pb.GeneratedMessage {
  factory DeleteBotFilesReq({
    $core.String? botDid,
    $core.Iterable<$core.int>? fileIds,
  }) {
    final result = create();
    if (botDid != null) result.botDid = botDid;
    if (fileIds != null) result.fileIds.addAll(fileIds);
    return result;
  }

  DeleteBotFilesReq._();

  factory DeleteBotFilesReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteBotFilesReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteBotFilesReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'botDid')
    ..p<$core.int>(2, _omitFieldNames ? '' : 'fileIds', $pb.PbFieldType.K3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteBotFilesReq clone() => DeleteBotFilesReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteBotFilesReq copyWith(void Function(DeleteBotFilesReq) updates) =>
      super.copyWith((message) => updates(message as DeleteBotFilesReq))
          as DeleteBotFilesReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteBotFilesReq create() => DeleteBotFilesReq._();
  @$core.override
  DeleteBotFilesReq createEmptyInstance() => create();
  static $pb.PbList<DeleteBotFilesReq> createRepeated() =>
      $pb.PbList<DeleteBotFilesReq>();
  @$core.pragma('dart2js:noInline')
  static DeleteBotFilesReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteBotFilesReq>(create);
  static DeleteBotFilesReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get botDid => $_getSZ(0);
  @$pb.TagNumber(1)
  set botDid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBotDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearBotDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$core.int> get fileIds => $_getList(1);
}

class DeleteBotFilesByDidReq extends $pb.GeneratedMessage {
  factory DeleteBotFilesByDidReq({
    $core.Iterable<$core.String>? botDids,
  }) {
    final result = create();
    if (botDids != null) result.botDids.addAll(botDids);
    return result;
  }

  DeleteBotFilesByDidReq._();

  factory DeleteBotFilesByDidReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteBotFilesByDidReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteBotFilesByDidReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'botDids')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteBotFilesByDidReq clone() =>
      DeleteBotFilesByDidReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteBotFilesByDidReq copyWith(
          void Function(DeleteBotFilesByDidReq) updates) =>
      super.copyWith((message) => updates(message as DeleteBotFilesByDidReq))
          as DeleteBotFilesByDidReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteBotFilesByDidReq create() => DeleteBotFilesByDidReq._();
  @$core.override
  DeleteBotFilesByDidReq createEmptyInstance() => create();
  static $pb.PbList<DeleteBotFilesByDidReq> createRepeated() =>
      $pb.PbList<DeleteBotFilesByDidReq>();
  @$core.pragma('dart2js:noInline')
  static DeleteBotFilesByDidReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteBotFilesByDidReq>(create);
  static DeleteBotFilesByDidReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get botDids => $_getList(0);
}

class GetBotFileReq extends $pb.GeneratedMessage {
  factory GetBotFileReq({
    $core.int? fileId,
  }) {
    final result = create();
    if (fileId != null) result.fileId = fileId;
    return result;
  }

  GetBotFileReq._();

  factory GetBotFileReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBotFileReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBotFileReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'fileId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBotFileReq clone() => GetBotFileReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBotFileReq copyWith(void Function(GetBotFileReq) updates) =>
      super.copyWith((message) => updates(message as GetBotFileReq))
          as GetBotFileReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBotFileReq create() => GetBotFileReq._();
  @$core.override
  GetBotFileReq createEmptyInstance() => create();
  static $pb.PbList<GetBotFileReq> createRepeated() =>
      $pb.PbList<GetBotFileReq>();
  @$core.pragma('dart2js:noInline')
  static GetBotFileReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBotFileReq>(create);
  static GetBotFileReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get fileId => $_getIZ(0);
  @$pb.TagNumber(1)
  set fileId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFileId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileId() => $_clearField(1);
}

class GetBotFileResp extends $pb.GeneratedMessage {
  factory GetBotFileResp({
    BotTrainingFile? file,
  }) {
    final result = create();
    if (file != null) result.file = file;
    return result;
  }

  GetBotFileResp._();

  factory GetBotFileResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBotFileResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBotFileResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOM<BotTrainingFile>(1, _omitFieldNames ? '' : 'file',
        subBuilder: BotTrainingFile.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBotFileResp clone() => GetBotFileResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBotFileResp copyWith(void Function(GetBotFileResp) updates) =>
      super.copyWith((message) => updates(message as GetBotFileResp))
          as GetBotFileResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBotFileResp create() => GetBotFileResp._();
  @$core.override
  GetBotFileResp createEmptyInstance() => create();
  static $pb.PbList<GetBotFileResp> createRepeated() =>
      $pb.PbList<GetBotFileResp>();
  @$core.pragma('dart2js:noInline')
  static GetBotFileResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBotFileResp>(create);
  static GetBotFileResp? _defaultInstance;

  @$pb.TagNumber(1)
  BotTrainingFile get file => $_getN(0);
  @$pb.TagNumber(1)
  set file(BotTrainingFile value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasFile() => $_has(0);
  @$pb.TagNumber(1)
  void clearFile() => $_clearField(1);
  @$pb.TagNumber(1)
  BotTrainingFile ensureFile() => $_ensure(0);
}

class UpdateCotentReq extends $pb.GeneratedMessage {
  factory UpdateCotentReq({
    $core.String? botDid,
    $core.int? fileId,
    $core.String? content,
  }) {
    final result = create();
    if (botDid != null) result.botDid = botDid;
    if (fileId != null) result.fileId = fileId;
    if (content != null) result.content = content;
    return result;
  }

  UpdateCotentReq._();

  factory UpdateCotentReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateCotentReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateCotentReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'botDid')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'fileId', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateCotentReq clone() => UpdateCotentReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateCotentReq copyWith(void Function(UpdateCotentReq) updates) =>
      super.copyWith((message) => updates(message as UpdateCotentReq))
          as UpdateCotentReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateCotentReq create() => UpdateCotentReq._();
  @$core.override
  UpdateCotentReq createEmptyInstance() => create();
  static $pb.PbList<UpdateCotentReq> createRepeated() =>
      $pb.PbList<UpdateCotentReq>();
  @$core.pragma('dart2js:noInline')
  static UpdateCotentReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateCotentReq>(create);
  static UpdateCotentReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get botDid => $_getSZ(0);
  @$pb.TagNumber(1)
  set botDid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBotDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearBotDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get fileId => $_getIZ(1);
  @$pb.TagNumber(2)
  set fileId($core.int value) => $_setSignedInt32(1, value);
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

class CreateCotentReq extends $pb.GeneratedMessage {
  factory CreateCotentReq({
    $core.String? botDid,
    $core.String? content,
  }) {
    final result = create();
    if (botDid != null) result.botDid = botDid;
    if (content != null) result.content = content;
    return result;
  }

  CreateCotentReq._();

  factory CreateCotentReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateCotentReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateCotentReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'botDid')
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateCotentReq clone() => CreateCotentReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateCotentReq copyWith(void Function(CreateCotentReq) updates) =>
      super.copyWith((message) => updates(message as CreateCotentReq))
          as CreateCotentReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateCotentReq create() => CreateCotentReq._();
  @$core.override
  CreateCotentReq createEmptyInstance() => create();
  static $pb.PbList<CreateCotentReq> createRepeated() =>
      $pb.PbList<CreateCotentReq>();
  @$core.pragma('dart2js:noInline')
  static CreateCotentReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateCotentReq>(create);
  static CreateCotentReq? _defaultInstance;

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

class CreateCotentResp extends $pb.GeneratedMessage {
  factory CreateCotentResp({
    BotTrainingFile? file,
  }) {
    final result = create();
    if (file != null) result.file = file;
    return result;
  }

  CreateCotentResp._();

  factory CreateCotentResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateCotentResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateCotentResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOM<BotTrainingFile>(1, _omitFieldNames ? '' : 'file',
        subBuilder: BotTrainingFile.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateCotentResp clone() => CreateCotentResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateCotentResp copyWith(void Function(CreateCotentResp) updates) =>
      super.copyWith((message) => updates(message as CreateCotentResp))
          as CreateCotentResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateCotentResp create() => CreateCotentResp._();
  @$core.override
  CreateCotentResp createEmptyInstance() => create();
  static $pb.PbList<CreateCotentResp> createRepeated() =>
      $pb.PbList<CreateCotentResp>();
  @$core.pragma('dart2js:noInline')
  static CreateCotentResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateCotentResp>(create);
  static CreateCotentResp? _defaultInstance;

  @$pb.TagNumber(1)
  BotTrainingFile get file => $_getN(0);
  @$pb.TagNumber(1)
  set file(BotTrainingFile value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasFile() => $_has(0);
  @$pb.TagNumber(1)
  void clearFile() => $_clearField(1);
  @$pb.TagNumber(1)
  BotTrainingFile ensureFile() => $_ensure(0);
}

class EditDigestReq extends $pb.GeneratedMessage {
  factory EditDigestReq({
    $core.int? fileId,
    $core.String? botDid,
    $core.String? digest,
  }) {
    final result = create();
    if (fileId != null) result.fileId = fileId;
    if (botDid != null) result.botDid = botDid;
    if (digest != null) result.digest = digest;
    return result;
  }

  EditDigestReq._();

  factory EditDigestReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EditDigestReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EditDigestReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'fileId', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'botDid')
    ..aOS(3, _omitFieldNames ? '' : 'digest')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EditDigestReq clone() => EditDigestReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EditDigestReq copyWith(void Function(EditDigestReq) updates) =>
      super.copyWith((message) => updates(message as EditDigestReq))
          as EditDigestReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EditDigestReq create() => EditDigestReq._();
  @$core.override
  EditDigestReq createEmptyInstance() => create();
  static $pb.PbList<EditDigestReq> createRepeated() =>
      $pb.PbList<EditDigestReq>();
  @$core.pragma('dart2js:noInline')
  static EditDigestReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EditDigestReq>(create);
  static EditDigestReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get fileId => $_getIZ(0);
  @$pb.TagNumber(1)
  set fileId($core.int value) => $_setSignedInt32(0, value);
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

/// ///////////////////////////// 机器人插件 ///////////////////////////////
class DrawConfigResp extends $pb.GeneratedMessage {
  factory DrawConfigResp({
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

  DrawConfigResp._();

  factory DrawConfigResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DrawConfigResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DrawConfigResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
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
  DrawConfigResp clone() => DrawConfigResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DrawConfigResp copyWith(void Function(DrawConfigResp) updates) =>
      super.copyWith((message) => updates(message as DrawConfigResp))
          as DrawConfigResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DrawConfigResp create() => DrawConfigResp._();
  @$core.override
  DrawConfigResp createEmptyInstance() => create();
  static $pb.PbList<DrawConfigResp> createRepeated() =>
      $pb.PbList<DrawConfigResp>();
  @$core.pragma('dart2js:noInline')
  static DrawConfigResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DrawConfigResp>(create);
  static DrawConfigResp? _defaultInstance;

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

class NamesReq extends $pb.GeneratedMessage {
  factory NamesReq({
    $core.String? botDid,
  }) {
    final result = create();
    if (botDid != null) result.botDid = botDid;
    return result;
  }

  NamesReq._();

  factory NamesReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NamesReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NamesReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'botDid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NamesReq clone() => NamesReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NamesReq copyWith(void Function(NamesReq) updates) =>
      super.copyWith((message) => updates(message as NamesReq)) as NamesReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NamesReq create() => NamesReq._();
  @$core.override
  NamesReq createEmptyInstance() => create();
  static $pb.PbList<NamesReq> createRepeated() => $pb.PbList<NamesReq>();
  @$core.pragma('dart2js:noInline')
  static NamesReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NamesReq>(create);
  static NamesReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get botDid => $_getSZ(0);
  @$pb.TagNumber(1)
  set botDid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBotDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearBotDid() => $_clearField(1);
}

class NamesResp_Function extends $pb.GeneratedMessage {
  factory NamesResp_Function({
    $core.String? name,
    $core.String? enable,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (enable != null) result.enable = enable;
    return result;
  }

  NamesResp_Function._();

  factory NamesResp_Function.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NamesResp_Function.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NamesResp.Function',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'enable')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NamesResp_Function clone() => NamesResp_Function()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NamesResp_Function copyWith(void Function(NamesResp_Function) updates) =>
      super.copyWith((message) => updates(message as NamesResp_Function))
          as NamesResp_Function;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NamesResp_Function create() => NamesResp_Function._();
  @$core.override
  NamesResp_Function createEmptyInstance() => create();
  static $pb.PbList<NamesResp_Function> createRepeated() =>
      $pb.PbList<NamesResp_Function>();
  @$core.pragma('dart2js:noInline')
  static NamesResp_Function getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NamesResp_Function>(create);
  static NamesResp_Function? _defaultInstance;

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

class NamesResp extends $pb.GeneratedMessage {
  factory NamesResp({
    $core.Iterable<NamesResp_Function>? functions,
  }) {
    final result = create();
    if (functions != null) result.functions.addAll(functions);
    return result;
  }

  NamesResp._();

  factory NamesResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NamesResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NamesResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..pc<NamesResp_Function>(
        1, _omitFieldNames ? '' : 'functions', $pb.PbFieldType.PM,
        subBuilder: NamesResp_Function.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NamesResp clone() => NamesResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NamesResp copyWith(void Function(NamesResp) updates) =>
      super.copyWith((message) => updates(message as NamesResp)) as NamesResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NamesResp create() => NamesResp._();
  @$core.override
  NamesResp createEmptyInstance() => create();
  static $pb.PbList<NamesResp> createRepeated() => $pb.PbList<NamesResp>();
  @$core.pragma('dart2js:noInline')
  static NamesResp getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NamesResp>(create);
  static NamesResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<NamesResp_Function> get functions => $_getList(0);
}

class CreateBotPluginReq extends $pb.GeneratedMessage {
  factory CreateBotPluginReq({
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

  CreateBotPluginReq._();

  factory CreateBotPluginReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateBotPluginReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateBotPluginReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
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
  CreateBotPluginReq clone() => CreateBotPluginReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateBotPluginReq copyWith(void Function(CreateBotPluginReq) updates) =>
      super.copyWith((message) => updates(message as CreateBotPluginReq))
          as CreateBotPluginReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateBotPluginReq create() => CreateBotPluginReq._();
  @$core.override
  CreateBotPluginReq createEmptyInstance() => create();
  static $pb.PbList<CreateBotPluginReq> createRepeated() =>
      $pb.PbList<CreateBotPluginReq>();
  @$core.pragma('dart2js:noInline')
  static CreateBotPluginReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateBotPluginReq>(create);
  static CreateBotPluginReq? _defaultInstance;

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

class BotPluginListReq extends $pb.GeneratedMessage {
  factory BotPluginListReq({
    $core.String? botDid,
    $core.String? name,
    $2.Pagination? pagination,
  }) {
    final result = create();
    if (botDid != null) result.botDid = botDid;
    if (name != null) result.name = name;
    if (pagination != null) result.pagination = pagination;
    return result;
  }

  BotPluginListReq._();

  factory BotPluginListReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BotPluginListReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BotPluginListReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'botDid')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOM<$2.Pagination>(3, _omitFieldNames ? '' : 'pagination',
        subBuilder: $2.Pagination.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotPluginListReq clone() => BotPluginListReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotPluginListReq copyWith(void Function(BotPluginListReq) updates) =>
      super.copyWith((message) => updates(message as BotPluginListReq))
          as BotPluginListReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BotPluginListReq create() => BotPluginListReq._();
  @$core.override
  BotPluginListReq createEmptyInstance() => create();
  static $pb.PbList<BotPluginListReq> createRepeated() =>
      $pb.PbList<BotPluginListReq>();
  @$core.pragma('dart2js:noInline')
  static BotPluginListReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BotPluginListReq>(create);
  static BotPluginListReq? _defaultInstance;

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
  $2.Pagination get pagination => $_getN(2);
  @$pb.TagNumber(3)
  set pagination($2.Pagination value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasPagination() => $_has(2);
  @$pb.TagNumber(3)
  void clearPagination() => $_clearField(3);
  @$pb.TagNumber(3)
  $2.Pagination ensurePagination() => $_ensure(2);
}

class BotPluginInfo extends $pb.GeneratedMessage {
  factory BotPluginInfo({
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

  BotPluginInfo._();

  factory BotPluginInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BotPluginInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BotPluginInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
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
  BotPluginInfo clone() => BotPluginInfo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotPluginInfo copyWith(void Function(BotPluginInfo) updates) =>
      super.copyWith((message) => updates(message as BotPluginInfo))
          as BotPluginInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BotPluginInfo create() => BotPluginInfo._();
  @$core.override
  BotPluginInfo createEmptyInstance() => create();
  static $pb.PbList<BotPluginInfo> createRepeated() =>
      $pb.PbList<BotPluginInfo>();
  @$core.pragma('dart2js:noInline')
  static BotPluginInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BotPluginInfo>(create);
  static BotPluginInfo? _defaultInstance;

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

class BotPluginListResp extends $pb.GeneratedMessage {
  factory BotPluginListResp({
    $fixnum.Int64? total,
    $core.Iterable<BotPluginInfo>? pluginInfoList,
  }) {
    final result = create();
    if (total != null) result.total = total;
    if (pluginInfoList != null) result.pluginInfoList.addAll(pluginInfoList);
    return result;
  }

  BotPluginListResp._();

  factory BotPluginListResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BotPluginListResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BotPluginListResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'total')
    ..pc<BotPluginInfo>(
        2, _omitFieldNames ? '' : 'pluginInfoList', $pb.PbFieldType.PM,
        subBuilder: BotPluginInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotPluginListResp clone() => BotPluginListResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BotPluginListResp copyWith(void Function(BotPluginListResp) updates) =>
      super.copyWith((message) => updates(message as BotPluginListResp))
          as BotPluginListResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BotPluginListResp create() => BotPluginListResp._();
  @$core.override
  BotPluginListResp createEmptyInstance() => create();
  static $pb.PbList<BotPluginListResp> createRepeated() =>
      $pb.PbList<BotPluginListResp>();
  @$core.pragma('dart2js:noInline')
  static BotPluginListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BotPluginListResp>(create);
  static BotPluginListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get total => $_getI64(0);
  @$pb.TagNumber(1)
  set total($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotal() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotal() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<BotPluginInfo> get pluginInfoList => $_getList(1);
}

class DeleteBotPluginReq extends $pb.GeneratedMessage {
  factory DeleteBotPluginReq({
    $core.String? uuid,
  }) {
    final result = create();
    if (uuid != null) result.uuid = uuid;
    return result;
  }

  DeleteBotPluginReq._();

  factory DeleteBotPluginReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteBotPluginReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteBotPluginReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteBotPluginReq clone() => DeleteBotPluginReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteBotPluginReq copyWith(void Function(DeleteBotPluginReq) updates) =>
      super.copyWith((message) => updates(message as DeleteBotPluginReq))
          as DeleteBotPluginReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteBotPluginReq create() => DeleteBotPluginReq._();
  @$core.override
  DeleteBotPluginReq createEmptyInstance() => create();
  static $pb.PbList<DeleteBotPluginReq> createRepeated() =>
      $pb.PbList<DeleteBotPluginReq>();
  @$core.pragma('dart2js:noInline')
  static DeleteBotPluginReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteBotPluginReq>(create);
  static DeleteBotPluginReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => $_clearField(1);
}

class DeleteBotPluginByDidsReq extends $pb.GeneratedMessage {
  factory DeleteBotPluginByDidsReq({
    $core.Iterable<$core.String>? botDids,
  }) {
    final result = create();
    if (botDids != null) result.botDids.addAll(botDids);
    return result;
  }

  DeleteBotPluginByDidsReq._();

  factory DeleteBotPluginByDidsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteBotPluginByDidsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteBotPluginByDidsReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'botDids')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteBotPluginByDidsReq clone() =>
      DeleteBotPluginByDidsReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteBotPluginByDidsReq copyWith(
          void Function(DeleteBotPluginByDidsReq) updates) =>
      super.copyWith((message) => updates(message as DeleteBotPluginByDidsReq))
          as DeleteBotPluginByDidsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteBotPluginByDidsReq create() => DeleteBotPluginByDidsReq._();
  @$core.override
  DeleteBotPluginByDidsReq createEmptyInstance() => create();
  static $pb.PbList<DeleteBotPluginByDidsReq> createRepeated() =>
      $pb.PbList<DeleteBotPluginByDidsReq>();
  @$core.pragma('dart2js:noInline')
  static DeleteBotPluginByDidsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteBotPluginByDidsReq>(create);
  static DeleteBotPluginByDidsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get botDids => $_getList(0);
}

class EditBotPluginReq extends $pb.GeneratedMessage {
  factory EditBotPluginReq({
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

  EditBotPluginReq._();

  factory EditBotPluginReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EditBotPluginReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EditBotPluginReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..aOS(2, _omitFieldNames ? '' : 'botDid')
    ..aOS(3, _omitFieldNames ? '' : 'type')
    ..aOS(4, _omitFieldNames ? '' : 'url')
    ..aOS(5, _omitFieldNames ? '' : 'functionDescription')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EditBotPluginReq clone() => EditBotPluginReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EditBotPluginReq copyWith(void Function(EditBotPluginReq) updates) =>
      super.copyWith((message) => updates(message as EditBotPluginReq))
          as EditBotPluginReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EditBotPluginReq create() => EditBotPluginReq._();
  @$core.override
  EditBotPluginReq createEmptyInstance() => create();
  static $pb.PbList<EditBotPluginReq> createRepeated() =>
      $pb.PbList<EditBotPluginReq>();
  @$core.pragma('dart2js:noInline')
  static EditBotPluginReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EditBotPluginReq>(create);
  static EditBotPluginReq? _defaultInstance;

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

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
