// This is a generated file - do not edit.
//
// Generated from v1/did/base.proto.

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
import 'base.pb.dart' as $1;

export 'base.pb.dart';

@$pb.GrpcServiceName('did.Base')
class BaseClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  BaseClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.ListCoinsResp> listCoins(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listCoins, request, options: options);
  }

  $grpc.ResponseFuture<$2.Number> totalUsers(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$totalUsers, request, options: options);
  }

  $grpc.ResponseFuture<$1.LastetVersionResp> lastetVersion(
    $1.LastetVersionReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$lastetVersion, request, options: options);
  }

  // method descriptors

  static final _$listCoins = $grpc.ClientMethod<$0.Empty, $1.ListCoinsResp>(
      '/did.Base/ListCoins',
      ($0.Empty value) => value.writeToBuffer(),
      $1.ListCoinsResp.fromBuffer);
  static final _$totalUsers = $grpc.ClientMethod<$0.Empty, $2.Number>(
      '/did.Base/TotalUsers',
      ($0.Empty value) => value.writeToBuffer(),
      $2.Number.fromBuffer);
  static final _$lastetVersion =
      $grpc.ClientMethod<$1.LastetVersionReq, $1.LastetVersionResp>(
          '/did.Base/LastetVersion',
          ($1.LastetVersionReq value) => value.writeToBuffer(),
          $1.LastetVersionResp.fromBuffer);
}

@$pb.GrpcServiceName('did.Base')
abstract class BaseServiceBase extends $grpc.Service {
  $core.String get $name => 'did.Base';

  BaseServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.ListCoinsResp>(
        'ListCoins',
        listCoins_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.ListCoinsResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $2.Number>(
        'TotalUsers',
        totalUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($2.Number value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.LastetVersionReq, $1.LastetVersionResp>(
        'LastetVersion',
        lastetVersion_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.LastetVersionReq.fromBuffer(value),
        ($1.LastetVersionResp value) => value.writeToBuffer()));
  }

  $async.Future<$1.ListCoinsResp> listCoins_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return listCoins($call, await $request);
  }

  $async.Future<$1.ListCoinsResp> listCoins(
      $grpc.ServiceCall call, $0.Empty request);

  $async.Future<$2.Number> totalUsers_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return totalUsers($call, await $request);
  }

  $async.Future<$2.Number> totalUsers($grpc.ServiceCall call, $0.Empty request);

  $async.Future<$1.LastetVersionResp> lastetVersion_Pre($grpc.ServiceCall $call,
      $async.Future<$1.LastetVersionReq> $request) async {
    return lastetVersion($call, await $request);
  }

  $async.Future<$1.LastetVersionResp> lastetVersion(
      $grpc.ServiceCall call, $1.LastetVersionReq request);
}

@$pb.GrpcServiceName('did.Assist')
class AssistClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  AssistClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$2.DID> verifySignature(
    $2.Web3Data request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$verifySignature, request, options: options);
  }

  // method descriptors

  static final _$verifySignature = $grpc.ClientMethod<$2.Web3Data, $2.DID>(
      '/did.Assist/VerifySignature',
      ($2.Web3Data value) => value.writeToBuffer(),
      $2.DID.fromBuffer);
}

@$pb.GrpcServiceName('did.Assist')
abstract class AssistServiceBase extends $grpc.Service {
  $core.String get $name => 'did.Assist';

  AssistServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.Web3Data, $2.DID>(
        'VerifySignature',
        verifySignature_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Web3Data.fromBuffer(value),
        ($2.DID value) => value.writeToBuffer()));
  }

  $async.Future<$2.DID> verifySignature_Pre(
      $grpc.ServiceCall $call, $async.Future<$2.Web3Data> $request) async {
    return verifySignature($call, await $request);
  }

  $async.Future<$2.DID> verifySignature(
      $grpc.ServiceCall call, $2.Web3Data request);
}
