// This is a generated file - do not edit.
//
// Generated from v1/did/base.proto.

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

class Coin extends $pb.GeneratedMessage {
  factory Coin({
    $core.String? icon,
    $core.String? name,
    $core.String? contract,
  }) {
    final result = create();
    if (icon != null) result.icon = icon;
    if (name != null) result.name = name;
    if (contract != null) result.contract = contract;
    return result;
  }

  Coin._();

  factory Coin.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Coin.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Coin',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'icon')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'contract')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Coin clone() => Coin()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Coin copyWith(void Function(Coin) updates) =>
      super.copyWith((message) => updates(message as Coin)) as Coin;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Coin create() => Coin._();
  @$core.override
  Coin createEmptyInstance() => create();
  static $pb.PbList<Coin> createRepeated() => $pb.PbList<Coin>();
  @$core.pragma('dart2js:noInline')
  static Coin getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Coin>(create);
  static Coin? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get icon => $_getSZ(0);
  @$pb.TagNumber(1)
  set icon($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIcon() => $_has(0);
  @$pb.TagNumber(1)
  void clearIcon() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get contract => $_getSZ(2);
  @$pb.TagNumber(3)
  set contract($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasContract() => $_has(2);
  @$pb.TagNumber(3)
  void clearContract() => $_clearField(3);
}

class ListCoinsResp extends $pb.GeneratedMessage {
  factory ListCoinsResp({
    $core.Iterable<Coin>? list,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    return result;
  }

  ListCoinsResp._();

  factory ListCoinsResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListCoinsResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListCoinsResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..pc<Coin>(1, _omitFieldNames ? '' : 'list', $pb.PbFieldType.PM,
        subBuilder: Coin.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListCoinsResp clone() => ListCoinsResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListCoinsResp copyWith(void Function(ListCoinsResp) updates) =>
      super.copyWith((message) => updates(message as ListCoinsResp))
          as ListCoinsResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListCoinsResp create() => ListCoinsResp._();
  @$core.override
  ListCoinsResp createEmptyInstance() => create();
  static $pb.PbList<ListCoinsResp> createRepeated() =>
      $pb.PbList<ListCoinsResp>();
  @$core.pragma('dart2js:noInline')
  static ListCoinsResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListCoinsResp>(create);
  static ListCoinsResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Coin> get list => $_getList(0);
}

class LastetVersionReq extends $pb.GeneratedMessage {
  factory LastetVersionReq({
    $core.String? platform,
  }) {
    final result = create();
    if (platform != null) result.platform = platform;
    return result;
  }

  LastetVersionReq._();

  factory LastetVersionReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LastetVersionReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LastetVersionReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'platform')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LastetVersionReq clone() => LastetVersionReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LastetVersionReq copyWith(void Function(LastetVersionReq) updates) =>
      super.copyWith((message) => updates(message as LastetVersionReq))
          as LastetVersionReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LastetVersionReq create() => LastetVersionReq._();
  @$core.override
  LastetVersionReq createEmptyInstance() => create();
  static $pb.PbList<LastetVersionReq> createRepeated() =>
      $pb.PbList<LastetVersionReq>();
  @$core.pragma('dart2js:noInline')
  static LastetVersionReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LastetVersionReq>(create);
  static LastetVersionReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get platform => $_getSZ(0);
  @$pb.TagNumber(1)
  set platform($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPlatform() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlatform() => $_clearField(1);
}

class LastetVersionResp extends $pb.GeneratedMessage {
  factory LastetVersionResp({
    $core.String? minSupportedVersion,
    $core.String? latestVersion,
    $core.String? downloadUrl,
    $core.Iterable<$core.String>? changes,
    $fixnum.Int64? releaseTime,
  }) {
    final result = create();
    if (minSupportedVersion != null)
      result.minSupportedVersion = minSupportedVersion;
    if (latestVersion != null) result.latestVersion = latestVersion;
    if (downloadUrl != null) result.downloadUrl = downloadUrl;
    if (changes != null) result.changes.addAll(changes);
    if (releaseTime != null) result.releaseTime = releaseTime;
    return result;
  }

  LastetVersionResp._();

  factory LastetVersionResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LastetVersionResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LastetVersionResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'minSupportedVersion')
    ..aOS(2, _omitFieldNames ? '' : 'latestVersion')
    ..aOS(3, _omitFieldNames ? '' : 'downloadUrl')
    ..pPS(4, _omitFieldNames ? '' : 'changes')
    ..aInt64(5, _omitFieldNames ? '' : 'releaseTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LastetVersionResp clone() => LastetVersionResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LastetVersionResp copyWith(void Function(LastetVersionResp) updates) =>
      super.copyWith((message) => updates(message as LastetVersionResp))
          as LastetVersionResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LastetVersionResp create() => LastetVersionResp._();
  @$core.override
  LastetVersionResp createEmptyInstance() => create();
  static $pb.PbList<LastetVersionResp> createRepeated() =>
      $pb.PbList<LastetVersionResp>();
  @$core.pragma('dart2js:noInline')
  static LastetVersionResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LastetVersionResp>(create);
  static LastetVersionResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get minSupportedVersion => $_getSZ(0);
  @$pb.TagNumber(1)
  set minSupportedVersion($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMinSupportedVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearMinSupportedVersion() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get latestVersion => $_getSZ(1);
  @$pb.TagNumber(2)
  set latestVersion($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLatestVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearLatestVersion() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get downloadUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set downloadUrl($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDownloadUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearDownloadUrl() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get changes => $_getList(3);

  @$pb.TagNumber(5)
  $fixnum.Int64 get releaseTime => $_getI64(4);
  @$pb.TagNumber(5)
  set releaseTime($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasReleaseTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearReleaseTime() => $_clearField(5);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
