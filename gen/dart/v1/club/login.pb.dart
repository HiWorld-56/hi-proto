// This is a generated file - do not edit.
//
// Generated from v1/club/login.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// service Login {
///     rpc RefreshToken (hi.RefreshTokenReq) returns (hi.Token);
///     rpc GenerateReqID (hi.Node) returns (hi.ReqID);
///     rpc GetReqStatus (hi.ReqID) returns (LoginResp);
/// }
class Nonce extends $pb.GeneratedMessage {
  factory Nonce({
    $core.String? nonce,
  }) {
    final result = create();
    if (nonce != null) result.nonce = nonce;
    return result;
  }

  Nonce._();

  factory Nonce.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Nonce.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Nonce',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'nonce')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Nonce clone() => Nonce()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Nonce copyWith(void Function(Nonce) updates) =>
      super.copyWith((message) => updates(message as Nonce)) as Nonce;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Nonce create() => Nonce._();
  @$core.override
  Nonce createEmptyInstance() => create();
  static $pb.PbList<Nonce> createRepeated() => $pb.PbList<Nonce>();
  @$core.pragma('dart2js:noInline')
  static Nonce getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Nonce>(create);
  static Nonce? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nonce => $_getSZ(0);
  @$pb.TagNumber(1)
  set nonce($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearNonce() => $_clearField(1);
}

class LoginParam extends $pb.GeneratedMessage {
  factory LoginParam({
    $core.String? signature,
    $core.List<$core.int>? data,
  }) {
    final result = create();
    if (signature != null) result.signature = signature;
    if (data != null) result.data = data;
    return result;
  }

  LoginParam._();

