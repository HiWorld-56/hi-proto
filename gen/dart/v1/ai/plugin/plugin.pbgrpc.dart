// This is a generated file - do not edit.
//
// Generated from v1/ai/plugin/plugin.proto.

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

import 'plugin.pb.dart' as $0;

export 'plugin.pb.dart';

@$pb.GrpcServiceName('plugin.AiPlugin')
class AiPluginClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  AiPluginClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.SearchResp> search(
    $0.SearchReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$search, request, options: options);
  }

  $grpc.ResponseFuture<$0.PythonResp> python(
    $0.PythonReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$python, request, options: options);
  }

  // method descriptors

  static final _$search = $grpc.ClientMethod<$0.SearchReq, $0.SearchResp>(
      '/plugin.AiPlugin/Search',
      ($0.SearchReq value) => value.writeToBuffer(),
      $0.SearchResp.fromBuffer);
  static final _$python = $grpc.ClientMethod<$0.PythonReq, $0.PythonResp>(
      '/plugin.AiPlugin/Python',
      ($0.PythonReq value) => value.writeToBuffer(),
      $0.PythonResp.fromBuffer);
}

@$pb.GrpcServiceName('plugin.AiPlugin')
abstract class AiPluginServiceBase extends $grpc.Service {
  $core.String get $name => 'plugin.AiPlugin';

  AiPluginServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SearchReq, $0.SearchResp>(
        'Search',
        search_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SearchReq.fromBuffer(value),
        ($0.SearchResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PythonReq, $0.PythonResp>(
        'Python',
        python_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PythonReq.fromBuffer(value),
        ($0.PythonResp value) => value.writeToBuffer()));
  }

  $async.Future<$0.SearchResp> search_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.SearchReq> $request) async {
    return search($call, await $request);
  }

  $async.Future<$0.SearchResp> search(
      $grpc.ServiceCall call, $0.SearchReq request);

  $async.Future<$0.PythonResp> python_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.PythonReq> $request) async {
    return python($call, await $request);
  }

  $async.Future<$0.PythonResp> python(
      $grpc.ServiceCall call, $0.PythonReq request);
}
