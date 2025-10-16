// This is a generated file - do not edit.
//
// Generated from v1/pay_callback.proto.

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

import '../google/protobuf/empty.pb.dart' as $1;
import 'hi.pb.dart' as $0;

export 'pay_callback.pb.dart';

/// 三方app/web支付回调
@$pb.GrpcServiceName('hi.PayCallback')
class PayCallbackClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  PayCallbackClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.Empty> pay(
    $0.Web3Data request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$pay, request, options: options);
  }

  // method descriptors

  static final _$pay = $grpc.ClientMethod<$0.Web3Data, $1.Empty>(
      '/hi.PayCallback/Pay',
      ($0.Web3Data value) => value.writeToBuffer(),
      $1.Empty.fromBuffer);
}

@$pb.GrpcServiceName('hi.PayCallback')
abstract class PayCallbackServiceBase extends $grpc.Service {
  $core.String get $name => 'hi.PayCallback';

  PayCallbackServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Web3Data, $1.Empty>(
        'Pay',
        pay_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Web3Data.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$1.Empty> pay_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Web3Data> $request) async {
    return pay($call, await $request);
  }

  $async.Future<$1.Empty> pay($grpc.ServiceCall call, $0.Web3Data request);
}
