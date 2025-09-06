// This is a generated file - do not edit.
//
// Generated from v1/did/price.proto.

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

import 'price.pb.dart' as $0;

export 'price.pb.dart';

@$pb.GrpcServiceName('did.Price')
class PriceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  PriceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.GetPriceResp> getPrice(
    $0.GetPriceReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getPrice, request, options: options);
  }

  // method descriptors

  static final _$getPrice = $grpc.ClientMethod<$0.GetPriceReq, $0.GetPriceResp>(
      '/did.Price/GetPrice',
      ($0.GetPriceReq value) => value.writeToBuffer(),
      $0.GetPriceResp.fromBuffer);
}

@$pb.GrpcServiceName('did.Price')
abstract class PriceServiceBase extends $grpc.Service {
  $core.String get $name => 'did.Price';

  PriceServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetPriceReq, $0.GetPriceResp>(
        'GetPrice',
        getPrice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetPriceReq.fromBuffer(value),
        ($0.GetPriceResp value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetPriceResp> getPrice_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.GetPriceReq> $request) async {
    return getPrice($call, await $request);
  }

  $async.Future<$0.GetPriceResp> getPrice(
      $grpc.ServiceCall call, $0.GetPriceReq request);
}
