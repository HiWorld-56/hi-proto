// This is a generated file - do not edit.
//
// Generated from v1/did/price.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class GetPriceReq extends $pb.GeneratedMessage {
  factory GetPriceReq({
    $core.String? symbol,
  }) {
    final result = create();
    if (symbol != null) result.symbol = symbol;
    return result;
  }

  GetPriceReq._();

  factory GetPriceReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPriceReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPriceReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'symbol')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPriceReq clone() => GetPriceReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPriceReq copyWith(void Function(GetPriceReq) updates) =>
      super.copyWith((message) => updates(message as GetPriceReq))
          as GetPriceReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPriceReq create() => GetPriceReq._();
  @$core.override
  GetPriceReq createEmptyInstance() => create();
  static $pb.PbList<GetPriceReq> createRepeated() => $pb.PbList<GetPriceReq>();
  @$core.pragma('dart2js:noInline')
  static GetPriceReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPriceReq>(create);
  static GetPriceReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get symbol => $_getSZ(0);
  @$pb.TagNumber(1)
  set symbol($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSymbol() => $_has(0);
  @$pb.TagNumber(1)
  void clearSymbol() => $_clearField(1);
}

class GetPriceResp_Unit extends $pb.GeneratedMessage {
  factory GetPriceResp_Unit({
    $core.String? price,
    $core.String? symbol,
  }) {
    final result = create();
    if (price != null) result.price = price;
    if (symbol != null) result.symbol = symbol;
    return result;
  }

  GetPriceResp_Unit._();

  factory GetPriceResp_Unit.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPriceResp_Unit.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPriceResp.Unit',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'price')
    ..aOS(2, _omitFieldNames ? '' : 'symbol')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPriceResp_Unit clone() => GetPriceResp_Unit()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPriceResp_Unit copyWith(void Function(GetPriceResp_Unit) updates) =>
      super.copyWith((message) => updates(message as GetPriceResp_Unit))
          as GetPriceResp_Unit;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPriceResp_Unit create() => GetPriceResp_Unit._();
  @$core.override
  GetPriceResp_Unit createEmptyInstance() => create();
  static $pb.PbList<GetPriceResp_Unit> createRepeated() =>
      $pb.PbList<GetPriceResp_Unit>();
  @$core.pragma('dart2js:noInline')
  static GetPriceResp_Unit getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPriceResp_Unit>(create);
  static GetPriceResp_Unit? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get price => $_getSZ(0);
  @$pb.TagNumber(1)
  set price($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPrice() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrice() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get symbol => $_getSZ(1);
  @$pb.TagNumber(2)
  set symbol($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSymbol() => $_has(1);
  @$pb.TagNumber(2)
  void clearSymbol() => $_clearField(2);
}

class GetPriceResp extends $pb.GeneratedMessage {
  factory GetPriceResp({
    $core.Iterable<GetPriceResp_Unit>? list,
    $core.String? usdcny,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    if (usdcny != null) result.usdcny = usdcny;
    return result;
  }

  GetPriceResp._();

  factory GetPriceResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPriceResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPriceResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..pc<GetPriceResp_Unit>(
        1, _omitFieldNames ? '' : 'list', $pb.PbFieldType.PM,
        subBuilder: GetPriceResp_Unit.create)
    ..aOS(2, _omitFieldNames ? '' : 'usdcny')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPriceResp clone() => GetPriceResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPriceResp copyWith(void Function(GetPriceResp) updates) =>
      super.copyWith((message) => updates(message as GetPriceResp))
          as GetPriceResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPriceResp create() => GetPriceResp._();
  @$core.override
  GetPriceResp createEmptyInstance() => create();
  static $pb.PbList<GetPriceResp> createRepeated() =>
      $pb.PbList<GetPriceResp>();
  @$core.pragma('dart2js:noInline')
  static GetPriceResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPriceResp>(create);
  static GetPriceResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<GetPriceResp_Unit> get list => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get usdcny => $_getSZ(1);
  @$pb.TagNumber(2)
  set usdcny($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUsdcny() => $_has(1);
  @$pb.TagNumber(2)
  void clearUsdcny() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
