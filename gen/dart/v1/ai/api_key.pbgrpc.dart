// This is a generated file - do not edit.
//
// Generated from v1/ai/api_key.proto.

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
import 'api_key.pb.dart' as $1;

export 'api_key.pb.dart';

/// 使用token鉴权
@$pb.GrpcServiceName('ai.ApiKey')
class ApiKeyClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  ApiKeyClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.CreateApiKeyResp> create(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$create, request, options: options);
  }

  $grpc.ResponseFuture<$1.EditApiKeyResp> edit(
    $1.EditApiKeyReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$edit, request, options: options);
  }

  $grpc.ResponseFuture<$1.ListApiKeyResp> list(
    $2.Pagination request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$list, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> delete(
    $1.DeleteApiKeyReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$delete, request, options: options);
  }

  // method descriptors

  static final _$create = $grpc.ClientMethod<$0.Empty, $1.CreateApiKeyResp>(
      '/ai.ApiKey/Create',
      ($0.Empty value) => value.writeToBuffer(),
      $1.CreateApiKeyResp.fromBuffer);
  static final _$edit = $grpc.ClientMethod<$1.EditApiKeyReq, $1.EditApiKeyResp>(
      '/ai.ApiKey/Edit',
      ($1.EditApiKeyReq value) => value.writeToBuffer(),
      $1.EditApiKeyResp.fromBuffer);
  static final _$list = $grpc.ClientMethod<$2.Pagination, $1.ListApiKeyResp>(
      '/ai.ApiKey/List',
      ($2.Pagination value) => value.writeToBuffer(),
      $1.ListApiKeyResp.fromBuffer);
  static final _$delete = $grpc.ClientMethod<$1.DeleteApiKeyReq, $0.Empty>(
      '/ai.ApiKey/Delete',
      ($1.DeleteApiKeyReq value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
}

@$pb.GrpcServiceName('ai.ApiKey')
abstract class ApiKeyServiceBase extends $grpc.Service {
  $core.String get $name => 'ai.ApiKey';

  ApiKeyServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.CreateApiKeyResp>(
        'Create',
        create_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.CreateApiKeyResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.EditApiKeyReq, $1.EditApiKeyResp>(
        'Edit',
        edit_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.EditApiKeyReq.fromBuffer(value),
        ($1.EditApiKeyResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Pagination, $1.ListApiKeyResp>(
        'List',
        list_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Pagination.fromBuffer(value),
        ($1.ListApiKeyResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.DeleteApiKeyReq, $0.Empty>(
        'Delete',
        delete_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.DeleteApiKeyReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$1.CreateApiKeyResp> create_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return create($call, await $request);
  }

  $async.Future<$1.CreateApiKeyResp> create(
      $grpc.ServiceCall call, $0.Empty request);

  $async.Future<$1.EditApiKeyResp> edit_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.EditApiKeyReq> $request) async {
    return edit($call, await $request);
  }

  $async.Future<$1.EditApiKeyResp> edit(
      $grpc.ServiceCall call, $1.EditApiKeyReq request);

  $async.Future<$1.ListApiKeyResp> list_Pre(
      $grpc.ServiceCall $call, $async.Future<$2.Pagination> $request) async {
    return list($call, await $request);
  }

  $async.Future<$1.ListApiKeyResp> list(
      $grpc.ServiceCall call, $2.Pagination request);

  $async.Future<$0.Empty> delete_Pre($grpc.ServiceCall $call,
      $async.Future<$1.DeleteApiKeyReq> $request) async {
    return delete($call, await $request);
  }

  $async.Future<$0.Empty> delete(
      $grpc.ServiceCall call, $1.DeleteApiKeyReq request);
}
