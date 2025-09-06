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

import '../did/login.pb.dart' as $2;
import '../hi.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class LoginResp extends $pb.GeneratedMessage {
  factory LoginResp({
    $2.LoginResp? base,
    $0.Unit? master,
    $core.Iterable<$core.String>? permissions,
  }) {
    final result = create();
    if (base != null) result.base = base;
    if (master != null) result.master = master;
    if (permissions != null) result.permissions.addAll(permissions);
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOM<$2.LoginResp>(1, _omitFieldNames ? '' : 'base',
        subBuilder: $2.LoginResp.create)
    ..aOM<$0.Unit>(2, _omitFieldNames ? '' : 'master',
        subBuilder: $0.Unit.create)
    ..pPS(3, _omitFieldNames ? '' : 'permissions')
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
  $2.LoginResp get base => $_getN(0);
  @$pb.TagNumber(1)
  set base($2.LoginResp value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => $_clearField(1);
  @$pb.TagNumber(1)
  $2.LoginResp ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.Unit get master => $_getN(1);
  @$pb.TagNumber(2)
  set master($0.Unit value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasMaster() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaster() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Unit ensureMaster() => $_ensure(1);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get permissions => $_getList(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
