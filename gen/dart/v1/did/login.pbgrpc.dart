// This is a generated file - do not edit.
//
// Generated from v1/did/login.proto.

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
import '../hi.pb.dart' as $0;
import 'login.pb.dart' as $2;

export 'login.pb.dart';

@$pb.GrpcServiceName('did.Login')
class LoginClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  LoginClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.Token> refreshToken(
    $0.RefreshTokenReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$refreshToken, request, options: options);
  }

  $grpc.ResponseFuture<$0.Nonce> generateNonce(
    $1.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$generateNonce, request, options: options);
  }

  $grpc.ResponseFuture<$2.LoginResp> verify(
    $0.Web3Data request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$verify, request, options: options);
  }

  $grpc.ResponseFuture<$0.ReqID> generateReq(
    $0.Node request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$generateReq, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> notify(
    $0.Web3Data request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$notify, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> logout(
    $1.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$logout, request, options: options);
  }

  // method descriptors

  static final _$refreshToken =
      $grpc.ClientMethod<$0.RefreshTokenReq, $0.Token>(
          '/did.Login/RefreshToken',
          ($0.RefreshTokenReq value) => value.writeToBuffer(),
          $0.Token.fromBuffer);
  static final _$generateNonce = $grpc.ClientMethod<$1.Empty, $0.Nonce>(
      '/did.Login/GenerateNonce',
      ($1.Empty value) => value.writeToBuffer(),
      $0.Nonce.fromBuffer);
  static final _$verify = $grpc.ClientMethod<$0.Web3Data, $2.LoginResp>(
      '/did.Login/Verify',
      ($0.Web3Data value) => value.writeToBuffer(),
      $2.LoginResp.fromBuffer);
  static final _$generateReq = $grpc.ClientMethod<$0.Node, $0.ReqID>(
      '/did.Login/GenerateReq',
      ($0.Node value) => value.writeToBuffer(),
      $0.ReqID.fromBuffer);
  static final _$notify = $grpc.ClientMethod<$0.Web3Data, $1.Empty>(
      '/did.Login/Notify',
      ($0.Web3Data value) => value.writeToBuffer(),
      $1.Empty.fromBuffer);
  static final _$logout = $grpc.ClientMethod<$1.Empty, $1.Empty>(
      '/did.Login/Logout',
      ($1.Empty value) => value.writeToBuffer(),
      $1.Empty.fromBuffer);
}

@$pb.GrpcServiceName('did.Login')
abstract class LoginServiceBase extends $grpc.Service {
  $core.String get $name => 'did.Login';

  LoginServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.RefreshTokenReq, $0.Token>(
        'RefreshToken',
        refreshToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RefreshTokenReq.fromBuffer(value),
        ($0.Token value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.Nonce>(
        'GenerateNonce',
        generateNonce_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.Nonce value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Web3Data, $2.LoginResp>(
        'Verify',
        verify_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Web3Data.fromBuffer(value),
        ($2.LoginResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Node, $0.ReqID>(
        'GenerateReq',
        generateReq_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Node.fromBuffer(value),
        ($0.ReqID value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Web3Data, $1.Empty>(
        'Notify',
        notify_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Web3Data.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $1.Empty>(
        'Logout',
        logout_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$0.Token> refreshToken_Pre($grpc.ServiceCall $call,
      $async.Future<$0.RefreshTokenReq> $request) async {
    return refreshToken($call, await $request);
  }

  $async.Future<$0.Token> refreshToken(
      $grpc.ServiceCall call, $0.RefreshTokenReq request);

  $async.Future<$0.Nonce> generateNonce_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.Empty> $request) async {
    return generateNonce($call, await $request);
  }

  $async.Future<$0.Nonce> generateNonce(
      $grpc.ServiceCall call, $1.Empty request);

  $async.Future<$2.LoginResp> verify_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Web3Data> $request) async {
    return verify($call, await $request);
  }

  $async.Future<$2.LoginResp> verify(
      $grpc.ServiceCall call, $0.Web3Data request);

  $async.Future<$0.ReqID> generateReq_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Node> $request) async {
    return generateReq($call, await $request);
  }

  $async.Future<$0.ReqID> generateReq($grpc.ServiceCall call, $0.Node request);

  $async.Future<$1.Empty> notify_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Web3Data> $request) async {
    return notify($call, await $request);
  }

  $async.Future<$1.Empty> notify($grpc.ServiceCall call, $0.Web3Data request);

  $async.Future<$1.Empty> logout_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.Empty> $request) async {
    return logout($call, await $request);
  }

  $async.Future<$1.Empty> logout($grpc.ServiceCall call, $1.Empty request);
}
