// This is a generated file - do not edit.
//
// Generated from v1/did/extend.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class UserExtendSettingResp extends $pb.GeneratedMessage {
  factory UserExtendSettingResp({
    $core.String? token,
    $core.String? table,
  }) {
    final result = create();
    if (token != null) result.token = token;
    if (table != null) result.table = table;
    return result;
  }

  UserExtendSettingResp._();

  factory UserExtendSettingResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserExtendSettingResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserExtendSettingResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'token')
    ..aOS(3, _omitFieldNames ? '' : 'table')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserExtendSettingResp clone() =>
      UserExtendSettingResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserExtendSettingResp copyWith(
          void Function(UserExtendSettingResp) updates) =>
      super.copyWith((message) => updates(message as UserExtendSettingResp))
          as UserExtendSettingResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserExtendSettingResp create() => UserExtendSettingResp._();
  @$core.override
  UserExtendSettingResp createEmptyInstance() => create();
  static $pb.PbList<UserExtendSettingResp> createRepeated() =>
      $pb.PbList<UserExtendSettingResp>();
  @$core.pragma('dart2js:noInline')
  static UserExtendSettingResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserExtendSettingResp>(create);
  static UserExtendSettingResp? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(2)
  set token($core.String value) => $_setString(0, value);
  @$pb.TagNumber(2)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(2)
  void clearToken() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get table => $_getSZ(1);
  @$pb.TagNumber(3)
  set table($core.String value) => $_setString(1, value);
  @$pb.TagNumber(3)
  $core.bool hasTable() => $_has(1);
  @$pb.TagNumber(3)
  void clearTable() => $_clearField(3);
}

class UserExtendInfo extends $pb.GeneratedMessage {
  factory UserExtendInfo({
    $core.String? logo,
    $core.int? level,
    $core.String? card,
    $core.String? extend,
  }) {
    final result = create();
    if (logo != null) result.logo = logo;
    if (level != null) result.level = level;
    if (card != null) result.card = card;
    if (extend != null) result.extend = extend;
    return result;
  }

  UserExtendInfo._();

  factory UserExtendInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserExtendInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserExtendInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'logo')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'level', $pb.PbFieldType.O3)
    ..aOS(4, _omitFieldNames ? '' : 'card')
    ..aOS(5, _omitFieldNames ? '' : 'extend')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserExtendInfo clone() => UserExtendInfo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserExtendInfo copyWith(void Function(UserExtendInfo) updates) =>
      super.copyWith((message) => updates(message as UserExtendInfo))
          as UserExtendInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserExtendInfo create() => UserExtendInfo._();
  @$core.override
  UserExtendInfo createEmptyInstance() => create();
  static $pb.PbList<UserExtendInfo> createRepeated() =>
      $pb.PbList<UserExtendInfo>();
  @$core.pragma('dart2js:noInline')
  static UserExtendInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserExtendInfo>(create);
  static UserExtendInfo? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get logo => $_getSZ(0);
  @$pb.TagNumber(2)
  set logo($core.String value) => $_setString(0, value);
  @$pb.TagNumber(2)
  $core.bool hasLogo() => $_has(0);
  @$pb.TagNumber(2)
  void clearLogo() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get level => $_getIZ(1);
  @$pb.TagNumber(3)
  set level($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(3)
  $core.bool hasLevel() => $_has(1);
  @$pb.TagNumber(3)
  void clearLevel() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get card => $_getSZ(2);
  @$pb.TagNumber(4)
  set card($core.String value) => $_setString(2, value);
  @$pb.TagNumber(4)
  $core.bool hasCard() => $_has(2);
  @$pb.TagNumber(4)
  void clearCard() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get extend => $_getSZ(3);
  @$pb.TagNumber(5)
  set extend($core.String value) => $_setString(3, value);
  @$pb.TagNumber(5)
  $core.bool hasExtend() => $_has(3);
  @$pb.TagNumber(5)
  void clearExtend() => $_clearField(5);
}

