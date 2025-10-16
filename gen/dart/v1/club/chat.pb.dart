// This is a generated file - do not edit.
//
// Generated from v1/club/chat.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class CID extends $pb.GeneratedMessage {
  factory CID({
    $core.String? conversationId,
  }) {
    final result = create();
    if (conversationId != null) result.conversationId = conversationId;
    return result;
  }

  CID._();

  factory CID.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CID.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CID',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'conversationId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CID clone() => CID()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CID copyWith(void Function(CID) updates) =>
      super.copyWith((message) => updates(message as CID)) as CID;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CID create() => CID._();
  @$core.override
  CID createEmptyInstance() => create();
  static $pb.PbList<CID> createRepeated() => $pb.PbList<CID>();
  @$core.pragma('dart2js:noInline')
  static CID getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CID>(create);
  static CID? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get conversationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set conversationId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasConversationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearConversationId() => $_clearField(1);
}

class SpeechToTextParam extends $pb.GeneratedMessage {
  factory SpeechToTextParam({
    $core.String? audioUrl,
    $core.String? model,
    $core.String? lang,
  }) {
    final result = create();
    if (audioUrl != null) result.audioUrl = audioUrl;
    if (model != null) result.model = model;
    if (lang != null) result.lang = lang;
    return result;
  }

  SpeechToTextParam._();

