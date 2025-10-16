// This is a generated file - do not edit.
//
// Generated from v1/club/health.proto.

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

import '../../google/protobuf/empty.pb.dart' as $0;
import 'health.pb.dart' as $1;

export 'health.pb.dart';

@$pb.GrpcServiceName('club.Health')
class HealthClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  HealthClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.HealthStatus> checkHealth(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$checkHealth, request, options: options);
  }

  // method descriptors

  static final _$checkHealth = $grpc.ClientMethod<$0.Empty, $1.HealthStatus>(
      '/club.Health/CheckHealth',
      ($0.Empty value) => value.writeToBuffer(),
      $1.HealthStatus.fromBuffer);
}

@$pb.GrpcServiceName('club.Health')
abstract class HealthServiceBase extends $grpc.Service {
  $core.String get $name => 'club.Health';

  HealthServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.HealthStatus>(
        'CheckHealth',
        checkHealth_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.HealthStatus value) => value.writeToBuffer()));
  }

  $async.Future<$1.HealthStatus> checkHealth_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return checkHealth($call, await $request);
  }

  $async.Future<$1.HealthStatus> checkHealth(
      $grpc.ServiceCall call, $0.Empty request);
}
