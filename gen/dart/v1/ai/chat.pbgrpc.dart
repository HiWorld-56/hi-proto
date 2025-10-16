// This is a generated file - do not edit.
//
// Generated from v1/ai/chat.proto.

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
import 'chat.pb.dart' as $1;

export 'chat.pb.dart';

/// apiKey鉴权
@$pb.GrpcServiceName('ai.Chat')
class ChatClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  ChatClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.GenerateCidResp> generateCid(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$generateCid, request, options: options);
  }

  $grpc.ResponseFuture<$1.DialogResp> dialog(
    $1.DialogReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$dialog, request, options: options);
  }

  $grpc.ResponseStream<$1.DialogStreamResp> dialogStream(
    $1.DialogStreamReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createStreamingCall(
        _$dialogStream, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.Empty> clearContext(
    $1.ClearContextReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$clearContext, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetContextResp> getContext(
    $1.GetContextReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getContext, request, options: options);
  }

  $grpc.ResponseFuture<$1.SpeechToSpeechResp> speechToSpeech(
    $1.SpeechToSpeechReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$speechToSpeech, request, options: options);
  }

  $grpc.ResponseFuture<$1.SpeechToSpeechResp> speechToSpeechResults(
    $1.CallToolsReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$speechToSpeechResults, request, options: options);
  }

  $grpc.ResponseFuture<$1.TextToTextResp> textToText(
    $1.TextToTextReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$textToText, request, options: options);
  }

  $grpc.ResponseFuture<$1.TextToTextResp> textToTextToolResults(
    $1.CallToolsReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$textToTextToolResults, request, options: options);
  }

  $grpc.ResponseFuture<$1.TextToSpeechResp> textToSpeech(
    $1.TextToSpeechReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$textToSpeech, request, options: options);
  }

  $grpc.ResponseFuture<$1.SpeechToTextResp> speechToText(
    $1.SpeechToTextReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$speechToText, request, options: options);
  }

  $grpc.ResponseFuture<$1.MultiModalDialogResp> multiModalDialog(
    $1.MultiModalDialogReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$multiModalDialog, request, options: options);
  }

  $grpc.ResponseFuture<$1.MultiModalDialogToolCallsResp>
      multiModalDialogToolCalls(
    $1.MultiModalDialogToolCallsReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$multiModalDialogToolCalls, request,
        options: options);
  }

  // method descriptors

  static final _$generateCid = $grpc.ClientMethod<$0.Empty, $1.GenerateCidResp>(
      '/ai.Chat/GenerateCid',
      ($0.Empty value) => value.writeToBuffer(),
      $1.GenerateCidResp.fromBuffer);
  static final _$dialog = $grpc.ClientMethod<$1.DialogReq, $1.DialogResp>(
      '/ai.Chat/Dialog',
      ($1.DialogReq value) => value.writeToBuffer(),
      $1.DialogResp.fromBuffer);
  static final _$dialogStream =
      $grpc.ClientMethod<$1.DialogStreamReq, $1.DialogStreamResp>(
          '/ai.Chat/DialogStream',
          ($1.DialogStreamReq value) => value.writeToBuffer(),
          $1.DialogStreamResp.fromBuffer);
  static final _$clearContext =
      $grpc.ClientMethod<$1.ClearContextReq, $0.Empty>(
          '/ai.Chat/ClearContext',
          ($1.ClearContextReq value) => value.writeToBuffer(),
          $0.Empty.fromBuffer);
  static final _$getContext =
      $grpc.ClientMethod<$1.GetContextReq, $1.GetContextResp>(
          '/ai.Chat/GetContext',
          ($1.GetContextReq value) => value.writeToBuffer(),
          $1.GetContextResp.fromBuffer);
  static final _$speechToSpeech =
      $grpc.ClientMethod<$1.SpeechToSpeechReq, $1.SpeechToSpeechResp>(
          '/ai.Chat/SpeechToSpeech',
          ($1.SpeechToSpeechReq value) => value.writeToBuffer(),
          $1.SpeechToSpeechResp.fromBuffer);
  static final _$speechToSpeechResults =
      $grpc.ClientMethod<$1.CallToolsReq, $1.SpeechToSpeechResp>(
          '/ai.Chat/SpeechToSpeechResults',
          ($1.CallToolsReq value) => value.writeToBuffer(),
          $1.SpeechToSpeechResp.fromBuffer);
  static final _$textToText =
      $grpc.ClientMethod<$1.TextToTextReq, $1.TextToTextResp>(
          '/ai.Chat/TextToText',
          ($1.TextToTextReq value) => value.writeToBuffer(),
          $1.TextToTextResp.fromBuffer);
  static final _$textToTextToolResults =
      $grpc.ClientMethod<$1.CallToolsReq, $1.TextToTextResp>(
          '/ai.Chat/TextToTextToolResults',
          ($1.CallToolsReq value) => value.writeToBuffer(),
          $1.TextToTextResp.fromBuffer);
  static final _$textToSpeech =
      $grpc.ClientMethod<$1.TextToSpeechReq, $1.TextToSpeechResp>(
          '/ai.Chat/TextToSpeech',
          ($1.TextToSpeechReq value) => value.writeToBuffer(),
          $1.TextToSpeechResp.fromBuffer);
  static final _$speechToText =
      $grpc.ClientMethod<$1.SpeechToTextReq, $1.SpeechToTextResp>(
          '/ai.Chat/SpeechToText',
          ($1.SpeechToTextReq value) => value.writeToBuffer(),
          $1.SpeechToTextResp.fromBuffer);
  static final _$multiModalDialog =
      $grpc.ClientMethod<$1.MultiModalDialogReq, $1.MultiModalDialogResp>(
          '/ai.Chat/MultiModalDialog',
          ($1.MultiModalDialogReq value) => value.writeToBuffer(),
          $1.MultiModalDialogResp.fromBuffer);
  static final _$multiModalDialogToolCalls = $grpc.ClientMethod<
          $1.MultiModalDialogToolCallsReq, $1.MultiModalDialogToolCallsResp>(
      '/ai.Chat/MultiModalDialogToolCalls',
      ($1.MultiModalDialogToolCallsReq value) => value.writeToBuffer(),
      $1.MultiModalDialogToolCallsResp.fromBuffer);
}

