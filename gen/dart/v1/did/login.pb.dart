// This is a generated file - do not edit.
//
// Generated from v1/did/login.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../hi.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// hidid web/app/pc登录
class LoginReq extends $pb.GeneratedMessage {
  factory LoginReq({
    $0.Node? node,
    $0.ReqID? reqId,
  }) {
    final result = create();
    if (node != null) result.node = node;
    if (reqId != null) result.reqId = reqId;
    return result;
  }

  LoginReq._();

  factory LoginReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LoginReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LoginReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..aOM<$0.Node>(1, _omitFieldNames ? '' : 'node', subBuilder: $0.Node.create)
    ..aOM<$0.ReqID>(2, _omitFieldNames ? '' : 'reqId',
        subBuilder: $0.ReqID.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginReq clone() => LoginReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginReq copyWith(void Function(LoginReq) updates) =>
      super.copyWith((message) => updates(message as LoginReq)) as LoginReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginReq create() => LoginReq._();
  @$core.override
  LoginReq createEmptyInstance() => create();
  static $pb.PbList<LoginReq> createRepeated() => $pb.PbList<LoginReq>();
  @$core.pragma('dart2js:noInline')
  static LoginReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginReq>(create);
  static LoginReq? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Node get node => $_getN(0);
  @$pb.TagNumber(1)
  set node($0.Node value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasNode() => $_has(0);
  @$pb.TagNumber(1)
  void clearNode() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.Node ensureNode() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.ReqID get reqId => $_getN(1);
  @$pb.TagNumber(2)
  set reqId($0.ReqID value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasReqId() => $_has(1);
  @$pb.TagNumber(2)
  void clearReqId() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.ReqID ensureReqId() => $_ensure(1);
}

class LoginResp extends $pb.GeneratedMessage {
  factory LoginResp({
    $0.Unit? user,
    $0.Token? token,
    $0.Mqtt? mqtt,
  }) {
    final result = create();
    if (user != null) result.user = user;
    if (token != null) result.token = token;
    if (mqtt != null) result.mqtt = mqtt;
    return result;
  }

  LoginResp._();

  factory LoginResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LoginResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LoginResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..aOM<$0.Unit>(1, _omitFieldNames ? '' : 'user', subBuilder: $0.Unit.create)
    ..aOM<$0.Token>(2, _omitFieldNames ? '' : 'token',
        subBuilder: $0.Token.create)
    ..aOM<$0.Mqtt>(3, _omitFieldNames ? '' : 'mqtt', subBuilder: $0.Mqtt.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginResp clone() => LoginResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginResp copyWith(void Function(LoginResp) updates) =>
      super.copyWith((message) => updates(message as LoginResp)) as LoginResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginResp create() => LoginResp._();
  @$core.override
  LoginResp createEmptyInstance() => create();
  static $pb.PbList<LoginResp> createRepeated() => $pb.PbList<LoginResp>();
  @$core.pragma('dart2js:noInline')
  static LoginResp getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginResp>(create);
  static LoginResp? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Unit get user => $_getN(0);
  @$pb.TagNumber(1)
  set user($0.Unit value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.Unit ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.Token get token => $_getN(1);
  @$pb.TagNumber(2)
  set token($0.Token value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearToken() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Token ensureToken() => $_ensure(1);

  @$pb.TagNumber(3)
  $0.Mqtt get mqtt => $_getN(2);
  @$pb.TagNumber(3)
  set mqtt($0.Mqtt value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasMqtt() => $_has(2);
  @$pb.TagNumber(3)
  void clearMqtt() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.Mqtt ensureMqtt() => $_ensure(2);
}

class ReqStatusResp extends $pb.GeneratedMessage {
  factory ReqStatusResp({
    $core.String? status,
  }) {
    final result = create();
    if (status != null) result.status = status;
    return result;
  }

  ReqStatusResp._();

  factory ReqStatusResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReqStatusResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReqStatusResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReqStatusResp clone() => ReqStatusResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReqStatusResp copyWith(void Function(ReqStatusResp) updates) =>
      super.copyWith((message) => updates(message as ReqStatusResp))
          as ReqStatusResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqStatusResp create() => ReqStatusResp._();
  @$core.override
  ReqStatusResp createEmptyInstance() => create();
  static $pb.PbList<ReqStatusResp> createRepeated() =>
      $pb.PbList<ReqStatusResp>();
  @$core.pragma('dart2js:noInline')
  static ReqStatusResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReqStatusResp>(create);
  static ReqStatusResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
