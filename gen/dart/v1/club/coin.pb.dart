// This is a generated file - do not edit.
//
// Generated from v1/club/coin.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class IconInfo extends $pb.GeneratedMessage {
  factory IconInfo({
    $core.String? name,
    $core.String? icon,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (icon != null) result.icon = icon;
    return result;
  }

  IconInfo._();

  factory IconInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory IconInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IconInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'icon')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IconInfo clone() => IconInfo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IconInfo copyWith(void Function(IconInfo) updates) =>
      super.copyWith((message) => updates(message as IconInfo)) as IconInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IconInfo create() => IconInfo._();
  @$core.override
  IconInfo createEmptyInstance() => create();
  static $pb.PbList<IconInfo> createRepeated() => $pb.PbList<IconInfo>();
  @$core.pragma('dart2js:noInline')
  static IconInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IconInfo>(create);
  static IconInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get icon => $_getSZ(1);
  @$pb.TagNumber(2)
  set icon($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearIcon() => $_clearField(2);
}

class IconList extends $pb.GeneratedMessage {
  factory IconList({
    $core.Iterable<IconInfo>? iconList,
  }) {
    final result = create();
    if (iconList != null) result.iconList.addAll(iconList);
    return result;
  }

  IconList._();

  factory IconList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory IconList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IconList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..pc<IconInfo>(1, _omitFieldNames ? '' : 'iconList', $pb.PbFieldType.PM,
        subBuilder: IconInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IconList clone() => IconList()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IconList copyWith(void Function(IconList) updates) =>
      super.copyWith((message) => updates(message as IconList)) as IconList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IconList create() => IconList._();
  @$core.override
  IconList createEmptyInstance() => create();
  static $pb.PbList<IconList> createRepeated() => $pb.PbList<IconList>();
  @$core.pragma('dart2js:noInline')
  static IconList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IconList>(create);
  static IconList? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<IconInfo> get iconList => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
