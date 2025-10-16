// This is a generated file - do not edit.
//
// Generated from v1/ai/chat.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class GenerateCidResp extends $pb.GeneratedMessage {
  factory GenerateCidResp({
    $core.String? cid,
  }) {
    final result = create();
    if (cid != null) result.cid = cid;
    return result;
  }

  GenerateCidResp._();

  factory GenerateCidResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GenerateCidResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GenerateCidResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'cid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateCidResp clone() => GenerateCidResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateCidResp copyWith(void Function(GenerateCidResp) updates) =>
      super.copyWith((message) => updates(message as GenerateCidResp))
          as GenerateCidResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateCidResp create() => GenerateCidResp._();
  @$core.override
  GenerateCidResp createEmptyInstance() => create();
  static $pb.PbList<GenerateCidResp> createRepeated() =>
      $pb.PbList<GenerateCidResp>();
  @$core.pragma('dart2js:noInline')
  static GenerateCidResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GenerateCidResp>(create);
  static GenerateCidResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get cid => $_getSZ(0);
  @$pb.TagNumber(1)
  set cid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCid() => $_has(0);
  @$pb.TagNumber(1)
  void clearCid() => $_clearField(1);
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
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

class DialogReq extends $pb.GeneratedMessage {
  factory DialogReq({
    $core.String? did,
    $core.String? cid,
    $core.Iterable<MessagesContent>? messages,
    $core.String? state,
    $core.String? returnPluginUse,
    $core.String? returnTrainingData,
    $core.String? returnContext,
  }) {
    final result = create();
    if (did != null) result.did = did;
    if (cid != null) result.cid = cid;
    if (messages != null) result.messages.addAll(messages);
    if (state != null) result.state = state;
    if (returnPluginUse != null) result.returnPluginUse = returnPluginUse;
    if (returnTrainingData != null)
      result.returnTrainingData = returnTrainingData;
    if (returnContext != null) result.returnContext = returnContext;
    return result;
  }

  DialogReq._();

