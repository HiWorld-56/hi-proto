// This is a generated file - do not edit.
//
// Generated from v1/club/login.proto.

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

import '../hi.pb.dart' as $0;
import 'login.pb.dart' as $1;

export 'login.pb.dart';

@$pb.GrpcServiceName('club.Login')
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

  $grpc.ResponseFuture<$0.ReqID> generateReqID(
    $0.Node request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$generateReqID, request, options: options);
  }

  $grpc.ResponseFuture<$1.LoginResp> getReqStatus(
    $0.ReqID request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getReqStatus, request, options: options);
  }

  // method descriptors

  static final _$refreshToken =
      $grpc.ClientMethod<$0.RefreshTokenReq, $0.Token>(
          '/club.Login/RefreshToken',
          ($0.RefreshTokenReq value) => value.writeToBuffer(),
          $0.Token.fromBuffer);
  static final _$generateReqID = $grpc.ClientMethod<$0.Node, $0.ReqID>(
      '/club.Login/GenerateReqID',
      ($0.Node value) => value.writeToBuffer(),
      $0.ReqID.fromBuffer);
  static final _$getReqStatus = $grpc.ClientMethod<$0.ReqID, $1.LoginResp>(
      '/club.Login/GetReqStatus',
      ($0.ReqID value) => value.writeToBuffer(),
      $1.LoginResp.fromBuffer);
}

@$pb.GrpcServiceName('club.Login')
abstract class LoginServiceBase extends $grpc.Service {
  $core.String get $name => 'club.Login';

  LoginServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.RefreshTokenReq, $0.Token>(
        'RefreshToken',
        refreshToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RefreshTokenReq.fromBuffer(value),
        ($0.Token value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Node, $0.ReqID>(
        'GenerateReqID',
        generateReqID_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Node.fromBuffer(value),
        ($0.ReqID value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ReqID, $1.LoginResp>(
        'GetReqStatus',
        getReqStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ReqID.fromBuffer(value),
        ($1.LoginResp value) => value.writeToBuffer()));
  }

  $async.Future<$0.Token> refreshToken_Pre($grpc.ServiceCall $call,
      $async.Future<$0.RefreshTokenReq> $request) async {
    return refreshToken($call, await $request);
  }

  $async.Future<$0.Token> refreshToken(
      $grpc.ServiceCall call, $0.RefreshTokenReq request);

  $async.Future<$0.ReqID> generateReqID_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Node> $request) async {
    return generateReqID($call, await $request);
  }

  $async.Future<$0.ReqID> generateReqID(
      $grpc.ServiceCall call, $0.Node request);

  $async.Future<$1.LoginResp> getReqStatus_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.ReqID> $request) async {
    return getReqStatus($call, await $request);
  }

  $async.Future<$1.LoginResp> getReqStatus(
      $grpc.ServiceCall call, $0.ReqID request);
}
