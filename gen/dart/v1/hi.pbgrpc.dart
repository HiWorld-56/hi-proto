// This is a generated file - do not edit.
//
// Generated from v1/hi.proto.

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

import '../google/protobuf/empty.pb.dart' as $0;
import 'hi.pb.dart' as $1;

export 'hi.pb.dart';

@$pb.GrpcServiceName('hi.Base')
class BaseClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  BaseClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.Empty> queryHealth(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$queryHealth, request, options: options);
  }

  $grpc.ResponseFuture<$1.ListSuperAdminUsersResp> listSuperAdminUsers(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listSuperAdminUsers, request, options: options);
  }

  // method descriptors

  static final _$queryHealth = $grpc.ClientMethod<$0.Empty, $0.Empty>(
      '/hi.Base/QueryHealth',
      ($0.Empty value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
  static final _$listSuperAdminUsers =
      $grpc.ClientMethod<$0.Empty, $1.ListSuperAdminUsersResp>(
          '/hi.Base/ListSuperAdminUsers',
          ($0.Empty value) => value.writeToBuffer(),
          $1.ListSuperAdminUsersResp.fromBuffer);
}

@$pb.GrpcServiceName('hi.Base')
abstract class BaseServiceBase extends $grpc.Service {
  $core.String get $name => 'hi.Base';

  BaseServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.Empty>(
        'QueryHealth',
        queryHealth_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.ListSuperAdminUsersResp>(
        'ListSuperAdminUsers',
        listSuperAdminUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.ListSuperAdminUsersResp value) => value.writeToBuffer()));
  }

  $async.Future<$0.Empty> queryHealth_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return queryHealth($call, await $request);
  }

  $async.Future<$0.Empty> queryHealth($grpc.ServiceCall call, $0.Empty request);

  $async.Future<$1.ListSuperAdminUsersResp> listSuperAdminUsers_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return listSuperAdminUsers($call, await $request);
  }

  $async.Future<$1.ListSuperAdminUsersResp> listSuperAdminUsers(
      $grpc.ServiceCall call, $0.Empty request);
}
