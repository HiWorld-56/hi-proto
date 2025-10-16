// This is a generated file - do not edit.
//
// Generated from v1/club/tx/tx.proto.

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

import '../../../google/protobuf/empty.pb.dart' as $1;
import '../../hi.pb.dart' as $2;
import 'tx.pb.dart' as $0;

export 'tx.pb.dart';

@$pb.GrpcServiceName('tx.Tx')
class TxClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  TxClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.GetTxFeeResp> getTxFee(
    $0.GetTxFeeReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getTxFee, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetTxResp> getTx(
    $0.GetTxReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getTx, request, options: options);
  }

  $grpc.ResponseFuture<$0.AddTxResp> addTx(
    $0.AddTxReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$addTx, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> updateOrderTxHash(
    $0.UpdateOrderTxHashReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateOrderTxHash, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetTxListResp> getTxList(
    $0.GetTxListReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getTxList, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetAllTxInfoResp> getAllTxInfo(
    $0.GetAllTxInfoReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getAllTxInfo, request, options: options);
  }

  // method descriptors

  static final _$getTxFee = $grpc.ClientMethod<$0.GetTxFeeReq, $0.GetTxFeeResp>(
      '/tx.Tx/GetTxFee',
      ($0.GetTxFeeReq value) => value.writeToBuffer(),
      $0.GetTxFeeResp.fromBuffer);
  static final _$getTx = $grpc.ClientMethod<$0.GetTxReq, $0.GetTxResp>(
      '/tx.Tx/GetTx',
      ($0.GetTxReq value) => value.writeToBuffer(),
      $0.GetTxResp.fromBuffer);
  static final _$addTx = $grpc.ClientMethod<$0.AddTxReq, $0.AddTxResp>(
      '/tx.Tx/AddTx',
      ($0.AddTxReq value) => value.writeToBuffer(),
      $0.AddTxResp.fromBuffer);
  static final _$updateOrderTxHash =
      $grpc.ClientMethod<$0.UpdateOrderTxHashReq, $1.Empty>(
          '/tx.Tx/UpdateOrderTxHash',
          ($0.UpdateOrderTxHashReq value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$getTxList =
      $grpc.ClientMethod<$0.GetTxListReq, $0.GetTxListResp>(
          '/tx.Tx/GetTxList',
          ($0.GetTxListReq value) => value.writeToBuffer(),
          $0.GetTxListResp.fromBuffer);
  static final _$getAllTxInfo =
      $grpc.ClientMethod<$0.GetAllTxInfoReq, $0.GetAllTxInfoResp>(
          '/tx.Tx/GetAllTxInfo',
          ($0.GetAllTxInfoReq value) => value.writeToBuffer(),
          $0.GetAllTxInfoResp.fromBuffer);
}

@$pb.GrpcServiceName('tx.Tx')
abstract class TxServiceBase extends $grpc.Service {
  $core.String get $name => 'tx.Tx';

  TxServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetTxFeeReq, $0.GetTxFeeResp>(
        'GetTxFee',
        getTxFee_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetTxFeeReq.fromBuffer(value),
        ($0.GetTxFeeResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetTxReq, $0.GetTxResp>(
        'GetTx',
        getTx_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetTxReq.fromBuffer(value),
        ($0.GetTxResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AddTxReq, $0.AddTxResp>(
        'AddTx',
        addTx_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddTxReq.fromBuffer(value),
        ($0.AddTxResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateOrderTxHashReq, $1.Empty>(
        'UpdateOrderTxHash',
        updateOrderTxHash_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdateOrderTxHashReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetTxListReq, $0.GetTxListResp>(
        'GetTxList',
        getTxList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetTxListReq.fromBuffer(value),
        ($0.GetTxListResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetAllTxInfoReq, $0.GetAllTxInfoResp>(
        'GetAllTxInfo',
        getAllTxInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetAllTxInfoReq.fromBuffer(value),
        ($0.GetAllTxInfoResp value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetTxFeeResp> getTxFee_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.GetTxFeeReq> $request) async {
    return getTxFee($call, await $request);
  }

  $async.Future<$0.GetTxFeeResp> getTxFee(
      $grpc.ServiceCall call, $0.GetTxFeeReq request);

  $async.Future<$0.GetTxResp> getTx_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.GetTxReq> $request) async {
    return getTx($call, await $request);
  }

  $async.Future<$0.GetTxResp> getTx(
      $grpc.ServiceCall call, $0.GetTxReq request);

  $async.Future<$0.AddTxResp> addTx_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.AddTxReq> $request) async {
    return addTx($call, await $request);
  }

  $async.Future<$0.AddTxResp> addTx(
      $grpc.ServiceCall call, $0.AddTxReq request);

  $async.Future<$1.Empty> updateOrderTxHash_Pre($grpc.ServiceCall $call,
      $async.Future<$0.UpdateOrderTxHashReq> $request) async {
    return updateOrderTxHash($call, await $request);
  }

  $async.Future<$1.Empty> updateOrderTxHash(
      $grpc.ServiceCall call, $0.UpdateOrderTxHashReq request);

  $async.Future<$0.GetTxListResp> getTxList_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.GetTxListReq> $request) async {
    return getTxList($call, await $request);
  }

  $async.Future<$0.GetTxListResp> getTxList(
      $grpc.ServiceCall call, $0.GetTxListReq request);

  $async.Future<$0.GetAllTxInfoResp> getAllTxInfo_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetAllTxInfoReq> $request) async {
    return getAllTxInfo($call, await $request);
  }

  $async.Future<$0.GetAllTxInfoResp> getAllTxInfo(
      $grpc.ServiceCall call, $0.GetAllTxInfoReq request);
}

@$pb.GrpcServiceName('tx.Order')
class OrderClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  OrderClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.GetNotPulledPcOrdersResp> getNotPulledPcOrders(
    $2.Web3Data request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getNotPulledPcOrders, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> updatePulledPcOrders(
    $2.Web3Data request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updatePulledPcOrders, request, options: options);
  }

  // method descriptors

  static final _$getNotPulledPcOrders =
      $grpc.ClientMethod<$2.Web3Data, $0.GetNotPulledPcOrdersResp>(
          '/tx.Order/GetNotPulledPcOrders',
          ($2.Web3Data value) => value.writeToBuffer(),
          $0.GetNotPulledPcOrdersResp.fromBuffer);
  static final _$updatePulledPcOrders =
      $grpc.ClientMethod<$2.Web3Data, $1.Empty>(
          '/tx.Order/UpdatePulledPcOrders',
          ($2.Web3Data value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
}

@$pb.GrpcServiceName('tx.Order')
abstract class OrderServiceBase extends $grpc.Service {
  $core.String get $name => 'tx.Order';

  OrderServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.Web3Data, $0.GetNotPulledPcOrdersResp>(
        'GetNotPulledPcOrders',
        getNotPulledPcOrders_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Web3Data.fromBuffer(value),
        ($0.GetNotPulledPcOrdersResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Web3Data, $1.Empty>(
        'UpdatePulledPcOrders',
        updatePulledPcOrders_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Web3Data.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetNotPulledPcOrdersResp> getNotPulledPcOrders_Pre(
      $grpc.ServiceCall $call, $async.Future<$2.Web3Data> $request) async {
    return getNotPulledPcOrders($call, await $request);
  }

  $async.Future<$0.GetNotPulledPcOrdersResp> getNotPulledPcOrders(
      $grpc.ServiceCall call, $2.Web3Data request);

  $async.Future<$1.Empty> updatePulledPcOrders_Pre(
      $grpc.ServiceCall $call, $async.Future<$2.Web3Data> $request) async {
    return updatePulledPcOrders($call, await $request);
  }

  $async.Future<$1.Empty> updatePulledPcOrders(
      $grpc.ServiceCall call, $2.Web3Data request);
}
