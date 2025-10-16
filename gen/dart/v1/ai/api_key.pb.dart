// This is a generated file - do not edit.
//
// Generated from v1/ai/api_key.proto.

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

class ApiKeyInfo extends $pb.GeneratedMessage {
  factory ApiKeyInfo({
    $core.String? value,
    $core.String? did,
    $core.int? rateLimit,
    $core.int? isActive,
    $core.int? note,
  }) {
    final result = create();
    if (value != null) result.value = value;
    if (did != null) result.did = did;
    if (rateLimit != null) result.rateLimit = rateLimit;
    if (isActive != null) result.isActive = isActive;
    if (note != null) result.note = note;
    return result;
  }

  ApiKeyInfo._();

  factory ApiKeyInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ApiKeyInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ApiKeyInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'value')
    ..aOS(2, _omitFieldNames ? '' : 'did')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'rateLimit', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'isActive', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'note', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ApiKeyInfo clone() => ApiKeyInfo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ApiKeyInfo copyWith(void Function(ApiKeyInfo) updates) =>
      super.copyWith((message) => updates(message as ApiKeyInfo)) as ApiKeyInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ApiKeyInfo create() => ApiKeyInfo._();
  @$core.override
  ApiKeyInfo createEmptyInstance() => create();
  static $pb.PbList<ApiKeyInfo> createRepeated() => $pb.PbList<ApiKeyInfo>();
  @$core.pragma('dart2js:noInline')
  static ApiKeyInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiKeyInfo>(create);
  static ApiKeyInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get value => $_getSZ(0);
  @$pb.TagNumber(1)
  set value($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get did => $_getSZ(1);
  @$pb.TagNumber(2)
  set did($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDid() => $_has(1);
  @$pb.TagNumber(2)
  void clearDid() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get rateLimit => $_getIZ(2);
  @$pb.TagNumber(3)
  set rateLimit($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRateLimit() => $_has(2);
  @$pb.TagNumber(3)
  void clearRateLimit() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get isActive => $_getIZ(3);
  @$pb.TagNumber(4)
  set isActive($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIsActive() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsActive() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get note => $_getIZ(4);
  @$pb.TagNumber(5)
  set note($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasNote() => $_has(4);
  @$pb.TagNumber(5)
  void clearNote() => $_clearField(5);
}

class CreateApiKeyResp extends $pb.GeneratedMessage {
  factory CreateApiKeyResp({
    ApiKeyInfo? info,
  }) {
    final result = create();
    if (info != null) result.info = info;
    return result;
  }

  CreateApiKeyResp._();

  factory CreateApiKeyResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateApiKeyResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateApiKeyResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOM<ApiKeyInfo>(1, _omitFieldNames ? '' : 'info',
        subBuilder: ApiKeyInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateApiKeyResp clone() => CreateApiKeyResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateApiKeyResp copyWith(void Function(CreateApiKeyResp) updates) =>
      super.copyWith((message) => updates(message as CreateApiKeyResp))
          as CreateApiKeyResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateApiKeyResp create() => CreateApiKeyResp._();
  @$core.override
  CreateApiKeyResp createEmptyInstance() => create();
  static $pb.PbList<CreateApiKeyResp> createRepeated() =>
      $pb.PbList<CreateApiKeyResp>();
  @$core.pragma('dart2js:noInline')
  static CreateApiKeyResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateApiKeyResp>(create);
  static CreateApiKeyResp? _defaultInstance;

  @$pb.TagNumber(1)
  ApiKeyInfo get info => $_getN(0);
  @$pb.TagNumber(1)
  set info(ApiKeyInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  ApiKeyInfo ensureInfo() => $_ensure(0);
}

class EditApiKeyReq extends $pb.GeneratedMessage {
  factory EditApiKeyReq({
    $core.String? apiKey,
    $core.String? note,
  }) {
    final result = create();
    if (apiKey != null) result.apiKey = apiKey;
    if (note != null) result.note = note;
    return result;
  }

  EditApiKeyReq._();

  factory EditApiKeyReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EditApiKeyReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EditApiKeyReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'apiKey')
    ..aOS(2, _omitFieldNames ? '' : 'note')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EditApiKeyReq clone() => EditApiKeyReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EditApiKeyReq copyWith(void Function(EditApiKeyReq) updates) =>
      super.copyWith((message) => updates(message as EditApiKeyReq))
          as EditApiKeyReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EditApiKeyReq create() => EditApiKeyReq._();
  @$core.override
  EditApiKeyReq createEmptyInstance() => create();
  static $pb.PbList<EditApiKeyReq> createRepeated() =>
      $pb.PbList<EditApiKeyReq>();
  @$core.pragma('dart2js:noInline')
  static EditApiKeyReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EditApiKeyReq>(create);
  static EditApiKeyReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get apiKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set apiKey($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasApiKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearApiKey() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get note => $_getSZ(1);
  @$pb.TagNumber(2)
  set note($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNote() => $_has(1);
  @$pb.TagNumber(2)
  void clearNote() => $_clearField(2);
}

class EditApiKeyResp extends $pb.GeneratedMessage {
  factory EditApiKeyResp({
    ApiKeyInfo? info,
  }) {
    final result = create();
    if (info != null) result.info = info;
    return result;
  }

  EditApiKeyResp._();

  factory EditApiKeyResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EditApiKeyResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EditApiKeyResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOM<ApiKeyInfo>(1, _omitFieldNames ? '' : 'info',
        subBuilder: ApiKeyInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EditApiKeyResp clone() => EditApiKeyResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EditApiKeyResp copyWith(void Function(EditApiKeyResp) updates) =>
      super.copyWith((message) => updates(message as EditApiKeyResp))
          as EditApiKeyResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EditApiKeyResp create() => EditApiKeyResp._();
  @$core.override
  EditApiKeyResp createEmptyInstance() => create();
  static $pb.PbList<EditApiKeyResp> createRepeated() =>
      $pb.PbList<EditApiKeyResp>();
  @$core.pragma('dart2js:noInline')
  static EditApiKeyResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EditApiKeyResp>(create);
  static EditApiKeyResp? _defaultInstance;

  @$pb.TagNumber(1)
  ApiKeyInfo get info => $_getN(0);
  @$pb.TagNumber(1)
  set info(ApiKeyInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  ApiKeyInfo ensureInfo() => $_ensure(0);
}

class ListApiKeyResp extends $pb.GeneratedMessage {
  factory ListApiKeyResp({
    $fixnum.Int64? total,
    $core.Iterable<ApiKeyInfo>? infos,
  }) {
    final result = create();
    if (total != null) result.total = total;
    if (infos != null) result.infos.addAll(infos);
    return result;
  }

  ListApiKeyResp._();

  factory ListApiKeyResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListApiKeyResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListApiKeyResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'total')
    ..pc<ApiKeyInfo>(2, _omitFieldNames ? '' : 'infos', $pb.PbFieldType.PM,
        subBuilder: ApiKeyInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListApiKeyResp clone() => ListApiKeyResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListApiKeyResp copyWith(void Function(ListApiKeyResp) updates) =>
      super.copyWith((message) => updates(message as ListApiKeyResp))
          as ListApiKeyResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListApiKeyResp create() => ListApiKeyResp._();
  @$core.override
  ListApiKeyResp createEmptyInstance() => create();
  static $pb.PbList<ListApiKeyResp> createRepeated() =>
      $pb.PbList<ListApiKeyResp>();
  @$core.pragma('dart2js:noInline')
  static ListApiKeyResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListApiKeyResp>(create);
  static ListApiKeyResp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get total => $_getI64(0);
  @$pb.TagNumber(1)
  set total($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotal() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotal() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<ApiKeyInfo> get infos => $_getList(1);
}

class DeleteApiKeyReq extends $pb.GeneratedMessage {
  factory DeleteApiKeyReq({
    $core.String? apiKey,
  }) {
    final result = create();
    if (apiKey != null) result.apiKey = apiKey;
    return result;
  }

  DeleteApiKeyReq._();

  factory DeleteApiKeyReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteApiKeyReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteApiKeyReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'apiKey')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteApiKeyReq clone() => DeleteApiKeyReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteApiKeyReq copyWith(void Function(DeleteApiKeyReq) updates) =>
      super.copyWith((message) => updates(message as DeleteApiKeyReq))
          as DeleteApiKeyReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteApiKeyReq create() => DeleteApiKeyReq._();
  @$core.override
  DeleteApiKeyReq createEmptyInstance() => create();
  static $pb.PbList<DeleteApiKeyReq> createRepeated() =>
      $pb.PbList<DeleteApiKeyReq>();
  @$core.pragma('dart2js:noInline')
  static DeleteApiKeyReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteApiKeyReq>(create);
  static DeleteApiKeyReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get apiKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set apiKey($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasApiKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearApiKey() => $_clearField(1);
}

class ListBotReq extends $pb.GeneratedMessage {
  factory ListBotReq({
    $core.String? botDid,
    $2.Pagination? pagination,
  }) {
    final result = create();
    if (botDid != null) result.botDid = botDid;
    if (pagination != null) result.pagination = pagination;
    return result;
  }

  ListBotReq._();

  factory ListBotReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListBotReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListBotReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'botDid')
    ..aOM<$2.Pagination>(2, _omitFieldNames ? '' : 'pagination',
        subBuilder: $2.Pagination.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListBotReq clone() => ListBotReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListBotReq copyWith(void Function(ListBotReq) updates) =>
      super.copyWith((message) => updates(message as ListBotReq)) as ListBotReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListBotReq create() => ListBotReq._();
  @$core.override
  ListBotReq createEmptyInstance() => create();
  static $pb.PbList<ListBotReq> createRepeated() => $pb.PbList<ListBotReq>();
  @$core.pragma('dart2js:noInline')
  static ListBotReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListBotReq>(create);
  static ListBotReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get botDid => $_getSZ(0);
  @$pb.TagNumber(1)
  set botDid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBotDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearBotDid() => $_clearField(1);

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

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
