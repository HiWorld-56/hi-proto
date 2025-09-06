// This is a generated file - do not edit.
//
// Generated from v1/did/wallet.proto.

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
import 'wallet.pb.dart' as $2;

export 'wallet.pb.dart';

@$pb.GrpcServiceName('did.Web')
class WebClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  WebClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.Empty> updateAddresses(
    $0.Web3Data request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateAddresses, request, options: options);
  }

  $grpc.ResponseFuture<$2.GetWalletResp> getWallet(
    $2.GetWalletReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getWallet, request, options: options);
  }

  $grpc.ResponseFuture<$2.ListAddressesResp> listAddresses(
    $2.ListAddressesReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listAddresses, request, options: options);
  }

  $grpc.ResponseFuture<$2.TotalAssetsResp> totalAssets(
    $2.TotalAssetsReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$totalAssets, request, options: options);
  }

  $grpc.ResponseFuture<$2.ListUsersAssetsResp> listUsersAssets(
    $2.ListUsersAssetsReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listUsersAssets, request, options: options);
  }

  $grpc.ResponseFuture<$2.GetUserAssetsResp> getUserAssets(
    $2.GetUserAssetsReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getUserAssets, request, options: options);
  }

  // method descriptors

  static final _$updateAddresses = $grpc.ClientMethod<$0.Web3Data, $1.Empty>(
      '/did.Web/UpdateAddresses',
      ($0.Web3Data value) => value.writeToBuffer(),
      $1.Empty.fromBuffer);
  static final _$getWallet =
      $grpc.ClientMethod<$2.GetWalletReq, $2.GetWalletResp>(
          '/did.Web/GetWallet',
          ($2.GetWalletReq value) => value.writeToBuffer(),
          $2.GetWalletResp.fromBuffer);
  static final _$listAddresses =
      $grpc.ClientMethod<$2.ListAddressesReq, $2.ListAddressesResp>(
          '/did.Web/ListAddresses',
          ($2.ListAddressesReq value) => value.writeToBuffer(),
          $2.ListAddressesResp.fromBuffer);
  static final _$totalAssets =
      $grpc.ClientMethod<$2.TotalAssetsReq, $2.TotalAssetsResp>(
          '/did.Web/TotalAssets',
          ($2.TotalAssetsReq value) => value.writeToBuffer(),
          $2.TotalAssetsResp.fromBuffer);
  static final _$listUsersAssets =
      $grpc.ClientMethod<$2.ListUsersAssetsReq, $2.ListUsersAssetsResp>(
          '/did.Web/ListUsersAssets',
          ($2.ListUsersAssetsReq value) => value.writeToBuffer(),
          $2.ListUsersAssetsResp.fromBuffer);
  static final _$getUserAssets =
      $grpc.ClientMethod<$2.GetUserAssetsReq, $2.GetUserAssetsResp>(
          '/did.Web/GetUserAssets',
          ($2.GetUserAssetsReq value) => value.writeToBuffer(),
          $2.GetUserAssetsResp.fromBuffer);
}

@$pb.GrpcServiceName('did.Web')
abstract class WebServiceBase extends $grpc.Service {
  $core.String get $name => 'did.Web';

  WebServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Web3Data, $1.Empty>(
        'UpdateAddresses',
        updateAddresses_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Web3Data.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.GetWalletReq, $2.GetWalletResp>(
        'GetWallet',
        getWallet_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.GetWalletReq.fromBuffer(value),
        ($2.GetWalletResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.ListAddressesReq, $2.ListAddressesResp>(
        'ListAddresses',
        listAddresses_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.ListAddressesReq.fromBuffer(value),
        ($2.ListAddressesResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.TotalAssetsReq, $2.TotalAssetsResp>(
        'TotalAssets',
        totalAssets_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.TotalAssetsReq.fromBuffer(value),
        ($2.TotalAssetsResp value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$2.ListUsersAssetsReq, $2.ListUsersAssetsResp>(
            'ListUsersAssets',
            listUsersAssets_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $2.ListUsersAssetsReq.fromBuffer(value),
            ($2.ListUsersAssetsResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.GetUserAssetsReq, $2.GetUserAssetsResp>(
        'GetUserAssets',
        getUserAssets_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.GetUserAssetsReq.fromBuffer(value),
        ($2.GetUserAssetsResp value) => value.writeToBuffer()));
  }

  $async.Future<$1.Empty> updateAddresses_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Web3Data> $request) async {
    return updateAddresses($call, await $request);
  }

  $async.Future<$1.Empty> updateAddresses(
      $grpc.ServiceCall call, $0.Web3Data request);

  $async.Future<$2.GetWalletResp> getWallet_Pre(
      $grpc.ServiceCall $call, $async.Future<$2.GetWalletReq> $request) async {
    return getWallet($call, await $request);
  }

  $async.Future<$2.GetWalletResp> getWallet(
      $grpc.ServiceCall call, $2.GetWalletReq request);

  $async.Future<$2.ListAddressesResp> listAddresses_Pre($grpc.ServiceCall $call,
      $async.Future<$2.ListAddressesReq> $request) async {
    return listAddresses($call, await $request);
  }

  $async.Future<$2.ListAddressesResp> listAddresses(
      $grpc.ServiceCall call, $2.ListAddressesReq request);

  $async.Future<$2.TotalAssetsResp> totalAssets_Pre($grpc.ServiceCall $call,
      $async.Future<$2.TotalAssetsReq> $request) async {
    return totalAssets($call, await $request);
  }

  $async.Future<$2.TotalAssetsResp> totalAssets(
      $grpc.ServiceCall call, $2.TotalAssetsReq request);

  $async.Future<$2.ListUsersAssetsResp> listUsersAssets_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$2.ListUsersAssetsReq> $request) async {
    return listUsersAssets($call, await $request);
  }

  $async.Future<$2.ListUsersAssetsResp> listUsersAssets(
      $grpc.ServiceCall call, $2.ListUsersAssetsReq request);

  $async.Future<$2.GetUserAssetsResp> getUserAssets_Pre($grpc.ServiceCall $call,
      $async.Future<$2.GetUserAssetsReq> $request) async {
    return getUserAssets($call, await $request);
  }

  $async.Future<$2.GetUserAssetsResp> getUserAssets(
      $grpc.ServiceCall call, $2.GetUserAssetsReq request);
}

@$pb.GrpcServiceName('did.Wallet')
class WalletClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  WalletClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.Empty> updateAssets(
    $2.UpdateAssetsReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateAssets, request, options: options);
  }

  // method descriptors

  static final _$updateAssets =
      $grpc.ClientMethod<$2.UpdateAssetsReq, $1.Empty>(
          '/did.Wallet/UpdateAssets',
          ($2.UpdateAssetsReq value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
}

@$pb.GrpcServiceName('did.Wallet')
abstract class WalletServiceBase extends $grpc.Service {
  $core.String get $name => 'did.Wallet';

  WalletServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.UpdateAssetsReq, $1.Empty>(
        'UpdateAssets',
        updateAssets_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.UpdateAssetsReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$1.Empty> updateAssets_Pre($grpc.ServiceCall $call,
      $async.Future<$2.UpdateAssetsReq> $request) async {
    return updateAssets($call, await $request);
  }

  $async.Future<$1.Empty> updateAssets(
      $grpc.ServiceCall call, $2.UpdateAssetsReq request);
}
