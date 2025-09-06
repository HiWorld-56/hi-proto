// This is a generated file - do not edit.
//
// Generated from v1/did/merchant.proto.

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
import '../hi.pb.dart' as $2;
import 'merchant.pb.dart' as $1;

export 'merchant.pb.dart';

@$pb.GrpcServiceName('did.Merchant')
class MerchantClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  MerchantClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.MerchantGetResp> get(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$get, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> set(
    $1.MerchantSetReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$set, request, options: options);
  }

  $grpc.ResponseFuture<$1.MerchantListResp> list(
    $2.DID request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$list, request, options: options);
  }

  // method descriptors

  static final _$get = $grpc.ClientMethod<$0.Empty, $1.MerchantGetResp>(
      '/did.Merchant/Get',
      ($0.Empty value) => value.writeToBuffer(),
      $1.MerchantGetResp.fromBuffer);
  static final _$set = $grpc.ClientMethod<$1.MerchantSetReq, $0.Empty>(
      '/did.Merchant/Set',
      ($1.MerchantSetReq value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
  static final _$list = $grpc.ClientMethod<$2.DID, $1.MerchantListResp>(
      '/did.Merchant/List',
      ($2.DID value) => value.writeToBuffer(),
      $1.MerchantListResp.fromBuffer);
}

@$pb.GrpcServiceName('did.Merchant')
abstract class MerchantServiceBase extends $grpc.Service {
  $core.String get $name => 'did.Merchant';

  MerchantServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.MerchantGetResp>(
        'Get',
        get_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.MerchantGetResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.MerchantSetReq, $0.Empty>(
        'Set',
        set_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.MerchantSetReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.DID, $1.MerchantListResp>(
        'List',
        list_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.DID.fromBuffer(value),
        ($1.MerchantListResp value) => value.writeToBuffer()));
  }

  $async.Future<$1.MerchantGetResp> get_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return get($call, await $request);
  }

  $async.Future<$1.MerchantGetResp> get(
      $grpc.ServiceCall call, $0.Empty request);

  $async.Future<$0.Empty> set_Pre($grpc.ServiceCall $call,
      $async.Future<$1.MerchantSetReq> $request) async {
    return set($call, await $request);
  }

  $async.Future<$0.Empty> set(
      $grpc.ServiceCall call, $1.MerchantSetReq request);

  $async.Future<$1.MerchantListResp> list_Pre(
      $grpc.ServiceCall $call, $async.Future<$2.DID> $request) async {
    return list($call, await $request);
  }

  $async.Future<$1.MerchantListResp> list(
      $grpc.ServiceCall call, $2.DID request);
}

@$pb.GrpcServiceName('did.SSE')
class SSEClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  SSEClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.Empty> notify(
    $1.MerchantNotifyReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$notify, request, options: options);
  }

  // method descriptors

  static final _$notify = $grpc.ClientMethod<$1.MerchantNotifyReq, $0.Empty>(
      '/did.SSE/Notify',
      ($1.MerchantNotifyReq value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
}

@$pb.GrpcServiceName('did.SSE')
abstract class SSEServiceBase extends $grpc.Service {
  $core.String get $name => 'did.SSE';

  SSEServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.MerchantNotifyReq, $0.Empty>(
        'Notify',
        notify_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.MerchantNotifyReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$0.Empty> notify_Pre($grpc.ServiceCall $call,
      $async.Future<$1.MerchantNotifyReq> $request) async {
    return notify($call, await $request);
  }

  $async.Future<$0.Empty> notify(
      $grpc.ServiceCall call, $1.MerchantNotifyReq request);
}
