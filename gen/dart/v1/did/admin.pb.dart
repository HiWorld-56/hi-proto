// This is a generated file - do not edit.
//
// Generated from v1/did/admin.proto.

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
import 'merchant.pb.dart' as $3;

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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
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

class DAppInfo extends $pb.GeneratedMessage {
  factory DAppInfo({
    $core.String? class_2,
    $core.String? logo,
    $core.String? title,
    $core.String? description,
    $core.String? url,
    $core.bool? nav,
    $core.bool? external,
    $core.bool? promotion,
  }) {
    final result = create();
    if (class_2 != null) result.class_2 = class_2;
    if (logo != null) result.logo = logo;
    if (title != null) result.title = title;
    if (description != null) result.description = description;
    if (url != null) result.url = url;
    if (nav != null) result.nav = nav;
    if (external != null) result.external = external;
    if (promotion != null) result.promotion = promotion;
    return result;
  }

  DAppInfo._();

  factory DAppInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DAppInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DAppInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'class')
    ..aOS(3, _omitFieldNames ? '' : 'logo')
    ..aOS(4, _omitFieldNames ? '' : 'title')
    ..aOS(5, _omitFieldNames ? '' : 'description')
    ..aOS(6, _omitFieldNames ? '' : 'url')
    ..aOB(7, _omitFieldNames ? '' : 'nav')
    ..aOB(8, _omitFieldNames ? '' : 'external')
    ..aOB(9, _omitFieldNames ? '' : 'promotion')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DAppInfo clone() => DAppInfo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DAppInfo copyWith(void Function(DAppInfo) updates) =>
      super.copyWith((message) => updates(message as DAppInfo)) as DAppInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DAppInfo create() => DAppInfo._();
  @$core.override
  DAppInfo createEmptyInstance() => create();
  static $pb.PbList<DAppInfo> createRepeated() => $pb.PbList<DAppInfo>();
  @$core.pragma('dart2js:noInline')
  static DAppInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DAppInfo>(create);
  static DAppInfo? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get class_2 => $_getSZ(0);
  @$pb.TagNumber(2)
  set class_2($core.String value) => $_setString(0, value);
  @$pb.TagNumber(2)
  $core.bool hasClass_2() => $_has(0);
  @$pb.TagNumber(2)
  void clearClass_2() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get logo => $_getSZ(1);
  @$pb.TagNumber(3)
  set logo($core.String value) => $_setString(1, value);
  @$pb.TagNumber(3)
  $core.bool hasLogo() => $_has(1);
  @$pb.TagNumber(3)
  void clearLogo() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(4)
  set title($core.String value) => $_setString(2, value);
  @$pb.TagNumber(4)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(4)
  void clearTitle() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(5)
  set description($core.String value) => $_setString(3, value);
  @$pb.TagNumber(5)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(5)
  void clearDescription() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get url => $_getSZ(4);
  @$pb.TagNumber(6)
  set url($core.String value) => $_setString(4, value);
  @$pb.TagNumber(6)
  $core.bool hasUrl() => $_has(4);
  @$pb.TagNumber(6)
  void clearUrl() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get nav => $_getBF(5);
  @$pb.TagNumber(7)
  set nav($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(7)
  $core.bool hasNav() => $_has(5);
  @$pb.TagNumber(7)
  void clearNav() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get external => $_getBF(6);
  @$pb.TagNumber(8)
  set external($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(8)
  $core.bool hasExternal() => $_has(6);
  @$pb.TagNumber(8)
  void clearExternal() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.bool get promotion => $_getBF(7);
  @$pb.TagNumber(9)
  set promotion($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(9)
  $core.bool hasPromotion() => $_has(7);
  @$pb.TagNumber(9)
  void clearPromotion() => $_clearField(9);
}

class DAppEntity extends $pb.GeneratedMessage {
  factory DAppEntity({
    DAppInfo? info,
    $core.String? uuid,
  }) {
    final result = create();
    if (info != null) result.info = info;
    if (uuid != null) result.uuid = uuid;
    return result;
  }

  DAppEntity._();

  factory DAppEntity.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DAppEntity.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DAppEntity',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..aOM<DAppInfo>(1, _omitFieldNames ? '' : 'info',
        subBuilder: DAppInfo.create)
    ..aOS(2, _omitFieldNames ? '' : 'uuid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DAppEntity clone() => DAppEntity()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DAppEntity copyWith(void Function(DAppEntity) updates) =>
      super.copyWith((message) => updates(message as DAppEntity)) as DAppEntity;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DAppEntity create() => DAppEntity._();
  @$core.override
  DAppEntity createEmptyInstance() => create();
  static $pb.PbList<DAppEntity> createRepeated() => $pb.PbList<DAppEntity>();
  @$core.pragma('dart2js:noInline')
  static DAppEntity getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DAppEntity>(create);
  static DAppEntity? _defaultInstance;

  @$pb.TagNumber(1)
  DAppInfo get info => $_getN(0);
  @$pb.TagNumber(1)
  set info(DAppInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  DAppInfo ensureInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get uuid => $_getSZ(1);
  @$pb.TagNumber(2)
  set uuid($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUuid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUuid() => $_clearField(2);
}

class DAppListByClassResp extends $pb.GeneratedMessage {
  factory DAppListByClassResp({
    $core.Iterable<DAppInfo>? top,
    $core.Iterable<DAppInfo>? popular,
    $core.Iterable<DAppInfo>? recommend,
  }) {
    final result = create();
    if (top != null) result.top.addAll(top);
    if (popular != null) result.popular.addAll(popular);
    if (recommend != null) result.recommend.addAll(recommend);
    return result;
  }

  DAppListByClassResp._();

  factory DAppListByClassResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DAppListByClassResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DAppListByClassResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..pc<DAppInfo>(1, _omitFieldNames ? '' : 'top', $pb.PbFieldType.PM,
        subBuilder: DAppInfo.create)
    ..pc<DAppInfo>(2, _omitFieldNames ? '' : 'popular', $pb.PbFieldType.PM,
        subBuilder: DAppInfo.create)
    ..pc<DAppInfo>(3, _omitFieldNames ? '' : 'recommend', $pb.PbFieldType.PM,
        subBuilder: DAppInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DAppListByClassResp clone() => DAppListByClassResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DAppListByClassResp copyWith(void Function(DAppListByClassResp) updates) =>
      super.copyWith((message) => updates(message as DAppListByClassResp))
          as DAppListByClassResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DAppListByClassResp create() => DAppListByClassResp._();
  @$core.override
  DAppListByClassResp createEmptyInstance() => create();
  static $pb.PbList<DAppListByClassResp> createRepeated() =>
      $pb.PbList<DAppListByClassResp>();
  @$core.pragma('dart2js:noInline')
  static DAppListByClassResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DAppListByClassResp>(create);
  static DAppListByClassResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<DAppInfo> get top => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<DAppInfo> get popular => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<DAppInfo> get recommend => $_getList(2);
}

class DAppGetRWAResp extends $pb.GeneratedMessage {
  factory DAppGetRWAResp({
    $core.String? url,
  }) {
    final result = create();
    if (url != null) result.url = url;
    return result;
  }

  DAppGetRWAResp._();

  factory DAppGetRWAResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DAppGetRWAResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DAppGetRWAResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DAppGetRWAResp clone() => DAppGetRWAResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DAppGetRWAResp copyWith(void Function(DAppGetRWAResp) updates) =>
      super.copyWith((message) => updates(message as DAppGetRWAResp))
          as DAppGetRWAResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DAppGetRWAResp create() => DAppGetRWAResp._();
  @$core.override
  DAppGetRWAResp createEmptyInstance() => create();
  static $pb.PbList<DAppGetRWAResp> createRepeated() =>
      $pb.PbList<DAppGetRWAResp>();
  @$core.pragma('dart2js:noInline')
  static DAppGetRWAResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DAppGetRWAResp>(create);
  static DAppGetRWAResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);
}

class DAppUpdateTopReq extends $pb.GeneratedMessage {
  factory DAppUpdateTopReq({
    $core.String? url,
    $core.String? cover,
  }) {
    final result = create();
    if (url != null) result.url = url;
    if (cover != null) result.cover = cover;
    return result;
  }

  DAppUpdateTopReq._();

  factory DAppUpdateTopReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DAppUpdateTopReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DAppUpdateTopReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..aOS(2, _omitFieldNames ? '' : 'cover')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DAppUpdateTopReq clone() => DAppUpdateTopReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DAppUpdateTopReq copyWith(void Function(DAppUpdateTopReq) updates) =>
      super.copyWith((message) => updates(message as DAppUpdateTopReq))
          as DAppUpdateTopReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DAppUpdateTopReq create() => DAppUpdateTopReq._();
  @$core.override
  DAppUpdateTopReq createEmptyInstance() => create();
  static $pb.PbList<DAppUpdateTopReq> createRepeated() =>
      $pb.PbList<DAppUpdateTopReq>();
  @$core.pragma('dart2js:noInline')
  static DAppUpdateTopReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DAppUpdateTopReq>(create);
  static DAppUpdateTopReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get cover => $_getSZ(1);
  @$pb.TagNumber(2)
  set cover($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCover() => $_has(1);
  @$pb.TagNumber(2)
  void clearCover() => $_clearField(2);
}

class DAppUpdateOrderReq_Unit extends $pb.GeneratedMessage {
  factory DAppUpdateOrderReq_Unit({
    $core.String? uuid,
    $core.int? order,
  }) {
    final result = create();
    if (uuid != null) result.uuid = uuid;
    if (order != null) result.order = order;
    return result;
  }

  DAppUpdateOrderReq_Unit._();

  factory DAppUpdateOrderReq_Unit.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DAppUpdateOrderReq_Unit.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DAppUpdateOrderReq.Unit',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'order', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DAppUpdateOrderReq_Unit clone() =>
      DAppUpdateOrderReq_Unit()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DAppUpdateOrderReq_Unit copyWith(
          void Function(DAppUpdateOrderReq_Unit) updates) =>
      super.copyWith((message) => updates(message as DAppUpdateOrderReq_Unit))
          as DAppUpdateOrderReq_Unit;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DAppUpdateOrderReq_Unit create() => DAppUpdateOrderReq_Unit._();
  @$core.override
  DAppUpdateOrderReq_Unit createEmptyInstance() => create();
  static $pb.PbList<DAppUpdateOrderReq_Unit> createRepeated() =>
      $pb.PbList<DAppUpdateOrderReq_Unit>();
  @$core.pragma('dart2js:noInline')
  static DAppUpdateOrderReq_Unit getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DAppUpdateOrderReq_Unit>(create);
  static DAppUpdateOrderReq_Unit? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get order => $_getIZ(1);
  @$pb.TagNumber(2)
  set order($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOrder() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrder() => $_clearField(2);
}

class DAppUpdateOrderReq extends $pb.GeneratedMessage {
  factory DAppUpdateOrderReq({
    $core.Iterable<DAppUpdateOrderReq_Unit>? list,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    return result;
  }

  DAppUpdateOrderReq._();

  factory DAppUpdateOrderReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DAppUpdateOrderReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DAppUpdateOrderReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..pc<DAppUpdateOrderReq_Unit>(
        1, _omitFieldNames ? '' : 'list', $pb.PbFieldType.PM,
        subBuilder: DAppUpdateOrderReq_Unit.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DAppUpdateOrderReq clone() => DAppUpdateOrderReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DAppUpdateOrderReq copyWith(void Function(DAppUpdateOrderReq) updates) =>
      super.copyWith((message) => updates(message as DAppUpdateOrderReq))
          as DAppUpdateOrderReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DAppUpdateOrderReq create() => DAppUpdateOrderReq._();
  @$core.override
  DAppUpdateOrderReq createEmptyInstance() => create();
  static $pb.PbList<DAppUpdateOrderReq> createRepeated() =>
      $pb.PbList<DAppUpdateOrderReq>();
  @$core.pragma('dart2js:noInline')
  static DAppUpdateOrderReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DAppUpdateOrderReq>(create);
  static DAppUpdateOrderReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<DAppUpdateOrderReq_Unit> get list => $_getList(0);
}

class DAppDeleteReq extends $pb.GeneratedMessage {
  factory DAppDeleteReq({
    $core.String? uuid,
  }) {
    final result = create();
    if (uuid != null) result.uuid = uuid;
    return result;
  }

  DAppDeleteReq._();

  factory DAppDeleteReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DAppDeleteReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DAppDeleteReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DAppDeleteReq clone() => DAppDeleteReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DAppDeleteReq copyWith(void Function(DAppDeleteReq) updates) =>
      super.copyWith((message) => updates(message as DAppDeleteReq))
          as DAppDeleteReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DAppDeleteReq create() => DAppDeleteReq._();
  @$core.override
  DAppDeleteReq createEmptyInstance() => create();
  static $pb.PbList<DAppDeleteReq> createRepeated() =>
      $pb.PbList<DAppDeleteReq>();
  @$core.pragma('dart2js:noInline')
  static DAppDeleteReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DAppDeleteReq>(create);
  static DAppDeleteReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => $_clearField(1);
}

class MerchantManageListReq extends $pb.GeneratedMessage {
  factory MerchantManageListReq({
    $core.String? name,
    $2.Pagination? pagination,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (pagination != null) result.pagination = pagination;
    return result;
  }

  MerchantManageListReq._();

  factory MerchantManageListReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MerchantManageListReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MerchantManageListReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOM<$2.Pagination>(2, _omitFieldNames ? '' : 'pagination',
        subBuilder: $2.Pagination.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MerchantManageListReq clone() =>
      MerchantManageListReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MerchantManageListReq copyWith(
          void Function(MerchantManageListReq) updates) =>
      super.copyWith((message) => updates(message as MerchantManageListReq))
          as MerchantManageListReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MerchantManageListReq create() => MerchantManageListReq._();
  @$core.override
  MerchantManageListReq createEmptyInstance() => create();
  static $pb.PbList<MerchantManageListReq> createRepeated() =>
      $pb.PbList<MerchantManageListReq>();
  @$core.pragma('dart2js:noInline')
  static MerchantManageListReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MerchantManageListReq>(create);
  static MerchantManageListReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

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

class MerchantManageListResp_Unit extends $pb.GeneratedMessage {
  factory MerchantManageListResp_Unit({
    $3.MerchantInfo? base,
    $core.String? comment,
  }) {
    final result = create();
    if (base != null) result.base = base;
    if (comment != null) result.comment = comment;
    return result;
  }

  MerchantManageListResp_Unit._();

  factory MerchantManageListResp_Unit.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MerchantManageListResp_Unit.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MerchantManageListResp.Unit',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..aOM<$3.MerchantInfo>(1, _omitFieldNames ? '' : 'base',
        subBuilder: $3.MerchantInfo.create)
    ..aOS(2, _omitFieldNames ? '' : 'comment')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MerchantManageListResp_Unit clone() =>
      MerchantManageListResp_Unit()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MerchantManageListResp_Unit copyWith(
          void Function(MerchantManageListResp_Unit) updates) =>
      super.copyWith(
              (message) => updates(message as MerchantManageListResp_Unit))
          as MerchantManageListResp_Unit;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MerchantManageListResp_Unit create() =>
      MerchantManageListResp_Unit._();
  @$core.override
  MerchantManageListResp_Unit createEmptyInstance() => create();
  static $pb.PbList<MerchantManageListResp_Unit> createRepeated() =>
      $pb.PbList<MerchantManageListResp_Unit>();
  @$core.pragma('dart2js:noInline')
  static MerchantManageListResp_Unit getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MerchantManageListResp_Unit>(create);
  static MerchantManageListResp_Unit? _defaultInstance;

  @$pb.TagNumber(1)
  $3.MerchantInfo get base => $_getN(0);
  @$pb.TagNumber(1)
  set base($3.MerchantInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => $_clearField(1);
  @$pb.TagNumber(1)
  $3.MerchantInfo ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get comment => $_getSZ(1);
  @$pb.TagNumber(2)
  set comment($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasComment() => $_has(1);
  @$pb.TagNumber(2)
  void clearComment() => $_clearField(2);
}

class MerchantManageListResp extends $pb.GeneratedMessage {
  factory MerchantManageListResp({
    $core.Iterable<MerchantManageListResp_Unit>? list,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    return result;
  }

  MerchantManageListResp._();

  factory MerchantManageListResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MerchantManageListResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MerchantManageListResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..pc<MerchantManageListResp_Unit>(
        1, _omitFieldNames ? '' : 'list', $pb.PbFieldType.PM,
        subBuilder: MerchantManageListResp_Unit.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MerchantManageListResp clone() =>
      MerchantManageListResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MerchantManageListResp copyWith(
          void Function(MerchantManageListResp) updates) =>
      super.copyWith((message) => updates(message as MerchantManageListResp))
          as MerchantManageListResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MerchantManageListResp create() => MerchantManageListResp._();
  @$core.override
  MerchantManageListResp createEmptyInstance() => create();
  static $pb.PbList<MerchantManageListResp> createRepeated() =>
      $pb.PbList<MerchantManageListResp>();
  @$core.pragma('dart2js:noInline')
  static MerchantManageListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MerchantManageListResp>(create);
  static MerchantManageListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<MerchantManageListResp_Unit> get list => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
