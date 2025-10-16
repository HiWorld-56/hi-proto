// This is a generated file - do not edit.
//
// Generated from v1/club/user_acl.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../hi.pb.dart' as $2;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class DIDList extends $pb.GeneratedMessage {
  factory DIDList({
    $core.Iterable<$core.String>? didList,
  }) {
    final result = create();
    if (didList != null) result.didList.addAll(didList);
    return result;
  }

  DIDList._();

  factory DIDList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DIDList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DIDList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'didList')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DIDList clone() => DIDList()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DIDList copyWith(void Function(DIDList) updates) =>
      super.copyWith((message) => updates(message as DIDList)) as DIDList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DIDList create() => DIDList._();
  @$core.override
  DIDList createEmptyInstance() => create();
  static $pb.PbList<DIDList> createRepeated() => $pb.PbList<DIDList>();
  @$core.pragma('dart2js:noInline')
  static DIDList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DIDList>(create);
  static DIDList? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get didList => $_getList(0);
}

class UserAccessParam extends $pb.GeneratedMessage {
  factory UserAccessParam({
    $core.String? did,
    $core.String? type,
  }) {
    final result = create();
    if (did != null) result.did = did;
    if (type != null) result.type = type;
    return result;
  }

  UserAccessParam._();

  factory UserAccessParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserAccessParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserAccessParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..aOS(2, _omitFieldNames ? '' : 'type')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserAccessParam clone() => UserAccessParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserAccessParam copyWith(void Function(UserAccessParam) updates) =>
      super.copyWith((message) => updates(message as UserAccessParam))
          as UserAccessParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserAccessParam create() => UserAccessParam._();
  @$core.override
  UserAccessParam createEmptyInstance() => create();
  static $pb.PbList<UserAccessParam> createRepeated() =>
      $pb.PbList<UserAccessParam>();
  @$core.pragma('dart2js:noInline')
  static UserAccessParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserAccessParam>(create);
  static UserAccessParam? _defaultInstance;

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

class UserAccessListParam extends $pb.GeneratedMessage {
  factory UserAccessListParam({
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

  UserAccessListParam._();

  factory UserAccessListParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserAccessListParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserAccessListParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..aOS(2, _omitFieldNames ? '' : 'type')
    ..aOM<$2.Pagination>(3, _omitFieldNames ? '' : 'pagination',
        subBuilder: $2.Pagination.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserAccessListParam clone() => UserAccessListParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserAccessListParam copyWith(void Function(UserAccessListParam) updates) =>
      super.copyWith((message) => updates(message as UserAccessListParam))
          as UserAccessListParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserAccessListParam create() => UserAccessListParam._();
  @$core.override
  UserAccessListParam createEmptyInstance() => create();
  static $pb.PbList<UserAccessListParam> createRepeated() =>
      $pb.PbList<UserAccessListParam>();
  @$core.pragma('dart2js:noInline')
  static UserAccessListParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserAccessListParam>(create);
  static UserAccessListParam? _defaultInstance;

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

class UserAccess extends $pb.GeneratedMessage {
  factory UserAccess({
    $core.String? did,
    $core.String? note,
    $core.int? type,
    $core.Iterable<$core.String>? permissions,
  }) {
    final result = create();
    if (did != null) result.did = did;
    if (note != null) result.note = note;
    if (type != null) result.type = type;
    if (permissions != null) result.permissions.addAll(permissions);
    return result;
  }

  UserAccess._();

  factory UserAccess.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserAccess.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserAccess',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..aOS(2, _omitFieldNames ? '' : 'note')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'type', $pb.PbFieldType.O3)
    ..pPS(4, _omitFieldNames ? '' : 'permissions')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserAccess clone() => UserAccess()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserAccess copyWith(void Function(UserAccess) updates) =>
      super.copyWith((message) => updates(message as UserAccess)) as UserAccess;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserAccess create() => UserAccess._();
  @$core.override
  UserAccess createEmptyInstance() => create();
  static $pb.PbList<UserAccess> createRepeated() => $pb.PbList<UserAccess>();
  @$core.pragma('dart2js:noInline')
  static UserAccess getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserAccess>(create);
  static UserAccess? _defaultInstance;

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

  @$pb.TagNumber(3)
  $core.int get type => $_getIZ(2);
  @$pb.TagNumber(3)
  set type($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get permissions => $_getList(3);
}

class UserAccessList extends $pb.GeneratedMessage {
  factory UserAccessList({
    $core.Iterable<UserAccess>? userAccessList,
  }) {
    final result = create();
    if (userAccessList != null) result.userAccessList.addAll(userAccessList);
    return result;
  }

  UserAccessList._();

  factory UserAccessList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserAccessList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserAccessList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..pc<UserAccess>(
        1, _omitFieldNames ? '' : 'userAccessList', $pb.PbFieldType.PM,
        subBuilder: UserAccess.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserAccessList clone() => UserAccessList()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserAccessList copyWith(void Function(UserAccessList) updates) =>
      super.copyWith((message) => updates(message as UserAccessList))
          as UserAccessList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserAccessList create() => UserAccessList._();
  @$core.override
  UserAccessList createEmptyInstance() => create();
  static $pb.PbList<UserAccessList> createRepeated() =>
      $pb.PbList<UserAccessList>();
  @$core.pragma('dart2js:noInline')
  static UserAccessList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserAccessList>(create);
  static UserAccessList? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<UserAccess> get userAccessList => $_getList(0);
}

class AccessTypeList extends $pb.GeneratedMessage {
  factory AccessTypeList({
    $core.Iterable<$core.String>? typeList,
  }) {
    final result = create();
    if (typeList != null) result.typeList.addAll(typeList);
    return result;
  }

  AccessTypeList._();

  factory AccessTypeList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AccessTypeList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AccessTypeList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'typeList')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AccessTypeList clone() => AccessTypeList()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AccessTypeList copyWith(void Function(AccessTypeList) updates) =>
      super.copyWith((message) => updates(message as AccessTypeList))
          as AccessTypeList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AccessTypeList create() => AccessTypeList._();
  @$core.override
  AccessTypeList createEmptyInstance() => create();
  static $pb.PbList<AccessTypeList> createRepeated() =>
      $pb.PbList<AccessTypeList>();
  @$core.pragma('dart2js:noInline')
  static AccessTypeList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AccessTypeList>(create);
  static AccessTypeList? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get typeList => $_getList(0);
}

class UpdateAccessParam extends $pb.GeneratedMessage {
  factory UpdateAccessParam({
    $core.String? did,
    $core.String? note,
  }) {
    final result = create();
    if (did != null) result.did = did;
    if (note != null) result.note = note;
    return result;
  }

  UpdateAccessParam._();

  factory UpdateAccessParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateAccessParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateAccessParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..aOS(2, _omitFieldNames ? '' : 'note')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateAccessParam clone() => UpdateAccessParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateAccessParam copyWith(void Function(UpdateAccessParam) updates) =>
      super.copyWith((message) => updates(message as UpdateAccessParam))
          as UpdateAccessParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateAccessParam create() => UpdateAccessParam._();
  @$core.override
  UpdateAccessParam createEmptyInstance() => create();
  static $pb.PbList<UpdateAccessParam> createRepeated() =>
      $pb.PbList<UpdateAccessParam>();
  @$core.pragma('dart2js:noInline')
  static UpdateAccessParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateAccessParam>(create);
  static UpdateAccessParam? _defaultInstance;

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
