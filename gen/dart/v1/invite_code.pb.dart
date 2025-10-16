// This is a generated file - do not edit.
//
// Generated from v1/invite_code.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class InviteCodeCreateResp extends $pb.GeneratedMessage {
  factory InviteCodeCreateResp({
    $core.String? code,
    $core.bool? isActive,
  }) {
    final result = create();
    if (code != null) result.code = code;
    if (isActive != null) result.isActive = isActive;
    return result;
  }

  InviteCodeCreateResp._();

  factory InviteCodeCreateResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InviteCodeCreateResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InviteCodeCreateResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'hi'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'code')
    ..aOB(3, _omitFieldNames ? '' : 'isActive')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteCodeCreateResp clone() =>
      InviteCodeCreateResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteCodeCreateResp copyWith(void Function(InviteCodeCreateResp) updates) =>
      super.copyWith((message) => updates(message as InviteCodeCreateResp))
          as InviteCodeCreateResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InviteCodeCreateResp create() => InviteCodeCreateResp._();
  @$core.override
  InviteCodeCreateResp createEmptyInstance() => create();
  static $pb.PbList<InviteCodeCreateResp> createRepeated() =>
      $pb.PbList<InviteCodeCreateResp>();
  @$core.pragma('dart2js:noInline')
  static InviteCodeCreateResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InviteCodeCreateResp>(create);
  static InviteCodeCreateResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);

  @$pb.TagNumber(3)
  $core.bool get isActive => $_getBF(1);
  @$pb.TagNumber(3)
  set isActive($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(3)
  $core.bool hasIsActive() => $_has(1);
  @$pb.TagNumber(3)
  void clearIsActive() => $_clearField(3);
}

class InviteCodeEditReq extends $pb.GeneratedMessage {
  factory InviteCodeEditReq({
    $core.String? code,
    $core.String? note,
  }) {
    final result = create();
    if (code != null) result.code = code;
    if (note != null) result.note = note;
    return result;
  }

  InviteCodeEditReq._();

  factory InviteCodeEditReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InviteCodeEditReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InviteCodeEditReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'hi'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'code')
    ..aOS(2, _omitFieldNames ? '' : 'note')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteCodeEditReq clone() => InviteCodeEditReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteCodeEditReq copyWith(void Function(InviteCodeEditReq) updates) =>
      super.copyWith((message) => updates(message as InviteCodeEditReq))
          as InviteCodeEditReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InviteCodeEditReq create() => InviteCodeEditReq._();
  @$core.override
  InviteCodeEditReq createEmptyInstance() => create();
  static $pb.PbList<InviteCodeEditReq> createRepeated() =>
      $pb.PbList<InviteCodeEditReq>();
  @$core.pragma('dart2js:noInline')
  static InviteCodeEditReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InviteCodeEditReq>(create);
  static InviteCodeEditReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get note => $_getSZ(1);
  @$pb.TagNumber(2)
  set note($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNote() => $_has(1);
  @$pb.TagNumber(2)
  void clearNote() => $_clearField(2);
}

class InviteCodeListResp_Unit extends $pb.GeneratedMessage {
  factory InviteCodeListResp_Unit({
    $core.String? code,
    $core.bool? isActive,
    $core.String? note,
  }) {
    final result = create();
    if (code != null) result.code = code;
    if (isActive != null) result.isActive = isActive;
    if (note != null) result.note = note;
    return result;
  }

  InviteCodeListResp_Unit._();

