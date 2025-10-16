// This is a generated file - do not edit.
//
// Generated from v1/club/coin.proto.

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
import 'coin.pb.dart' as $1;

export 'coin.pb.dart';

@$pb.GrpcServiceName('club.Icon')
class IconClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  IconClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.IconList> getIconList(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getIconList, request, options: options);
  }

  // method descriptors

  static final _$getIconList = $grpc.ClientMethod<$0.Empty, $1.IconList>(
      '/club.Icon/GetIconList',
      ($0.Empty value) => value.writeToBuffer(),
      $1.IconList.fromBuffer);
}

@$pb.GrpcServiceName('club.Icon')
abstract class IconServiceBase extends $grpc.Service {
  $core.String get $name => 'club.Icon';

  IconServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.IconList>(
        'GetIconList',
        getIconList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.IconList value) => value.writeToBuffer()));
  }

  $async.Future<$1.IconList> getIconList_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return getIconList($call, await $request);
  }

  $async.Future<$1.IconList> getIconList(
      $grpc.ServiceCall call, $0.Empty request);
}
