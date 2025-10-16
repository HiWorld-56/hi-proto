// This is a generated file - do not edit.
//
// Generated from v1/club/merchant.proto.

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

class MerchantInfo extends $pb.GeneratedMessage {
  factory MerchantInfo({
    $core.String? did,
    $core.String? name,
    $core.String? logo,
    $core.Iterable<$core.String>? nativeCoins,
    $core.Iterable<$core.String>? tokenCoins,
    $core.String? comment,
    $fixnum.Int64? createdAt,
  }) {
    final result = create();
    if (did != null) result.did = did;
    if (name != null) result.name = name;
    if (logo != null) result.logo = logo;
    if (nativeCoins != null) result.nativeCoins.addAll(nativeCoins);
    if (tokenCoins != null) result.tokenCoins.addAll(tokenCoins);
    if (comment != null) result.comment = comment;
    if (createdAt != null) result.createdAt = createdAt;
    return result;
  }

  MerchantInfo._();

  factory MerchantInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MerchantInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MerchantInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'logo')
    ..pPS(4, _omitFieldNames ? '' : 'nativeCoins')
    ..pPS(5, _omitFieldNames ? '' : 'tokenCoins')
    ..aOS(6, _omitFieldNames ? '' : 'comment')
    ..aInt64(7, _omitFieldNames ? '' : 'createdAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MerchantInfo clone() => MerchantInfo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MerchantInfo copyWith(void Function(MerchantInfo) updates) =>
      super.copyWith((message) => updates(message as MerchantInfo))
          as MerchantInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MerchantInfo create() => MerchantInfo._();
  @$core.override
  MerchantInfo createEmptyInstance() => create();
  static $pb.PbList<MerchantInfo> createRepeated() =>
      $pb.PbList<MerchantInfo>();
  @$core.pragma('dart2js:noInline')
  static MerchantInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MerchantInfo>(create);
  static MerchantInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get did => $_getSZ(0);
  @$pb.TagNumber(1)
  set did($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get logo => $_getSZ(2);
  @$pb.TagNumber(3)
  set logo($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLogo() => $_has(2);
  @$pb.TagNumber(3)
  void clearLogo() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get nativeCoins => $_getList(3);

  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get tokenCoins => $_getList(4);

  @$pb.TagNumber(6)
  $core.String get comment => $_getSZ(5);
  @$pb.TagNumber(6)
  set comment($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasComment() => $_has(5);
  @$pb.TagNumber(6)
  void clearComment() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get createdAt => $_getI64(6);
  @$pb.TagNumber(7)
  set createdAt($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasCreatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreatedAt() => $_clearField(7);
}

class MerchantList extends $pb.GeneratedMessage {
  factory MerchantList({
    $core.Iterable<MerchantInfo>? merchantList,
  }) {
    final result = create();
    if (merchantList != null) result.merchantList.addAll(merchantList);
    return result;
  }

  MerchantList._();

  factory MerchantList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MerchantList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MerchantList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..pc<MerchantInfo>(
        1, _omitFieldNames ? '' : 'merchantList', $pb.PbFieldType.PM,
        subBuilder: MerchantInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MerchantList clone() => MerchantList()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MerchantList copyWith(void Function(MerchantList) updates) =>
      super.copyWith((message) => updates(message as MerchantList))
          as MerchantList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MerchantList create() => MerchantList._();
  @$core.override
  MerchantList createEmptyInstance() => create();
  static $pb.PbList<MerchantList> createRepeated() =>
      $pb.PbList<MerchantList>();
  @$core.pragma('dart2js:noInline')
  static MerchantList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MerchantList>(create);
  static MerchantList? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<MerchantInfo> get merchantList => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
