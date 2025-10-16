// This is a generated file - do not edit.
//
// Generated from v1/ai/plugin/plugin.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../chat.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class SearchReq extends $pb.GeneratedMessage {
  factory SearchReq({
    $core.String? type,
    $core.String? url,
    $core.String? uuid,
    $core.String? keyword,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (url != null) result.url = url;
    if (uuid != null) result.uuid = uuid;
    if (keyword != null) result.keyword = keyword;
    return result;
  }

  SearchReq._();

  factory SearchReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SearchReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SearchReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'plugin'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'type')
    ..aOS(2, _omitFieldNames ? '' : 'url')
    ..aOS(3, _omitFieldNames ? '' : 'uuid')
    ..aOS(4, _omitFieldNames ? '' : 'keyword')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchReq clone() => SearchReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchReq copyWith(void Function(SearchReq) updates) =>
      super.copyWith((message) => updates(message as SearchReq)) as SearchReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchReq create() => SearchReq._();
  @$core.override
  SearchReq createEmptyInstance() => create();
  static $pb.PbList<SearchReq> createRepeated() => $pb.PbList<SearchReq>();
  @$core.pragma('dart2js:noInline')
  static SearchReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchReq>(create);
  static SearchReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get uuid => $_getSZ(2);
  @$pb.TagNumber(3)
  set uuid($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUuid() => $_has(2);
  @$pb.TagNumber(3)
  void clearUuid() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get keyword => $_getSZ(3);
  @$pb.TagNumber(4)
  set keyword($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasKeyword() => $_has(3);
  @$pb.TagNumber(4)
  void clearKeyword() => $_clearField(4);
}

class SearchResp extends $pb.GeneratedMessage {
  factory SearchResp({
    $core.Iterable<$1.MessagesContent>? contents,
  }) {
    final result = create();
    if (contents != null) result.contents.addAll(contents);
    return result;
  }

  SearchResp._();

  factory SearchResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SearchResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SearchResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'plugin'),
      createEmptyInstance: create)
    ..pc<$1.MessagesContent>(
        1, _omitFieldNames ? '' : 'contents', $pb.PbFieldType.PM,
        subBuilder: $1.MessagesContent.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchResp clone() => SearchResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchResp copyWith(void Function(SearchResp) updates) =>
      super.copyWith((message) => updates(message as SearchResp)) as SearchResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchResp create() => SearchResp._();
  @$core.override
  SearchResp createEmptyInstance() => create();
  static $pb.PbList<SearchResp> createRepeated() => $pb.PbList<SearchResp>();
  @$core.pragma('dart2js:noInline')
  static SearchResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SearchResp>(create);
  static SearchResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$1.MessagesContent> get contents => $_getList(0);
}

class PythonReq extends $pb.GeneratedMessage {
  factory PythonReq({
    $core.String? code,
    $core.String? codeParams,
    $core.String? uuid,
  }) {
    final result = create();
    if (code != null) result.code = code;
    if (codeParams != null) result.codeParams = codeParams;
    if (uuid != null) result.uuid = uuid;
    return result;
  }

  PythonReq._();

  factory PythonReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PythonReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PythonReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'plugin'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'code')
    ..aOS(2, _omitFieldNames ? '' : 'codeParams')
    ..aOS(3, _omitFieldNames ? '' : 'uuid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PythonReq clone() => PythonReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PythonReq copyWith(void Function(PythonReq) updates) =>
      super.copyWith((message) => updates(message as PythonReq)) as PythonReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PythonReq create() => PythonReq._();
  @$core.override
  PythonReq createEmptyInstance() => create();
  static $pb.PbList<PythonReq> createRepeated() => $pb.PbList<PythonReq>();
  @$core.pragma('dart2js:noInline')
  static PythonReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PythonReq>(create);
  static PythonReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get codeParams => $_getSZ(1);
  @$pb.TagNumber(2)
  set codeParams($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCodeParams() => $_has(1);
  @$pb.TagNumber(2)
  void clearCodeParams() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get uuid => $_getSZ(2);
  @$pb.TagNumber(3)
  set uuid($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUuid() => $_has(2);
  @$pb.TagNumber(3)
  void clearUuid() => $_clearField(3);
}

class PythonResp extends $pb.GeneratedMessage {
  factory PythonResp({
    $core.Iterable<$1.MessagesContent>? contents,
  }) {
    final result = create();
    if (contents != null) result.contents.addAll(contents);
    return result;
  }

  PythonResp._();

  factory PythonResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PythonResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PythonResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'plugin'),
      createEmptyInstance: create)
    ..pc<$1.MessagesContent>(
        1, _omitFieldNames ? '' : 'contents', $pb.PbFieldType.PM,
        subBuilder: $1.MessagesContent.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PythonResp clone() => PythonResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PythonResp copyWith(void Function(PythonResp) updates) =>
      super.copyWith((message) => updates(message as PythonResp)) as PythonResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PythonResp create() => PythonResp._();
  @$core.override
  PythonResp createEmptyInstance() => create();
  static $pb.PbList<PythonResp> createRepeated() => $pb.PbList<PythonResp>();
  @$core.pragma('dart2js:noInline')
  static PythonResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PythonResp>(create);
  static PythonResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$1.MessagesContent> get contents => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
