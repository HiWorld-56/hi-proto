// This is a generated file - do not edit.
//
// Generated from v1/app_version.proto.

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

@$pb.GrpcServiceName('hi.AppVersion')
class AppVersionClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  AppVersionClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.LastetVersionResp> lastetVersion(
    $0.LastetVersionReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$lastetVersion, request, options: options);
  }

  // method descriptors

  static final _$lastetVersion =
      $grpc.ClientMethod<$0.LastetVersionReq, $0.LastetVersionResp>(
          '/hi.AppVersion/LastetVersion',
          ($0.LastetVersionReq value) => value.writeToBuffer(),
          $0.LastetVersionResp.fromBuffer);
}

@$pb.GrpcServiceName('hi.AppVersion')
abstract class AppVersionServiceBase extends $grpc.Service {
  $core.String get $name => 'hi.AppVersion';

  AppVersionServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.LastetVersionReq, $0.LastetVersionResp>(
        'LastetVersion',
        lastetVersion_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LastetVersionReq.fromBuffer(value),
        ($0.LastetVersionResp value) => value.writeToBuffer()));
  }

  $async.Future<$0.LastetVersionResp> lastetVersion_Pre($grpc.ServiceCall $call,
      $async.Future<$0.LastetVersionReq> $request) async {
    return lastetVersion($call, await $request);
  }

  $async.Future<$0.LastetVersionResp> lastetVersion(
      $grpc.ServiceCall call, $0.LastetVersionReq request);
}
