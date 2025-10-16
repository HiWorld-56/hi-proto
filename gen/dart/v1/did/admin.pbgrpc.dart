// This is a generated file - do not edit.
//
// Generated from v1/did/admin.proto.

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
import 'admin.pb.dart' as $1;

export 'admin.pb.dart';

@$pb.GrpcServiceName('did.InviteCode')
class InviteCodeClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  InviteCodeClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.InviteCodeCreateResp> create(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$create, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> edit(
    $1.InviteCodeEditReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$edit, request, options: options);
  }

  $grpc.ResponseFuture<$1.InviteCodeListResp> list(
    $2.Pagination request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$list, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> delete(
    $1.InviteCodeDeleteReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$delete, request, options: options);
  }

  $grpc.ResponseFuture<$2.Token> verify(
    $1.InviteCodeVerifyReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$verify, request, options: options);
  }

  // method descriptors

  static final _$create = $grpc.ClientMethod<$0.Empty, $1.InviteCodeCreateResp>(
      '/did.InviteCode/Create',
      ($0.Empty value) => value.writeToBuffer(),
      $1.InviteCodeCreateResp.fromBuffer);
  static final _$edit = $grpc.ClientMethod<$1.InviteCodeEditReq, $0.Empty>(
      '/did.InviteCode/Edit',
      ($1.InviteCodeEditReq value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
  static final _$list =
      $grpc.ClientMethod<$2.Pagination, $1.InviteCodeListResp>(
          '/did.InviteCode/List',
          ($2.Pagination value) => value.writeToBuffer(),
          $1.InviteCodeListResp.fromBuffer);
  static final _$delete = $grpc.ClientMethod<$1.InviteCodeDeleteReq, $0.Empty>(
      '/did.InviteCode/Delete',
      ($1.InviteCodeDeleteReq value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
  static final _$verify = $grpc.ClientMethod<$1.InviteCodeVerifyReq, $2.Token>(
      '/did.InviteCode/Verify',
      ($1.InviteCodeVerifyReq value) => value.writeToBuffer(),
      $2.Token.fromBuffer);
}

@$pb.GrpcServiceName('did.InviteCode')
abstract class InviteCodeServiceBase extends $grpc.Service {
  $core.String get $name => 'did.InviteCode';

  InviteCodeServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.InviteCodeCreateResp>(
        'Create',
        create_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.InviteCodeCreateResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.InviteCodeEditReq, $0.Empty>(
        'Edit',
        edit_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.InviteCodeEditReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Pagination, $1.InviteCodeListResp>(
        'List',
        list_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Pagination.fromBuffer(value),
        ($1.InviteCodeListResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.InviteCodeDeleteReq, $0.Empty>(
        'Delete',
        delete_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.InviteCodeDeleteReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.InviteCodeVerifyReq, $2.Token>(
        'Verify',
        verify_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.InviteCodeVerifyReq.fromBuffer(value),
        ($2.Token value) => value.writeToBuffer()));
  }

  $async.Future<$1.InviteCodeCreateResp> create_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return create($call, await $request);
  }

  $async.Future<$1.InviteCodeCreateResp> create(
      $grpc.ServiceCall call, $0.Empty request);

  $async.Future<$0.Empty> edit_Pre($grpc.ServiceCall $call,
      $async.Future<$1.InviteCodeEditReq> $request) async {
    return edit($call, await $request);
  }

  $async.Future<$0.Empty> edit(
      $grpc.ServiceCall call, $1.InviteCodeEditReq request);

  $async.Future<$1.InviteCodeListResp> list_Pre(
      $grpc.ServiceCall $call, $async.Future<$2.Pagination> $request) async {
    return list($call, await $request);
  }

  $async.Future<$1.InviteCodeListResp> list(
      $grpc.ServiceCall call, $2.Pagination request);

  $async.Future<$0.Empty> delete_Pre($grpc.ServiceCall $call,
      $async.Future<$1.InviteCodeDeleteReq> $request) async {
    return delete($call, await $request);
  }

  $async.Future<$0.Empty> delete(
      $grpc.ServiceCall call, $1.InviteCodeDeleteReq request);

  $async.Future<$2.Token> verify_Pre($grpc.ServiceCall $call,
      $async.Future<$1.InviteCodeVerifyReq> $request) async {
    return verify($call, await $request);
  }

  $async.Future<$2.Token> verify(
      $grpc.ServiceCall call, $1.InviteCodeVerifyReq request);
}

@$pb.GrpcServiceName('did.DApp')
class DAppClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  DAppClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.DAppListByClassResp> listByClass(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listByClass, request, options: options);
  }

  $grpc.ResponseFuture<$1.DAppGetRWAResp> getRWA(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getRWA, request, options: options);
  }

  $grpc.ResponseFuture<$1.DAppInfo> getTop(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getTop, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> updateTop(
    $1.DAppUpdateTopReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateTop, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> create(
    $1.DAppInfo request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$create, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> edit(
    $1.DAppEntity request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$edit, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> updateOrder(
    $1.DAppUpdateOrderReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateOrder, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> delete(
    $1.DAppDeleteReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$delete, request, options: options);
  }

  // method descriptors

  static final _$listByClass =
      $grpc.ClientMethod<$0.Empty, $1.DAppListByClassResp>(
          '/did.DApp/ListByClass',
          ($0.Empty value) => value.writeToBuffer(),
          $1.DAppListByClassResp.fromBuffer);
  static final _$getRWA = $grpc.ClientMethod<$0.Empty, $1.DAppGetRWAResp>(
      '/did.DApp/GetRWA',
      ($0.Empty value) => value.writeToBuffer(),
      $1.DAppGetRWAResp.fromBuffer);
  static final _$getTop = $grpc.ClientMethod<$0.Empty, $1.DAppInfo>(
      '/did.DApp/GetTop',
      ($0.Empty value) => value.writeToBuffer(),
      $1.DAppInfo.fromBuffer);
  static final _$updateTop = $grpc.ClientMethod<$1.DAppUpdateTopReq, $0.Empty>(
      '/did.DApp/UpdateTop',
      ($1.DAppUpdateTopReq value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
  static final _$create = $grpc.ClientMethod<$1.DAppInfo, $0.Empty>(
      '/did.DApp/Create',
      ($1.DAppInfo value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
  static final _$edit = $grpc.ClientMethod<$1.DAppEntity, $0.Empty>(
      '/did.DApp/Edit',
      ($1.DAppEntity value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
  static final _$updateOrder =
      $grpc.ClientMethod<$1.DAppUpdateOrderReq, $0.Empty>(
          '/did.DApp/UpdateOrder',
          ($1.DAppUpdateOrderReq value) => value.writeToBuffer(),
          $0.Empty.fromBuffer);
  static final _$delete = $grpc.ClientMethod<$1.DAppDeleteReq, $0.Empty>(
      '/did.DApp/Delete',
      ($1.DAppDeleteReq value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
}

@$pb.GrpcServiceName('did.DApp')
abstract class DAppServiceBase extends $grpc.Service {
  $core.String get $name => 'did.DApp';

  DAppServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.DAppListByClassResp>(
        'ListByClass',
        listByClass_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.DAppListByClassResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.DAppGetRWAResp>(
        'GetRWA',
        getRWA_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.DAppGetRWAResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.DAppInfo>(
        'GetTop',
        getTop_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.DAppInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.DAppUpdateTopReq, $0.Empty>(
        'UpdateTop',
        updateTop_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.DAppUpdateTopReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.DAppInfo, $0.Empty>(
        'Create',
        create_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.DAppInfo.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.DAppEntity, $0.Empty>(
        'Edit',
        edit_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.DAppEntity.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.DAppUpdateOrderReq, $0.Empty>(
        'UpdateOrder',
        updateOrder_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.DAppUpdateOrderReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.DAppDeleteReq, $0.Empty>(
        'Delete',
        delete_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.DAppDeleteReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$1.DAppListByClassResp> listByClass_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return listByClass($call, await $request);
  }

  $async.Future<$1.DAppListByClassResp> listByClass(
      $grpc.ServiceCall call, $0.Empty request);

  $async.Future<$1.DAppGetRWAResp> getRWA_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return getRWA($call, await $request);
  }

  $async.Future<$1.DAppGetRWAResp> getRWA(
      $grpc.ServiceCall call, $0.Empty request);

  $async.Future<$1.DAppInfo> getTop_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return getTop($call, await $request);
  }

  $async.Future<$1.DAppInfo> getTop($grpc.ServiceCall call, $0.Empty request);

  $async.Future<$0.Empty> updateTop_Pre($grpc.ServiceCall $call,
      $async.Future<$1.DAppUpdateTopReq> $request) async {
    return updateTop($call, await $request);
  }

  $async.Future<$0.Empty> updateTop(
      $grpc.ServiceCall call, $1.DAppUpdateTopReq request);

  $async.Future<$0.Empty> create_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.DAppInfo> $request) async {
    return create($call, await $request);
  }

  $async.Future<$0.Empty> create($grpc.ServiceCall call, $1.DAppInfo request);

  $async.Future<$0.Empty> edit_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.DAppEntity> $request) async {
    return edit($call, await $request);
  }

  $async.Future<$0.Empty> edit($grpc.ServiceCall call, $1.DAppEntity request);

  $async.Future<$0.Empty> updateOrder_Pre($grpc.ServiceCall $call,
      $async.Future<$1.DAppUpdateOrderReq> $request) async {
    return updateOrder($call, await $request);
  }

  $async.Future<$0.Empty> updateOrder(
      $grpc.ServiceCall call, $1.DAppUpdateOrderReq request);

  $async.Future<$0.Empty> delete_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.DAppDeleteReq> $request) async {
    return delete($call, await $request);
  }

  $async.Future<$0.Empty> delete(
      $grpc.ServiceCall call, $1.DAppDeleteReq request);
}

@$pb.GrpcServiceName('did.MerchantManage')
class MerchantManageClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  MerchantManageClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.MerchantManageListResp> list(
    $1.MerchantManageListReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$list, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> delete(
    $2.DID request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$delete, request, options: options);
  }

  // method descriptors

  static final _$list =
      $grpc.ClientMethod<$1.MerchantManageListReq, $1.MerchantManageListResp>(
          '/did.MerchantManage/List',
          ($1.MerchantManageListReq value) => value.writeToBuffer(),
          $1.MerchantManageListResp.fromBuffer);
  static final _$delete = $grpc.ClientMethod<$2.DID, $0.Empty>(
      '/did.MerchantManage/Delete',
      ($2.DID value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
}

@$pb.GrpcServiceName('did.MerchantManage')
abstract class MerchantManageServiceBase extends $grpc.Service {
  $core.String get $name => 'did.MerchantManage';

  MerchantManageServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.MerchantManageListReq,
            $1.MerchantManageListResp>(
        'List',
        list_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.MerchantManageListReq.fromBuffer(value),
        ($1.MerchantManageListResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.DID, $0.Empty>(
        'Delete',
        delete_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.DID.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$1.MerchantManageListResp> list_Pre($grpc.ServiceCall $call,
      $async.Future<$1.MerchantManageListReq> $request) async {
    return list($call, await $request);
  }

  $async.Future<$1.MerchantManageListResp> list(
      $grpc.ServiceCall call, $1.MerchantManageListReq request);

  $async.Future<$0.Empty> delete_Pre(
      $grpc.ServiceCall $call, $async.Future<$2.DID> $request) async {
    return delete($call, await $request);
  }

  $async.Future<$0.Empty> delete($grpc.ServiceCall call, $2.DID request);
}
