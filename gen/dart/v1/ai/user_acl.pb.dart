// This is a generated file - do not edit.
//
// Generated from v1/ai/user_acl.proto.

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

class AddSuperUserReq extends $pb.GeneratedMessage {
  factory AddSuperUserReq({
    $core.String? did,
    $core.String? type,
  }) {
    final result = create();
    if (did != null) result.did = did;
    if (type != null) result.type = type;
    return result;
  }

  AddSuperUserReq._();

  factory AddSuperUserReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddSuperUserReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddSuperUserReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..aOS(2, _omitFieldNames ? '' : 'type')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddSuperUserReq clone() => AddSuperUserReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddSuperUserReq copyWith(void Function(AddSuperUserReq) updates) =>
      super.copyWith((message) => updates(message as AddSuperUserReq))
          as AddSuperUserReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddSuperUserReq create() => AddSuperUserReq._();
  @$core.override
  AddSuperUserReq createEmptyInstance() => create();
  static $pb.PbList<AddSuperUserReq> createRepeated() =>
      $pb.PbList<AddSuperUserReq>();
  @$core.pragma('dart2js:noInline')
  static AddSuperUserReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddSuperUserReq>(create);
  static AddSuperUserReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get did => $_getSZ(0);
  @$pb.TagNumber(1)
  set did($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get type => $_getSZ(1);
  @$pb.TagNumber(2)
  set type($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);
}

class DeleteSuperUserReq extends $pb.GeneratedMessage {
  factory DeleteSuperUserReq({
    $core.String? did,
    $core.String? type,
  }) {
    final result = create();
    if (did != null) result.did = did;
    if (type != null) result.type = type;
    return result;
  }

  DeleteSuperUserReq._();

  factory DeleteSuperUserReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteSuperUserReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteSuperUserReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..aOS(2, _omitFieldNames ? '' : 'type')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteSuperUserReq clone() => DeleteSuperUserReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteSuperUserReq copyWith(void Function(DeleteSuperUserReq) updates) =>
      super.copyWith((message) => updates(message as DeleteSuperUserReq))
          as DeleteSuperUserReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteSuperUserReq create() => DeleteSuperUserReq._();
  @$core.override
  DeleteSuperUserReq createEmptyInstance() => create();
  static $pb.PbList<DeleteSuperUserReq> createRepeated() =>
      $pb.PbList<DeleteSuperUserReq>();
  @$core.pragma('dart2js:noInline')
  static DeleteSuperUserReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteSuperUserReq>(create);
  static DeleteSuperUserReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get did => $_getSZ(0);
  @$pb.TagNumber(1)
  set did($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get type => $_getSZ(1);
  @$pb.TagNumber(2)
  set type($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);
}

class ListSuperUserReq extends $pb.GeneratedMessage {
  factory ListSuperUserReq({
    $core.String? did,
    $core.String? type,
    $2.Pagination? pagination,
  }) {
    final result = create();
    if (did != null) result.did = did;
    if (type != null) result.type = type;
    if (pagination != null) result.pagination = pagination;
    return result;
  }

  ListSuperUserReq._();

