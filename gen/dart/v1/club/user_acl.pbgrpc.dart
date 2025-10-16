// This is a generated file - do not edit.
//
// Generated from v1/club/user_acl.proto.

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
import 'user_acl.pb.dart' as $1;

export 'user_acl.pb.dart';

@$pb.GrpcServiceName('club.UserACL')
class UserACLClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  UserACLClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.DIDList> getDIDList(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getDIDList, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> add(
    $1.UserAccessParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$add, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> delete(
    $1.UserAccessParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$delete, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> update(
    $1.UpdateAccessParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$update, request, options: options);
  }

  $grpc.ResponseFuture<$1.UserAccessList> list(
    $1.UserAccessListParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$list, request, options: options);
  }

  $grpc.ResponseFuture<$1.AccessTypeList> getAccessTypeList(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getAccessTypeList, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> checkUser(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$checkUser, request, options: options);
  }

  // method descriptors

  static final _$getDIDList = $grpc.ClientMethod<$0.Empty, $1.DIDList>(
      '/club.UserACL/GetDIDList',
      ($0.Empty value) => value.writeToBuffer(),
      $1.DIDList.fromBuffer);
  static final _$add = $grpc.ClientMethod<$1.UserAccessParam, $0.Empty>(
      '/club.UserACL/Add',
      ($1.UserAccessParam value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
  static final _$delete = $grpc.ClientMethod<$1.UserAccessParam, $0.Empty>(
      '/club.UserACL/Delete',
      ($1.UserAccessParam value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
  static final _$update = $grpc.ClientMethod<$1.UpdateAccessParam, $0.Empty>(
      '/club.UserACL/Update',
      ($1.UpdateAccessParam value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
  static final _$list =
      $grpc.ClientMethod<$1.UserAccessListParam, $1.UserAccessList>(
          '/club.UserACL/List',
          ($1.UserAccessListParam value) => value.writeToBuffer(),
          $1.UserAccessList.fromBuffer);
  static final _$getAccessTypeList =
      $grpc.ClientMethod<$0.Empty, $1.AccessTypeList>(
          '/club.UserACL/GetAccessTypeList',
          ($0.Empty value) => value.writeToBuffer(),
          $1.AccessTypeList.fromBuffer);
  static final _$checkUser = $grpc.ClientMethod<$0.Empty, $0.Empty>(
      '/club.UserACL/CheckUser',
      ($0.Empty value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
}

@$pb.GrpcServiceName('club.UserACL')
abstract class UserACLServiceBase extends $grpc.Service {
  $core.String get $name => 'club.UserACL';

  UserACLServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.DIDList>(
        'GetDIDList',
        getDIDList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.DIDList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.UserAccessParam, $0.Empty>(
        'Add',
        add_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.UserAccessParam.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.UserAccessParam, $0.Empty>(
        'Delete',
        delete_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.UserAccessParam.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.UpdateAccessParam, $0.Empty>(
        'Update',
        update_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.UpdateAccessParam.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.UserAccessListParam, $1.UserAccessList>(
        'List',
        list_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.UserAccessListParam.fromBuffer(value),
        ($1.UserAccessList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.AccessTypeList>(
        'GetAccessTypeList',
        getAccessTypeList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.AccessTypeList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.Empty>(
        'CheckUser',
        checkUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$1.DIDList> getDIDList_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return getDIDList($call, await $request);
  }

  $async.Future<$1.DIDList> getDIDList(
      $grpc.ServiceCall call, $0.Empty request);

  $async.Future<$0.Empty> add_Pre($grpc.ServiceCall $call,
      $async.Future<$1.UserAccessParam> $request) async {
    return add($call, await $request);
  }

  $async.Future<$0.Empty> add(
      $grpc.ServiceCall call, $1.UserAccessParam request);

  $async.Future<$0.Empty> delete_Pre($grpc.ServiceCall $call,
      $async.Future<$1.UserAccessParam> $request) async {
    return delete($call, await $request);
  }

  $async.Future<$0.Empty> delete(
      $grpc.ServiceCall call, $1.UserAccessParam request);

  $async.Future<$0.Empty> update_Pre($grpc.ServiceCall $call,
      $async.Future<$1.UpdateAccessParam> $request) async {
    return update($call, await $request);
  }

  $async.Future<$0.Empty> update(
      $grpc.ServiceCall call, $1.UpdateAccessParam request);

  $async.Future<$1.UserAccessList> list_Pre($grpc.ServiceCall $call,
      $async.Future<$1.UserAccessListParam> $request) async {
    return list($call, await $request);
  }

  $async.Future<$1.UserAccessList> list(
      $grpc.ServiceCall call, $1.UserAccessListParam request);

  $async.Future<$1.AccessTypeList> getAccessTypeList_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return getAccessTypeList($call, await $request);
  }

  $async.Future<$1.AccessTypeList> getAccessTypeList(
      $grpc.ServiceCall call, $0.Empty request);

  $async.Future<$0.Empty> checkUser_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return checkUser($call, await $request);
  }

  $async.Future<$0.Empty> checkUser($grpc.ServiceCall call, $0.Empty request);
}
