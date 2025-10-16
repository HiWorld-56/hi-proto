// This is a generated file - do not edit.
//
// Generated from v1/ai/user_acl.proto.

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
import 'user_acl.pb.dart' as $0;

export 'user_acl.pb.dart';

/// Token鉴权
@$pb.GrpcServiceName('ai.UserACL')
class UserACLClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  UserACLClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.Empty> add(
    $0.AddSuperUserReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$add, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> delete(
    $0.DeleteSuperUserReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$delete, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListSuperUserResp> list(
    $0.ListSuperUserReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$list, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListSuperUserTypeResp> listType(
    $1.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listType, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> edit(
    $0.EditSuperUserReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$edit, request, options: options);
  }

  // method descriptors

  static final _$add = $grpc.ClientMethod<$0.AddSuperUserReq, $1.Empty>(
      '/ai.UserACL/Add',
      ($0.AddSuperUserReq value) => value.writeToBuffer(),
      $1.Empty.fromBuffer);
  static final _$delete = $grpc.ClientMethod<$0.DeleteSuperUserReq, $1.Empty>(
      '/ai.UserACL/Delete',
      ($0.DeleteSuperUserReq value) => value.writeToBuffer(),
      $1.Empty.fromBuffer);
  static final _$list =
      $grpc.ClientMethod<$0.ListSuperUserReq, $0.ListSuperUserResp>(
          '/ai.UserACL/List',
          ($0.ListSuperUserReq value) => value.writeToBuffer(),
          $0.ListSuperUserResp.fromBuffer);
  static final _$listType =
      $grpc.ClientMethod<$1.Empty, $0.ListSuperUserTypeResp>(
          '/ai.UserACL/ListType',
          ($1.Empty value) => value.writeToBuffer(),
          $0.ListSuperUserTypeResp.fromBuffer);
  static final _$edit = $grpc.ClientMethod<$0.EditSuperUserReq, $1.Empty>(
      '/ai.UserACL/Edit',
      ($0.EditSuperUserReq value) => value.writeToBuffer(),
      $1.Empty.fromBuffer);
}

@$pb.GrpcServiceName('ai.UserACL')
abstract class UserACLServiceBase extends $grpc.Service {
  $core.String get $name => 'ai.UserACL';

  UserACLServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.AddSuperUserReq, $1.Empty>(
        'Add',
        add_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddSuperUserReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteSuperUserReq, $1.Empty>(
        'Delete',
        delete_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeleteSuperUserReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListSuperUserReq, $0.ListSuperUserResp>(
        'List',
        list_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListSuperUserReq.fromBuffer(value),
        ($0.ListSuperUserResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.ListSuperUserTypeResp>(
        'ListType',
        listType_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.ListSuperUserTypeResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EditSuperUserReq, $1.Empty>(
        'Edit',
        edit_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EditSuperUserReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$1.Empty> add_Pre($grpc.ServiceCall $call,
      $async.Future<$0.AddSuperUserReq> $request) async {
    return add($call, await $request);
  }

  $async.Future<$1.Empty> add(
      $grpc.ServiceCall call, $0.AddSuperUserReq request);

  $async.Future<$1.Empty> delete_Pre($grpc.ServiceCall $call,
      $async.Future<$0.DeleteSuperUserReq> $request) async {
    return delete($call, await $request);
  }

  $async.Future<$1.Empty> delete(
      $grpc.ServiceCall call, $0.DeleteSuperUserReq request);

  $async.Future<$0.ListSuperUserResp> list_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ListSuperUserReq> $request) async {
    return list($call, await $request);
  }

  $async.Future<$0.ListSuperUserResp> list(
      $grpc.ServiceCall call, $0.ListSuperUserReq request);

  $async.Future<$0.ListSuperUserTypeResp> listType_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.Empty> $request) async {
    return listType($call, await $request);
  }

  $async.Future<$0.ListSuperUserTypeResp> listType(
      $grpc.ServiceCall call, $1.Empty request);

  $async.Future<$1.Empty> edit_Pre($grpc.ServiceCall $call,
      $async.Future<$0.EditSuperUserReq> $request) async {
    return edit($call, await $request);
  }

  $async.Future<$1.Empty> edit(
      $grpc.ServiceCall call, $0.EditSuperUserReq request);
}
