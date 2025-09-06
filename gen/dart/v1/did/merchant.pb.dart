// This is a generated file - do not edit.
//
// Generated from v1/did/merchant.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../hi.pb.dart' as $2;
import 'base.pb.dart' as $3;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class MerchantInfo extends $pb.GeneratedMessage {
  factory MerchantInfo({
    $2.Unit? master,
    $2.Unit? server,
    $core.String? name,
    $3.Coin? coin,
    $core.String? endpoint,
    $core.String? scheme,
    $core.String? extendToken,
    $core.String? createAt,
  }) {
    final result = create();
    if (master != null) result.master = master;
    if (server != null) result.server = server;
    if (name != null) result.name = name;
    if (coin != null) result.coin = coin;
    if (endpoint != null) result.endpoint = endpoint;
    if (scheme != null) result.scheme = scheme;
    if (extendToken != null) result.extendToken = extendToken;
    if (createAt != null) result.createAt = createAt;
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..aOM<$2.Unit>(2, _omitFieldNames ? '' : 'master',
        subBuilder: $2.Unit.create)
    ..aOM<$2.Unit>(3, _omitFieldNames ? '' : 'server',
        subBuilder: $2.Unit.create)
    ..aOS(4, _omitFieldNames ? '' : 'name')
    ..aOM<$3.Coin>(5, _omitFieldNames ? '' : 'coin', subBuilder: $3.Coin.create)
    ..aOS(6, _omitFieldNames ? '' : 'endpoint')
    ..aOS(7, _omitFieldNames ? '' : 'scheme')
    ..aOS(8, _omitFieldNames ? '' : 'extendToken')
    ..aOS(9, _omitFieldNames ? '' : 'createAt')
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

  @$pb.TagNumber(2)
  $2.Unit get master => $_getN(0);
  @$pb.TagNumber(2)
  set master($2.Unit value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasMaster() => $_has(0);
  @$pb.TagNumber(2)
  void clearMaster() => $_clearField(2);
  @$pb.TagNumber(2)
  $2.Unit ensureMaster() => $_ensure(0);

  @$pb.TagNumber(3)
  $2.Unit get server => $_getN(1);
  @$pb.TagNumber(3)
  set server($2.Unit value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasServer() => $_has(1);
  @$pb.TagNumber(3)
  void clearServer() => $_clearField(3);
  @$pb.TagNumber(3)
  $2.Unit ensureServer() => $_ensure(1);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(4)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(4)
  void clearName() => $_clearField(4);

  @$pb.TagNumber(5)
  $3.Coin get coin => $_getN(3);
  @$pb.TagNumber(5)
  set coin($3.Coin value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasCoin() => $_has(3);
  @$pb.TagNumber(5)
  void clearCoin() => $_clearField(5);
  @$pb.TagNumber(5)
  $3.Coin ensureCoin() => $_ensure(3);

  @$pb.TagNumber(6)
  $core.String get endpoint => $_getSZ(4);
  @$pb.TagNumber(6)
  set endpoint($core.String value) => $_setString(4, value);
  @$pb.TagNumber(6)
  $core.bool hasEndpoint() => $_has(4);
  @$pb.TagNumber(6)
  void clearEndpoint() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get scheme => $_getSZ(5);
  @$pb.TagNumber(7)
  set scheme($core.String value) => $_setString(5, value);
  @$pb.TagNumber(7)
  $core.bool hasScheme() => $_has(5);
  @$pb.TagNumber(7)
  void clearScheme() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get extendToken => $_getSZ(6);
  @$pb.TagNumber(8)
  set extendToken($core.String value) => $_setString(6, value);
  @$pb.TagNumber(8)
  $core.bool hasExtendToken() => $_has(6);
  @$pb.TagNumber(8)
  void clearExtendToken() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get createAt => $_getSZ(7);
  @$pb.TagNumber(9)
  set createAt($core.String value) => $_setString(7, value);
  @$pb.TagNumber(9)
  $core.bool hasCreateAt() => $_has(7);
  @$pb.TagNumber(9)
  void clearCreateAt() => $_clearField(9);
}

class MerchantGetResp extends $pb.GeneratedMessage {
  factory MerchantGetResp({
    MerchantInfo? info,
  }) {
    final result = create();
    if (info != null) result.info = info;
    return result;
  }

  MerchantGetResp._();

  factory MerchantGetResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MerchantGetResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MerchantGetResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..aOM<MerchantInfo>(1, _omitFieldNames ? '' : 'info',
        subBuilder: MerchantInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MerchantGetResp clone() => MerchantGetResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MerchantGetResp copyWith(void Function(MerchantGetResp) updates) =>
      super.copyWith((message) => updates(message as MerchantGetResp))
          as MerchantGetResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MerchantGetResp create() => MerchantGetResp._();
  @$core.override
  MerchantGetResp createEmptyInstance() => create();
  static $pb.PbList<MerchantGetResp> createRepeated() =>
      $pb.PbList<MerchantGetResp>();
  @$core.pragma('dart2js:noInline')
  static MerchantGetResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MerchantGetResp>(create);
  static MerchantGetResp? _defaultInstance;

  @$pb.TagNumber(1)
  MerchantInfo get info => $_getN(0);
  @$pb.TagNumber(1)
  set info(MerchantInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  MerchantInfo ensureInfo() => $_ensure(0);
}

class MerchantSetReq extends $pb.GeneratedMessage {
  factory MerchantSetReq({
    $core.String? server,
    $core.String? name,
    $core.String? coin,
    $core.String? endpoint,
    $core.String? scheme,
  }) {
    final result = create();
    if (server != null) result.server = server;
    if (name != null) result.name = name;
    if (coin != null) result.coin = coin;
    if (endpoint != null) result.endpoint = endpoint;
    if (scheme != null) result.scheme = scheme;
    return result;
  }

  MerchantSetReq._();

  factory MerchantSetReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MerchantSetReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MerchantSetReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..aOS(3, _omitFieldNames ? '' : 'server')
    ..aOS(4, _omitFieldNames ? '' : 'name')
    ..aOS(5, _omitFieldNames ? '' : 'coin')
    ..aOS(6, _omitFieldNames ? '' : 'endpoint')
    ..aOS(7, _omitFieldNames ? '' : 'scheme')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MerchantSetReq clone() => MerchantSetReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MerchantSetReq copyWith(void Function(MerchantSetReq) updates) =>
      super.copyWith((message) => updates(message as MerchantSetReq))
          as MerchantSetReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MerchantSetReq create() => MerchantSetReq._();
  @$core.override
  MerchantSetReq createEmptyInstance() => create();
  static $pb.PbList<MerchantSetReq> createRepeated() =>
      $pb.PbList<MerchantSetReq>();
  @$core.pragma('dart2js:noInline')
  static MerchantSetReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MerchantSetReq>(create);
  static MerchantSetReq? _defaultInstance;

  @$pb.TagNumber(3)
  $core.String get server => $_getSZ(0);
  @$pb.TagNumber(3)
  set server($core.String value) => $_setString(0, value);
  @$pb.TagNumber(3)
  $core.bool hasServer() => $_has(0);
  @$pb.TagNumber(3)
  void clearServer() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(4)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(4)
  void clearName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get coin => $_getSZ(2);
  @$pb.TagNumber(5)
  set coin($core.String value) => $_setString(2, value);
  @$pb.TagNumber(5)
  $core.bool hasCoin() => $_has(2);
  @$pb.TagNumber(5)
  void clearCoin() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get endpoint => $_getSZ(3);
  @$pb.TagNumber(6)
  set endpoint($core.String value) => $_setString(3, value);
  @$pb.TagNumber(6)
  $core.bool hasEndpoint() => $_has(3);
  @$pb.TagNumber(6)
  void clearEndpoint() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get scheme => $_getSZ(4);
  @$pb.TagNumber(7)
  set scheme($core.String value) => $_setString(4, value);
  @$pb.TagNumber(7)
  $core.bool hasScheme() => $_has(4);
  @$pb.TagNumber(7)
  void clearScheme() => $_clearField(7);
}

class MerchantListResp extends $pb.GeneratedMessage {
  factory MerchantListResp({
    $core.Iterable<MerchantInfo>? list,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    return result;
  }

  MerchantListResp._();

  factory MerchantListResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MerchantListResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MerchantListResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..pc<MerchantInfo>(1, _omitFieldNames ? '' : 'list', $pb.PbFieldType.PM,
        subBuilder: MerchantInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MerchantListResp clone() => MerchantListResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MerchantListResp copyWith(void Function(MerchantListResp) updates) =>
      super.copyWith((message) => updates(message as MerchantListResp))
          as MerchantListResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MerchantListResp create() => MerchantListResp._();
  @$core.override
  MerchantListResp createEmptyInstance() => create();
  static $pb.PbList<MerchantListResp> createRepeated() =>
      $pb.PbList<MerchantListResp>();
  @$core.pragma('dart2js:noInline')
  static MerchantListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MerchantListResp>(create);
  static MerchantListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<MerchantInfo> get list => $_getList(0);
}

class MerchantNotifyReq extends $pb.GeneratedMessage {
  factory MerchantNotifyReq({
    $core.String? did,
    $core.String? nonce,
  }) {
    final result = create();
    if (did != null) result.did = did;
    if (nonce != null) result.nonce = nonce;
    return result;
  }

  MerchantNotifyReq._();

  factory MerchantNotifyReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MerchantNotifyReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MerchantNotifyReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..aOS(2, _omitFieldNames ? '' : 'nonce')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MerchantNotifyReq clone() => MerchantNotifyReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MerchantNotifyReq copyWith(void Function(MerchantNotifyReq) updates) =>
      super.copyWith((message) => updates(message as MerchantNotifyReq))
          as MerchantNotifyReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MerchantNotifyReq create() => MerchantNotifyReq._();
  @$core.override
  MerchantNotifyReq createEmptyInstance() => create();
  static $pb.PbList<MerchantNotifyReq> createRepeated() =>
      $pb.PbList<MerchantNotifyReq>();
  @$core.pragma('dart2js:noInline')
  static MerchantNotifyReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MerchantNotifyReq>(create);
  static MerchantNotifyReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get did => $_getSZ(0);
  @$pb.TagNumber(1)
  set did($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get nonce => $_getSZ(1);
  @$pb.TagNumber(2)
  set nonce($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNonce() => $_has(1);
  @$pb.TagNumber(2)
  void clearNonce() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
