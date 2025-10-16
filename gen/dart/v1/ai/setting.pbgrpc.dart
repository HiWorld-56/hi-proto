// This is a generated file - do not edit.
//
// Generated from v1/ai/setting.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/empty.pb.dart' as $1;
import 'setting.pb.dart' as $0;

export 'setting.pb.dart';

/// Token鉴权
@$pb.GrpcServiceName('ai.Setting')
class SettingClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  SettingClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.Empty> editSettings(
    $0.EditSettingsReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$editSettings, request, options: options);
  }

  $grpc.ResponseFuture<$0.EditSettingsReq> getSettings(
    $1.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getSettings, request, options: options);
  }

  // method descriptors

  static final _$editSettings =
      $grpc.ClientMethod<$0.EditSettingsReq, $1.Empty>(
          '/ai.Setting/EditSettings',
          ($0.EditSettingsReq value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$getSettings = $grpc.ClientMethod<$1.Empty, $0.EditSettingsReq>(
      '/ai.Setting/GetSettings',
      ($1.Empty value) => value.writeToBuffer(),
      $0.EditSettingsReq.fromBuffer);
}

@$pb.GrpcServiceName('ai.Setting')
abstract class SettingServiceBase extends $grpc.Service {
  $core.String get $name => 'ai.Setting';

  SettingServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.EditSettingsReq, $1.Empty>(
        'EditSettings',
        editSettings_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EditSettingsReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.EditSettingsReq>(
        'GetSettings',
        getSettings_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.EditSettingsReq value) => value.writeToBuffer()));
  }

  $async.Future<$1.Empty> editSettings_Pre($grpc.ServiceCall $call,
      $async.Future<$0.EditSettingsReq> $request) async {
    return editSettings($call, await $request);
  }

  $async.Future<$1.Empty> editSettings(
      $grpc.ServiceCall call, $0.EditSettingsReq request);

  $async.Future<$0.EditSettingsReq> getSettings_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.Empty> $request) async {
    return getSettings($call, await $request);
  }

  $async.Future<$0.EditSettingsReq> getSettings(
      $grpc.ServiceCall call, $1.Empty request);
}
