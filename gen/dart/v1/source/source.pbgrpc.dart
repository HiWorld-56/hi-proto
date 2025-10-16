// This is a generated file - do not edit.
//
// Generated from v1/source/source.proto.

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

import 'source.pb.dart' as $0;

export 'source.pb.dart';

/// TODO: 添加流式接口
@$pb.GrpcServiceName('source.FileManager')
class FileManagerClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  FileManagerClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.UploadResp> upload(
    $0.UploadReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$upload, request, options: options);
  }

  $grpc.ResponseFuture<$0.DownloadResp> download(
    $0.DownloadReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$download, request, options: options);
  }

  // method descriptors

  static final _$upload = $grpc.ClientMethod<$0.UploadReq, $0.UploadResp>(
      '/source.FileManager/Upload',
      ($0.UploadReq value) => value.writeToBuffer(),
      $0.UploadResp.fromBuffer);
  static final _$download = $grpc.ClientMethod<$0.DownloadReq, $0.DownloadResp>(
      '/source.FileManager/Download',
      ($0.DownloadReq value) => value.writeToBuffer(),
      $0.DownloadResp.fromBuffer);
}

@$pb.GrpcServiceName('source.FileManager')
abstract class FileManagerServiceBase extends $grpc.Service {
  $core.String get $name => 'source.FileManager';

  FileManagerServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.UploadReq, $0.UploadResp>(
        'Upload',
        upload_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UploadReq.fromBuffer(value),
        ($0.UploadResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DownloadReq, $0.DownloadResp>(
        'Download',
        download_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DownloadReq.fromBuffer(value),
        ($0.DownloadResp value) => value.writeToBuffer()));
  }

  $async.Future<$0.UploadResp> upload_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.UploadReq> $request) async {
    return upload($call, await $request);
  }

  $async.Future<$0.UploadResp> upload(
      $grpc.ServiceCall call, $0.UploadReq request);

  $async.Future<$0.DownloadResp> download_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.DownloadReq> $request) async {
    return download($call, await $request);
  }

  $async.Future<$0.DownloadResp> download(
      $grpc.ServiceCall call, $0.DownloadReq request);
}