  factory DialogReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DialogReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DialogReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..aOS(2, _omitFieldNames ? '' : 'cid')
    ..pc<MessagesContent>(
        3, _omitFieldNames ? '' : 'messages', $pb.PbFieldType.PM,
        subBuilder: MessagesContent.create)
    ..aOS(4, _omitFieldNames ? '' : 'state')
    ..aOS(5, _omitFieldNames ? '' : 'returnPluginUse')
    ..aOS(6, _omitFieldNames ? '' : 'returnTrainingData')
    ..aOS(7, _omitFieldNames ? '' : 'returnContext')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DialogReq clone() => DialogReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DialogReq copyWith(void Function(DialogReq) updates) =>
      super.copyWith((message) => updates(message as DialogReq)) as DialogReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DialogReq create() => DialogReq._();
  @$core.override
  DialogReq createEmptyInstance() => create();
  static $pb.PbList<DialogReq> createRepeated() => $pb.PbList<DialogReq>();
  @$core.pragma('dart2js:noInline')
  static DialogReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DialogReq>(create);
  static DialogReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get did => $_getSZ(0);
  @$pb.TagNumber(1)
  set did($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get cid => $_getSZ(1);
  @$pb.TagNumber(2)
  set cid($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCid() => $_has(1);
  @$pb.TagNumber(2)
  void clearCid() => $_clearField(2);

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

class DialogResp extends $pb.GeneratedMessage {
  factory DialogResp({
    $core.String? reply,
  }) {
    final result = create();
    if (reply != null) result.reply = reply;
    return result;
  }

  DialogResp._();

  factory DialogResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DialogResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DialogResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'reply')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DialogResp clone() => DialogResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DialogResp copyWith(void Function(DialogResp) updates) =>
      super.copyWith((message) => updates(message as DialogResp)) as DialogResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DialogResp create() => DialogResp._();
  @$core.override
  DialogResp createEmptyInstance() => create();
  static $pb.PbList<DialogResp> createRepeated() => $pb.PbList<DialogResp>();
  @$core.pragma('dart2js:noInline')
  static DialogResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DialogResp>(create);
  static DialogResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get reply => $_getSZ(0);
  @$pb.TagNumber(1)
  set reply($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReply() => $_has(0);
  @$pb.TagNumber(1)
  void clearReply() => $_clearField(1);
}

class DialogStreamReq extends $pb.GeneratedMessage {
  factory DialogStreamReq({
    $core.String? did,
    $core.String? cid,
    $core.Iterable<MessagesContent>? messages,
    $core.String? state,
    $core.String? returnPluginUse,
    $core.String? returnTrainingData,
    $core.String? returnContext,
  }) {
    final result = create();
    if (did != null) result.did = did;
    if (cid != null) result.cid = cid;
    if (messages != null) result.messages.addAll(messages);
    if (state != null) result.state = state;
    if (returnPluginUse != null) result.returnPluginUse = returnPluginUse;
    if (returnTrainingData != null)
      result.returnTrainingData = returnTrainingData;
    if (returnContext != null) result.returnContext = returnContext;
    return result;
  }

  DialogStreamReq._();

  factory DialogStreamReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DialogStreamReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DialogStreamReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..aOS(2, _omitFieldNames ? '' : 'cid')
    ..pc<MessagesContent>(
        3, _omitFieldNames ? '' : 'messages', $pb.PbFieldType.PM,
        subBuilder: MessagesContent.create)
    ..aOS(4, _omitFieldNames ? '' : 'state')
    ..aOS(5, _omitFieldNames ? '' : 'returnPluginUse')
    ..aOS(6, _omitFieldNames ? '' : 'returnTrainingData')
    ..aOS(7, _omitFieldNames ? '' : 'returnContext')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DialogStreamReq clone() => DialogStreamReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DialogStreamReq copyWith(void Function(DialogStreamReq) updates) =>
      super.copyWith((message) => updates(message as DialogStreamReq))
          as DialogStreamReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DialogStreamReq create() => DialogStreamReq._();
  @$core.override
  DialogStreamReq createEmptyInstance() => create();
  static $pb.PbList<DialogStreamReq> createRepeated() =>
      $pb.PbList<DialogStreamReq>();
  @$core.pragma('dart2js:noInline')
  static DialogStreamReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DialogStreamReq>(create);
  static DialogStreamReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get did => $_getSZ(0);
  @$pb.TagNumber(1)
  set did($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get cid => $_getSZ(1);
  @$pb.TagNumber(2)
  set cid($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCid() => $_has(1);
  @$pb.TagNumber(2)
  void clearCid() => $_clearField(2);

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

class DialogStreamResp extends $pb.GeneratedMessage {
  factory DialogStreamResp({
    $core.int? code,
    $core.String? type,
    $core.String? message,
  }) {
    final result = create();
    if (code != null) result.code = code;
    if (type != null) result.type = type;
    if (message != null) result.message = message;
    return result;
  }

  DialogStreamResp._();

  factory DialogStreamResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DialogStreamResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DialogStreamResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'code', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'type')
    ..aOS(3, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DialogStreamResp clone() => DialogStreamResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DialogStreamResp copyWith(void Function(DialogStreamResp) updates) =>
      super.copyWith((message) => updates(message as DialogStreamResp))
          as DialogStreamResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DialogStreamResp create() => DialogStreamResp._();
  @$core.override
  DialogStreamResp createEmptyInstance() => create();
  static $pb.PbList<DialogStreamResp> createRepeated() =>
      $pb.PbList<DialogStreamResp>();
  @$core.pragma('dart2js:noInline')
  static DialogStreamResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DialogStreamResp>(create);
  static DialogStreamResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get code => $_getIZ(0);
  @$pb.TagNumber(1)
  set code($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get type => $_getSZ(1);
  @$pb.TagNumber(2)
  set type($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => $_clearField(3);
}

class ClearContextReq extends $pb.GeneratedMessage {
  factory ClearContextReq({
    $core.String? cid,
  }) {
    final result = create();
    if (cid != null) result.cid = cid;
    return result;
  }

  ClearContextReq._();

  factory ClearContextReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClearContextReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClearContextReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'cid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClearContextReq clone() => ClearContextReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClearContextReq copyWith(void Function(ClearContextReq) updates) =>
      super.copyWith((message) => updates(message as ClearContextReq))
          as ClearContextReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClearContextReq create() => ClearContextReq._();
  @$core.override
  ClearContextReq createEmptyInstance() => create();
  static $pb.PbList<ClearContextReq> createRepeated() =>
      $pb.PbList<ClearContextReq>();
  @$core.pragma('dart2js:noInline')
  static ClearContextReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClearContextReq>(create);
  static ClearContextReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get cid => $_getSZ(0);
  @$pb.TagNumber(1)
  set cid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCid() => $_has(0);
  @$pb.TagNumber(1)
  void clearCid() => $_clearField(1);
}

class GetContextReq extends $pb.GeneratedMessage {
  factory GetContextReq({
    $core.String? cid,
    $core.String? botDid,
  }) {
    final result = create();
    if (cid != null) result.cid = cid;
    if (botDid != null) result.botDid = botDid;
    return result;
  }

  GetContextReq._();

  factory GetContextReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetContextReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetContextReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'cid')
    ..aOS(2, _omitFieldNames ? '' : 'botDid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetContextReq clone() => GetContextReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetContextReq copyWith(void Function(GetContextReq) updates) =>
      super.copyWith((message) => updates(message as GetContextReq))
          as GetContextReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetContextReq create() => GetContextReq._();
  @$core.override
  GetContextReq createEmptyInstance() => create();
  static $pb.PbList<GetContextReq> createRepeated() =>
      $pb.PbList<GetContextReq>();
  @$core.pragma('dart2js:noInline')
  static GetContextReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetContextReq>(create);
  static GetContextReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get cid => $_getSZ(0);
  @$pb.TagNumber(1)
  set cid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCid() => $_has(0);
  @$pb.TagNumber(1)
  void clearCid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get botDid => $_getSZ(1);
  @$pb.TagNumber(2)
  set botDid($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBotDid() => $_has(1);
  @$pb.TagNumber(2)
  void clearBotDid() => $_clearField(2);
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
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

class ChatMessageImageURL extends $pb.GeneratedMessage {
  factory ChatMessageImageURL({
    $core.String? url,
    $core.String? detail,
  }) {
    final result = create();
    if (url != null) result.url = url;
    if (detail != null) result.detail = detail;
    return result;
  }

  ChatMessageImageURL._();

  factory ChatMessageImageURL.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatMessageImageURL.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatMessageImageURL',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..aOS(2, _omitFieldNames ? '' : 'detail')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatMessageImageURL clone() => ChatMessageImageURL()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatMessageImageURL copyWith(void Function(ChatMessageImageURL) updates) =>
      super.copyWith((message) => updates(message as ChatMessageImageURL))
          as ChatMessageImageURL;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatMessageImageURL create() => ChatMessageImageURL._();
  @$core.override
  ChatMessageImageURL createEmptyInstance() => create();
  static $pb.PbList<ChatMessageImageURL> createRepeated() =>
      $pb.PbList<ChatMessageImageURL>();
  @$core.pragma('dart2js:noInline')
  static ChatMessageImageURL getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatMessageImageURL>(create);
  static ChatMessageImageURL? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get detail => $_getSZ(1);
  @$pb.TagNumber(2)
  set detail($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDetail() => $_has(1);
  @$pb.TagNumber(2)
  void clearDetail() => $_clearField(2);
}

class ChatMessagePart extends $pb.GeneratedMessage {
  factory ChatMessagePart({
    $core.String? type,
    $core.String? text,
    ChatMessageImageURL? imageUrl,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (text != null) result.text = text;
    if (imageUrl != null) result.imageUrl = imageUrl;
    return result;
  }

  ChatMessagePart._();

  factory ChatMessagePart.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatMessagePart.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatMessagePart',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'type')
    ..aOS(2, _omitFieldNames ? '' : 'text')
    ..aOM<ChatMessageImageURL>(3, _omitFieldNames ? '' : 'imageUrl',
        subBuilder: ChatMessageImageURL.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatMessagePart clone() => ChatMessagePart()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatMessagePart copyWith(void Function(ChatMessagePart) updates) =>
      super.copyWith((message) => updates(message as ChatMessagePart))
          as ChatMessagePart;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatMessagePart create() => ChatMessagePart._();
  @$core.override
  ChatMessagePart createEmptyInstance() => create();
  static $pb.PbList<ChatMessagePart> createRepeated() =>
      $pb.PbList<ChatMessagePart>();
  @$core.pragma('dart2js:noInline')
  static ChatMessagePart getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatMessagePart>(create);
  static ChatMessagePart? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(2)
  set text($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => $_clearField(2);

  @$pb.TagNumber(3)
  ChatMessageImageURL get imageUrl => $_getN(2);
  @$pb.TagNumber(3)
  set imageUrl(ChatMessageImageURL value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasImageUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearImageUrl() => $_clearField(3);
  @$pb.TagNumber(3)
  ChatMessageImageURL ensureImageUrl() => $_ensure(2);
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
    $core.Iterable<ChatMessagePart>? multiContent,
  }) {
    final result = create();
    if (role != null) result.role = role;
    if (content != null) result.content = content;
    if (refusal != null) result.refusal = refusal;
    if (name != null) result.name = name;
    if (functionCall != null) result.functionCall = functionCall;
    if (toolCalls != null) result.toolCalls.addAll(toolCalls);
    if (toolCallId != null) result.toolCallId = toolCallId;
    if (multiContent != null) result.multiContent.addAll(multiContent);
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
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
    ..pc<ChatMessagePart>(
        8, _omitFieldNames ? '' : 'multiContent', $pb.PbFieldType.PM,
        subBuilder: ChatMessagePart.create)
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

  @$pb.TagNumber(8)
  $pb.PbList<ChatMessagePart> get multiContent => $_getList(7);
}

class GetContextResp extends $pb.GeneratedMessage {
  factory GetContextResp({
    $core.Iterable<ChatCompletionMessage>? messageList,
  }) {
    final result = create();
    if (messageList != null) result.messageList.addAll(messageList);
    return result;
  }

  GetContextResp._();

  factory GetContextResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetContextResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetContextResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..pc<ChatCompletionMessage>(
        1, _omitFieldNames ? '' : 'messageList', $pb.PbFieldType.PM,
        subBuilder: ChatCompletionMessage.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetContextResp clone() => GetContextResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetContextResp copyWith(void Function(GetContextResp) updates) =>
      super.copyWith((message) => updates(message as GetContextResp))
          as GetContextResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetContextResp create() => GetContextResp._();
  @$core.override
  GetContextResp createEmptyInstance() => create();
  static $pb.PbList<GetContextResp> createRepeated() =>
      $pb.PbList<GetContextResp>();
  @$core.pragma('dart2js:noInline')
  static GetContextResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetContextResp>(create);
  static GetContextResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ChatCompletionMessage> get messageList => $_getList(0);
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
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

class SpeechToSpeechReq extends $pb.GeneratedMessage {
  factory SpeechToSpeechReq({
    $core.String? did,
    $core.String? cid,
    $core.Iterable<MessagesContent>? messages,
    $core.String? voice,
    $core.Iterable<Tool>? tools,
    $core.String? toolChoice,
    $core.String? customer,
    $core.String? state,
  }) {
    final result = create();
    if (did != null) result.did = did;
    if (cid != null) result.cid = cid;
    if (messages != null) result.messages.addAll(messages);
    if (voice != null) result.voice = voice;
    if (tools != null) result.tools.addAll(tools);
    if (toolChoice != null) result.toolChoice = toolChoice;
    if (customer != null) result.customer = customer;
    if (state != null) result.state = state;
    return result;
  }

  SpeechToSpeechReq._();

  factory SpeechToSpeechReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SpeechToSpeechReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SpeechToSpeechReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..aOS(2, _omitFieldNames ? '' : 'cid')
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
  SpeechToSpeechReq clone() => SpeechToSpeechReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpeechToSpeechReq copyWith(void Function(SpeechToSpeechReq) updates) =>
      super.copyWith((message) => updates(message as SpeechToSpeechReq))
          as SpeechToSpeechReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SpeechToSpeechReq create() => SpeechToSpeechReq._();
  @$core.override
  SpeechToSpeechReq createEmptyInstance() => create();
  static $pb.PbList<SpeechToSpeechReq> createRepeated() =>
      $pb.PbList<SpeechToSpeechReq>();
  @$core.pragma('dart2js:noInline')
  static SpeechToSpeechReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SpeechToSpeechReq>(create);
  static SpeechToSpeechReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get did => $_getSZ(0);
  @$pb.TagNumber(1)
  set did($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get cid => $_getSZ(1);
  @$pb.TagNumber(2)
  set cid($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCid() => $_has(1);
  @$pb.TagNumber(2)
  void clearCid() => $_clearField(2);

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

class SpeechToSpeechResp extends $pb.GeneratedMessage {
  factory SpeechToSpeechResp({
    $core.String? path,
    $core.String? toolId,
    $core.Iterable<ToolCall>? toolCalls,
  }) {
    final result = create();
    if (path != null) result.path = path;
    if (toolId != null) result.toolId = toolId;
    if (toolCalls != null) result.toolCalls.addAll(toolCalls);
    return result;
  }

  SpeechToSpeechResp._();

  factory SpeechToSpeechResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SpeechToSpeechResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SpeechToSpeechResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'path')
    ..aOS(2, _omitFieldNames ? '' : 'toolId')
    ..pc<ToolCall>(3, _omitFieldNames ? '' : 'toolCalls', $pb.PbFieldType.PM,
        subBuilder: ToolCall.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpeechToSpeechResp clone() => SpeechToSpeechResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpeechToSpeechResp copyWith(void Function(SpeechToSpeechResp) updates) =>
      super.copyWith((message) => updates(message as SpeechToSpeechResp))
          as SpeechToSpeechResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SpeechToSpeechResp create() => SpeechToSpeechResp._();
  @$core.override
  SpeechToSpeechResp createEmptyInstance() => create();
  static $pb.PbList<SpeechToSpeechResp> createRepeated() =>
      $pb.PbList<SpeechToSpeechResp>();
  @$core.pragma('dart2js:noInline')
  static SpeechToSpeechResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SpeechToSpeechResp>(create);
  static SpeechToSpeechResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get path => $_getSZ(0);
  @$pb.TagNumber(1)
  set path($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearPath() => $_clearField(1);

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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
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

class CallToolsReq extends $pb.GeneratedMessage {
  factory CallToolsReq({
    $core.String? toolId,
    $core.Iterable<ToolCallsResult>? toolResults,
  }) {
    final result = create();
    if (toolId != null) result.toolId = toolId;
    if (toolResults != null) result.toolResults.addAll(toolResults);
    return result;
  }

  CallToolsReq._();

  factory CallToolsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CallToolsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CallToolsReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'toolId')
    ..pc<ToolCallsResult>(
        2, _omitFieldNames ? '' : 'toolResults', $pb.PbFieldType.PM,
        subBuilder: ToolCallsResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CallToolsReq clone() => CallToolsReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CallToolsReq copyWith(void Function(CallToolsReq) updates) =>
      super.copyWith((message) => updates(message as CallToolsReq))
          as CallToolsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CallToolsReq create() => CallToolsReq._();
  @$core.override
  CallToolsReq createEmptyInstance() => create();
  static $pb.PbList<CallToolsReq> createRepeated() =>
      $pb.PbList<CallToolsReq>();
  @$core.pragma('dart2js:noInline')
  static CallToolsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CallToolsReq>(create);
  static CallToolsReq? _defaultInstance;

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

class TextToTextReq extends $pb.GeneratedMessage {
  factory TextToTextReq({
    $core.String? did,
    $core.String? cid,
    $core.Iterable<MessagesContent>? messages,
    $core.String? voice,
    $core.Iterable<Tool>? tools,
    $core.String? toolChoice,
    $core.String? customer,
    $core.String? state,
  }) {
    final result = create();
    if (did != null) result.did = did;
    if (cid != null) result.cid = cid;
    if (messages != null) result.messages.addAll(messages);
    if (voice != null) result.voice = voice;
    if (tools != null) result.tools.addAll(tools);
    if (toolChoice != null) result.toolChoice = toolChoice;
    if (customer != null) result.customer = customer;
    if (state != null) result.state = state;
    return result;
  }

  TextToTextReq._();

  factory TextToTextReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TextToTextReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TextToTextReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..aOS(2, _omitFieldNames ? '' : 'cid')
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
  TextToTextReq clone() => TextToTextReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextToTextReq copyWith(void Function(TextToTextReq) updates) =>
      super.copyWith((message) => updates(message as TextToTextReq))
          as TextToTextReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TextToTextReq create() => TextToTextReq._();
  @$core.override
  TextToTextReq createEmptyInstance() => create();
  static $pb.PbList<TextToTextReq> createRepeated() =>
      $pb.PbList<TextToTextReq>();
  @$core.pragma('dart2js:noInline')
  static TextToTextReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TextToTextReq>(create);
  static TextToTextReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get did => $_getSZ(0);
  @$pb.TagNumber(1)
  set did($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get cid => $_getSZ(1);
  @$pb.TagNumber(2)
  set cid($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCid() => $_has(1);
  @$pb.TagNumber(2)
  void clearCid() => $_clearField(2);

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

class TextToTextResp extends $pb.GeneratedMessage {
  factory TextToTextResp({
    $core.String? path,
    $core.String? toolId,
    $core.Iterable<ToolCall>? toolCalls,
  }) {
    final result = create();
    if (path != null) result.path = path;
    if (toolId != null) result.toolId = toolId;
    if (toolCalls != null) result.toolCalls.addAll(toolCalls);
    return result;
  }

  TextToTextResp._();

  factory TextToTextResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TextToTextResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TextToTextResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'path')
    ..aOS(2, _omitFieldNames ? '' : 'toolId')
    ..pc<ToolCall>(3, _omitFieldNames ? '' : 'toolCalls', $pb.PbFieldType.PM,
        subBuilder: ToolCall.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextToTextResp clone() => TextToTextResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextToTextResp copyWith(void Function(TextToTextResp) updates) =>
      super.copyWith((message) => updates(message as TextToTextResp))
          as TextToTextResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TextToTextResp create() => TextToTextResp._();
  @$core.override
  TextToTextResp createEmptyInstance() => create();
  static $pb.PbList<TextToTextResp> createRepeated() =>
      $pb.PbList<TextToTextResp>();
  @$core.pragma('dart2js:noInline')
  static TextToTextResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TextToTextResp>(create);
  static TextToTextResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get path => $_getSZ(0);
  @$pb.TagNumber(1)
  set path($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearPath() => $_clearField(1);

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

class TextToSpeechReq extends $pb.GeneratedMessage {
  factory TextToSpeechReq({
    $core.String? message,
    $core.String? gptModel,
    $core.String? voice,
  }) {
    final result = create();
    if (message != null) result.message = message;
    if (gptModel != null) result.gptModel = gptModel;
    if (voice != null) result.voice = voice;
    return result;
  }

  TextToSpeechReq._();

  factory TextToSpeechReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TextToSpeechReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TextToSpeechReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..aOS(2, _omitFieldNames ? '' : 'gptModel')
    ..aOS(3, _omitFieldNames ? '' : 'voice')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextToSpeechReq clone() => TextToSpeechReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextToSpeechReq copyWith(void Function(TextToSpeechReq) updates) =>
      super.copyWith((message) => updates(message as TextToSpeechReq))
          as TextToSpeechReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TextToSpeechReq create() => TextToSpeechReq._();
  @$core.override
  TextToSpeechReq createEmptyInstance() => create();
  static $pb.PbList<TextToSpeechReq> createRepeated() =>
      $pb.PbList<TextToSpeechReq>();
  @$core.pragma('dart2js:noInline')
  static TextToSpeechReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TextToSpeechReq>(create);
  static TextToSpeechReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get gptModel => $_getSZ(1);
  @$pb.TagNumber(2)
  set gptModel($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGptModel() => $_has(1);
  @$pb.TagNumber(2)
  void clearGptModel() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get voice => $_getSZ(2);
  @$pb.TagNumber(3)
  set voice($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasVoice() => $_has(2);
  @$pb.TagNumber(3)
  void clearVoice() => $_clearField(3);
}

class TextToSpeechResp extends $pb.GeneratedMessage {
  factory TextToSpeechResp({
    $core.String? path,
  }) {
    final result = create();
    if (path != null) result.path = path;
    return result;
  }

  TextToSpeechResp._();

  factory TextToSpeechResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TextToSpeechResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TextToSpeechResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'path')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextToSpeechResp clone() => TextToSpeechResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextToSpeechResp copyWith(void Function(TextToSpeechResp) updates) =>
      super.copyWith((message) => updates(message as TextToSpeechResp))
          as TextToSpeechResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TextToSpeechResp create() => TextToSpeechResp._();
  @$core.override
  TextToSpeechResp createEmptyInstance() => create();
  static $pb.PbList<TextToSpeechResp> createRepeated() =>
      $pb.PbList<TextToSpeechResp>();
  @$core.pragma('dart2js:noInline')
  static TextToSpeechResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TextToSpeechResp>(create);
  static TextToSpeechResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get path => $_getSZ(0);
  @$pb.TagNumber(1)
  set path($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearPath() => $_clearField(1);
}

class SpeechToTextReq extends $pb.GeneratedMessage {
  factory SpeechToTextReq({
    $core.String? url,
    $core.String? transcriptionModel,
    $core.String? lang,
  }) {
    final result = create();
    if (url != null) result.url = url;
    if (transcriptionModel != null)
      result.transcriptionModel = transcriptionModel;
    if (lang != null) result.lang = lang;
    return result;
  }

  SpeechToTextReq._();

  factory SpeechToTextReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SpeechToTextReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SpeechToTextReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..aOS(2, _omitFieldNames ? '' : 'transcriptionModel')
    ..aOS(3, _omitFieldNames ? '' : 'lang')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpeechToTextReq clone() => SpeechToTextReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpeechToTextReq copyWith(void Function(SpeechToTextReq) updates) =>
      super.copyWith((message) => updates(message as SpeechToTextReq))
          as SpeechToTextReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SpeechToTextReq create() => SpeechToTextReq._();
  @$core.override
  SpeechToTextReq createEmptyInstance() => create();
  static $pb.PbList<SpeechToTextReq> createRepeated() =>
      $pb.PbList<SpeechToTextReq>();
  @$core.pragma('dart2js:noInline')
  static SpeechToTextReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SpeechToTextReq>(create);
  static SpeechToTextReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get transcriptionModel => $_getSZ(1);
  @$pb.TagNumber(2)
  set transcriptionModel($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTranscriptionModel() => $_has(1);
  @$pb.TagNumber(2)
  void clearTranscriptionModel() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get lang => $_getSZ(2);
  @$pb.TagNumber(3)
  set lang($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLang() => $_has(2);
  @$pb.TagNumber(3)
  void clearLang() => $_clearField(3);
}

class SpeechToTextResp extends $pb.GeneratedMessage {
  factory SpeechToTextResp({
    $core.String? reply,
  }) {
    final result = create();
    if (reply != null) result.reply = reply;
    return result;
  }

  SpeechToTextResp._();

  factory SpeechToTextResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SpeechToTextResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SpeechToTextResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'reply')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpeechToTextResp clone() => SpeechToTextResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpeechToTextResp copyWith(void Function(SpeechToTextResp) updates) =>
      super.copyWith((message) => updates(message as SpeechToTextResp))
          as SpeechToTextResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SpeechToTextResp create() => SpeechToTextResp._();
  @$core.override
  SpeechToTextResp createEmptyInstance() => create();
  static $pb.PbList<SpeechToTextResp> createRepeated() =>
      $pb.PbList<SpeechToTextResp>();
  @$core.pragma('dart2js:noInline')
  static SpeechToTextResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SpeechToTextResp>(create);
  static SpeechToTextResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get reply => $_getSZ(0);
  @$pb.TagNumber(1)
  set reply($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReply() => $_has(0);
  @$pb.TagNumber(1)
  void clearReply() => $_clearField(1);
}

class MultiModalDialogReq extends $pb.GeneratedMessage {
  factory MultiModalDialogReq({
    $core.String? did,
    $core.String? cid,
    $core.Iterable<MessagesContent>? messages,
    $core.String? voice,
    $core.Iterable<Tool>? tools,
    $core.String? toolChoice,
    $core.String? customer,
    $core.String? state,
    $core.bool? enableSts,
  }) {
    final result = create();
    if (did != null) result.did = did;
    if (cid != null) result.cid = cid;
    if (messages != null) result.messages.addAll(messages);
    if (voice != null) result.voice = voice;
    if (tools != null) result.tools.addAll(tools);
    if (toolChoice != null) result.toolChoice = toolChoice;
    if (customer != null) result.customer = customer;
    if (state != null) result.state = state;
    if (enableSts != null) result.enableSts = enableSts;
    return result;
  }

  MultiModalDialogReq._();

  factory MultiModalDialogReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MultiModalDialogReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MultiModalDialogReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..aOS(2, _omitFieldNames ? '' : 'cid')
    ..pc<MessagesContent>(
        3, _omitFieldNames ? '' : 'messages', $pb.PbFieldType.PM,
        subBuilder: MessagesContent.create)
    ..aOS(4, _omitFieldNames ? '' : 'voice')
    ..pc<Tool>(5, _omitFieldNames ? '' : 'tools', $pb.PbFieldType.PM,
        subBuilder: Tool.create)
    ..aOS(6, _omitFieldNames ? '' : 'toolChoice')
    ..aOS(7, _omitFieldNames ? '' : 'customer')
    ..aOS(8, _omitFieldNames ? '' : 'state')
    ..aOB(9, _omitFieldNames ? '' : 'enableSts')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MultiModalDialogReq clone() => MultiModalDialogReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MultiModalDialogReq copyWith(void Function(MultiModalDialogReq) updates) =>
      super.copyWith((message) => updates(message as MultiModalDialogReq))
          as MultiModalDialogReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MultiModalDialogReq create() => MultiModalDialogReq._();
  @$core.override
  MultiModalDialogReq createEmptyInstance() => create();
  static $pb.PbList<MultiModalDialogReq> createRepeated() =>
      $pb.PbList<MultiModalDialogReq>();
  @$core.pragma('dart2js:noInline')
  static MultiModalDialogReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MultiModalDialogReq>(create);
  static MultiModalDialogReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get did => $_getSZ(0);
  @$pb.TagNumber(1)
  set did($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get cid => $_getSZ(1);
  @$pb.TagNumber(2)
  set cid($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCid() => $_has(1);
  @$pb.TagNumber(2)
  void clearCid() => $_clearField(2);

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

  @$pb.TagNumber(9)
  $core.bool get enableSts => $_getBF(8);
  @$pb.TagNumber(9)
  set enableSts($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasEnableSts() => $_has(8);
  @$pb.TagNumber(9)
  void clearEnableSts() => $_clearField(9);
}

class MultiModalDialogResp extends $pb.GeneratedMessage {
  factory MultiModalDialogResp({
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

  MultiModalDialogResp._();

  factory MultiModalDialogResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MultiModalDialogResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MultiModalDialogResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'reply')
    ..aOS(2, _omitFieldNames ? '' : 'toolId')
    ..pc<ToolCall>(3, _omitFieldNames ? '' : 'toolCalls', $pb.PbFieldType.PM,
        subBuilder: ToolCall.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MultiModalDialogResp clone() =>
      MultiModalDialogResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MultiModalDialogResp copyWith(void Function(MultiModalDialogResp) updates) =>
      super.copyWith((message) => updates(message as MultiModalDialogResp))
          as MultiModalDialogResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MultiModalDialogResp create() => MultiModalDialogResp._();
  @$core.override
  MultiModalDialogResp createEmptyInstance() => create();
  static $pb.PbList<MultiModalDialogResp> createRepeated() =>
      $pb.PbList<MultiModalDialogResp>();
  @$core.pragma('dart2js:noInline')
  static MultiModalDialogResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MultiModalDialogResp>(create);
  static MultiModalDialogResp? _defaultInstance;

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

class MultiModalDialogToolCallsReq extends $pb.GeneratedMessage {
  factory MultiModalDialogToolCallsReq({
    $core.String? toolId,
    $core.Iterable<ToolCallsResult>? toolResults,
    $core.bool? enableSts,
  }) {
    final result = create();
    if (toolId != null) result.toolId = toolId;
    if (toolResults != null) result.toolResults.addAll(toolResults);
    if (enableSts != null) result.enableSts = enableSts;
    return result;
  }

  MultiModalDialogToolCallsReq._();

  factory MultiModalDialogToolCallsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MultiModalDialogToolCallsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MultiModalDialogToolCallsReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'toolId')
    ..pc<ToolCallsResult>(
        2, _omitFieldNames ? '' : 'toolResults', $pb.PbFieldType.PM,
        subBuilder: ToolCallsResult.create)
    ..aOB(3, _omitFieldNames ? '' : 'enableSts')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MultiModalDialogToolCallsReq clone() =>
      MultiModalDialogToolCallsReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MultiModalDialogToolCallsReq copyWith(
          void Function(MultiModalDialogToolCallsReq) updates) =>
      super.copyWith(
              (message) => updates(message as MultiModalDialogToolCallsReq))
          as MultiModalDialogToolCallsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MultiModalDialogToolCallsReq create() =>
      MultiModalDialogToolCallsReq._();
  @$core.override
  MultiModalDialogToolCallsReq createEmptyInstance() => create();
  static $pb.PbList<MultiModalDialogToolCallsReq> createRepeated() =>
      $pb.PbList<MultiModalDialogToolCallsReq>();
  @$core.pragma('dart2js:noInline')
  static MultiModalDialogToolCallsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MultiModalDialogToolCallsReq>(create);
  static MultiModalDialogToolCallsReq? _defaultInstance;

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

  @$pb.TagNumber(3)
  $core.bool get enableSts => $_getBF(2);
  @$pb.TagNumber(3)
  set enableSts($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEnableSts() => $_has(2);
  @$pb.TagNumber(3)
  void clearEnableSts() => $_clearField(3);
}

class MultiModalDialogToolCallsResp extends $pb.GeneratedMessage {
  factory MultiModalDialogToolCallsResp({
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

  MultiModalDialogToolCallsResp._();

  factory MultiModalDialogToolCallsResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MultiModalDialogToolCallsResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MultiModalDialogToolCallsResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'reply')
    ..aOS(2, _omitFieldNames ? '' : 'toolId')
    ..pc<ToolCall>(3, _omitFieldNames ? '' : 'toolCalls', $pb.PbFieldType.PM,
        subBuilder: ToolCall.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MultiModalDialogToolCallsResp clone() =>
      MultiModalDialogToolCallsResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MultiModalDialogToolCallsResp copyWith(
          void Function(MultiModalDialogToolCallsResp) updates) =>
      super.copyWith(
              (message) => updates(message as MultiModalDialogToolCallsResp))
          as MultiModalDialogToolCallsResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MultiModalDialogToolCallsResp create() =>
      MultiModalDialogToolCallsResp._();
  @$core.override
  MultiModalDialogToolCallsResp createEmptyInstance() => create();
  static $pb.PbList<MultiModalDialogToolCallsResp> createRepeated() =>
      $pb.PbList<MultiModalDialogToolCallsResp>();
  @$core.pragma('dart2js:noInline')
  static MultiModalDialogToolCallsResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MultiModalDialogToolCallsResp>(create);
  static MultiModalDialogToolCallsResp? _defaultInstance;

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

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