  factory SpeechToTextParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SpeechToTextParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SpeechToTextParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'audioUrl')
    ..aOS(2, _omitFieldNames ? '' : 'Model', protoName: 'Model')
    ..aOS(3, _omitFieldNames ? '' : 'Lang', protoName: 'Lang')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpeechToTextParam clone() => SpeechToTextParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpeechToTextParam copyWith(void Function(SpeechToTextParam) updates) =>
      super.copyWith((message) => updates(message as SpeechToTextParam))
          as SpeechToTextParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SpeechToTextParam create() => SpeechToTextParam._();
  @$core.override
  SpeechToTextParam createEmptyInstance() => create();
  static $pb.PbList<SpeechToTextParam> createRepeated() =>
      $pb.PbList<SpeechToTextParam>();
  @$core.pragma('dart2js:noInline')
  static SpeechToTextParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SpeechToTextParam>(create);
  static SpeechToTextParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get audioUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set audioUrl($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAudioUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearAudioUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get model => $_getSZ(1);
  @$pb.TagNumber(2)
  set model($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasModel() => $_has(1);
  @$pb.TagNumber(2)
  void clearModel() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get lang => $_getSZ(2);
  @$pb.TagNumber(3)
  set lang($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLang() => $_has(2);
  @$pb.TagNumber(3)
  void clearLang() => $_clearField(3);
}

class ChatReply extends $pb.GeneratedMessage {
  factory ChatReply({
    $core.String? reply,
  }) {
    final result = create();
    if (reply != null) result.reply = reply;
    return result;
  }

  ChatReply._();

  factory ChatReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'reply')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatReply clone() => ChatReply()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatReply copyWith(void Function(ChatReply) updates) =>
      super.copyWith((message) => updates(message as ChatReply)) as ChatReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatReply create() => ChatReply._();
  @$core.override
  ChatReply createEmptyInstance() => create();
  static $pb.PbList<ChatReply> createRepeated() => $pb.PbList<ChatReply>();
  @$core.pragma('dart2js:noInline')
  static ChatReply getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatReply>(create);
  static ChatReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get reply => $_getSZ(0);
  @$pb.TagNumber(1)
  set reply($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReply() => $_has(0);
  @$pb.TagNumber(1)
  void clearReply() => $_clearField(1);
}

class MessagesContent extends $pb.GeneratedMessage {
  factory MessagesContent({
    $core.String? type,
    $core.String? content,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (content != null) result.content = content;
    return result;
  }

  MessagesContent._();

  factory MessagesContent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MessagesContent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MessagesContent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'type')
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessagesContent clone() => MessagesContent()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessagesContent copyWith(void Function(MessagesContent) updates) =>
      super.copyWith((message) => updates(message as MessagesContent))
          as MessagesContent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MessagesContent create() => MessagesContent._();
  @$core.override
  MessagesContent createEmptyInstance() => create();
  static $pb.PbList<MessagesContent> createRepeated() =>
      $pb.PbList<MessagesContent>();
  @$core.pragma('dart2js:noInline')
  static MessagesContent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MessagesContent>(create);
  static MessagesContent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => $_clearField(2);
}

class ChatParam extends $pb.GeneratedMessage {
  factory ChatParam({
    $core.String? conversationId,
    $core.String? botDid,
    $core.Iterable<MessagesContent>? messages,
  }) {
    final result = create();
    if (conversationId != null) result.conversationId = conversationId;
    if (botDid != null) result.botDid = botDid;
    if (messages != null) result.messages.addAll(messages);
    return result;
  }

  ChatParam._();

  factory ChatParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'conversationId')
    ..aOS(2, _omitFieldNames ? '' : 'botDid')
    ..pc<MessagesContent>(
        3, _omitFieldNames ? '' : 'messages', $pb.PbFieldType.PM,
        subBuilder: MessagesContent.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatParam clone() => ChatParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatParam copyWith(void Function(ChatParam) updates) =>
      super.copyWith((message) => updates(message as ChatParam)) as ChatParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatParam create() => ChatParam._();
  @$core.override
  ChatParam createEmptyInstance() => create();
  static $pb.PbList<ChatParam> createRepeated() => $pb.PbList<ChatParam>();
  @$core.pragma('dart2js:noInline')
  static ChatParam getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatParam>(create);
  static ChatParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get conversationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set conversationId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasConversationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearConversationId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get botDid => $_getSZ(1);
  @$pb.TagNumber(2)
  set botDid($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBotDid() => $_has(1);
  @$pb.TagNumber(2)
  void clearBotDid() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<MessagesContent> get messages => $_getList(2);
}

class StreamParam extends $pb.GeneratedMessage {
  factory StreamParam({
    $core.String? did,
    $core.String? conversationId,
    $core.Iterable<MessagesContent>? messages,
    $core.String? state,
    $core.String? returnPluginUse,
    $core.String? returnTrainingData,
    $core.String? returnContext,
  }) {
    final result = create();
    if (did != null) result.did = did;
    if (conversationId != null) result.conversationId = conversationId;
    if (messages != null) result.messages.addAll(messages);
    if (state != null) result.state = state;
    if (returnPluginUse != null) result.returnPluginUse = returnPluginUse;
    if (returnTrainingData != null)
      result.returnTrainingData = returnTrainingData;
    if (returnContext != null) result.returnContext = returnContext;
    return result;
  }

  StreamParam._();

  factory StreamParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StreamParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StreamParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..aOS(2, _omitFieldNames ? '' : 'conversationId')
    ..pc<MessagesContent>(
        3, _omitFieldNames ? '' : 'messages', $pb.PbFieldType.PM,
        subBuilder: MessagesContent.create)
    ..aOS(4, _omitFieldNames ? '' : 'state')
    ..aOS(5, _omitFieldNames ? '' : 'returnPluginUse')
    ..aOS(6, _omitFieldNames ? '' : 'returnTrainingData')
    ..aOS(7, _omitFieldNames ? '' : 'returnContext')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamParam clone() => StreamParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamParam copyWith(void Function(StreamParam) updates) =>
      super.copyWith((message) => updates(message as StreamParam))
          as StreamParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamParam create() => StreamParam._();
  @$core.override
  StreamParam createEmptyInstance() => create();
  static $pb.PbList<StreamParam> createRepeated() => $pb.PbList<StreamParam>();
  @$core.pragma('dart2js:noInline')
  static StreamParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StreamParam>(create);
  static StreamParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get did => $_getSZ(0);
  @$pb.TagNumber(1)
  set did($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get conversationId => $_getSZ(1);
  @$pb.TagNumber(2)
  set conversationId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasConversationId() => $_has(1);
  @$pb.TagNumber(2)
  void clearConversationId() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<MessagesContent> get messages => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get state => $_getSZ(3);
  @$pb.TagNumber(4)
  set state($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasState() => $_has(3);
  @$pb.TagNumber(4)
  void clearState() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get returnPluginUse => $_getSZ(4);
  @$pb.TagNumber(5)
  set returnPluginUse($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasReturnPluginUse() => $_has(4);
  @$pb.TagNumber(5)
  void clearReturnPluginUse() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get returnTrainingData => $_getSZ(5);
  @$pb.TagNumber(6)
  set returnTrainingData($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasReturnTrainingData() => $_has(5);
  @$pb.TagNumber(6)
  void clearReturnTrainingData() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get returnContext => $_getSZ(6);
  @$pb.TagNumber(7)
  set returnContext($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasReturnContext() => $_has(6);
  @$pb.TagNumber(7)
  void clearReturnContext() => $_clearField(7);
}

class GetContextParam extends $pb.GeneratedMessage {
  factory GetContextParam({
    $core.String? conversationId,
    $core.String? botDid,
  }) {
    final result = create();
    if (conversationId != null) result.conversationId = conversationId;
    if (botDid != null) result.botDid = botDid;
    return result;
  }

  GetContextParam._();

  factory GetContextParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetContextParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetContextParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'conversationId')
    ..aOS(2, _omitFieldNames ? '' : 'botDid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetContextParam clone() => GetContextParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetContextParam copyWith(void Function(GetContextParam) updates) =>
      super.copyWith((message) => updates(message as GetContextParam))
          as GetContextParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetContextParam create() => GetContextParam._();
  @$core.override
  GetContextParam createEmptyInstance() => create();
  static $pb.PbList<GetContextParam> createRepeated() =>
      $pb.PbList<GetContextParam>();
  @$core.pragma('dart2js:noInline')
  static GetContextParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetContextParam>(create);
  static GetContextParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get conversationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set conversationId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasConversationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearConversationId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get botDid => $_getSZ(1);
  @$pb.TagNumber(2)
  set botDid($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBotDid() => $_has(1);
  @$pb.TagNumber(2)
  void clearBotDid() => $_clearField(2);
}

class FunctionDefinition extends $pb.GeneratedMessage {
  factory FunctionDefinition({
    $core.String? name,
    $core.String? description,
    $core.bool? strict,
    $core.List<$core.int>? parameters,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (description != null) result.description = description;
    if (strict != null) result.strict = strict;
    if (parameters != null) result.parameters = parameters;
    return result;
  }

  FunctionDefinition._();

  factory FunctionDefinition.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FunctionDefinition.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FunctionDefinition',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'description')
    ..aOB(3, _omitFieldNames ? '' : 'strict')
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'parameters', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FunctionDefinition clone() => FunctionDefinition()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FunctionDefinition copyWith(void Function(FunctionDefinition) updates) =>
      super.copyWith((message) => updates(message as FunctionDefinition))
          as FunctionDefinition;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FunctionDefinition create() => FunctionDefinition._();
  @$core.override
  FunctionDefinition createEmptyInstance() => create();
  static $pb.PbList<FunctionDefinition> createRepeated() =>
      $pb.PbList<FunctionDefinition>();
  @$core.pragma('dart2js:noInline')
  static FunctionDefinition getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FunctionDefinition>(create);
  static FunctionDefinition? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get strict => $_getBF(2);
  @$pb.TagNumber(3)
  set strict($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStrict() => $_has(2);
  @$pb.TagNumber(3)
  void clearStrict() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get parameters => $_getN(3);
  @$pb.TagNumber(4)
  set parameters($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasParameters() => $_has(3);
  @$pb.TagNumber(4)
  void clearParameters() => $_clearField(4);
}

class Tool extends $pb.GeneratedMessage {
  factory Tool({
    $core.String? type,
    FunctionDefinition? function,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (function != null) result.function = function;
    return result;
  }

  Tool._();

  factory Tool.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Tool.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Tool',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'type')
    ..aOM<FunctionDefinition>(2, _omitFieldNames ? '' : 'function',
        subBuilder: FunctionDefinition.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Tool clone() => Tool()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Tool copyWith(void Function(Tool) updates) =>
      super.copyWith((message) => updates(message as Tool)) as Tool;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Tool create() => Tool._();
  @$core.override
  Tool createEmptyInstance() => create();
  static $pb.PbList<Tool> createRepeated() => $pb.PbList<Tool>();
  @$core.pragma('dart2js:noInline')
  static Tool getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Tool>(create);
  static Tool? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  FunctionDefinition get function => $_getN(1);
  @$pb.TagNumber(2)
  set function(FunctionDefinition value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasFunction() => $_has(1);
  @$pb.TagNumber(2)
  void clearFunction() => $_clearField(2);
  @$pb.TagNumber(2)
  FunctionDefinition ensureFunction() => $_ensure(1);
}

class TextToTextParam extends $pb.GeneratedMessage {
  factory TextToTextParam({
    $core.String? did,
    $core.String? conversationId,
    $core.Iterable<MessagesContent>? messages,
    $core.String? voice,
    $core.Iterable<Tool>? tools,
    $core.String? toolChoice,
    $core.String? customer,
    $core.String? state,
  }) {
    final result = create();
    if (did != null) result.did = did;
    if (conversationId != null) result.conversationId = conversationId;
    if (messages != null) result.messages.addAll(messages);
    if (voice != null) result.voice = voice;
    if (tools != null) result.tools.addAll(tools);
    if (toolChoice != null) result.toolChoice = toolChoice;
    if (customer != null) result.customer = customer;
    if (state != null) result.state = state;
    return result;
  }

  TextToTextParam._();

  factory TextToTextParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TextToTextParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TextToTextParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..aOS(2, _omitFieldNames ? '' : 'conversationId')
    ..pc<MessagesContent>(
        3, _omitFieldNames ? '' : 'messages', $pb.PbFieldType.PM,
        subBuilder: MessagesContent.create)
    ..aOS(4, _omitFieldNames ? '' : 'voice')
    ..pc<Tool>(5, _omitFieldNames ? '' : 'tools', $pb.PbFieldType.PM,
        subBuilder: Tool.create)
    ..aOS(6, _omitFieldNames ? '' : 'toolChoice')
    ..aOS(7, _omitFieldNames ? '' : 'customer')
    ..aOS(8, _omitFieldNames ? '' : 'state')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextToTextParam clone() => TextToTextParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextToTextParam copyWith(void Function(TextToTextParam) updates) =>
      super.copyWith((message) => updates(message as TextToTextParam))
          as TextToTextParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TextToTextParam create() => TextToTextParam._();
  @$core.override
  TextToTextParam createEmptyInstance() => create();
  static $pb.PbList<TextToTextParam> createRepeated() =>
      $pb.PbList<TextToTextParam>();
  @$core.pragma('dart2js:noInline')
  static TextToTextParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TextToTextParam>(create);
  static TextToTextParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get did => $_getSZ(0);
  @$pb.TagNumber(1)
  set did($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get conversationId => $_getSZ(1);
  @$pb.TagNumber(2)
  set conversationId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasConversationId() => $_has(1);
  @$pb.TagNumber(2)
  void clearConversationId() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<MessagesContent> get messages => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get voice => $_getSZ(3);
  @$pb.TagNumber(4)
  set voice($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasVoice() => $_has(3);
  @$pb.TagNumber(4)
  void clearVoice() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<Tool> get tools => $_getList(4);

  @$pb.TagNumber(6)
  $core.String get toolChoice => $_getSZ(5);
  @$pb.TagNumber(6)
  set toolChoice($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasToolChoice() => $_has(5);
  @$pb.TagNumber(6)
  void clearToolChoice() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get customer => $_getSZ(6);
  @$pb.TagNumber(7)
  set customer($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasCustomer() => $_has(6);
  @$pb.TagNumber(7)
  void clearCustomer() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get state => $_getSZ(7);
  @$pb.TagNumber(8)
  set state($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasState() => $_has(7);
  @$pb.TagNumber(8)
  void clearState() => $_clearField(8);
}

class SpeechToSpeechParam extends $pb.GeneratedMessage {
  factory SpeechToSpeechParam({
    $core.String? did,
    $core.String? conversationId,
    $core.Iterable<MessagesContent>? messages,
    $core.String? voice,
    $core.Iterable<Tool>? tools,
    $core.String? toolChoice,
    $core.String? customer,
    $core.String? state,
  }) {
    final result = create();
    if (did != null) result.did = did;
    if (conversationId != null) result.conversationId = conversationId;
    if (messages != null) result.messages.addAll(messages);
    if (voice != null) result.voice = voice;
    if (tools != null) result.tools.addAll(tools);
    if (toolChoice != null) result.toolChoice = toolChoice;
    if (customer != null) result.customer = customer;
    if (state != null) result.state = state;
    return result;
  }

  SpeechToSpeechParam._();

  factory SpeechToSpeechParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SpeechToSpeechParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SpeechToSpeechParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..aOS(2, _omitFieldNames ? '' : 'conversationId')
    ..pc<MessagesContent>(
        3, _omitFieldNames ? '' : 'messages', $pb.PbFieldType.PM,
        subBuilder: MessagesContent.create)
    ..aOS(4, _omitFieldNames ? '' : 'voice')
    ..pc<Tool>(5, _omitFieldNames ? '' : 'tools', $pb.PbFieldType.PM,
        subBuilder: Tool.create)
    ..aOS(6, _omitFieldNames ? '' : 'toolChoice')
    ..aOS(7, _omitFieldNames ? '' : 'customer')
    ..aOS(8, _omitFieldNames ? '' : 'state')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpeechToSpeechParam clone() => SpeechToSpeechParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpeechToSpeechParam copyWith(void Function(SpeechToSpeechParam) updates) =>
      super.copyWith((message) => updates(message as SpeechToSpeechParam))
          as SpeechToSpeechParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SpeechToSpeechParam create() => SpeechToSpeechParam._();
  @$core.override
  SpeechToSpeechParam createEmptyInstance() => create();
  static $pb.PbList<SpeechToSpeechParam> createRepeated() =>
      $pb.PbList<SpeechToSpeechParam>();
  @$core.pragma('dart2js:noInline')
  static SpeechToSpeechParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SpeechToSpeechParam>(create);
  static SpeechToSpeechParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get did => $_getSZ(0);
  @$pb.TagNumber(1)
  set did($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get conversationId => $_getSZ(1);
  @$pb.TagNumber(2)
  set conversationId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasConversationId() => $_has(1);
  @$pb.TagNumber(2)
  void clearConversationId() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<MessagesContent> get messages => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get voice => $_getSZ(3);
  @$pb.TagNumber(4)
  set voice($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasVoice() => $_has(3);
  @$pb.TagNumber(4)
  void clearVoice() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<Tool> get tools => $_getList(4);

  @$pb.TagNumber(6)
  $core.String get toolChoice => $_getSZ(5);
  @$pb.TagNumber(6)
  set toolChoice($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasToolChoice() => $_has(5);
  @$pb.TagNumber(6)
  void clearToolChoice() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get customer => $_getSZ(6);
  @$pb.TagNumber(7)
  set customer($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasCustomer() => $_has(6);
  @$pb.TagNumber(7)
  void clearCustomer() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get state => $_getSZ(7);
  @$pb.TagNumber(8)
  set state($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasState() => $_has(7);
  @$pb.TagNumber(8)
  void clearState() => $_clearField(8);
}

class SpeechToSpeechReply extends $pb.GeneratedMessage {
  factory SpeechToSpeechReply({
    $core.String? audioUrl,
    $core.String? toolId,
    $core.Iterable<ToolCall>? toolCalls,
  }) {
    final result = create();
    if (audioUrl != null) result.audioUrl = audioUrl;
    if (toolId != null) result.toolId = toolId;
    if (toolCalls != null) result.toolCalls.addAll(toolCalls);
    return result;
  }

  SpeechToSpeechReply._();

  factory SpeechToSpeechReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SpeechToSpeechReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SpeechToSpeechReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'audioUrl')
    ..aOS(2, _omitFieldNames ? '' : 'toolId')
    ..pc<ToolCall>(3, _omitFieldNames ? '' : 'toolCalls', $pb.PbFieldType.PM,
        subBuilder: ToolCall.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpeechToSpeechReply clone() => SpeechToSpeechReply()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpeechToSpeechReply copyWith(void Function(SpeechToSpeechReply) updates) =>
      super.copyWith((message) => updates(message as SpeechToSpeechReply))
          as SpeechToSpeechReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SpeechToSpeechReply create() => SpeechToSpeechReply._();
  @$core.override
  SpeechToSpeechReply createEmptyInstance() => create();
  static $pb.PbList<SpeechToSpeechReply> createRepeated() =>
      $pb.PbList<SpeechToSpeechReply>();
  @$core.pragma('dart2js:noInline')
  static SpeechToSpeechReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SpeechToSpeechReply>(create);
  static SpeechToSpeechReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get audioUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set audioUrl($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAudioUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearAudioUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get toolId => $_getSZ(1);
  @$pb.TagNumber(2)
  set toolId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasToolId() => $_has(1);
  @$pb.TagNumber(2)
  void clearToolId() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<ToolCall> get toolCalls => $_getList(2);
}

class FunctionCall extends $pb.GeneratedMessage {
  factory FunctionCall({
    $core.String? name,
    $core.String? arguments,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (arguments != null) result.arguments = arguments;
    return result;
  }

  FunctionCall._();

  factory FunctionCall.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FunctionCall.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FunctionCall',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'arguments')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FunctionCall clone() => FunctionCall()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FunctionCall copyWith(void Function(FunctionCall) updates) =>
      super.copyWith((message) => updates(message as FunctionCall))
          as FunctionCall;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FunctionCall create() => FunctionCall._();
  @$core.override
  FunctionCall createEmptyInstance() => create();
  static $pb.PbList<FunctionCall> createRepeated() =>
      $pb.PbList<FunctionCall>();
  @$core.pragma('dart2js:noInline')
  static FunctionCall getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FunctionCall>(create);
  static FunctionCall? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get arguments => $_getSZ(1);
  @$pb.TagNumber(2)
  set arguments($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasArguments() => $_has(1);
  @$pb.TagNumber(2)
  void clearArguments() => $_clearField(2);
}

class ToolCall extends $pb.GeneratedMessage {
  factory ToolCall({
    $core.int? index,
    $core.String? id,
    $core.String? type,
    FunctionCall? function,
  }) {
    final result = create();
    if (index != null) result.index = index;
    if (id != null) result.id = id;
    if (type != null) result.type = type;
    if (function != null) result.function = function;
    return result;
  }

  ToolCall._();

  factory ToolCall.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ToolCall.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ToolCall',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'index', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'id')
    ..aOS(3, _omitFieldNames ? '' : 'type')
    ..aOM<FunctionCall>(4, _omitFieldNames ? '' : 'function',
        subBuilder: FunctionCall.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ToolCall clone() => ToolCall()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ToolCall copyWith(void Function(ToolCall) updates) =>
      super.copyWith((message) => updates(message as ToolCall)) as ToolCall;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ToolCall create() => ToolCall._();
  @$core.override
  ToolCall createEmptyInstance() => create();
  static $pb.PbList<ToolCall> createRepeated() => $pb.PbList<ToolCall>();
  @$core.pragma('dart2js:noInline')
  static ToolCall getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ToolCall>(create);
  static ToolCall? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get index => $_getIZ(0);
  @$pb.TagNumber(1)
  set index($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearIndex() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get type => $_getSZ(2);
  @$pb.TagNumber(3)
  set type($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => $_clearField(3);

  @$pb.TagNumber(4)
  FunctionCall get function => $_getN(3);
  @$pb.TagNumber(4)
  set function(FunctionCall value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasFunction() => $_has(3);
  @$pb.TagNumber(4)
  void clearFunction() => $_clearField(4);
  @$pb.TagNumber(4)
  FunctionCall ensureFunction() => $_ensure(3);
}

class TextToTextReply extends $pb.GeneratedMessage {
  factory TextToTextReply({
    $core.String? reply,
    $core.String? toolId,
    $core.Iterable<ToolCall>? toolCalls,
  }) {
    final result = create();
    if (reply != null) result.reply = reply;
    if (toolId != null) result.toolId = toolId;
    if (toolCalls != null) result.toolCalls.addAll(toolCalls);
    return result;
  }

  TextToTextReply._();

  factory TextToTextReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TextToTextReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TextToTextReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'reply')
    ..aOS(2, _omitFieldNames ? '' : 'toolId')
    ..pc<ToolCall>(3, _omitFieldNames ? '' : 'toolCalls', $pb.PbFieldType.PM,
        subBuilder: ToolCall.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextToTextReply clone() => TextToTextReply()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextToTextReply copyWith(void Function(TextToTextReply) updates) =>
      super.copyWith((message) => updates(message as TextToTextReply))
          as TextToTextReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TextToTextReply create() => TextToTextReply._();
  @$core.override
  TextToTextReply createEmptyInstance() => create();
  static $pb.PbList<TextToTextReply> createRepeated() =>
      $pb.PbList<TextToTextReply>();
  @$core.pragma('dart2js:noInline')
  static TextToTextReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TextToTextReply>(create);
  static TextToTextReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get reply => $_getSZ(0);
  @$pb.TagNumber(1)
  set reply($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReply() => $_has(0);
  @$pb.TagNumber(1)
  void clearReply() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get toolId => $_getSZ(1);
  @$pb.TagNumber(2)
  set toolId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasToolId() => $_has(1);
  @$pb.TagNumber(2)
  void clearToolId() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<ToolCall> get toolCalls => $_getList(2);
}

class ToolCallsResult extends $pb.GeneratedMessage {
  factory ToolCallsResult({
    $core.String? toolCallId,
    $core.Iterable<MessagesContent>? results,
  }) {
    final result = create();
    if (toolCallId != null) result.toolCallId = toolCallId;
    if (results != null) result.results.addAll(results);
    return result;
  }

  ToolCallsResult._();

  factory ToolCallsResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ToolCallsResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ToolCallsResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'toolCallId')
    ..pc<MessagesContent>(
        2, _omitFieldNames ? '' : 'results', $pb.PbFieldType.PM,
        subBuilder: MessagesContent.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ToolCallsResult clone() => ToolCallsResult()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ToolCallsResult copyWith(void Function(ToolCallsResult) updates) =>
      super.copyWith((message) => updates(message as ToolCallsResult))
          as ToolCallsResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ToolCallsResult create() => ToolCallsResult._();
  @$core.override
  ToolCallsResult createEmptyInstance() => create();
  static $pb.PbList<ToolCallsResult> createRepeated() =>
      $pb.PbList<ToolCallsResult>();
  @$core.pragma('dart2js:noInline')
  static ToolCallsResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ToolCallsResult>(create);
  static ToolCallsResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get toolCallId => $_getSZ(0);
  @$pb.TagNumber(1)
  set toolCallId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasToolCallId() => $_has(0);
  @$pb.TagNumber(1)
  void clearToolCallId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<MessagesContent> get results => $_getList(1);
}

class CallToolsParam extends $pb.GeneratedMessage {
  factory CallToolsParam({
    $core.String? toolId,
    $core.Iterable<ToolCallsResult>? toolResults,
  }) {
    final result = create();
    if (toolId != null) result.toolId = toolId;
    if (toolResults != null) result.toolResults.addAll(toolResults);
    return result;
  }

  CallToolsParam._();

  factory CallToolsParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CallToolsParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CallToolsParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'toolId')
    ..pc<ToolCallsResult>(
        2, _omitFieldNames ? '' : 'toolResults', $pb.PbFieldType.PM,
        subBuilder: ToolCallsResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CallToolsParam clone() => CallToolsParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CallToolsParam copyWith(void Function(CallToolsParam) updates) =>
      super.copyWith((message) => updates(message as CallToolsParam))
          as CallToolsParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CallToolsParam create() => CallToolsParam._();
  @$core.override
  CallToolsParam createEmptyInstance() => create();
  static $pb.PbList<CallToolsParam> createRepeated() =>
      $pb.PbList<CallToolsParam>();
  @$core.pragma('dart2js:noInline')
  static CallToolsParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CallToolsParam>(create);
  static CallToolsParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get toolId => $_getSZ(0);
  @$pb.TagNumber(1)
  set toolId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasToolId() => $_has(0);
  @$pb.TagNumber(1)
  void clearToolId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<ToolCallsResult> get toolResults => $_getList(1);
}

class ChatCompletionMessage extends $pb.GeneratedMessage {
  factory ChatCompletionMessage({
    $core.String? role,
    $core.String? content,
    $core.String? refusal,
    $core.String? name,
    FunctionCall? functionCall,
    $core.Iterable<ToolCall>? toolCalls,
    $core.String? toolCallId,
  }) {
    final result = create();
    if (role != null) result.role = role;
    if (content != null) result.content = content;
    if (refusal != null) result.refusal = refusal;
    if (name != null) result.name = name;
    if (functionCall != null) result.functionCall = functionCall;
    if (toolCalls != null) result.toolCalls.addAll(toolCalls);
    if (toolCallId != null) result.toolCallId = toolCallId;
    return result;
  }

  ChatCompletionMessage._();

  factory ChatCompletionMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatCompletionMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatCompletionMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'role')
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..aOS(3, _omitFieldNames ? '' : 'refusal')
    ..aOS(4, _omitFieldNames ? '' : 'name')
    ..aOM<FunctionCall>(5, _omitFieldNames ? '' : 'functionCall',
        subBuilder: FunctionCall.create)
    ..pc<ToolCall>(6, _omitFieldNames ? '' : 'toolCalls', $pb.PbFieldType.PM,
        subBuilder: ToolCall.create)
    ..aOS(7, _omitFieldNames ? '' : 'toolCallId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatCompletionMessage clone() =>
      ChatCompletionMessage()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatCompletionMessage copyWith(
          void Function(ChatCompletionMessage) updates) =>
      super.copyWith((message) => updates(message as ChatCompletionMessage))
          as ChatCompletionMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatCompletionMessage create() => ChatCompletionMessage._();
  @$core.override
  ChatCompletionMessage createEmptyInstance() => create();
  static $pb.PbList<ChatCompletionMessage> createRepeated() =>
      $pb.PbList<ChatCompletionMessage>();
  @$core.pragma('dart2js:noInline')
  static ChatCompletionMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatCompletionMessage>(create);
  static ChatCompletionMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get role => $_getSZ(0);
  @$pb.TagNumber(1)
  set role($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRole() => $_has(0);
  @$pb.TagNumber(1)
  void clearRole() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get refusal => $_getSZ(2);
  @$pb.TagNumber(3)
  set refusal($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRefusal() => $_has(2);
  @$pb.TagNumber(3)
  void clearRefusal() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => $_clearField(4);

  @$pb.TagNumber(5)
  FunctionCall get functionCall => $_getN(4);
  @$pb.TagNumber(5)
  set functionCall(FunctionCall value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasFunctionCall() => $_has(4);
  @$pb.TagNumber(5)
  void clearFunctionCall() => $_clearField(5);
  @$pb.TagNumber(5)
  FunctionCall ensureFunctionCall() => $_ensure(4);

  @$pb.TagNumber(6)
  $pb.PbList<ToolCall> get toolCalls => $_getList(5);

  @$pb.TagNumber(7)
  $core.String get toolCallId => $_getSZ(6);
  @$pb.TagNumber(7)
  set toolCallId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasToolCallId() => $_has(6);
  @$pb.TagNumber(7)
  void clearToolCallId() => $_clearField(7);
}

class ChatCompletionMessageList extends $pb.GeneratedMessage {
  factory ChatCompletionMessageList({
    $core.Iterable<ChatCompletionMessage>? messageList,
  }) {
    final result = create();
    if (messageList != null) result.messageList.addAll(messageList);
    return result;
  }

  ChatCompletionMessageList._();

  factory ChatCompletionMessageList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatCompletionMessageList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatCompletionMessageList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..pc<ChatCompletionMessage>(
        1, _omitFieldNames ? '' : 'messageList', $pb.PbFieldType.PM,
        subBuilder: ChatCompletionMessage.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatCompletionMessageList clone() =>
      ChatCompletionMessageList()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatCompletionMessageList copyWith(
          void Function(ChatCompletionMessageList) updates) =>
      super.copyWith((message) => updates(message as ChatCompletionMessageList))
          as ChatCompletionMessageList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatCompletionMessageList create() => ChatCompletionMessageList._();
  @$core.override
  ChatCompletionMessageList createEmptyInstance() => create();
  static $pb.PbList<ChatCompletionMessageList> createRepeated() =>
      $pb.PbList<ChatCompletionMessageList>();
  @$core.pragma('dart2js:noInline')
  static ChatCompletionMessageList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatCompletionMessageList>(create);
  static ChatCompletionMessageList? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ChatCompletionMessage> get messageList => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
