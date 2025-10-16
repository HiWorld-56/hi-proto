// This is a generated file - do not edit.
//
// Generated from v1/club/merchant.proto.

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
import 'merchant.pb.dart' as $1;

export 'merchant.pb.dart';

@$pb.GrpcServiceName('club.Merchant')
class MerchantClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  MerchantClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.MerchantList> getAllMerchant(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getAllMerchant, request, options: options);
  }

  // method descriptors

  static final _$getAllMerchant = $grpc.ClientMethod<$0.Empty, $1.MerchantList>(
      '/club.Merchant/GetAllMerchant',
      ($0.Empty value) => value.writeToBuffer(),
      $1.MerchantList.fromBuffer);
}

@$pb.GrpcServiceName('club.Merchant')
abstract class MerchantServiceBase extends $grpc.Service {
  $core.String get $name => 'club.Merchant';

  MerchantServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.MerchantList>(
        'GetAllMerchant',
        getAllMerchant_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.MerchantList value) => value.writeToBuffer()));
  }

  $async.Future<$1.MerchantList> getAllMerchant_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return getAllMerchant($call, await $request);
  }

  $async.Future<$1.MerchantList> getAllMerchant(
      $grpc.ServiceCall call, $0.Empty request);
}
