// This is a generated file - do not edit.
//
// Generated from v1/did/extend.proto.

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
import 'extend.pb.dart' as $1;

export 'extend.pb.dart';

@$pb.GrpcServiceName('did.UserExtendSetting')
class UserExtendSettingClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  UserExtendSettingClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.UserExtendSettingResp> update(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$update, request, options: options);
  }

  $grpc.ResponseFuture<$1.UserExtendSettingResp> get(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$get, request, options: options);
  }

  // method descriptors

  static final _$update =
      $grpc.ClientMethod<$0.Empty, $1.UserExtendSettingResp>(
          '/did.UserExtendSetting/Update',
          ($0.Empty value) => value.writeToBuffer(),
          $1.UserExtendSettingResp.fromBuffer);
  static final _$get = $grpc.ClientMethod<$0.Empty, $1.UserExtendSettingResp>(
      '/did.UserExtendSetting/Get',
      ($0.Empty value) => value.writeToBuffer(),
      $1.UserExtendSettingResp.fromBuffer);
}

@$pb.GrpcServiceName('did.UserExtendSetting')
abstract class UserExtendSettingServiceBase extends $grpc.Service {
  $core.String get $name => 'did.UserExtendSetting';

  UserExtendSettingServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.UserExtendSettingResp>(
        'Update',
        update_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.UserExtendSettingResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.UserExtendSettingResp>(
        'Get',
        get_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.UserExtendSettingResp value) => value.writeToBuffer()));
  }

  $async.Future<$1.UserExtendSettingResp> update_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return update($call, await $request);
  }

  $async.Future<$1.UserExtendSettingResp> update(
      $grpc.ServiceCall call, $0.Empty request);

  $async.Future<$1.UserExtendSettingResp> get_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return get($call, await $request);
  }

  $async.Future<$1.UserExtendSettingResp> get(
      $grpc.ServiceCall call, $0.Empty request);
}

@$pb.GrpcServiceName('did.UserExtend')
class UserExtendClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  UserExtendClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.Empty> update(
    $1.UserExtendUpdateReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$update, request, options: options);
  }

  $grpc.ResponseFuture<$1.UserExtendListResp> list(
    $1.UserExtendListReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$list, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> delete(
    $1.UserExtendDeleteReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$delete, request, options: options);
  }

  // method descriptors

  static final _$update = $grpc.ClientMethod<$1.UserExtendUpdateReq, $0.Empty>(
      '/did.UserExtend/Update',
      ($1.UserExtendUpdateReq value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
  static final _$list =
      $grpc.ClientMethod<$1.UserExtendListReq, $1.UserExtendListResp>(
          '/did.UserExtend/List',
          ($1.UserExtendListReq value) => value.writeToBuffer(),
          $1.UserExtendListResp.fromBuffer);
  static final _$delete = $grpc.ClientMethod<$1.UserExtendDeleteReq, $0.Empty>(
      '/did.UserExtend/Delete',
      ($1.UserExtendDeleteReq value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
}

@$pb.GrpcServiceName('did.UserExtend')
abstract class UserExtendServiceBase extends $grpc.Service {
  $core.String get $name => 'did.UserExtend';

  UserExtendServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.UserExtendUpdateReq, $0.Empty>(
        'Update',
        update_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.UserExtendUpdateReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.UserExtendListReq, $1.UserExtendListResp>(
        'List',
        list_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.UserExtendListReq.fromBuffer(value),
        ($1.UserExtendListResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.UserExtendDeleteReq, $0.Empty>(
        'Delete',
        delete_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.UserExtendDeleteReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$0.Empty> update_Pre($grpc.ServiceCall $call,
      $async.Future<$1.UserExtendUpdateReq> $request) async {
    return update($call, await $request);
  }

  $async.Future<$0.Empty> update(
      $grpc.ServiceCall call, $1.UserExtendUpdateReq request);

  $async.Future<$1.UserExtendListResp> list_Pre($grpc.ServiceCall $call,
      $async.Future<$1.UserExtendListReq> $request) async {
    return list($call, await $request);
  }

  $async.Future<$1.UserExtendListResp> list(
      $grpc.ServiceCall call, $1.UserExtendListReq request);

  $async.Future<$0.Empty> delete_Pre($grpc.ServiceCall $call,
      $async.Future<$1.UserExtendDeleteReq> $request) async {
    return delete($call, await $request);
  }

  $async.Future<$0.Empty> delete(
      $grpc.ServiceCall call, $1.UserExtendDeleteReq request);
}