  factory InviteCodeListResp_Unit.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InviteCodeListResp_Unit.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InviteCodeListResp.Unit',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'hi'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'code')
    ..aOB(2, _omitFieldNames ? '' : 'isActive')
    ..aOS(3, _omitFieldNames ? '' : 'note')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteCodeListResp_Unit clone() =>
      InviteCodeListResp_Unit()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteCodeListResp_Unit copyWith(
          void Function(InviteCodeListResp_Unit) updates) =>
      super.copyWith((message) => updates(message as InviteCodeListResp_Unit))
          as InviteCodeListResp_Unit;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InviteCodeListResp_Unit create() => InviteCodeListResp_Unit._();
  @$core.override
  InviteCodeListResp_Unit createEmptyInstance() => create();
  static $pb.PbList<InviteCodeListResp_Unit> createRepeated() =>
      $pb.PbList<InviteCodeListResp_Unit>();
  @$core.pragma('dart2js:noInline')
  static InviteCodeListResp_Unit getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InviteCodeListResp_Unit>(create);
  static InviteCodeListResp_Unit? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isActive => $_getBF(1);
  @$pb.TagNumber(2)
  set isActive($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIsActive() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsActive() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get note => $_getSZ(2);
  @$pb.TagNumber(3)
  set note($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNote() => $_has(2);
  @$pb.TagNumber(3)
  void clearNote() => $_clearField(3);
}

class InviteCodeListResp extends $pb.GeneratedMessage {
  factory InviteCodeListResp({
    $fixnum.Int64? total,
    $core.Iterable<InviteCodeListResp_Unit>? infos,
  }) {
    final result = create();
    if (total != null) result.total = total;
    if (infos != null) result.infos.addAll(infos);
    return result;
  }

  InviteCodeListResp._();

  factory InviteCodeListResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InviteCodeListResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InviteCodeListResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'hi'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'total')
    ..pc<InviteCodeListResp_Unit>(
        2, _omitFieldNames ? '' : 'infos', $pb.PbFieldType.PM,
        subBuilder: InviteCodeListResp_Unit.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteCodeListResp clone() => InviteCodeListResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteCodeListResp copyWith(void Function(InviteCodeListResp) updates) =>
      super.copyWith((message) => updates(message as InviteCodeListResp))
          as InviteCodeListResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InviteCodeListResp create() => InviteCodeListResp._();
  @$core.override
  InviteCodeListResp createEmptyInstance() => create();
  static $pb.PbList<InviteCodeListResp> createRepeated() =>
      $pb.PbList<InviteCodeListResp>();
  @$core.pragma('dart2js:noInline')
  static InviteCodeListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InviteCodeListResp>(create);
  static InviteCodeListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get total => $_getI64(0);
  @$pb.TagNumber(1)
  set total($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotal() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotal() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<InviteCodeListResp_Unit> get infos => $_getList(1);
}

class InviteCodeDeleteReq extends $pb.GeneratedMessage {
  factory InviteCodeDeleteReq({
    $core.String? code,
  }) {
    final result = create();
    if (code != null) result.code = code;
    return result;
  }

  InviteCodeDeleteReq._();

  factory InviteCodeDeleteReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InviteCodeDeleteReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InviteCodeDeleteReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'hi'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'code')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteCodeDeleteReq clone() => InviteCodeDeleteReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteCodeDeleteReq copyWith(void Function(InviteCodeDeleteReq) updates) =>
      super.copyWith((message) => updates(message as InviteCodeDeleteReq))
          as InviteCodeDeleteReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InviteCodeDeleteReq create() => InviteCodeDeleteReq._();
  @$core.override
  InviteCodeDeleteReq createEmptyInstance() => create();
  static $pb.PbList<InviteCodeDeleteReq> createRepeated() =>
      $pb.PbList<InviteCodeDeleteReq>();
  @$core.pragma('dart2js:noInline')
  static InviteCodeDeleteReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InviteCodeDeleteReq>(create);
  static InviteCodeDeleteReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);
}

class InviteCodeVerifyReq extends $pb.GeneratedMessage {
  factory InviteCodeVerifyReq({
    $core.String? id,
    $core.String? code,
    $core.String? did,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (code != null) result.code = code;
    if (did != null) result.did = did;
    return result;
  }

  InviteCodeVerifyReq._();

  factory InviteCodeVerifyReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InviteCodeVerifyReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InviteCodeVerifyReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'hi'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'code')
    ..aOS(3, _omitFieldNames ? '' : 'did')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteCodeVerifyReq clone() => InviteCodeVerifyReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteCodeVerifyReq copyWith(void Function(InviteCodeVerifyReq) updates) =>
      super.copyWith((message) => updates(message as InviteCodeVerifyReq))
          as InviteCodeVerifyReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InviteCodeVerifyReq create() => InviteCodeVerifyReq._();
  @$core.override
  InviteCodeVerifyReq createEmptyInstance() => create();
  static $pb.PbList<InviteCodeVerifyReq> createRepeated() =>
      $pb.PbList<InviteCodeVerifyReq>();
  @$core.pragma('dart2js:noInline')
  static InviteCodeVerifyReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InviteCodeVerifyReq>(create);
  static InviteCodeVerifyReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get did => $_getSZ(2);
  @$pb.TagNumber(3)
  set did($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDid() => $_has(2);
  @$pb.TagNumber(3)
  void clearDid() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