@$pb.GrpcServiceName('ai.Chat')
abstract class ChatServiceBase extends $grpc.Service {
  $core.String get $name => 'ai.Chat';

  ChatServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.GenerateCidResp>(
        'GenerateCid',
        generateCid_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.GenerateCidResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.DialogReq, $1.DialogResp>(
        'Dialog',
        dialog_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.DialogReq.fromBuffer(value),
        ($1.DialogResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.DialogStreamReq, $1.DialogStreamResp>(
        'DialogStream',
        dialogStream_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.DialogStreamReq.fromBuffer(value),
        ($1.DialogStreamResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ClearContextReq, $0.Empty>(
        'ClearContext',
        clearContext_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.ClearContextReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetContextReq, $1.GetContextResp>(
        'GetContext',
        getContext_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetContextReq.fromBuffer(value),
        ($1.GetContextResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.SpeechToSpeechReq, $1.SpeechToSpeechResp>(
        'SpeechToSpeech',
        speechToSpeech_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.SpeechToSpeechReq.fromBuffer(value),
        ($1.SpeechToSpeechResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.CallToolsReq, $1.SpeechToSpeechResp>(
        'SpeechToSpeechResults',
        speechToSpeechResults_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.CallToolsReq.fromBuffer(value),
        ($1.SpeechToSpeechResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.TextToTextReq, $1.TextToTextResp>(
        'TextToText',
        textToText_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.TextToTextReq.fromBuffer(value),
        ($1.TextToTextResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.CallToolsReq, $1.TextToTextResp>(
        'TextToTextToolResults',
        textToTextToolResults_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.CallToolsReq.fromBuffer(value),
        ($1.TextToTextResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.TextToSpeechReq, $1.TextToSpeechResp>(
        'TextToSpeech',
        textToSpeech_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.TextToSpeechReq.fromBuffer(value),
        ($1.TextToSpeechResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.SpeechToTextReq, $1.SpeechToTextResp>(
        'SpeechToText',
        speechToText_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.SpeechToTextReq.fromBuffer(value),
        ($1.SpeechToTextResp value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.MultiModalDialogReq, $1.MultiModalDialogResp>(
            'MultiModalDialog',
            multiModalDialog_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.MultiModalDialogReq.fromBuffer(value),
            ($1.MultiModalDialogResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.MultiModalDialogToolCallsReq,
            $1.MultiModalDialogToolCallsResp>(
        'MultiModalDialogToolCalls',
        multiModalDialogToolCalls_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.MultiModalDialogToolCallsReq.fromBuffer(value),
        ($1.MultiModalDialogToolCallsResp value) => value.writeToBuffer()));
  }

  $async.Future<$1.GenerateCidResp> generateCid_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return generateCid($call, await $request);
  }

  $async.Future<$1.GenerateCidResp> generateCid(
      $grpc.ServiceCall call, $0.Empty request);

  $async.Future<$1.DialogResp> dialog_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.DialogReq> $request) async {
    return dialog($call, await $request);
  }

  $async.Future<$1.DialogResp> dialog(
      $grpc.ServiceCall call, $1.DialogReq request);

  $async.Stream<$1.DialogStreamResp> dialogStream_Pre($grpc.ServiceCall $call,
      $async.Future<$1.DialogStreamReq> $request) async* {
    yield* dialogStream($call, await $request);
  }

  $async.Stream<$1.DialogStreamResp> dialogStream(
      $grpc.ServiceCall call, $1.DialogStreamReq request);

  $async.Future<$0.Empty> clearContext_Pre($grpc.ServiceCall $call,
      $async.Future<$1.ClearContextReq> $request) async {
    return clearContext($call, await $request);
  }

  $async.Future<$0.Empty> clearContext(
      $grpc.ServiceCall call, $1.ClearContextReq request);

  $async.Future<$1.GetContextResp> getContext_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.GetContextReq> $request) async {
    return getContext($call, await $request);
  }

  $async.Future<$1.GetContextResp> getContext(
      $grpc.ServiceCall call, $1.GetContextReq request);

  $async.Future<$1.SpeechToSpeechResp> speechToSpeech_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$1.SpeechToSpeechReq> $request) async {
    return speechToSpeech($call, await $request);
  }

  $async.Future<$1.SpeechToSpeechResp> speechToSpeech(
      $grpc.ServiceCall call, $1.SpeechToSpeechReq request);

  $async.Future<$1.SpeechToSpeechResp> speechToSpeechResults_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.CallToolsReq> $request) async {
    return speechToSpeechResults($call, await $request);
  }

  $async.Future<$1.SpeechToSpeechResp> speechToSpeechResults(
      $grpc.ServiceCall call, $1.CallToolsReq request);

  $async.Future<$1.TextToTextResp> textToText_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.TextToTextReq> $request) async {
    return textToText($call, await $request);
  }

  $async.Future<$1.TextToTextResp> textToText(
      $grpc.ServiceCall call, $1.TextToTextReq request);

  $async.Future<$1.TextToTextResp> textToTextToolResults_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.CallToolsReq> $request) async {
    return textToTextToolResults($call, await $request);
  }

  $async.Future<$1.TextToTextResp> textToTextToolResults(
      $grpc.ServiceCall call, $1.CallToolsReq request);

  $async.Future<$1.TextToSpeechResp> textToSpeech_Pre($grpc.ServiceCall $call,
      $async.Future<$1.TextToSpeechReq> $request) async {
    return textToSpeech($call, await $request);
  }

  $async.Future<$1.TextToSpeechResp> textToSpeech(
      $grpc.ServiceCall call, $1.TextToSpeechReq request);

  $async.Future<$1.SpeechToTextResp> speechToText_Pre($grpc.ServiceCall $call,
      $async.Future<$1.SpeechToTextReq> $request) async {
    return speechToText($call, await $request);
  }

  $async.Future<$1.SpeechToTextResp> speechToText(
      $grpc.ServiceCall call, $1.SpeechToTextReq request);

  $async.Future<$1.MultiModalDialogResp> multiModalDialog_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$1.MultiModalDialogReq> $request) async {
    return multiModalDialog($call, await $request);
  }

  $async.Future<$1.MultiModalDialogResp> multiModalDialog(
      $grpc.ServiceCall call, $1.MultiModalDialogReq request);

  $async.Future<$1.MultiModalDialogToolCallsResp> multiModalDialogToolCalls_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$1.MultiModalDialogToolCallsReq> $request) async {
    return multiModalDialogToolCalls($call, await $request);
  }

  $async.Future<$1.MultiModalDialogToolCallsResp> multiModalDialogToolCalls(
      $grpc.ServiceCall call, $1.MultiModalDialogToolCallsReq request);
}
