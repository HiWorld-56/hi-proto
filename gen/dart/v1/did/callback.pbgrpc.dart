// This is a generated file - do not edit.
//
// Generated from v1/did/callback.proto.

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
import '../hi.pb.dart' as $0;

export 'callback.pb.dart';

@$pb.GrpcServiceName('did.Callback')
class CallbackClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  CallbackClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.Empty> login(
    $0.Web3Data request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> pay(
    $0.Web3Data request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$pay, request, options: options);
  }

  // method descriptors

  static final _$login = $grpc.ClientMethod<$0.Web3Data, $1.Empty>(
      '/did.Callback/Login',
      ($0.Web3Data value) => value.writeToBuffer(),
      $1.Empty.fromBuffer);
  static final _$pay = $grpc.ClientMethod<$0.Web3Data, $1.Empty>(
      '/did.Callback/Pay',
      ($0.Web3Data value) => value.writeToBuffer(),
      $1.Empty.fromBuffer);
}

@$pb.GrpcServiceName('did.Callback')
abstract class CallbackServiceBase extends $grpc.Service {
  $core.String get $name => 'did.Callback';

  CallbackServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Web3Data, $1.Empty>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Web3Data.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Web3Data, $1.Empty>(
        'Pay',
        pay_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Web3Data.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$1.Empty> login_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Web3Data> $request) async {
    return login($call, await $request);
  }

  $async.Future<$1.Empty> login($grpc.ServiceCall call, $0.Web3Data request);

  $async.Future<$1.Empty> pay_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Web3Data> $request) async {
    return pay($call, await $request);
  }

  $async.Future<$1.Empty> pay($grpc.ServiceCall call, $0.Web3Data request);
}
