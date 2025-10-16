// This is a generated file - do not edit.
//
// Generated from v1/club/app_version.proto.

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

class AppVersionParam extends $pb.GeneratedMessage {
  factory AppVersionParam({
    $core.String? platform,
  }) {
    final result = create();
    if (platform != null) result.platform = platform;
    return result;
  }

  AppVersionParam._();

  factory AppVersionParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AppVersionParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AppVersionParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'platform')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AppVersionParam clone() => AppVersionParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AppVersionParam copyWith(void Function(AppVersionParam) updates) =>
      super.copyWith((message) => updates(message as AppVersionParam))
          as AppVersionParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AppVersionParam create() => AppVersionParam._();
  @$core.override
  AppVersionParam createEmptyInstance() => create();
  static $pb.PbList<AppVersionParam> createRepeated() =>
      $pb.PbList<AppVersionParam>();
  @$core.pragma('dart2js:noInline')
  static AppVersionParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AppVersionParam>(create);
  static AppVersionParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get platform => $_getSZ(0);
  @$pb.TagNumber(1)
  set platform($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPlatform() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlatform() => $_clearField(1);
}

class AppVersionInfo extends $pb.GeneratedMessage {
  factory AppVersionInfo({
    $core.String? platform,
    $core.String? minSupportedVersion,
    $core.String? latestVersion,
    $core.String? downloadUrl,
    $core.Iterable<$core.String>? changes,
    $fixnum.Int64? releaseTime,
  }) {
    final result = create();
    if (platform != null) result.platform = platform;
    if (minSupportedVersion != null)
      result.minSupportedVersion = minSupportedVersion;
    if (latestVersion != null) result.latestVersion = latestVersion;
    if (downloadUrl != null) result.downloadUrl = downloadUrl;
    if (changes != null) result.changes.addAll(changes);
    if (releaseTime != null) result.releaseTime = releaseTime;
    return result;
  }

  AppVersionInfo._();

  factory AppVersionInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AppVersionInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AppVersionInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'platform')
    ..aOS(2, _omitFieldNames ? '' : 'minSupportedVersion')
    ..aOS(3, _omitFieldNames ? '' : 'latestVersion')
    ..aOS(4, _omitFieldNames ? '' : 'downloadUrl')
    ..pPS(5, _omitFieldNames ? '' : 'changes')
    ..aInt64(6, _omitFieldNames ? '' : 'releaseTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AppVersionInfo clone() => AppVersionInfo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AppVersionInfo copyWith(void Function(AppVersionInfo) updates) =>
      super.copyWith((message) => updates(message as AppVersionInfo))
          as AppVersionInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AppVersionInfo create() => AppVersionInfo._();
  @$core.override
  AppVersionInfo createEmptyInstance() => create();
  static $pb.PbList<AppVersionInfo> createRepeated() =>
      $pb.PbList<AppVersionInfo>();
  @$core.pragma('dart2js:noInline')
  static AppVersionInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AppVersionInfo>(create);
  static AppVersionInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get platform => $_getSZ(0);
  @$pb.TagNumber(1)
  set platform($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPlatform() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlatform() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get minSupportedVersion => $_getSZ(1);
  @$pb.TagNumber(2)
  set minSupportedVersion($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMinSupportedVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearMinSupportedVersion() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get latestVersion => $_getSZ(2);
  @$pb.TagNumber(3)
  set latestVersion($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLatestVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearLatestVersion() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get downloadUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set downloadUrl($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDownloadUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearDownloadUrl() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get changes => $_getList(4);

  @$pb.TagNumber(6)
  $fixnum.Int64 get releaseTime => $_getI64(5);
  @$pb.TagNumber(6)
  set releaseTime($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasReleaseTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearReleaseTime() => $_clearField(6);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
