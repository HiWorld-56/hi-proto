// This is a generated file - do not edit.
//
// Generated from v1/club/chat.proto.

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

@$pb.GrpcServiceName('club.Chat')
class ChatClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  ChatClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.CID> generateCID(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$generateCID, request, options: options);
  }

  $grpc.ResponseFuture<$1.ChatReply> speechToText(
    $1.SpeechToTextParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$speechToText, request, options: options);
  }

  $grpc.ResponseFuture<$1.ChatReply> chat(
    $1.ChatParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$chat, request, options: options);
  }

  $grpc.ResponseStream<$1.ChatReply> stream(
    $1.StreamParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createStreamingCall(_$stream, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.Empty> clearContext(
    $1.CID request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$clearContext, request, options: options);
  }

  $grpc.ResponseFuture<$1.ChatCompletionMessageList> getContext(
    $1.GetContextParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getContext, request, options: options);
  }

  $grpc.ResponseFuture<$1.SpeechToSpeechReply> speechToSpeech(
    $1.SpeechToSpeechParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$speechToSpeech, request, options: options);
  }

  $grpc.ResponseFuture<$1.SpeechToSpeechReply> speechToSpeechCallTools(
    $1.CallToolsParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$speechToSpeechCallTools, request,
        options: options);
  }

  $grpc.ResponseFuture<$1.TextToTextReply> textToText(
    $1.TextToTextParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$textToText, request, options: options);
  }

  $grpc.ResponseFuture<$1.TextToTextReply> textToTextCallTools(
    $1.CallToolsParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$textToTextCallTools, request, options: options);
  }

  // method descriptors

  static final _$generateCID = $grpc.ClientMethod<$0.Empty, $1.CID>(
      '/club.Chat/GenerateCID',
      ($0.Empty value) => value.writeToBuffer(),
      $1.CID.fromBuffer);
  static final _$speechToText =
      $grpc.ClientMethod<$1.SpeechToTextParam, $1.ChatReply>(
          '/club.Chat/SpeechToText',
          ($1.SpeechToTextParam value) => value.writeToBuffer(),
          $1.ChatReply.fromBuffer);
  static final _$chat = $grpc.ClientMethod<$1.ChatParam, $1.ChatReply>(
      '/club.Chat/Chat',
      ($1.ChatParam value) => value.writeToBuffer(),
      $1.ChatReply.fromBuffer);
  static final _$stream = $grpc.ClientMethod<$1.StreamParam, $1.ChatReply>(
      '/club.Chat/Stream',
      ($1.StreamParam value) => value.writeToBuffer(),
      $1.ChatReply.fromBuffer);
  static final _$clearContext = $grpc.ClientMethod<$1.CID, $0.Empty>(
      '/club.Chat/ClearContext',
      ($1.CID value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
  static final _$getContext =
      $grpc.ClientMethod<$1.GetContextParam, $1.ChatCompletionMessageList>(
          '/club.Chat/GetContext',
          ($1.GetContextParam value) => value.writeToBuffer(),
          $1.ChatCompletionMessageList.fromBuffer);
  static final _$speechToSpeech =
      $grpc.ClientMethod<$1.SpeechToSpeechParam, $1.SpeechToSpeechReply>(
          '/club.Chat/SpeechToSpeech',
          ($1.SpeechToSpeechParam value) => value.writeToBuffer(),
          $1.SpeechToSpeechReply.fromBuffer);
  static final _$speechToSpeechCallTools =
      $grpc.ClientMethod<$1.CallToolsParam, $1.SpeechToSpeechReply>(
          '/club.Chat/SpeechToSpeechCallTools',
          ($1.CallToolsParam value) => value.writeToBuffer(),
          $1.SpeechToSpeechReply.fromBuffer);
  static final _$textToText =
      $grpc.ClientMethod<$1.TextToTextParam, $1.TextToTextReply>(
          '/club.Chat/TextToText',
          ($1.TextToTextParam value) => value.writeToBuffer(),
          $1.TextToTextReply.fromBuffer);
  static final _$textToTextCallTools =
      $grpc.ClientMethod<$1.CallToolsParam, $1.TextToTextReply>(
          '/club.Chat/TextToTextCallTools',
          ($1.CallToolsParam value) => value.writeToBuffer(),
          $1.TextToTextReply.fromBuffer);
}

@$pb.GrpcServiceName('club.Chat')
abstract class ChatServiceBase extends $grpc.Service {
  $core.String get $name => 'club.Chat';

  ChatServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.CID>(
        'GenerateCID',
        generateCID_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.CID value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.SpeechToTextParam, $1.ChatReply>(
        'SpeechToText',
        speechToText_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.SpeechToTextParam.fromBuffer(value),
        ($1.ChatReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ChatParam, $1.ChatReply>(
        'Chat',
        chat_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.ChatParam.fromBuffer(value),
        ($1.ChatReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StreamParam, $1.ChatReply>(
        'Stream',
        stream_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.StreamParam.fromBuffer(value),
        ($1.ChatReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.CID, $0.Empty>(
        'ClearContext',
        clearContext_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.CID.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.GetContextParam, $1.ChatCompletionMessageList>(
            'GetContext',
            getContext_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.GetContextParam.fromBuffer(value),
            ($1.ChatCompletionMessageList value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.SpeechToSpeechParam, $1.SpeechToSpeechReply>(
            'SpeechToSpeech',
            speechToSpeech_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.SpeechToSpeechParam.fromBuffer(value),
            ($1.SpeechToSpeechReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.CallToolsParam, $1.SpeechToSpeechReply>(
        'SpeechToSpeechCallTools',
        speechToSpeechCallTools_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.CallToolsParam.fromBuffer(value),
        ($1.SpeechToSpeechReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.TextToTextParam, $1.TextToTextReply>(
        'TextToText',
        textToText_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.TextToTextParam.fromBuffer(value),
        ($1.TextToTextReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.CallToolsParam, $1.TextToTextReply>(
        'TextToTextCallTools',
        textToTextCallTools_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.CallToolsParam.fromBuffer(value),
        ($1.TextToTextReply value) => value.writeToBuffer()));
  }

  $async.Future<$1.CID> generateCID_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return generateCID($call, await $request);
  }

  $async.Future<$1.CID> generateCID($grpc.ServiceCall call, $0.Empty request);

  $async.Future<$1.ChatReply> speechToText_Pre($grpc.ServiceCall $call,
      $async.Future<$1.SpeechToTextParam> $request) async {
    return speechToText($call, await $request);
  }

  $async.Future<$1.ChatReply> speechToText(
      $grpc.ServiceCall call, $1.SpeechToTextParam request);

  $async.Future<$1.ChatReply> chat_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.ChatParam> $request) async {
    return chat($call, await $request);
  }

  $async.Future<$1.ChatReply> chat(
      $grpc.ServiceCall call, $1.ChatParam request);

  $async.Stream<$1.ChatReply> stream_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.StreamParam> $request) async* {
    yield* stream($call, await $request);
  }

  $async.Stream<$1.ChatReply> stream(
      $grpc.ServiceCall call, $1.StreamParam request);

  $async.Future<$0.Empty> clearContext_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.CID> $request) async {
    return clearContext($call, await $request);
  }

  $async.Future<$0.Empty> clearContext($grpc.ServiceCall call, $1.CID request);

  $async.Future<$1.ChatCompletionMessageList> getContext_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$1.GetContextParam> $request) async {
    return getContext($call, await $request);
  }

  $async.Future<$1.ChatCompletionMessageList> getContext(
      $grpc.ServiceCall call, $1.GetContextParam request);

  $async.Future<$1.SpeechToSpeechReply> speechToSpeech_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$1.SpeechToSpeechParam> $request) async {
    return speechToSpeech($call, await $request);
  }

  $async.Future<$1.SpeechToSpeechReply> speechToSpeech(
      $grpc.ServiceCall call, $1.SpeechToSpeechParam request);

  $async.Future<$1.SpeechToSpeechReply> speechToSpeechCallTools_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$1.CallToolsParam> $request) async {
    return speechToSpeechCallTools($call, await $request);
  }

  $async.Future<$1.SpeechToSpeechReply> speechToSpeechCallTools(
      $grpc.ServiceCall call, $1.CallToolsParam request);

  $async.Future<$1.TextToTextReply> textToText_Pre($grpc.ServiceCall $call,
      $async.Future<$1.TextToTextParam> $request) async {
    return textToText($call, await $request);
  }

  $async.Future<$1.TextToTextReply> textToText(
      $grpc.ServiceCall call, $1.TextToTextParam request);

  $async.Future<$1.TextToTextReply> textToTextCallTools_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$1.CallToolsParam> $request) async {
    return textToTextCallTools($call, await $request);
  }

  $async.Future<$1.TextToTextReply> textToTextCallTools(
      $grpc.ServiceCall call, $1.CallToolsParam request);
}
