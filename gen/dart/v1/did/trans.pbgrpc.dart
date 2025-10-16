// This is a generated file - do not edit.
//
// Generated from v1/did/trans.proto.

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

import 'trans.pb.dart' as $0;

export 'trans.pb.dart';

@$pb.GrpcServiceName('did.Transaction')
class TransactionClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  TransactionClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.ListTransactionsResp> listTransactions(
    $0.ListTransactionsReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listTransactions, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetTransactionDetailResp> getTransactionDetail(
    $0.GetTransactionDetailReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getTransactionDetail, request, options: options);
  }

  // method descriptors

  static final _$listTransactions =
      $grpc.ClientMethod<$0.ListTransactionsReq, $0.ListTransactionsResp>(
          '/did.Transaction/ListTransactions',
          ($0.ListTransactionsReq value) => value.writeToBuffer(),
          $0.ListTransactionsResp.fromBuffer);
  static final _$getTransactionDetail = $grpc.ClientMethod<
          $0.GetTransactionDetailReq, $0.GetTransactionDetailResp>(
      '/did.Transaction/GetTransactionDetail',
      ($0.GetTransactionDetailReq value) => value.writeToBuffer(),
      $0.GetTransactionDetailResp.fromBuffer);
}

@$pb.GrpcServiceName('did.Transaction')
abstract class TransactionServiceBase extends $grpc.Service {
  $core.String get $name => 'did.Transaction';

  TransactionServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.ListTransactionsReq, $0.ListTransactionsResp>(
            'ListTransactions',
            listTransactions_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ListTransactionsReq.fromBuffer(value),
            ($0.ListTransactionsResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetTransactionDetailReq,
            $0.GetTransactionDetailResp>(
        'GetTransactionDetail',
        getTransactionDetail_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetTransactionDetailReq.fromBuffer(value),
        ($0.GetTransactionDetailResp value) => value.writeToBuffer()));
  }

  $async.Future<$0.ListTransactionsResp> listTransactions_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListTransactionsReq> $request) async {
    return listTransactions($call, await $request);
  }

  $async.Future<$0.ListTransactionsResp> listTransactions(
      $grpc.ServiceCall call, $0.ListTransactionsReq request);

  $async.Future<$0.GetTransactionDetailResp> getTransactionDetail_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetTransactionDetailReq> $request) async {
    return getTransactionDetail($call, await $request);
  }

  $async.Future<$0.GetTransactionDetailResp> getTransactionDetail(
      $grpc.ServiceCall call, $0.GetTransactionDetailReq request);
}