  factory ListSuperUserReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListSuperUserReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListSuperUserReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..aOS(2, _omitFieldNames ? '' : 'type')
    ..aOM<$2.Pagination>(3, _omitFieldNames ? '' : 'pagination',
        subBuilder: $2.Pagination.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSuperUserReq clone() => ListSuperUserReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSuperUserReq copyWith(void Function(ListSuperUserReq) updates) =>
      super.copyWith((message) => updates(message as ListSuperUserReq))
          as ListSuperUserReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSuperUserReq create() => ListSuperUserReq._();
  @$core.override
  ListSuperUserReq createEmptyInstance() => create();
  static $pb.PbList<ListSuperUserReq> createRepeated() =>
      $pb.PbList<ListSuperUserReq>();
  @$core.pragma('dart2js:noInline')
  static ListSuperUserReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListSuperUserReq>(create);
  static ListSuperUserReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get did => $_getSZ(0);
  @$pb.TagNumber(1)
  set did($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get type => $_getSZ(1);
  @$pb.TagNumber(2)
  set type($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

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

class SuperUserInfo extends $pb.GeneratedMessage {
  factory SuperUserInfo({
    $core.String? did,
    $core.int? type,
    $core.Iterable<$core.String>? permissions,
    $core.String? note,
  }) {
    final result = create();
    if (did != null) result.did = did;
    if (type != null) result.type = type;
    if (permissions != null) result.permissions.addAll(permissions);
    if (note != null) result.note = note;
    return result;
  }

  SuperUserInfo._();

  factory SuperUserInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SuperUserInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SuperUserInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'type', $pb.PbFieldType.O3)
    ..pPS(3, _omitFieldNames ? '' : 'permissions')
    ..aOS(4, _omitFieldNames ? '' : 'note')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SuperUserInfo clone() => SuperUserInfo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SuperUserInfo copyWith(void Function(SuperUserInfo) updates) =>
      super.copyWith((message) => updates(message as SuperUserInfo))
          as SuperUserInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SuperUserInfo create() => SuperUserInfo._();
  @$core.override
  SuperUserInfo createEmptyInstance() => create();
  static $pb.PbList<SuperUserInfo> createRepeated() =>
      $pb.PbList<SuperUserInfo>();
  @$core.pragma('dart2js:noInline')
  static SuperUserInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SuperUserInfo>(create);
  static SuperUserInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get did => $_getSZ(0);
  @$pb.TagNumber(1)
  set did($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get type => $_getIZ(1);
  @$pb.TagNumber(2)
  set type($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get permissions => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get note => $_getSZ(3);
  @$pb.TagNumber(4)
  set note($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasNote() => $_has(3);
  @$pb.TagNumber(4)
  void clearNote() => $_clearField(4);
}

class ListSuperUserResp extends $pb.GeneratedMessage {
  factory ListSuperUserResp({
    $fixnum.Int64? total,
    $core.Iterable<SuperUserInfo>? infos,
  }) {
    final result = create();
    if (total != null) result.total = total;
    if (infos != null) result.infos.addAll(infos);
    return result;
  }

  ListSuperUserResp._();

  factory ListSuperUserResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListSuperUserResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListSuperUserResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'total')
    ..pc<SuperUserInfo>(2, _omitFieldNames ? '' : 'infos', $pb.PbFieldType.PM,
        subBuilder: SuperUserInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSuperUserResp clone() => ListSuperUserResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSuperUserResp copyWith(void Function(ListSuperUserResp) updates) =>
      super.copyWith((message) => updates(message as ListSuperUserResp))
          as ListSuperUserResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSuperUserResp create() => ListSuperUserResp._();
  @$core.override
  ListSuperUserResp createEmptyInstance() => create();
  static $pb.PbList<ListSuperUserResp> createRepeated() =>
      $pb.PbList<ListSuperUserResp>();
  @$core.pragma('dart2js:noInline')
  static ListSuperUserResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListSuperUserResp>(create);
  static ListSuperUserResp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get total => $_getI64(0);
  @$pb.TagNumber(1)
  set total($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotal() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotal() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<SuperUserInfo> get infos => $_getList(1);
}

class ListSuperUserTypeResp extends $pb.GeneratedMessage {
  factory ListSuperUserTypeResp({
    $core.Iterable<$core.String>? types,
  }) {
    final result = create();
    if (types != null) result.types.addAll(types);
    return result;
  }

  ListSuperUserTypeResp._();

  factory ListSuperUserTypeResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListSuperUserTypeResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListSuperUserTypeResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'types')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSuperUserTypeResp clone() =>
      ListSuperUserTypeResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSuperUserTypeResp copyWith(
          void Function(ListSuperUserTypeResp) updates) =>
      super.copyWith((message) => updates(message as ListSuperUserTypeResp))
          as ListSuperUserTypeResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSuperUserTypeResp create() => ListSuperUserTypeResp._();
  @$core.override
  ListSuperUserTypeResp createEmptyInstance() => create();
  static $pb.PbList<ListSuperUserTypeResp> createRepeated() =>
      $pb.PbList<ListSuperUserTypeResp>();
  @$core.pragma('dart2js:noInline')
  static ListSuperUserTypeResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListSuperUserTypeResp>(create);
  static ListSuperUserTypeResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get types => $_getList(0);
}

class EditSuperUserReq extends $pb.GeneratedMessage {
  factory EditSuperUserReq({
    $core.String? did,
    $core.String? note,
  }) {
    final result = create();
    if (did != null) result.did = did;
    if (note != null) result.note = note;
    return result;
  }

  EditSuperUserReq._();

  factory EditSuperUserReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EditSuperUserReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EditSuperUserReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ai'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..aOS(2, _omitFieldNames ? '' : 'note')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EditSuperUserReq clone() => EditSuperUserReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EditSuperUserReq copyWith(void Function(EditSuperUserReq) updates) =>
      super.copyWith((message) => updates(message as EditSuperUserReq))
          as EditSuperUserReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EditSuperUserReq create() => EditSuperUserReq._();
  @$core.override
  EditSuperUserReq createEmptyInstance() => create();
  static $pb.PbList<EditSuperUserReq> createRepeated() =>
      $pb.PbList<EditSuperUserReq>();
  @$core.pragma('dart2js:noInline')
  static EditSuperUserReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EditSuperUserReq>(create);
  static EditSuperUserReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get did => $_getSZ(0);
  @$pb.TagNumber(1)
  set did($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get note => $_getSZ(1);
  @$pb.TagNumber(2)
  set note($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNote() => $_has(1);
  @$pb.TagNumber(2)
  void clearNote() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
