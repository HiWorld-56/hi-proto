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

import '../../google/protobuf/empty.pb.dart' as $0;
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

  $grpc.ResponseFuture<$1.Nonce> generateNonce(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$generateNonce, request, options: options);
  }

  $grpc.ResponseFuture<$1.EmbeddedLoginResp> embeddedLogin(
    $1.LoginParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$embeddedLogin, request, options: options);
  }

  $grpc.ResponseFuture<$1.WalletLoginResp> walletLogin(
    $1.WalletLoginParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$walletLogin, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> qrLogin(
    $1.QrLoginParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$qrLogin, request, options: options);
  }

  $grpc.ResponseFuture<$1.RefreshTokenResp> refreshToken(
    $1.RefreshTokenParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$refreshToken, request, options: options);
  }

  $grpc.ResponseFuture<$1.LoginConversationID> generateLoginConversation(
    $1.LoginConversationParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$generateLoginConversation, request,
        options: options);
  }

  $grpc.ResponseFuture<$1.LoginConversation> getLoginConversation(
    $1.LoginConversationID request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getLoginConversation, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> clubWebQrLogin(
    $1.LoginParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$clubWebQrLogin, request, options: options);
  }

  // method descriptors

  static final _$generateNonce = $grpc.ClientMethod<$0.Empty, $1.Nonce>(
      '/club.Login/GenerateNonce',
      ($0.Empty value) => value.writeToBuffer(),
      $1.Nonce.fromBuffer);
  static final _$embeddedLogin =
      $grpc.ClientMethod<$1.LoginParam, $1.EmbeddedLoginResp>(
          '/club.Login/EmbeddedLogin',
          ($1.LoginParam value) => value.writeToBuffer(),
          $1.EmbeddedLoginResp.fromBuffer);
  static final _$walletLogin =
      $grpc.ClientMethod<$1.WalletLoginParam, $1.WalletLoginResp>(
          '/club.Login/WalletLogin',
          ($1.WalletLoginParam value) => value.writeToBuffer(),
          $1.WalletLoginResp.fromBuffer);
  static final _$qrLogin = $grpc.ClientMethod<$1.QrLoginParam, $0.Empty>(
      '/club.Login/QrLogin',
      ($1.QrLoginParam value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
  static final _$refreshToken =
      $grpc.ClientMethod<$1.RefreshTokenParam, $1.RefreshTokenResp>(
          '/club.Login/RefreshToken',
          ($1.RefreshTokenParam value) => value.writeToBuffer(),
          $1.RefreshTokenResp.fromBuffer);
  static final _$generateLoginConversation =
      $grpc.ClientMethod<$1.LoginConversationParam, $1.LoginConversationID>(
          '/club.Login/GenerateLoginConversation',
          ($1.LoginConversationParam value) => value.writeToBuffer(),
          $1.LoginConversationID.fromBuffer);
  static final _$getLoginConversation =
      $grpc.ClientMethod<$1.LoginConversationID, $1.LoginConversation>(
          '/club.Login/GetLoginConversation',
          ($1.LoginConversationID value) => value.writeToBuffer(),
          $1.LoginConversation.fromBuffer);
  static final _$clubWebQrLogin = $grpc.ClientMethod<$1.LoginParam, $0.Empty>(
      '/club.Login/ClubWebQrLogin',
      ($1.LoginParam value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
}

@$pb.GrpcServiceName('club.Login')
abstract class LoginServiceBase extends $grpc.Service {
  $core.String get $name => 'club.Login';

  LoginServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.Nonce>(
        'GenerateNonce',
        generateNonce_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.Nonce value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.LoginParam, $1.EmbeddedLoginResp>(
        'EmbeddedLogin',
        embeddedLogin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.LoginParam.fromBuffer(value),
        ($1.EmbeddedLoginResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.WalletLoginParam, $1.WalletLoginResp>(
        'WalletLogin',
        walletLogin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.WalletLoginParam.fromBuffer(value),
        ($1.WalletLoginResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.QrLoginParam, $0.Empty>(
        'QrLogin',
        qrLogin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.QrLoginParam.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.RefreshTokenParam, $1.RefreshTokenResp>(
        'RefreshToken',
        refreshToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.RefreshTokenParam.fromBuffer(value),
        ($1.RefreshTokenResp value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.LoginConversationParam, $1.LoginConversationID>(
            'GenerateLoginConversation',
            generateLoginConversation_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.LoginConversationParam.fromBuffer(value),
            ($1.LoginConversationID value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.LoginConversationID, $1.LoginConversation>(
            'GetLoginConversation',
            getLoginConversation_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.LoginConversationID.fromBuffer(value),
            ($1.LoginConversation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.LoginParam, $0.Empty>(
        'ClubWebQrLogin',
        clubWebQrLogin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.LoginParam.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$1.Nonce> generateNonce_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return generateNonce($call, await $request);
  }

  $async.Future<$1.Nonce> generateNonce(
      $grpc.ServiceCall call, $0.Empty request);

  $async.Future<$1.EmbeddedLoginResp> embeddedLogin_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.LoginParam> $request) async {
    return embeddedLogin($call, await $request);
  }

  $async.Future<$1.EmbeddedLoginResp> embeddedLogin(
      $grpc.ServiceCall call, $1.LoginParam request);

  $async.Future<$1.WalletLoginResp> walletLogin_Pre($grpc.ServiceCall $call,
      $async.Future<$1.WalletLoginParam> $request) async {
    return walletLogin($call, await $request);
  }

  $async.Future<$1.WalletLoginResp> walletLogin(
      $grpc.ServiceCall call, $1.WalletLoginParam request);

  $async.Future<$0.Empty> qrLogin_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.QrLoginParam> $request) async {
    return qrLogin($call, await $request);
  }

  $async.Future<$0.Empty> qrLogin(
      $grpc.ServiceCall call, $1.QrLoginParam request);

  $async.Future<$1.RefreshTokenResp> refreshToken_Pre($grpc.ServiceCall $call,
      $async.Future<$1.RefreshTokenParam> $request) async {
    return refreshToken($call, await $request);
  }

  $async.Future<$1.RefreshTokenResp> refreshToken(
      $grpc.ServiceCall call, $1.RefreshTokenParam request);

  $async.Future<$1.LoginConversationID> generateLoginConversation_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$1.LoginConversationParam> $request) async {
    return generateLoginConversation($call, await $request);
  }

  $async.Future<$1.LoginConversationID> generateLoginConversation(
      $grpc.ServiceCall call, $1.LoginConversationParam request);

  $async.Future<$1.LoginConversation> getLoginConversation_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$1.LoginConversationID> $request) async {
    return getLoginConversation($call, await $request);
  }

  $async.Future<$1.LoginConversation> getLoginConversation(
      $grpc.ServiceCall call, $1.LoginConversationID request);

  $async.Future<$0.Empty> clubWebQrLogin_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.LoginParam> $request) async {
    return clubWebQrLogin($call, await $request);
  }

  $async.Future<$0.Empty> clubWebQrLogin(
      $grpc.ServiceCall call, $1.LoginParam request);
}