class UserExtendUpdateReq_Unit extends $pb.GeneratedMessage {
  factory UserExtendUpdateReq_Unit({
    $core.String? did,
    UserExtendInfo? info,
  }) {
    final result = create();
    if (did != null) result.did = did;
    if (info != null) result.info = info;
    return result;
  }

  UserExtendUpdateReq_Unit._();

  factory UserExtendUpdateReq_Unit.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserExtendUpdateReq_Unit.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserExtendUpdateReq.Unit',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..aOM<UserExtendInfo>(2, _omitFieldNames ? '' : 'info',
        subBuilder: UserExtendInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserExtendUpdateReq_Unit clone() =>
      UserExtendUpdateReq_Unit()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserExtendUpdateReq_Unit copyWith(
          void Function(UserExtendUpdateReq_Unit) updates) =>
      super.copyWith((message) => updates(message as UserExtendUpdateReq_Unit))
          as UserExtendUpdateReq_Unit;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserExtendUpdateReq_Unit create() => UserExtendUpdateReq_Unit._();
  @$core.override
  UserExtendUpdateReq_Unit createEmptyInstance() => create();
  static $pb.PbList<UserExtendUpdateReq_Unit> createRepeated() =>
      $pb.PbList<UserExtendUpdateReq_Unit>();
  @$core.pragma('dart2js:noInline')
  static UserExtendUpdateReq_Unit getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserExtendUpdateReq_Unit>(create);
  static UserExtendUpdateReq_Unit? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get did => $_getSZ(0);
  @$pb.TagNumber(1)
  set did($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearDid() => $_clearField(1);

  @$pb.TagNumber(2)
  UserExtendInfo get info => $_getN(1);
  @$pb.TagNumber(2)
  set info(UserExtendInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearInfo() => $_clearField(2);
  @$pb.TagNumber(2)
  UserExtendInfo ensureInfo() => $_ensure(1);
}

class UserExtendUpdateReq extends $pb.GeneratedMessage {
  factory UserExtendUpdateReq({
    $core.Iterable<UserExtendUpdateReq_Unit>? unit,
  }) {
    final result = create();
    if (unit != null) result.unit.addAll(unit);
    return result;
  }

  UserExtendUpdateReq._();

  factory UserExtendUpdateReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserExtendUpdateReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserExtendUpdateReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..pc<UserExtendUpdateReq_Unit>(
        2, _omitFieldNames ? '' : 'unit', $pb.PbFieldType.PM,
        subBuilder: UserExtendUpdateReq_Unit.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserExtendUpdateReq clone() => UserExtendUpdateReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserExtendUpdateReq copyWith(void Function(UserExtendUpdateReq) updates) =>
      super.copyWith((message) => updates(message as UserExtendUpdateReq))
          as UserExtendUpdateReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserExtendUpdateReq create() => UserExtendUpdateReq._();
  @$core.override
  UserExtendUpdateReq createEmptyInstance() => create();
  static $pb.PbList<UserExtendUpdateReq> createRepeated() =>
      $pb.PbList<UserExtendUpdateReq>();
  @$core.pragma('dart2js:noInline')
  static UserExtendUpdateReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserExtendUpdateReq>(create);
  static UserExtendUpdateReq? _defaultInstance;

  @$pb.TagNumber(2)
  $pb.PbList<UserExtendUpdateReq_Unit> get unit => $_getList(0);
}

class UserExtendListReq extends $pb.GeneratedMessage {
  factory UserExtendListReq({
    $core.Iterable<$core.String>? list,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    return result;
  }

  UserExtendListReq._();

  factory UserExtendListReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserExtendListReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserExtendListReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'list')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserExtendListReq clone() => UserExtendListReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserExtendListReq copyWith(void Function(UserExtendListReq) updates) =>
      super.copyWith((message) => updates(message as UserExtendListReq))
          as UserExtendListReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserExtendListReq create() => UserExtendListReq._();
  @$core.override
  UserExtendListReq createEmptyInstance() => create();
  static $pb.PbList<UserExtendListReq> createRepeated() =>
      $pb.PbList<UserExtendListReq>();
  @$core.pragma('dart2js:noInline')
  static UserExtendListReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserExtendListReq>(create);
  static UserExtendListReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get list => $_getList(0);
}

class UserExtendListResp_Unit extends $pb.GeneratedMessage {
  factory UserExtendListResp_Unit({
    $core.String? did,
    UserExtendInfo? info,
  }) {
    final result = create();
    if (did != null) result.did = did;
    if (info != null) result.info = info;
    return result;
  }

  UserExtendListResp_Unit._();

  factory UserExtendListResp_Unit.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserExtendListResp_Unit.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserExtendListResp.Unit',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..aOM<UserExtendInfo>(2, _omitFieldNames ? '' : 'info',
        subBuilder: UserExtendInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserExtendListResp_Unit clone() =>
      UserExtendListResp_Unit()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserExtendListResp_Unit copyWith(
          void Function(UserExtendListResp_Unit) updates) =>
      super.copyWith((message) => updates(message as UserExtendListResp_Unit))
          as UserExtendListResp_Unit;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserExtendListResp_Unit create() => UserExtendListResp_Unit._();
  @$core.override
  UserExtendListResp_Unit createEmptyInstance() => create();
  static $pb.PbList<UserExtendListResp_Unit> createRepeated() =>
      $pb.PbList<UserExtendListResp_Unit>();
  @$core.pragma('dart2js:noInline')
  static UserExtendListResp_Unit getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserExtendListResp_Unit>(create);
  static UserExtendListResp_Unit? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get did => $_getSZ(0);
  @$pb.TagNumber(1)
  set did($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearDid() => $_clearField(1);

  @$pb.TagNumber(2)
  UserExtendInfo get info => $_getN(1);
  @$pb.TagNumber(2)
  set info(UserExtendInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearInfo() => $_clearField(2);
  @$pb.TagNumber(2)
  UserExtendInfo ensureInfo() => $_ensure(1);
}

class UserExtendListResp extends $pb.GeneratedMessage {
  factory UserExtendListResp({
    $core.Iterable<UserExtendListResp_Unit>? unit,
  }) {
    final result = create();
    if (unit != null) result.unit.addAll(unit);
    return result;
  }

  UserExtendListResp._();

  factory UserExtendListResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserExtendListResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserExtendListResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..pc<UserExtendListResp_Unit>(
        2, _omitFieldNames ? '' : 'unit', $pb.PbFieldType.PM,
        subBuilder: UserExtendListResp_Unit.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserExtendListResp clone() => UserExtendListResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserExtendListResp copyWith(void Function(UserExtendListResp) updates) =>
      super.copyWith((message) => updates(message as UserExtendListResp))
          as UserExtendListResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserExtendListResp create() => UserExtendListResp._();
  @$core.override
  UserExtendListResp createEmptyInstance() => create();
  static $pb.PbList<UserExtendListResp> createRepeated() =>
      $pb.PbList<UserExtendListResp>();
  @$core.pragma('dart2js:noInline')
  static UserExtendListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserExtendListResp>(create);
  static UserExtendListResp? _defaultInstance;

  @$pb.TagNumber(2)
  $pb.PbList<UserExtendListResp_Unit> get unit => $_getList(0);
}

class UserExtendDeleteReq extends $pb.GeneratedMessage {
  factory UserExtendDeleteReq({
    $core.Iterable<$core.String>? list,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    return result;
  }

  UserExtendDeleteReq._();

  factory UserExtendDeleteReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserExtendDeleteReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserExtendDeleteReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'list')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserExtendDeleteReq clone() => UserExtendDeleteReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserExtendDeleteReq copyWith(void Function(UserExtendDeleteReq) updates) =>
      super.copyWith((message) => updates(message as UserExtendDeleteReq))
          as UserExtendDeleteReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserExtendDeleteReq create() => UserExtendDeleteReq._();
  @$core.override
  UserExtendDeleteReq createEmptyInstance() => create();
  static $pb.PbList<UserExtendDeleteReq> createRepeated() =>
      $pb.PbList<UserExtendDeleteReq>();
  @$core.pragma('dart2js:noInline')
  static UserExtendDeleteReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserExtendDeleteReq>(create);
  static UserExtendDeleteReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get list => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
