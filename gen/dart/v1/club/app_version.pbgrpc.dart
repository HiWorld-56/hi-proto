// This is a generated file - do not edit.
//
// Generated from v1/club/app_version.proto.

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

import 'app_version.pb.dart' as $0;

export 'app_version.pb.dart';

/// 为了兼容前端，暂时使用
@$pb.GrpcServiceName('club.AppVersion')
class AppVersionClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  AppVersionClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.AppVersionInfo> getAppLastetVersion(
    $0.AppVersionParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getAppLastetVersion, request, options: options);
  }

  // method descriptors

  static final _$getAppLastetVersion =
      $grpc.ClientMethod<$0.AppVersionParam, $0.AppVersionInfo>(
          '/club.AppVersion/GetAppLastetVersion',
          ($0.AppVersionParam value) => value.writeToBuffer(),
          $0.AppVersionInfo.fromBuffer);
}

@$pb.GrpcServiceName('club.AppVersion')
abstract class AppVersionServiceBase extends $grpc.Service {
  $core.String get $name => 'club.AppVersion';

  AppVersionServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.AppVersionParam, $0.AppVersionInfo>(
        'GetAppLastetVersion',
        getAppLastetVersion_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AppVersionParam.fromBuffer(value),
        ($0.AppVersionInfo value) => value.writeToBuffer()));
  }

  $async.Future<$0.AppVersionInfo> getAppLastetVersion_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.AppVersionParam> $request) async {
    return getAppLastetVersion($call, await $request);
  }

  $async.Future<$0.AppVersionInfo> getAppLastetVersion(
      $grpc.ServiceCall call, $0.AppVersionParam request);
}
