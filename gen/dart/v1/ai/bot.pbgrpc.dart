// This is a generated file - do not edit.
//
// Generated from v1/ai/bot.proto.

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
import 'bot.pb.dart' as $1;

export 'bot.pb.dart';

/// apiKey鉴权
@$pb.GrpcServiceName('ai.Bot')
class BotClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  BotClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.LLMModelsResp> lLMModels(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$lLMModels, request, options: options);
  }

  $grpc.ResponseFuture<$1.EmbeddingModelsResp> embeddingModels(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$embeddingModels, request, options: options);
  }

  $grpc.ResponseFuture<$1.AudioModelsResp> audioModels(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$audioModels, request, options: options);
  }

  $grpc.ResponseFuture<$1.TextModelsResp> textModels(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$textModels, request, options: options);
  }

  $grpc.ResponseFuture<$1.BotConfigResp> botConfig(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$botConfig, request, options: options);
  }

  $grpc.ResponseFuture<$1.CreateBotResp> createBot(
    $1.CreateBotReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createBot, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> editBot(
    $1.EditBotReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$editBot, request, options: options);
  }

  $grpc.ResponseFuture<$1.ListBotResp> listBot(
    $2.Pagination request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listBot, request, options: options);
  }

  $grpc.ResponseFuture<$1.ListBotByDidsResp> listBotByDids(
    $1.ListBotByDidsReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listBotByDids, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> deleteBot(
    $1.DeleteBotReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteBot, request, options: options);
  }

  $grpc.ResponseFuture<$1.FindBotResp> findBot(
    $1.FindBotReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$findBot, request, options: options);
  }

  $grpc.ResponseFuture<$1.FindBotCountResp> findBotCount(
    $1.FindBotCountReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$findBotCount, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> transfer(
    $1.TransferReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$transfer, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> bindApikey(
    $1.BindApikeyReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$bindApikey, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> updatesToDefault(
    $1.UpdatesToDefaultReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updatesToDefault, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> favoriteBot(
    $1.FavoriteBotReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$favoriteBot, request, options: options);
  }

  $grpc.ResponseFuture<$1.FavoriteBotListResp> favoriteBotList(
    $1.FavoriteBotListReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$favoriteBotList, request, options: options);
  }

  $grpc.ResponseFuture<$1.FavoriteBotListByDIDsResp> favoriteBotListByDIDs(
    $1.FavoriteBotListByDIDsReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$favoriteBotListByDIDs, request, options: options);
  }

  // method descriptors

  static final _$lLMModels = $grpc.ClientMethod<$0.Empty, $1.LLMModelsResp>(
      '/ai.Bot/LLMModels',
      ($0.Empty value) => value.writeToBuffer(),
      $1.LLMModelsResp.fromBuffer);
  static final _$embeddingModels =
      $grpc.ClientMethod<$0.Empty, $1.EmbeddingModelsResp>(
          '/ai.Bot/EmbeddingModels',
          ($0.Empty value) => value.writeToBuffer(),
          $1.EmbeddingModelsResp.fromBuffer);
  static final _$audioModels = $grpc.ClientMethod<$0.Empty, $1.AudioModelsResp>(
      '/ai.Bot/AudioModels',
      ($0.Empty value) => value.writeToBuffer(),
      $1.AudioModelsResp.fromBuffer);
  static final _$textModels = $grpc.ClientMethod<$0.Empty, $1.TextModelsResp>(
      '/ai.Bot/TextModels',
      ($0.Empty value) => value.writeToBuffer(),
      $1.TextModelsResp.fromBuffer);
  static final _$botConfig = $grpc.ClientMethod<$0.Empty, $1.BotConfigResp>(
      '/ai.Bot/BotConfig',
      ($0.Empty value) => value.writeToBuffer(),
      $1.BotConfigResp.fromBuffer);
  static final _$createBot =
      $grpc.ClientMethod<$1.CreateBotReq, $1.CreateBotResp>(
          '/ai.Bot/CreateBot',
          ($1.CreateBotReq value) => value.writeToBuffer(),
          $1.CreateBotResp.fromBuffer);
  static final _$editBot = $grpc.ClientMethod<$1.EditBotReq, $0.Empty>(
      '/ai.Bot/EditBot',
      ($1.EditBotReq value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
  static final _$listBot = $grpc.ClientMethod<$2.Pagination, $1.ListBotResp>(
      '/ai.Bot/ListBot',
      ($2.Pagination value) => value.writeToBuffer(),
      $1.ListBotResp.fromBuffer);
  static final _$listBotByDids =
      $grpc.ClientMethod<$1.ListBotByDidsReq, $1.ListBotByDidsResp>(
          '/ai.Bot/ListBotByDids',
          ($1.ListBotByDidsReq value) => value.writeToBuffer(),
          $1.ListBotByDidsResp.fromBuffer);
  static final _$deleteBot = $grpc.ClientMethod<$1.DeleteBotReq, $0.Empty>(
      '/ai.Bot/DeleteBot',
      ($1.DeleteBotReq value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
  static final _$findBot = $grpc.ClientMethod<$1.FindBotReq, $1.FindBotResp>(
      '/ai.Bot/FindBot',
      ($1.FindBotReq value) => value.writeToBuffer(),
      $1.FindBotResp.fromBuffer);
  static final _$findBotCount =
      $grpc.ClientMethod<$1.FindBotCountReq, $1.FindBotCountResp>(
          '/ai.Bot/FindBotCount',
          ($1.FindBotCountReq value) => value.writeToBuffer(),
          $1.FindBotCountResp.fromBuffer);
  static final _$transfer = $grpc.ClientMethod<$1.TransferReq, $0.Empty>(
      '/ai.Bot/Transfer',
      ($1.TransferReq value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
  static final _$bindApikey = $grpc.ClientMethod<$1.BindApikeyReq, $0.Empty>(
      '/ai.Bot/BindApikey',
      ($1.BindApikeyReq value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
  static final _$updatesToDefault =
      $grpc.ClientMethod<$1.UpdatesToDefaultReq, $0.Empty>(
          '/ai.Bot/UpdatesToDefault',
          ($1.UpdatesToDefaultReq value) => value.writeToBuffer(),
          $0.Empty.fromBuffer);
  static final _$favoriteBot = $grpc.ClientMethod<$1.FavoriteBotReq, $0.Empty>(
      '/ai.Bot/FavoriteBot',
      ($1.FavoriteBotReq value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
  static final _$favoriteBotList =
      $grpc.ClientMethod<$1.FavoriteBotListReq, $1.FavoriteBotListResp>(
          '/ai.Bot/FavoriteBotList',
          ($1.FavoriteBotListReq value) => value.writeToBuffer(),
          $1.FavoriteBotListResp.fromBuffer);
  static final _$favoriteBotListByDIDs = $grpc.ClientMethod<
          $1.FavoriteBotListByDIDsReq, $1.FavoriteBotListByDIDsResp>(
      '/ai.Bot/FavoriteBotListByDIDs',
      ($1.FavoriteBotListByDIDsReq value) => value.writeToBuffer(),
      $1.FavoriteBotListByDIDsResp.fromBuffer);
}

@$pb.GrpcServiceName('ai.Bot')
abstract class BotServiceBase extends $grpc.Service {
  $core.String get $name => 'ai.Bot';

  BotServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.LLMModelsResp>(
        'LLMModels',
        lLMModels_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.LLMModelsResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.EmbeddingModelsResp>(
        'EmbeddingModels',
        embeddingModels_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.EmbeddingModelsResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.AudioModelsResp>(
        'AudioModels',
        audioModels_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.AudioModelsResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.TextModelsResp>(
        'TextModels',
        textModels_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.TextModelsResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.BotConfigResp>(
        'BotConfig',
        botConfig_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.BotConfigResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.CreateBotReq, $1.CreateBotResp>(
        'CreateBot',
        createBot_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.CreateBotReq.fromBuffer(value),
        ($1.CreateBotResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.EditBotReq, $0.Empty>(
        'EditBot',
        editBot_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.EditBotReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Pagination, $1.ListBotResp>(
        'ListBot',
        listBot_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Pagination.fromBuffer(value),
        ($1.ListBotResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ListBotByDidsReq, $1.ListBotByDidsResp>(
        'ListBotByDids',
        listBotByDids_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.ListBotByDidsReq.fromBuffer(value),
        ($1.ListBotByDidsResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.DeleteBotReq, $0.Empty>(
        'DeleteBot',
        deleteBot_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.DeleteBotReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.FindBotReq, $1.FindBotResp>(
        'FindBot',
        findBot_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.FindBotReq.fromBuffer(value),
        ($1.FindBotResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.FindBotCountReq, $1.FindBotCountResp>(
        'FindBotCount',
        findBotCount_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.FindBotCountReq.fromBuffer(value),
        ($1.FindBotCountResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.TransferReq, $0.Empty>(
        'Transfer',
        transfer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.TransferReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.BindApikeyReq, $0.Empty>(
        'BindApikey',
        bindApikey_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.BindApikeyReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.UpdatesToDefaultReq, $0.Empty>(
        'UpdatesToDefault',
        updatesToDefault_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.UpdatesToDefaultReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.FavoriteBotReq, $0.Empty>(
        'FavoriteBot',
        favoriteBot_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.FavoriteBotReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.FavoriteBotListReq, $1.FavoriteBotListResp>(
            'FavoriteBotList',
            favoriteBotList_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.FavoriteBotListReq.fromBuffer(value),
            ($1.FavoriteBotListResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.FavoriteBotListByDIDsReq,
            $1.FavoriteBotListByDIDsResp>(
        'FavoriteBotListByDIDs',
        favoriteBotListByDIDs_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.FavoriteBotListByDIDsReq.fromBuffer(value),
        ($1.FavoriteBotListByDIDsResp value) => value.writeToBuffer()));
  }

  $async.Future<$1.LLMModelsResp> lLMModels_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return lLMModels($call, await $request);
  }

  $async.Future<$1.LLMModelsResp> lLMModels(
      $grpc.ServiceCall call, $0.Empty request);

  $async.Future<$1.EmbeddingModelsResp> embeddingModels_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return embeddingModels($call, await $request);
  }

  $async.Future<$1.EmbeddingModelsResp> embeddingModels(
      $grpc.ServiceCall call, $0.Empty request);

  $async.Future<$1.AudioModelsResp> audioModels_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return audioModels($call, await $request);
  }

  $async.Future<$1.AudioModelsResp> audioModels(
      $grpc.ServiceCall call, $0.Empty request);

  $async.Future<$1.TextModelsResp> textModels_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return textModels($call, await $request);
  }

  $async.Future<$1.TextModelsResp> textModels(
      $grpc.ServiceCall call, $0.Empty request);

  $async.Future<$1.BotConfigResp> botConfig_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return botConfig($call, await $request);
  }

  $async.Future<$1.BotConfigResp> botConfig(
      $grpc.ServiceCall call, $0.Empty request);

  $async.Future<$1.CreateBotResp> createBot_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.CreateBotReq> $request) async {
    return createBot($call, await $request);
  }

  $async.Future<$1.CreateBotResp> createBot(
      $grpc.ServiceCall call, $1.CreateBotReq request);

  $async.Future<$0.Empty> editBot_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.EditBotReq> $request) async {
    return editBot($call, await $request);
  }

  $async.Future<$0.Empty> editBot(
      $grpc.ServiceCall call, $1.EditBotReq request);

  $async.Future<$1.ListBotResp> listBot_Pre(
      $grpc.ServiceCall $call, $async.Future<$2.Pagination> $request) async {
    return listBot($call, await $request);
  }

  $async.Future<$1.ListBotResp> listBot(
      $grpc.ServiceCall call, $2.Pagination request);

  $async.Future<$1.ListBotByDidsResp> listBotByDids_Pre($grpc.ServiceCall $call,
      $async.Future<$1.ListBotByDidsReq> $request) async {
    return listBotByDids($call, await $request);
  }

  $async.Future<$1.ListBotByDidsResp> listBotByDids(
      $grpc.ServiceCall call, $1.ListBotByDidsReq request);

  $async.Future<$0.Empty> deleteBot_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.DeleteBotReq> $request) async {
    return deleteBot($call, await $request);
  }

  $async.Future<$0.Empty> deleteBot(
      $grpc.ServiceCall call, $1.DeleteBotReq request);

  $async.Future<$1.FindBotResp> findBot_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.FindBotReq> $request) async {
    return findBot($call, await $request);
  }

  $async.Future<$1.FindBotResp> findBot(
      $grpc.ServiceCall call, $1.FindBotReq request);

  $async.Future<$1.FindBotCountResp> findBotCount_Pre($grpc.ServiceCall $call,
      $async.Future<$1.FindBotCountReq> $request) async {
    return findBotCount($call, await $request);
  }

  $async.Future<$1.FindBotCountResp> findBotCount(
      $grpc.ServiceCall call, $1.FindBotCountReq request);

  $async.Future<$0.Empty> transfer_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.TransferReq> $request) async {
    return transfer($call, await $request);
  }

  $async.Future<$0.Empty> transfer(
      $grpc.ServiceCall call, $1.TransferReq request);

  $async.Future<$0.Empty> bindApikey_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.BindApikeyReq> $request) async {
    return bindApikey($call, await $request);
  }

  $async.Future<$0.Empty> bindApikey(
      $grpc.ServiceCall call, $1.BindApikeyReq request);

  $async.Future<$0.Empty> updatesToDefault_Pre($grpc.ServiceCall $call,
      $async.Future<$1.UpdatesToDefaultReq> $request) async {
    return updatesToDefault($call, await $request);
  }

  $async.Future<$0.Empty> updatesToDefault(
      $grpc.ServiceCall call, $1.UpdatesToDefaultReq request);

  $async.Future<$0.Empty> favoriteBot_Pre($grpc.ServiceCall $call,
      $async.Future<$1.FavoriteBotReq> $request) async {
    return favoriteBot($call, await $request);
  }

  $async.Future<$0.Empty> favoriteBot(
      $grpc.ServiceCall call, $1.FavoriteBotReq request);

  $async.Future<$1.FavoriteBotListResp> favoriteBotList_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$1.FavoriteBotListReq> $request) async {
    return favoriteBotList($call, await $request);
  }

  $async.Future<$1.FavoriteBotListResp> favoriteBotList(
      $grpc.ServiceCall call, $1.FavoriteBotListReq request);

  $async.Future<$1.FavoriteBotListByDIDsResp> favoriteBotListByDIDs_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$1.FavoriteBotListByDIDsReq> $request) async {
    return favoriteBotListByDIDs($call, await $request);
  }

  $async.Future<$1.FavoriteBotListByDIDsResp> favoriteBotListByDIDs(
      $grpc.ServiceCall call, $1.FavoriteBotListByDIDsReq request);
}

/// apiKey鉴权
@$pb.GrpcServiceName('ai.BotTraining')
class BotTrainingClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  BotTrainingClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.Empty> trainingBot(
    $1.TrainingBotReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$trainingBot, request, options: options);
  }

  $grpc.ResponseFuture<$1.TrainingStatusResp> trainingStatus(
    $1.TrainingStatusReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$trainingStatus, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> trainingClear(
    $1.TrainingClearReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$trainingClear, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> createBotFile(
    $1.CreateBotFileReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createBotFile, request, options: options);
  }

  $grpc.ResponseFuture<$1.ListBotFileResp> listBotFile(
    $1.ListBotFileReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listBotFile, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> deleteBotFile(
    $1.DeleteBotFileReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteBotFile, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> deleteBotFiles(
    $1.DeleteBotFilesReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteBotFiles, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> deleteBotFilesByDid(
    $1.DeleteBotFilesByDidReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteBotFilesByDid, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetBotFileResp> getBotFile(
    $1.GetBotFileReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getBotFile, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> updateContent(
    $1.UpdateCotentReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateContent, request, options: options);
  }

  $grpc.ResponseFuture<$1.CreateCotentResp> createContent(
    $1.CreateCotentReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createContent, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> editDegest(
    $1.EditDigestReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$editDegest, request, options: options);
  }

  // method descriptors

  static final _$trainingBot = $grpc.ClientMethod<$1.TrainingBotReq, $0.Empty>(
      '/ai.BotTraining/TrainingBot',
      ($1.TrainingBotReq value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
  static final _$trainingStatus =
      $grpc.ClientMethod<$1.TrainingStatusReq, $1.TrainingStatusResp>(
          '/ai.BotTraining/TrainingStatus',
          ($1.TrainingStatusReq value) => value.writeToBuffer(),
          $1.TrainingStatusResp.fromBuffer);
  static final _$trainingClear =
      $grpc.ClientMethod<$1.TrainingClearReq, $0.Empty>(
          '/ai.BotTraining/TrainingClear',
          ($1.TrainingClearReq value) => value.writeToBuffer(),
          $0.Empty.fromBuffer);
  static final _$createBotFile =
      $grpc.ClientMethod<$1.CreateBotFileReq, $0.Empty>(
          '/ai.BotTraining/CreateBotFile',
          ($1.CreateBotFileReq value) => value.writeToBuffer(),
          $0.Empty.fromBuffer);
  static final _$listBotFile =
      $grpc.ClientMethod<$1.ListBotFileReq, $1.ListBotFileResp>(
          '/ai.BotTraining/ListBotFile',
          ($1.ListBotFileReq value) => value.writeToBuffer(),
          $1.ListBotFileResp.fromBuffer);
  static final _$deleteBotFile =
      $grpc.ClientMethod<$1.DeleteBotFileReq, $0.Empty>(
          '/ai.BotTraining/DeleteBotFile',
          ($1.DeleteBotFileReq value) => value.writeToBuffer(),
          $0.Empty.fromBuffer);
  static final _$deleteBotFiles =
      $grpc.ClientMethod<$1.DeleteBotFilesReq, $0.Empty>(
          '/ai.BotTraining/DeleteBotFiles',
          ($1.DeleteBotFilesReq value) => value.writeToBuffer(),
          $0.Empty.fromBuffer);
  static final _$deleteBotFilesByDid =
      $grpc.ClientMethod<$1.DeleteBotFilesByDidReq, $0.Empty>(
          '/ai.BotTraining/DeleteBotFilesByDid',
          ($1.DeleteBotFilesByDidReq value) => value.writeToBuffer(),
          $0.Empty.fromBuffer);
  static final _$getBotFile =
      $grpc.ClientMethod<$1.GetBotFileReq, $1.GetBotFileResp>(
          '/ai.BotTraining/GetBotFile',
          ($1.GetBotFileReq value) => value.writeToBuffer(),
          $1.GetBotFileResp.fromBuffer);
  static final _$updateContent =
      $grpc.ClientMethod<$1.UpdateCotentReq, $0.Empty>(
          '/ai.BotTraining/UpdateContent',
          ($1.UpdateCotentReq value) => value.writeToBuffer(),
          $0.Empty.fromBuffer);
  static final _$createContent =
      $grpc.ClientMethod<$1.CreateCotentReq, $1.CreateCotentResp>(
          '/ai.BotTraining/CreateContent',
          ($1.CreateCotentReq value) => value.writeToBuffer(),
          $1.CreateCotentResp.fromBuffer);
  static final _$editDegest = $grpc.ClientMethod<$1.EditDigestReq, $0.Empty>(
      '/ai.BotTraining/EditDegest',
      ($1.EditDigestReq value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
}

@$pb.GrpcServiceName('ai.BotTraining')
abstract class BotTrainingServiceBase extends $grpc.Service {
  $core.String get $name => 'ai.BotTraining';

  BotTrainingServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.TrainingBotReq, $0.Empty>(
        'TrainingBot',
        trainingBot_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.TrainingBotReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.TrainingStatusReq, $1.TrainingStatusResp>(
        'TrainingStatus',
        trainingStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.TrainingStatusReq.fromBuffer(value),
        ($1.TrainingStatusResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.TrainingClearReq, $0.Empty>(
        'TrainingClear',
        trainingClear_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.TrainingClearReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.CreateBotFileReq, $0.Empty>(
        'CreateBotFile',
        createBotFile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.CreateBotFileReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ListBotFileReq, $1.ListBotFileResp>(
        'ListBotFile',
        listBotFile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.ListBotFileReq.fromBuffer(value),
        ($1.ListBotFileResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.DeleteBotFileReq, $0.Empty>(
        'DeleteBotFile',
        deleteBotFile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.DeleteBotFileReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.DeleteBotFilesReq, $0.Empty>(
        'DeleteBotFiles',
        deleteBotFiles_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.DeleteBotFilesReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.DeleteBotFilesByDidReq, $0.Empty>(
        'DeleteBotFilesByDid',
        deleteBotFilesByDid_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.DeleteBotFilesByDidReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetBotFileReq, $1.GetBotFileResp>(
        'GetBotFile',
        getBotFile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetBotFileReq.fromBuffer(value),
        ($1.GetBotFileResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.UpdateCotentReq, $0.Empty>(
        'UpdateContent',
        updateContent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.UpdateCotentReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.CreateCotentReq, $1.CreateCotentResp>(
        'CreateContent',
        createContent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.CreateCotentReq.fromBuffer(value),
        ($1.CreateCotentResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.EditDigestReq, $0.Empty>(
        'EditDegest',
        editDegest_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.EditDigestReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$0.Empty> trainingBot_Pre($grpc.ServiceCall $call,
      $async.Future<$1.TrainingBotReq> $request) async {
    return trainingBot($call, await $request);
  }

  $async.Future<$0.Empty> trainingBot(
      $grpc.ServiceCall call, $1.TrainingBotReq request);

  $async.Future<$1.TrainingStatusResp> trainingStatus_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$1.TrainingStatusReq> $request) async {
    return trainingStatus($call, await $request);
  }

  $async.Future<$1.TrainingStatusResp> trainingStatus(
      $grpc.ServiceCall call, $1.TrainingStatusReq request);

  $async.Future<$0.Empty> trainingClear_Pre($grpc.ServiceCall $call,
      $async.Future<$1.TrainingClearReq> $request) async {
    return trainingClear($call, await $request);
  }

  $async.Future<$0.Empty> trainingClear(
      $grpc.ServiceCall call, $1.TrainingClearReq request);

  $async.Future<$0.Empty> createBotFile_Pre($grpc.ServiceCall $call,
      $async.Future<$1.CreateBotFileReq> $request) async {
    return createBotFile($call, await $request);
  }

  $async.Future<$0.Empty> createBotFile(
      $grpc.ServiceCall call, $1.CreateBotFileReq request);

  $async.Future<$1.ListBotFileResp> listBotFile_Pre($grpc.ServiceCall $call,
      $async.Future<$1.ListBotFileReq> $request) async {
    return listBotFile($call, await $request);
  }

  $async.Future<$1.ListBotFileResp> listBotFile(
      $grpc.ServiceCall call, $1.ListBotFileReq request);

  $async.Future<$0.Empty> deleteBotFile_Pre($grpc.ServiceCall $call,
      $async.Future<$1.DeleteBotFileReq> $request) async {
    return deleteBotFile($call, await $request);
  }

  $async.Future<$0.Empty> deleteBotFile(
      $grpc.ServiceCall call, $1.DeleteBotFileReq request);

  $async.Future<$0.Empty> deleteBotFiles_Pre($grpc.ServiceCall $call,
      $async.Future<$1.DeleteBotFilesReq> $request) async {
    return deleteBotFiles($call, await $request);
  }

  $async.Future<$0.Empty> deleteBotFiles(
      $grpc.ServiceCall call, $1.DeleteBotFilesReq request);

  $async.Future<$0.Empty> deleteBotFilesByDid_Pre($grpc.ServiceCall $call,
      $async.Future<$1.DeleteBotFilesByDidReq> $request) async {
    return deleteBotFilesByDid($call, await $request);
  }

  $async.Future<$0.Empty> deleteBotFilesByDid(
      $grpc.ServiceCall call, $1.DeleteBotFilesByDidReq request);

  $async.Future<$1.GetBotFileResp> getBotFile_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.GetBotFileReq> $request) async {
    return getBotFile($call, await $request);
  }

  $async.Future<$1.GetBotFileResp> getBotFile(
      $grpc.ServiceCall call, $1.GetBotFileReq request);

  $async.Future<$0.Empty> updateContent_Pre($grpc.ServiceCall $call,
      $async.Future<$1.UpdateCotentReq> $request) async {
    return updateContent($call, await $request);
  }

  $async.Future<$0.Empty> updateContent(
      $grpc.ServiceCall call, $1.UpdateCotentReq request);

  $async.Future<$1.CreateCotentResp> createContent_Pre($grpc.ServiceCall $call,
      $async.Future<$1.CreateCotentReq> $request) async {
    return createContent($call, await $request);
  }

  $async.Future<$1.CreateCotentResp> createContent(
      $grpc.ServiceCall call, $1.CreateCotentReq request);

  $async.Future<$0.Empty> editDegest_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.EditDigestReq> $request) async {
    return editDegest($call, await $request);
  }

  $async.Future<$0.Empty> editDegest(
      $grpc.ServiceCall call, $1.EditDigestReq request);
}

/// apiKey鉴权
@$pb.GrpcServiceName('ai.BotPlugin')
class BotPluginClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  BotPluginClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.DrawConfigResp> drawConfig(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$drawConfig, request, options: options);
  }

  $grpc.ResponseFuture<$1.NamesResp> names(
    $1.NamesReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$names, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> create(
    $1.CreateBotPluginReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$create, request, options: options);
  }

  $grpc.ResponseFuture<$1.BotPluginListResp> list(
    $1.BotPluginListReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$list, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> delete(
    $1.DeleteBotPluginReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$delete, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> deleteByDids(
    $1.DeleteBotPluginByDidsReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteByDids, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> edit(
    $1.EditBotPluginReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$edit, request, options: options);
  }

  // method descriptors

  static final _$drawConfig = $grpc.ClientMethod<$0.Empty, $1.DrawConfigResp>(
      '/ai.BotPlugin/DrawConfig',
      ($0.Empty value) => value.writeToBuffer(),
      $1.DrawConfigResp.fromBuffer);
  static final _$names = $grpc.ClientMethod<$1.NamesReq, $1.NamesResp>(
      '/ai.BotPlugin/Names',
      ($1.NamesReq value) => value.writeToBuffer(),
      $1.NamesResp.fromBuffer);
  static final _$create = $grpc.ClientMethod<$1.CreateBotPluginReq, $0.Empty>(
      '/ai.BotPlugin/Create',
      ($1.CreateBotPluginReq value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
  static final _$list =
      $grpc.ClientMethod<$1.BotPluginListReq, $1.BotPluginListResp>(
          '/ai.BotPlugin/List',
          ($1.BotPluginListReq value) => value.writeToBuffer(),
          $1.BotPluginListResp.fromBuffer);
  static final _$delete = $grpc.ClientMethod<$1.DeleteBotPluginReq, $0.Empty>(
      '/ai.BotPlugin/Delete',
      ($1.DeleteBotPluginReq value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
  static final _$deleteByDids =
      $grpc.ClientMethod<$1.DeleteBotPluginByDidsReq, $0.Empty>(
          '/ai.BotPlugin/DeleteByDids',
          ($1.DeleteBotPluginByDidsReq value) => value.writeToBuffer(),
          $0.Empty.fromBuffer);
  static final _$edit = $grpc.ClientMethod<$1.EditBotPluginReq, $0.Empty>(
      '/ai.BotPlugin/Edit',
      ($1.EditBotPluginReq value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
}

@$pb.GrpcServiceName('ai.BotPlugin')
abstract class BotPluginServiceBase extends $grpc.Service {
  $core.String get $name => 'ai.BotPlugin';

  BotPluginServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.DrawConfigResp>(
        'DrawConfig',
        drawConfig_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.DrawConfigResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.NamesReq, $1.NamesResp>(
        'Names',
        names_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.NamesReq.fromBuffer(value),
        ($1.NamesResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.CreateBotPluginReq, $0.Empty>(
        'Create',
        create_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.CreateBotPluginReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.BotPluginListReq, $1.BotPluginListResp>(
        'List',
        list_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.BotPluginListReq.fromBuffer(value),
        ($1.BotPluginListResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.DeleteBotPluginReq, $0.Empty>(
        'Delete',
        delete_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.DeleteBotPluginReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.DeleteBotPluginByDidsReq, $0.Empty>(
        'DeleteByDids',
        deleteByDids_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.DeleteBotPluginByDidsReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.EditBotPluginReq, $0.Empty>(
        'Edit',
        edit_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.EditBotPluginReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$1.DrawConfigResp> drawConfig_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return drawConfig($call, await $request);
  }

  $async.Future<$1.DrawConfigResp> drawConfig(
      $grpc.ServiceCall call, $0.Empty request);

  $async.Future<$1.NamesResp> names_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.NamesReq> $request) async {
    return names($call, await $request);
  }

  $async.Future<$1.NamesResp> names(
      $grpc.ServiceCall call, $1.NamesReq request);

  $async.Future<$0.Empty> create_Pre($grpc.ServiceCall $call,
      $async.Future<$1.CreateBotPluginReq> $request) async {
    return create($call, await $request);
  }

  $async.Future<$0.Empty> create(
      $grpc.ServiceCall call, $1.CreateBotPluginReq request);

  $async.Future<$1.BotPluginListResp> list_Pre($grpc.ServiceCall $call,
      $async.Future<$1.BotPluginListReq> $request) async {
    return list($call, await $request);
  }

  $async.Future<$1.BotPluginListResp> list(
      $grpc.ServiceCall call, $1.BotPluginListReq request);

  $async.Future<$0.Empty> delete_Pre($grpc.ServiceCall $call,
      $async.Future<$1.DeleteBotPluginReq> $request) async {
    return delete($call, await $request);
  }

  $async.Future<$0.Empty> delete(
      $grpc.ServiceCall call, $1.DeleteBotPluginReq request);

  $async.Future<$0.Empty> deleteByDids_Pre($grpc.ServiceCall $call,
      $async.Future<$1.DeleteBotPluginByDidsReq> $request) async {
    return deleteByDids($call, await $request);
  }

  $async.Future<$0.Empty> deleteByDids(
      $grpc.ServiceCall call, $1.DeleteBotPluginByDidsReq request);

  $async.Future<$0.Empty> edit_Pre($grpc.ServiceCall $call,
      $async.Future<$1.EditBotPluginReq> $request) async {
    return edit($call, await $request);
  }

  $async.Future<$0.Empty> edit(
      $grpc.ServiceCall call, $1.EditBotPluginReq request);
}