  factory LoginParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LoginParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LoginParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'signature')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginParam clone() => LoginParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginParam copyWith(void Function(LoginParam) updates) =>
      super.copyWith((message) => updates(message as LoginParam)) as LoginParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginParam create() => LoginParam._();
  @$core.override
  LoginParam createEmptyInstance() => create();
  static $pb.PbList<LoginParam> createRepeated() => $pb.PbList<LoginParam>();
  @$core.pragma('dart2js:noInline')
  static LoginParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LoginParam>(create);
  static LoginParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get signature => $_getSZ(0);
  @$pb.TagNumber(1)
  set signature($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSignature() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignature() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get data => $_getN(1);
  @$pb.TagNumber(2)
  set data($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => $_clearField(2);
}

class EmbeddedLoginData extends $pb.GeneratedMessage {
  factory EmbeddedLoginData({
    $core.String? nonce,
    $core.String? did,
    $core.String? appName,
    $core.String? mac,
    $core.String? point,
  }) {
    final result = create();
    if (nonce != null) result.nonce = nonce;
    if (did != null) result.did = did;
    if (appName != null) result.appName = appName;
    if (mac != null) result.mac = mac;
    if (point != null) result.point = point;
    return result;
  }

  EmbeddedLoginData._();

  factory EmbeddedLoginData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EmbeddedLoginData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EmbeddedLoginData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'nonce')
    ..aOS(2, _omitFieldNames ? '' : 'did')
    ..aOS(3, _omitFieldNames ? '' : 'appName')
    ..aOS(4, _omitFieldNames ? '' : 'mac')
    ..aOS(5, _omitFieldNames ? '' : 'point')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmbeddedLoginData clone() => EmbeddedLoginData()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmbeddedLoginData copyWith(void Function(EmbeddedLoginData) updates) =>
      super.copyWith((message) => updates(message as EmbeddedLoginData))
          as EmbeddedLoginData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EmbeddedLoginData create() => EmbeddedLoginData._();
  @$core.override
  EmbeddedLoginData createEmptyInstance() => create();
  static $pb.PbList<EmbeddedLoginData> createRepeated() =>
      $pb.PbList<EmbeddedLoginData>();
  @$core.pragma('dart2js:noInline')
  static EmbeddedLoginData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EmbeddedLoginData>(create);
  static EmbeddedLoginData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nonce => $_getSZ(0);
  @$pb.TagNumber(1)
  set nonce($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearNonce() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get did => $_getSZ(1);
  @$pb.TagNumber(2)
  set did($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDid() => $_has(1);
  @$pb.TagNumber(2)
  void clearDid() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get appName => $_getSZ(2);
  @$pb.TagNumber(3)
  set appName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAppName() => $_has(2);
  @$pb.TagNumber(3)
  void clearAppName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get mac => $_getSZ(3);
  @$pb.TagNumber(4)
  set mac($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMac() => $_has(3);
  @$pb.TagNumber(4)
  void clearMac() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get point => $_getSZ(4);
  @$pb.TagNumber(5)
  set point($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPoint() => $_has(4);
  @$pb.TagNumber(5)
  void clearPoint() => $_clearField(5);
}

class EmbeddedLoginResp extends $pb.GeneratedMessage {
  factory EmbeddedLoginResp({
    $core.String? token,
    $core.String? refreshToken,
    $core.String? avatar,
    $core.String? name,
    $core.String? mqttUsername,
    $core.String? mqttClientId,
    $core.String? mqttPassword,
    $core.String? master,
  }) {
    final result = create();
    if (token != null) result.token = token;
    if (refreshToken != null) result.refreshToken = refreshToken;
    if (avatar != null) result.avatar = avatar;
    if (name != null) result.name = name;
    if (mqttUsername != null) result.mqttUsername = mqttUsername;
    if (mqttClientId != null) result.mqttClientId = mqttClientId;
    if (mqttPassword != null) result.mqttPassword = mqttPassword;
    if (master != null) result.master = master;
    return result;
  }

  EmbeddedLoginResp._();

  factory EmbeddedLoginResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EmbeddedLoginResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EmbeddedLoginResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'token')
    ..aOS(2, _omitFieldNames ? '' : 'refreshToken')
    ..aOS(3, _omitFieldNames ? '' : 'avatar')
    ..aOS(4, _omitFieldNames ? '' : 'name')
    ..aOS(5, _omitFieldNames ? '' : 'mqttUsername')
    ..aOS(6, _omitFieldNames ? '' : 'mqttClientId')
    ..aOS(7, _omitFieldNames ? '' : 'mqttPassword')
    ..aOS(8, _omitFieldNames ? '' : 'master')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmbeddedLoginResp clone() => EmbeddedLoginResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmbeddedLoginResp copyWith(void Function(EmbeddedLoginResp) updates) =>
      super.copyWith((message) => updates(message as EmbeddedLoginResp))
          as EmbeddedLoginResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EmbeddedLoginResp create() => EmbeddedLoginResp._();
  @$core.override
  EmbeddedLoginResp createEmptyInstance() => create();
  static $pb.PbList<EmbeddedLoginResp> createRepeated() =>
      $pb.PbList<EmbeddedLoginResp>();
  @$core.pragma('dart2js:noInline')
  static EmbeddedLoginResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EmbeddedLoginResp>(create);
  static EmbeddedLoginResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get refreshToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set refreshToken($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRefreshToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearRefreshToken() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get avatar => $_getSZ(2);
  @$pb.TagNumber(3)
  set avatar($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAvatar() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvatar() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get mqttUsername => $_getSZ(4);
  @$pb.TagNumber(5)
  set mqttUsername($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMqttUsername() => $_has(4);
  @$pb.TagNumber(5)
  void clearMqttUsername() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get mqttClientId => $_getSZ(5);
  @$pb.TagNumber(6)
  set mqttClientId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasMqttClientId() => $_has(5);
  @$pb.TagNumber(6)
  void clearMqttClientId() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get mqttPassword => $_getSZ(6);
  @$pb.TagNumber(7)
  set mqttPassword($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasMqttPassword() => $_has(6);
  @$pb.TagNumber(7)
  void clearMqttPassword() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get master => $_getSZ(7);
  @$pb.TagNumber(8)
  set master($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasMaster() => $_has(7);
  @$pb.TagNumber(8)
  void clearMaster() => $_clearField(8);
}

class WalletLoginData extends $pb.GeneratedMessage {
  factory WalletLoginData({
    $core.String? nonce,
    $core.String? appName,
    $core.String? mac,
    $core.String? point,
  }) {
    final result = create();
    if (nonce != null) result.nonce = nonce;
    if (appName != null) result.appName = appName;
    if (mac != null) result.mac = mac;
    if (point != null) result.point = point;
    return result;
  }

  WalletLoginData._();

  factory WalletLoginData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WalletLoginData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WalletLoginData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'nonce')
    ..aOS(2, _omitFieldNames ? '' : 'appName')
    ..aOS(3, _omitFieldNames ? '' : 'mac')
    ..aOS(4, _omitFieldNames ? '' : 'point')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WalletLoginData clone() => WalletLoginData()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WalletLoginData copyWith(void Function(WalletLoginData) updates) =>
      super.copyWith((message) => updates(message as WalletLoginData))
          as WalletLoginData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WalletLoginData create() => WalletLoginData._();
  @$core.override
  WalletLoginData createEmptyInstance() => create();
  static $pb.PbList<WalletLoginData> createRepeated() =>
      $pb.PbList<WalletLoginData>();
  @$core.pragma('dart2js:noInline')
  static WalletLoginData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WalletLoginData>(create);
  static WalletLoginData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nonce => $_getSZ(0);
  @$pb.TagNumber(1)
  set nonce($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearNonce() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get appName => $_getSZ(1);
  @$pb.TagNumber(2)
  set appName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAppName() => $_has(1);
  @$pb.TagNumber(2)
  void clearAppName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get mac => $_getSZ(2);
  @$pb.TagNumber(3)
  set mac($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMac() => $_has(2);
  @$pb.TagNumber(3)
  void clearMac() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get point => $_getSZ(3);
  @$pb.TagNumber(4)
  set point($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPoint() => $_has(3);
  @$pb.TagNumber(4)
  void clearPoint() => $_clearField(4);
}

class WalletLoginParam extends $pb.GeneratedMessage {
  factory WalletLoginParam({
    $core.String? signature,
    WalletLoginData? data,
  }) {
    final result = create();
    if (signature != null) result.signature = signature;
    if (data != null) result.data = data;
    return result;
  }

  WalletLoginParam._();

  factory WalletLoginParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WalletLoginParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WalletLoginParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'signature')
    ..aOM<WalletLoginData>(2, _omitFieldNames ? '' : 'data',
        subBuilder: WalletLoginData.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WalletLoginParam clone() => WalletLoginParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WalletLoginParam copyWith(void Function(WalletLoginParam) updates) =>
      super.copyWith((message) => updates(message as WalletLoginParam))
          as WalletLoginParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WalletLoginParam create() => WalletLoginParam._();
  @$core.override
  WalletLoginParam createEmptyInstance() => create();
  static $pb.PbList<WalletLoginParam> createRepeated() =>
      $pb.PbList<WalletLoginParam>();
  @$core.pragma('dart2js:noInline')
  static WalletLoginParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WalletLoginParam>(create);
  static WalletLoginParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get signature => $_getSZ(0);
  @$pb.TagNumber(1)
  set signature($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSignature() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignature() => $_clearField(1);

  @$pb.TagNumber(2)
  WalletLoginData get data => $_getN(1);
  @$pb.TagNumber(2)
  set data(WalletLoginData value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => $_clearField(2);
  @$pb.TagNumber(2)
  WalletLoginData ensureData() => $_ensure(1);
}

class WalletLoginResp extends $pb.GeneratedMessage {
  factory WalletLoginResp({
    $core.String? did,
    $core.String? name,
    $core.String? avatar,
    $core.String? token,
    $core.String? refreshToken,
    $core.String? mqttUsername,
    $core.String? mqttClientId,
    $core.Iterable<$core.String>? permissions,
  }) {
    final result = create();
    if (did != null) result.did = did;
    if (name != null) result.name = name;
    if (avatar != null) result.avatar = avatar;
    if (token != null) result.token = token;
    if (refreshToken != null) result.refreshToken = refreshToken;
    if (mqttUsername != null) result.mqttUsername = mqttUsername;
    if (mqttClientId != null) result.mqttClientId = mqttClientId;
    if (permissions != null) result.permissions.addAll(permissions);
    return result;
  }

  WalletLoginResp._();

  factory WalletLoginResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WalletLoginResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WalletLoginResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'avatar')
    ..aOS(4, _omitFieldNames ? '' : 'token')
    ..aOS(5, _omitFieldNames ? '' : 'refreshToken')
    ..aOS(6, _omitFieldNames ? '' : 'mqttUsername')
    ..aOS(7, _omitFieldNames ? '' : 'mqttClientId')
    ..pPS(8, _omitFieldNames ? '' : 'permissions')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WalletLoginResp clone() => WalletLoginResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WalletLoginResp copyWith(void Function(WalletLoginResp) updates) =>
      super.copyWith((message) => updates(message as WalletLoginResp))
          as WalletLoginResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WalletLoginResp create() => WalletLoginResp._();
  @$core.override
  WalletLoginResp createEmptyInstance() => create();
  static $pb.PbList<WalletLoginResp> createRepeated() =>
      $pb.PbList<WalletLoginResp>();
  @$core.pragma('dart2js:noInline')
  static WalletLoginResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WalletLoginResp>(create);
  static WalletLoginResp? _defaultInstance;

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
  $core.String get avatar => $_getSZ(2);
  @$pb.TagNumber(3)
  set avatar($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAvatar() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvatar() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get token => $_getSZ(3);
  @$pb.TagNumber(4)
  set token($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasToken() => $_has(3);
  @$pb.TagNumber(4)
  void clearToken() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get refreshToken => $_getSZ(4);
  @$pb.TagNumber(5)
  set refreshToken($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRefreshToken() => $_has(4);
  @$pb.TagNumber(5)
  void clearRefreshToken() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get mqttUsername => $_getSZ(5);
  @$pb.TagNumber(6)
  set mqttUsername($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasMqttUsername() => $_has(5);
  @$pb.TagNumber(6)
  void clearMqttUsername() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get mqttClientId => $_getSZ(6);
  @$pb.TagNumber(7)
  set mqttClientId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasMqttClientId() => $_has(6);
  @$pb.TagNumber(7)
  void clearMqttClientId() => $_clearField(7);

  @$pb.TagNumber(8)
  $pb.PbList<$core.String> get permissions => $_getList(7);
}

class QrLoginParam extends $pb.GeneratedMessage {
  factory QrLoginParam({
    $core.String? conversationId,
  }) {
    final result = create();
    if (conversationId != null) result.conversationId = conversationId;
    return result;
  }

  QrLoginParam._();

  factory QrLoginParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QrLoginParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QrLoginParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'conversationId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QrLoginParam clone() => QrLoginParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QrLoginParam copyWith(void Function(QrLoginParam) updates) =>
      super.copyWith((message) => updates(message as QrLoginParam))
          as QrLoginParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QrLoginParam create() => QrLoginParam._();
  @$core.override
  QrLoginParam createEmptyInstance() => create();
  static $pb.PbList<QrLoginParam> createRepeated() =>
      $pb.PbList<QrLoginParam>();
  @$core.pragma('dart2js:noInline')
  static QrLoginParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QrLoginParam>(create);
  static QrLoginParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get conversationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set conversationId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasConversationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearConversationId() => $_clearField(1);
}

class RefreshTokenParam extends $pb.GeneratedMessage {
  factory RefreshTokenParam({
    $core.String? did,
    $core.String? refreshToken,
    $core.String? appName,
    $core.String? mac,
    $core.String? point,
  }) {
    final result = create();
    if (did != null) result.did = did;
    if (refreshToken != null) result.refreshToken = refreshToken;
    if (appName != null) result.appName = appName;
    if (mac != null) result.mac = mac;
    if (point != null) result.point = point;
    return result;
  }

  RefreshTokenParam._();

  factory RefreshTokenParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RefreshTokenParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RefreshTokenParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..aOS(2, _omitFieldNames ? '' : 'refreshToken')
    ..aOS(3, _omitFieldNames ? '' : 'appName')
    ..aOS(4, _omitFieldNames ? '' : 'mac')
    ..aOS(5, _omitFieldNames ? '' : 'point')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RefreshTokenParam clone() => RefreshTokenParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RefreshTokenParam copyWith(void Function(RefreshTokenParam) updates) =>
      super.copyWith((message) => updates(message as RefreshTokenParam))
          as RefreshTokenParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RefreshTokenParam create() => RefreshTokenParam._();
  @$core.override
  RefreshTokenParam createEmptyInstance() => create();
  static $pb.PbList<RefreshTokenParam> createRepeated() =>
      $pb.PbList<RefreshTokenParam>();
  @$core.pragma('dart2js:noInline')
  static RefreshTokenParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RefreshTokenParam>(create);
  static RefreshTokenParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get did => $_getSZ(0);
  @$pb.TagNumber(1)
  set did($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get refreshToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set refreshToken($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRefreshToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearRefreshToken() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get appName => $_getSZ(2);
  @$pb.TagNumber(3)
  set appName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAppName() => $_has(2);
  @$pb.TagNumber(3)
  void clearAppName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get mac => $_getSZ(3);
  @$pb.TagNumber(4)
  set mac($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMac() => $_has(3);
  @$pb.TagNumber(4)
  void clearMac() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get point => $_getSZ(4);
  @$pb.TagNumber(5)
  set point($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPoint() => $_has(4);
  @$pb.TagNumber(5)
  void clearPoint() => $_clearField(5);
}

class RefreshTokenResp extends $pb.GeneratedMessage {
  factory RefreshTokenResp({
    $core.String? did,
    $core.String? token,
    $core.String? refreshToken,
  }) {
    final result = create();
    if (did != null) result.did = did;
    if (token != null) result.token = token;
    if (refreshToken != null) result.refreshToken = refreshToken;
    return result;
  }

  RefreshTokenResp._();

  factory RefreshTokenResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RefreshTokenResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RefreshTokenResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..aOS(2, _omitFieldNames ? '' : 'token')
    ..aOS(3, _omitFieldNames ? '' : 'refreshToken')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RefreshTokenResp clone() => RefreshTokenResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RefreshTokenResp copyWith(void Function(RefreshTokenResp) updates) =>
      super.copyWith((message) => updates(message as RefreshTokenResp))
          as RefreshTokenResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RefreshTokenResp create() => RefreshTokenResp._();
  @$core.override
  RefreshTokenResp createEmptyInstance() => create();
  static $pb.PbList<RefreshTokenResp> createRepeated() =>
      $pb.PbList<RefreshTokenResp>();
  @$core.pragma('dart2js:noInline')
  static RefreshTokenResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RefreshTokenResp>(create);
  static RefreshTokenResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get did => $_getSZ(0);
  @$pb.TagNumber(1)
  set did($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get token => $_getSZ(1);
  @$pb.TagNumber(2)
  set token($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearToken() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get refreshToken => $_getSZ(2);
  @$pb.TagNumber(3)
  set refreshToken($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRefreshToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearRefreshToken() => $_clearField(3);
}

class LoginConversationParam extends $pb.GeneratedMessage {
  factory LoginConversationParam({
    $core.String? appName,
    $core.String? mac,
    $core.String? point,
  }) {
    final result = create();
    if (appName != null) result.appName = appName;
    if (mac != null) result.mac = mac;
    if (point != null) result.point = point;
    return result;
  }

  LoginConversationParam._();

  factory LoginConversationParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LoginConversationParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LoginConversationParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(3, _omitFieldNames ? '' : 'appName')
    ..aOS(4, _omitFieldNames ? '' : 'mac')
    ..aOS(5, _omitFieldNames ? '' : 'point')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginConversationParam clone() =>
      LoginConversationParam()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginConversationParam copyWith(
          void Function(LoginConversationParam) updates) =>
      super.copyWith((message) => updates(message as LoginConversationParam))
          as LoginConversationParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginConversationParam create() => LoginConversationParam._();
  @$core.override
  LoginConversationParam createEmptyInstance() => create();
  static $pb.PbList<LoginConversationParam> createRepeated() =>
      $pb.PbList<LoginConversationParam>();
  @$core.pragma('dart2js:noInline')
  static LoginConversationParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LoginConversationParam>(create);
  static LoginConversationParam? _defaultInstance;

  @$pb.TagNumber(3)
  $core.String get appName => $_getSZ(0);
  @$pb.TagNumber(3)
  set appName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(3)
  $core.bool hasAppName() => $_has(0);
  @$pb.TagNumber(3)
  void clearAppName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get mac => $_getSZ(1);
  @$pb.TagNumber(4)
  set mac($core.String value) => $_setString(1, value);
  @$pb.TagNumber(4)
  $core.bool hasMac() => $_has(1);
  @$pb.TagNumber(4)
  void clearMac() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get point => $_getSZ(2);
  @$pb.TagNumber(5)
  set point($core.String value) => $_setString(2, value);
  @$pb.TagNumber(5)
  $core.bool hasPoint() => $_has(2);
  @$pb.TagNumber(5)
  void clearPoint() => $_clearField(5);
}

class LoginConversationID extends $pb.GeneratedMessage {
  factory LoginConversationID({
    $core.String? id,
  }) {
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  LoginConversationID._();

  factory LoginConversationID.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LoginConversationID.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LoginConversationID',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginConversationID clone() => LoginConversationID()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginConversationID copyWith(void Function(LoginConversationID) updates) =>
      super.copyWith((message) => updates(message as LoginConversationID))
          as LoginConversationID;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginConversationID create() => LoginConversationID._();
  @$core.override
  LoginConversationID createEmptyInstance() => create();
  static $pb.PbList<LoginConversationID> createRepeated() =>
      $pb.PbList<LoginConversationID>();
  @$core.pragma('dart2js:noInline')
  static LoginConversationID getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LoginConversationID>(create);
  static LoginConversationID? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

class LoginConversation extends $pb.GeneratedMessage {
  factory LoginConversation({
    $core.String? reqId,
    $core.String? token,
    $core.String? refreshToken,
    $core.String? appName,
    $core.String? mac,
    $core.String? point,
    $core.String? did,
    $core.String? avatar,
    $core.String? name,
    $core.String? mqttUsername,
    $core.String? mqttClientId,
    $core.String? mqttClientPassword,
    $core.String? email,
    $core.Iterable<$core.String>? permissions,
  }) {
    final result = create();
    if (reqId != null) result.reqId = reqId;
    if (token != null) result.token = token;
    if (refreshToken != null) result.refreshToken = refreshToken;
    if (appName != null) result.appName = appName;
    if (mac != null) result.mac = mac;
    if (point != null) result.point = point;
    if (did != null) result.did = did;
    if (avatar != null) result.avatar = avatar;
    if (name != null) result.name = name;
    if (mqttUsername != null) result.mqttUsername = mqttUsername;
    if (mqttClientId != null) result.mqttClientId = mqttClientId;
    if (mqttClientPassword != null)
      result.mqttClientPassword = mqttClientPassword;
    if (email != null) result.email = email;
    if (permissions != null) result.permissions.addAll(permissions);
    return result;
  }

  LoginConversation._();

  factory LoginConversation.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LoginConversation.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LoginConversation',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'reqId')
    ..aOS(2, _omitFieldNames ? '' : 'token')
    ..aOS(3, _omitFieldNames ? '' : 'refreshToken')
    ..aOS(4, _omitFieldNames ? '' : 'appName')
    ..aOS(5, _omitFieldNames ? '' : 'mac')
    ..aOS(6, _omitFieldNames ? '' : 'point')
    ..aOS(7, _omitFieldNames ? '' : 'did')
    ..aOS(8, _omitFieldNames ? '' : 'avatar')
    ..aOS(9, _omitFieldNames ? '' : 'name')
    ..aOS(10, _omitFieldNames ? '' : 'mqttUsername')
    ..aOS(11, _omitFieldNames ? '' : 'mqttClientId')
    ..aOS(12, _omitFieldNames ? '' : 'mqttClientPassword')
    ..aOS(13, _omitFieldNames ? '' : 'email')
    ..pPS(14, _omitFieldNames ? '' : 'permissions')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginConversation clone() => LoginConversation()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginConversation copyWith(void Function(LoginConversation) updates) =>
      super.copyWith((message) => updates(message as LoginConversation))
          as LoginConversation;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginConversation create() => LoginConversation._();
  @$core.override
  LoginConversation createEmptyInstance() => create();
  static $pb.PbList<LoginConversation> createRepeated() =>
      $pb.PbList<LoginConversation>();
  @$core.pragma('dart2js:noInline')
  static LoginConversation getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LoginConversation>(create);
  static LoginConversation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get reqId => $_getSZ(0);
  @$pb.TagNumber(1)
  set reqId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReqId() => $_has(0);
  @$pb.TagNumber(1)
  void clearReqId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get token => $_getSZ(1);
  @$pb.TagNumber(2)
  set token($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearToken() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get refreshToken => $_getSZ(2);
  @$pb.TagNumber(3)
  set refreshToken($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRefreshToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearRefreshToken() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get appName => $_getSZ(3);
  @$pb.TagNumber(4)
  set appName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAppName() => $_has(3);
  @$pb.TagNumber(4)
  void clearAppName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get mac => $_getSZ(4);
  @$pb.TagNumber(5)
  set mac($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMac() => $_has(4);
  @$pb.TagNumber(5)
  void clearMac() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get point => $_getSZ(5);
  @$pb.TagNumber(6)
  set point($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPoint() => $_has(5);
  @$pb.TagNumber(6)
  void clearPoint() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get did => $_getSZ(6);
  @$pb.TagNumber(7)
  set did($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasDid() => $_has(6);
  @$pb.TagNumber(7)
  void clearDid() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get avatar => $_getSZ(7);
  @$pb.TagNumber(8)
  set avatar($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasAvatar() => $_has(7);
  @$pb.TagNumber(8)
  void clearAvatar() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get name => $_getSZ(8);
  @$pb.TagNumber(9)
  set name($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasName() => $_has(8);
  @$pb.TagNumber(9)
  void clearName() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get mqttUsername => $_getSZ(9);
  @$pb.TagNumber(10)
  set mqttUsername($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasMqttUsername() => $_has(9);
  @$pb.TagNumber(10)
  void clearMqttUsername() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get mqttClientId => $_getSZ(10);
  @$pb.TagNumber(11)
  set mqttClientId($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasMqttClientId() => $_has(10);
  @$pb.TagNumber(11)
  void clearMqttClientId() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get mqttClientPassword => $_getSZ(11);
  @$pb.TagNumber(12)
  set mqttClientPassword($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasMqttClientPassword() => $_has(11);
  @$pb.TagNumber(12)
  void clearMqttClientPassword() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get email => $_getSZ(12);
  @$pb.TagNumber(13)
  set email($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasEmail() => $_has(12);
  @$pb.TagNumber(13)
  void clearEmail() => $_clearField(13);

  @$pb.TagNumber(14)
  $pb.PbList<$core.String> get permissions => $_getList(13);
}

class ClubWebQrLoginData extends $pb.GeneratedMessage {
  factory ClubWebQrLoginData({
    $core.String? did,
    $core.String? cid,
  }) {
    final result = create();
    if (did != null) result.did = did;
    if (cid != null) result.cid = cid;
    return result;
  }

  ClubWebQrLoginData._();

  factory ClubWebQrLoginData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClubWebQrLoginData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClubWebQrLoginData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..aOS(2, _omitFieldNames ? '' : 'cid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClubWebQrLoginData clone() => ClubWebQrLoginData()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClubWebQrLoginData copyWith(void Function(ClubWebQrLoginData) updates) =>
      super.copyWith((message) => updates(message as ClubWebQrLoginData))
          as ClubWebQrLoginData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClubWebQrLoginData create() => ClubWebQrLoginData._();
  @$core.override
  ClubWebQrLoginData createEmptyInstance() => create();
  static $pb.PbList<ClubWebQrLoginData> createRepeated() =>
      $pb.PbList<ClubWebQrLoginData>();
  @$core.pragma('dart2js:noInline')
  static ClubWebQrLoginData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClubWebQrLoginData>(create);
  static ClubWebQrLoginData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get did => $_getSZ(0);
  @$pb.TagNumber(1)
  set did($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get cid => $_getSZ(1);
  @$pb.TagNumber(2)
  set cid($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCid() => $_has(1);
  @$pb.TagNumber(2)
  void clearCid() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
