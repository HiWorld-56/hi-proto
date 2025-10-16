// This is a generated file - do not edit.
//
// Generated from v1/did/pay.proto.

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

export 'pay.pb.dart';

@$pb.GrpcServiceName('did.Pay')
class PayClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  PayClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.ReqID> generateReq(
    $0.Node request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$generateReq, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> notify(
    $0.Web3Data request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$notify, request, options: options);
  }

  // method descriptors

  static final _$generateReq = $grpc.ClientMethod<$0.Node, $0.ReqID>(
      '/did.Pay/GenerateReq',
      ($0.Node value) => value.writeToBuffer(),
      $0.ReqID.fromBuffer);
  static final _$notify = $grpc.ClientMethod<$0.Web3Data, $1.Empty>(
      '/did.Pay/Notify',
      ($0.Web3Data value) => value.writeToBuffer(),
      $1.Empty.fromBuffer);
}

@$pb.GrpcServiceName('did.Pay')
abstract class PayServiceBase extends $grpc.Service {
  $core.String get $name => 'did.Pay';

  PayServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Node, $0.ReqID>(
        'GenerateReq',
        generateReq_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Node.fromBuffer(value),
        ($0.ReqID value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Web3Data, $1.Empty>(
        'Notify',
        notify_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Web3Data.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$0.ReqID> generateReq_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Node> $request) async {
    return generateReq($call, await $request);
  }

  $async.Future<$0.ReqID> generateReq($grpc.ServiceCall call, $0.Node request);

  $async.Future<$1.Empty> notify_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Web3Data> $request) async {
    return notify($call, await $request);
  }

  $async.Future<$1.Empty> notify($grpc.ServiceCall call, $0.Web3Data request);
}
