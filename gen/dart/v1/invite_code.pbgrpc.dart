// This is a generated file - do not edit.
//
// Generated from v1/invite_code.proto.

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

import '../google/protobuf/empty.pb.dart' as $0;
import 'hi.pb.dart' as $2;
import 'invite_code.pb.dart' as $1;

export 'invite_code.pb.dart';

/// 邀请码
@$pb.GrpcServiceName('hi.InviteCode')
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
      '/hi.InviteCode/Create',
      ($0.Empty value) => value.writeToBuffer(),
      $1.InviteCodeCreateResp.fromBuffer);
  static final _$edit = $grpc.ClientMethod<$1.InviteCodeEditReq, $0.Empty>(
      '/hi.InviteCode/Edit',
      ($1.InviteCodeEditReq value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
  static final _$list =
      $grpc.ClientMethod<$2.Pagination, $1.InviteCodeListResp>(
          '/hi.InviteCode/List',
          ($2.Pagination value) => value.writeToBuffer(),
          $1.InviteCodeListResp.fromBuffer);
  static final _$delete = $grpc.ClientMethod<$1.InviteCodeDeleteReq, $0.Empty>(
      '/hi.InviteCode/Delete',
      ($1.InviteCodeDeleteReq value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
  static final _$verify = $grpc.ClientMethod<$1.InviteCodeVerifyReq, $2.Token>(
      '/hi.InviteCode/Verify',
      ($1.InviteCodeVerifyReq value) => value.writeToBuffer(),
      $2.Token.fromBuffer);
}

@$pb.GrpcServiceName('hi.InviteCode')
abstract class InviteCodeServiceBase extends $grpc.Service {
  $core.String get $name => 'hi.InviteCode';

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
