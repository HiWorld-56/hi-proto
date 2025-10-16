// This is a generated file - do not edit.
//
// Generated from v1/club/bot.proto.

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
import 'bot.pb.dart' as $0;
import 'chat_user.pb.dart' as $2;

export 'bot.pb.dart';

@$pb.GrpcServiceName('club.Bot')
class BotClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  BotClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.BotDID> createBot(
    $0.CreateBotParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createBot, request, options: options);
  }

  $grpc.ResponseFuture<$0.Models> modelList(
    $1.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$modelList, request, options: options);
  }

  $grpc.ResponseFuture<$0.BotInfo> defaultConfig(
    $1.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$defaultConfig, request, options: options);
  }

  $grpc.ResponseFuture<$0.Models> embeddingModelList(
    $1.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$embeddingModelList, request, options: options);
  }

  $grpc.ResponseFuture<$0.AudioModels> audioModelList(
    $1.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$audioModelList, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> updateBot(
    $0.BotInfo request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateBot, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteBot(
    $0.BotDID request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteBot, request, options: options);
  }

  $grpc.ResponseFuture<$0.BotStatisticsInfo> statisticsInfo(
    $0.BotDID request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$statisticsInfo, request, options: options);
  }

  $grpc.ResponseFuture<$2.ChatUserInfo> getBotInfo(
    $0.BotDID request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getBotInfo, request, options: options);
  }

  $grpc.ResponseFuture<$0.BotInfoList> getBotInfoList(
    $0.BotInfoListParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getBotInfoList, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> favoriteBot(
    $0.FavoriteBotParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$favoriteBot, request, options: options);
  }

  $grpc.ResponseFuture<$0.BotInfoList> favoriteBotList(
    $0.BotInfoListParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$favoriteBotList, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> bindMaster(
    $0.BindMasterParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$bindMaster, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> unbindMaster(
    $0.BindMasterParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$unbindMaster, request, options: options);
  }

  $grpc.ResponseFuture<$0.BotBindStatus> bindStatus(
    $0.BindMasterParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$bindStatus, request, options: options);
  }

  // method descriptors

  static final _$createBot = $grpc.ClientMethod<$0.CreateBotParam, $0.BotDID>(
      '/club.Bot/CreateBot',
      ($0.CreateBotParam value) => value.writeToBuffer(),
      $0.BotDID.fromBuffer);
  static final _$modelList = $grpc.ClientMethod<$1.Empty, $0.Models>(
      '/club.Bot/ModelList',
      ($1.Empty value) => value.writeToBuffer(),
      $0.Models.fromBuffer);
  static final _$defaultConfig = $grpc.ClientMethod<$1.Empty, $0.BotInfo>(
      '/club.Bot/DefaultConfig',
      ($1.Empty value) => value.writeToBuffer(),
      $0.BotInfo.fromBuffer);
  static final _$embeddingModelList = $grpc.ClientMethod<$1.Empty, $0.Models>(
      '/club.Bot/EmbeddingModelList',
      ($1.Empty value) => value.writeToBuffer(),
      $0.Models.fromBuffer);
  static final _$audioModelList = $grpc.ClientMethod<$1.Empty, $0.AudioModels>(
      '/club.Bot/AudioModelList',
      ($1.Empty value) => value.writeToBuffer(),
      $0.AudioModels.fromBuffer);
  static final _$updateBot = $grpc.ClientMethod<$0.BotInfo, $1.Empty>(
      '/club.Bot/UpdateBot',
      ($0.BotInfo value) => value.writeToBuffer(),
      $1.Empty.fromBuffer);
  static final _$deleteBot = $grpc.ClientMethod<$0.BotDID, $1.Empty>(
      '/club.Bot/DeleteBot',
      ($0.BotDID value) => value.writeToBuffer(),
      $1.Empty.fromBuffer);
  static final _$statisticsInfo =
      $grpc.ClientMethod<$0.BotDID, $0.BotStatisticsInfo>(
          '/club.Bot/StatisticsInfo',
          ($0.BotDID value) => value.writeToBuffer(),
          $0.BotStatisticsInfo.fromBuffer);
  static final _$getBotInfo = $grpc.ClientMethod<$0.BotDID, $2.ChatUserInfo>(
      '/club.Bot/GetBotInfo',
      ($0.BotDID value) => value.writeToBuffer(),
      $2.ChatUserInfo.fromBuffer);
  static final _$getBotInfoList =
      $grpc.ClientMethod<$0.BotInfoListParam, $0.BotInfoList>(
          '/club.Bot/GetBotInfoList',
          ($0.BotInfoListParam value) => value.writeToBuffer(),
          $0.BotInfoList.fromBuffer);
  static final _$favoriteBot =
      $grpc.ClientMethod<$0.FavoriteBotParam, $1.Empty>(
          '/club.Bot/FavoriteBot',
          ($0.FavoriteBotParam value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$favoriteBotList =
      $grpc.ClientMethod<$0.BotInfoListParam, $0.BotInfoList>(
          '/club.Bot/FavoriteBotList',
          ($0.BotInfoListParam value) => value.writeToBuffer(),
          $0.BotInfoList.fromBuffer);
  static final _$bindMaster = $grpc.ClientMethod<$0.BindMasterParam, $1.Empty>(
      '/club.Bot/BindMaster',
      ($0.BindMasterParam value) => value.writeToBuffer(),
      $1.Empty.fromBuffer);
  static final _$unbindMaster =
      $grpc.ClientMethod<$0.BindMasterParam, $1.Empty>(
          '/club.Bot/UnbindMaster',
          ($0.BindMasterParam value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$bindStatus =
      $grpc.ClientMethod<$0.BindMasterParam, $0.BotBindStatus>(
          '/club.Bot/BindStatus',
          ($0.BindMasterParam value) => value.writeToBuffer(),
          $0.BotBindStatus.fromBuffer);
}

@$pb.GrpcServiceName('club.Bot')
abstract class BotServiceBase extends $grpc.Service {
  $core.String get $name => 'club.Bot';

  BotServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateBotParam, $0.BotDID>(
        'CreateBot',
        createBot_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateBotParam.fromBuffer(value),
        ($0.BotDID value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.Models>(
        'ModelList',
        modelList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.Models value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.BotInfo>(
        'DefaultConfig',
        defaultConfig_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.BotInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.Models>(
        'EmbeddingModelList',
        embeddingModelList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.Models value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.AudioModels>(
        'AudioModelList',
        audioModelList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.AudioModels value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.BotInfo, $1.Empty>(
        'UpdateBot',
        updateBot_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.BotInfo.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.BotDID, $1.Empty>(
        'DeleteBot',
        deleteBot_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.BotDID.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.BotDID, $0.BotStatisticsInfo>(
        'StatisticsInfo',
        statisticsInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.BotDID.fromBuffer(value),
        ($0.BotStatisticsInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.BotDID, $2.ChatUserInfo>(
        'GetBotInfo',
        getBotInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.BotDID.fromBuffer(value),
        ($2.ChatUserInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.BotInfoListParam, $0.BotInfoList>(
        'GetBotInfoList',
        getBotInfoList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.BotInfoListParam.fromBuffer(value),
        ($0.BotInfoList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FavoriteBotParam, $1.Empty>(
        'FavoriteBot',
        favoriteBot_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FavoriteBotParam.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.BotInfoListParam, $0.BotInfoList>(
        'FavoriteBotList',
        favoriteBotList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.BotInfoListParam.fromBuffer(value),
        ($0.BotInfoList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.BindMasterParam, $1.Empty>(
        'BindMaster',
        bindMaster_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.BindMasterParam.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.BindMasterParam, $1.Empty>(
        'UnbindMaster',
        unbindMaster_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.BindMasterParam.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.BindMasterParam, $0.BotBindStatus>(
        'BindStatus',
        bindStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.BindMasterParam.fromBuffer(value),
        ($0.BotBindStatus value) => value.writeToBuffer()));
  }

  $async.Future<$0.BotDID> createBot_Pre($grpc.ServiceCall $call,
      $async.Future<$0.CreateBotParam> $request) async {
    return createBot($call, await $request);
  }

  $async.Future<$0.BotDID> createBot(
      $grpc.ServiceCall call, $0.CreateBotParam request);

  $async.Future<$0.Models> modelList_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.Empty> $request) async {
    return modelList($call, await $request);
  }

  $async.Future<$0.Models> modelList($grpc.ServiceCall call, $1.Empty request);

  $async.Future<$0.BotInfo> defaultConfig_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.Empty> $request) async {
    return defaultConfig($call, await $request);
  }

  $async.Future<$0.BotInfo> defaultConfig(
      $grpc.ServiceCall call, $1.Empty request);

  $async.Future<$0.Models> embeddingModelList_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.Empty> $request) async {
    return embeddingModelList($call, await $request);
  }

  $async.Future<$0.Models> embeddingModelList(
      $grpc.ServiceCall call, $1.Empty request);

  $async.Future<$0.AudioModels> audioModelList_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.Empty> $request) async {
    return audioModelList($call, await $request);
  }

  $async.Future<$0.AudioModels> audioModelList(
      $grpc.ServiceCall call, $1.Empty request);

  $async.Future<$1.Empty> updateBot_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.BotInfo> $request) async {
    return updateBot($call, await $request);
  }

  $async.Future<$1.Empty> updateBot($grpc.ServiceCall call, $0.BotInfo request);

  $async.Future<$1.Empty> deleteBot_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.BotDID> $request) async {
    return deleteBot($call, await $request);
  }

  $async.Future<$1.Empty> deleteBot($grpc.ServiceCall call, $0.BotDID request);

  $async.Future<$0.BotStatisticsInfo> statisticsInfo_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.BotDID> $request) async {
    return statisticsInfo($call, await $request);
  }

  $async.Future<$0.BotStatisticsInfo> statisticsInfo(
      $grpc.ServiceCall call, $0.BotDID request);

  $async.Future<$2.ChatUserInfo> getBotInfo_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.BotDID> $request) async {
    return getBotInfo($call, await $request);
  }

  $async.Future<$2.ChatUserInfo> getBotInfo(
      $grpc.ServiceCall call, $0.BotDID request);

  $async.Future<$0.BotInfoList> getBotInfoList_Pre($grpc.ServiceCall $call,
      $async.Future<$0.BotInfoListParam> $request) async {
    return getBotInfoList($call, await $request);
  }

  $async.Future<$0.BotInfoList> getBotInfoList(
      $grpc.ServiceCall call, $0.BotInfoListParam request);

  $async.Future<$1.Empty> favoriteBot_Pre($grpc.ServiceCall $call,
      $async.Future<$0.FavoriteBotParam> $request) async {
    return favoriteBot($call, await $request);
  }

  $async.Future<$1.Empty> favoriteBot(
      $grpc.ServiceCall call, $0.FavoriteBotParam request);

  $async.Future<$0.BotInfoList> favoriteBotList_Pre($grpc.ServiceCall $call,
      $async.Future<$0.BotInfoListParam> $request) async {
    return favoriteBotList($call, await $request);
  }

  $async.Future<$0.BotInfoList> favoriteBotList(
      $grpc.ServiceCall call, $0.BotInfoListParam request);

  $async.Future<$1.Empty> bindMaster_Pre($grpc.ServiceCall $call,
      $async.Future<$0.BindMasterParam> $request) async {
    return bindMaster($call, await $request);
  }

  $async.Future<$1.Empty> bindMaster(
      $grpc.ServiceCall call, $0.BindMasterParam request);

  $async.Future<$1.Empty> unbindMaster_Pre($grpc.ServiceCall $call,
      $async.Future<$0.BindMasterParam> $request) async {
    return unbindMaster($call, await $request);
  }

  $async.Future<$1.Empty> unbindMaster(
      $grpc.ServiceCall call, $0.BindMasterParam request);

  $async.Future<$0.BotBindStatus> bindStatus_Pre($grpc.ServiceCall $call,
      $async.Future<$0.BindMasterParam> $request) async {
    return bindStatus($call, await $request);
  }

  $async.Future<$0.BotBindStatus> bindStatus(
      $grpc.ServiceCall call, $0.BindMasterParam request);
}

@$pb.GrpcServiceName('club.BotTraining')
class BotTrainingClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  BotTrainingClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.Empty> trainingBot(
    $0.TrainingBotParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$trainingBot, request, options: options);
  }

  $grpc.ResponseFuture<$0.BotTrainingStatus> trainingStatus(
    $0.BotDID request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$trainingStatus, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> trainingClear(
    $0.BotDID request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$trainingClear, request, options: options);
  }

  $grpc.ResponseFuture<$0.BotTrainingFile> createTrainingFile(
    $0.CreateTrainingFileParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createTrainingFile, request, options: options);
  }

  $grpc.ResponseFuture<$0.BotTrainingFileList> getTrainingFileList(
    $0.TrainingFileListParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getTrainingFileList, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteTrainingFile(
    $0.DeleteTrainingFileParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteTrainingFile, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteTrainingFiles(
    $0.DeleteTrainingFilesParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteTrainingFiles, request, options: options);
  }

  $grpc.ResponseFuture<$0.BotTrainingFile> getTrainingFile(
    $0.TrainingFileID request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getTrainingFile, request, options: options);
  }

  $grpc.ResponseFuture<$0.BotTrainingFile> createContent(
    $0.CreateCotentParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createContent, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> updateContent(
    $0.UpdateCotentParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateContent, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> editDigest(
    $0.EditDigestParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$editDigest, request, options: options);
  }

  // method descriptors

  static final _$trainingBot =
      $grpc.ClientMethod<$0.TrainingBotParam, $1.Empty>(
          '/club.BotTraining/TrainingBot',
          ($0.TrainingBotParam value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$trainingStatus =
      $grpc.ClientMethod<$0.BotDID, $0.BotTrainingStatus>(
          '/club.BotTraining/TrainingStatus',
          ($0.BotDID value) => value.writeToBuffer(),
          $0.BotTrainingStatus.fromBuffer);
  static final _$trainingClear = $grpc.ClientMethod<$0.BotDID, $1.Empty>(
      '/club.BotTraining/TrainingClear',
      ($0.BotDID value) => value.writeToBuffer(),
      $1.Empty.fromBuffer);
  static final _$createTrainingFile =
      $grpc.ClientMethod<$0.CreateTrainingFileParam, $0.BotTrainingFile>(
          '/club.BotTraining/CreateTrainingFile',
          ($0.CreateTrainingFileParam value) => value.writeToBuffer(),
          $0.BotTrainingFile.fromBuffer);
  static final _$getTrainingFileList =
      $grpc.ClientMethod<$0.TrainingFileListParam, $0.BotTrainingFileList>(
          '/club.BotTraining/GetTrainingFileList',
          ($0.TrainingFileListParam value) => value.writeToBuffer(),
          $0.BotTrainingFileList.fromBuffer);
  static final _$deleteTrainingFile =
      $grpc.ClientMethod<$0.DeleteTrainingFileParam, $1.Empty>(
          '/club.BotTraining/DeleteTrainingFile',
          ($0.DeleteTrainingFileParam value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$deleteTrainingFiles =
      $grpc.ClientMethod<$0.DeleteTrainingFilesParam, $1.Empty>(
          '/club.BotTraining/DeleteTrainingFiles',
          ($0.DeleteTrainingFilesParam value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$getTrainingFile =
      $grpc.ClientMethod<$0.TrainingFileID, $0.BotTrainingFile>(
          '/club.BotTraining/GetTrainingFile',
          ($0.TrainingFileID value) => value.writeToBuffer(),
          $0.BotTrainingFile.fromBuffer);
  static final _$createContent =
      $grpc.ClientMethod<$0.CreateCotentParam, $0.BotTrainingFile>(
          '/club.BotTraining/CreateContent',
          ($0.CreateCotentParam value) => value.writeToBuffer(),
          $0.BotTrainingFile.fromBuffer);
  static final _$updateContent =
      $grpc.ClientMethod<$0.UpdateCotentParam, $1.Empty>(
          '/club.BotTraining/UpdateContent',
          ($0.UpdateCotentParam value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$editDigest = $grpc.ClientMethod<$0.EditDigestParam, $1.Empty>(
      '/club.BotTraining/EditDigest',
      ($0.EditDigestParam value) => value.writeToBuffer(),
      $1.Empty.fromBuffer);
}

@$pb.GrpcServiceName('club.BotTraining')
abstract class BotTrainingServiceBase extends $grpc.Service {
  $core.String get $name => 'club.BotTraining';

  BotTrainingServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.TrainingBotParam, $1.Empty>(
        'TrainingBot',
        trainingBot_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TrainingBotParam.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.BotDID, $0.BotTrainingStatus>(
        'TrainingStatus',
        trainingStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.BotDID.fromBuffer(value),
        ($0.BotTrainingStatus value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.BotDID, $1.Empty>(
        'TrainingClear',
        trainingClear_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.BotDID.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.CreateTrainingFileParam, $0.BotTrainingFile>(
            'CreateTrainingFile',
            createTrainingFile_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.CreateTrainingFileParam.fromBuffer(value),
            ($0.BotTrainingFile value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.TrainingFileListParam, $0.BotTrainingFileList>(
            'GetTrainingFileList',
            getTrainingFileList_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.TrainingFileListParam.fromBuffer(value),
            ($0.BotTrainingFileList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteTrainingFileParam, $1.Empty>(
        'DeleteTrainingFile',
        deleteTrainingFile_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeleteTrainingFileParam.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteTrainingFilesParam, $1.Empty>(
        'DeleteTrainingFiles',
        deleteTrainingFiles_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeleteTrainingFilesParam.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TrainingFileID, $0.BotTrainingFile>(
        'GetTrainingFile',
        getTrainingFile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TrainingFileID.fromBuffer(value),
        ($0.BotTrainingFile value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateCotentParam, $0.BotTrainingFile>(
        'CreateContent',
        createContent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateCotentParam.fromBuffer(value),
        ($0.BotTrainingFile value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateCotentParam, $1.Empty>(
        'UpdateContent',
        updateContent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateCotentParam.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EditDigestParam, $1.Empty>(
        'EditDigest',
        editDigest_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EditDigestParam.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$1.Empty> trainingBot_Pre($grpc.ServiceCall $call,
      $async.Future<$0.TrainingBotParam> $request) async {
    return trainingBot($call, await $request);
  }

  $async.Future<$1.Empty> trainingBot(
      $grpc.ServiceCall call, $0.TrainingBotParam request);

  $async.Future<$0.BotTrainingStatus> trainingStatus_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.BotDID> $request) async {
    return trainingStatus($call, await $request);
  }

  $async.Future<$0.BotTrainingStatus> trainingStatus(
      $grpc.ServiceCall call, $0.BotDID request);

  $async.Future<$1.Empty> trainingClear_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.BotDID> $request) async {
    return trainingClear($call, await $request);
  }

  $async.Future<$1.Empty> trainingClear(
      $grpc.ServiceCall call, $0.BotDID request);

  $async.Future<$0.BotTrainingFile> createTrainingFile_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.CreateTrainingFileParam> $request) async {
    return createTrainingFile($call, await $request);
  }

  $async.Future<$0.BotTrainingFile> createTrainingFile(
      $grpc.ServiceCall call, $0.CreateTrainingFileParam request);

  $async.Future<$0.BotTrainingFileList> getTrainingFileList_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.TrainingFileListParam> $request) async {
    return getTrainingFileList($call, await $request);
  }

  $async.Future<$0.BotTrainingFileList> getTrainingFileList(
      $grpc.ServiceCall call, $0.TrainingFileListParam request);

  $async.Future<$1.Empty> deleteTrainingFile_Pre($grpc.ServiceCall $call,
      $async.Future<$0.DeleteTrainingFileParam> $request) async {
    return deleteTrainingFile($call, await $request);
  }

  $async.Future<$1.Empty> deleteTrainingFile(
      $grpc.ServiceCall call, $0.DeleteTrainingFileParam request);

  $async.Future<$1.Empty> deleteTrainingFiles_Pre($grpc.ServiceCall $call,
      $async.Future<$0.DeleteTrainingFilesParam> $request) async {
    return deleteTrainingFiles($call, await $request);
  }

  $async.Future<$1.Empty> deleteTrainingFiles(
      $grpc.ServiceCall call, $0.DeleteTrainingFilesParam request);

  $async.Future<$0.BotTrainingFile> getTrainingFile_Pre($grpc.ServiceCall $call,
      $async.Future<$0.TrainingFileID> $request) async {
    return getTrainingFile($call, await $request);
  }

  $async.Future<$0.BotTrainingFile> getTrainingFile(
      $grpc.ServiceCall call, $0.TrainingFileID request);

  $async.Future<$0.BotTrainingFile> createContent_Pre($grpc.ServiceCall $call,
      $async.Future<$0.CreateCotentParam> $request) async {
    return createContent($call, await $request);
  }

  $async.Future<$0.BotTrainingFile> createContent(
      $grpc.ServiceCall call, $0.CreateCotentParam request);

  $async.Future<$1.Empty> updateContent_Pre($grpc.ServiceCall $call,
      $async.Future<$0.UpdateCotentParam> $request) async {
    return updateContent($call, await $request);
  }

  $async.Future<$1.Empty> updateContent(
      $grpc.ServiceCall call, $0.UpdateCotentParam request);

  $async.Future<$1.Empty> editDigest_Pre($grpc.ServiceCall $call,
      $async.Future<$0.EditDigestParam> $request) async {
    return editDigest($call, await $request);
  }

  $async.Future<$1.Empty> editDigest(
      $grpc.ServiceCall call, $0.EditDigestParam request);
}

@$pb.GrpcServiceName('club.BotPlugin')
class BotPluginClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  BotPluginClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.FuncationList> nameList(
    $0.BotDID request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$nameList, request, options: options);
  }

  $grpc.ResponseFuture<$0.BotDrawConfig> drawConfig(
    $1.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$drawConfig, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> createPlugin(
    $0.CreatePluginParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createPlugin, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deletePlugin(
    $0.DeletePluginParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deletePlugin, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> editPlugin(
    $0.EditPluginParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$editPlugin, request, options: options);
  }

  $grpc.ResponseFuture<$0.PluginInfoList> pluginList(
    $0.PluginListParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$pluginList, request, options: options);
  }

  // method descriptors

  static final _$nameList = $grpc.ClientMethod<$0.BotDID, $0.FuncationList>(
      '/club.BotPlugin/NameList',
      ($0.BotDID value) => value.writeToBuffer(),
      $0.FuncationList.fromBuffer);
  static final _$drawConfig = $grpc.ClientMethod<$1.Empty, $0.BotDrawConfig>(
      '/club.BotPlugin/DrawConfig',
      ($1.Empty value) => value.writeToBuffer(),
      $0.BotDrawConfig.fromBuffer);
  static final _$createPlugin =
      $grpc.ClientMethod<$0.CreatePluginParam, $1.Empty>(
          '/club.BotPlugin/CreatePlugin',
          ($0.CreatePluginParam value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$deletePlugin =
      $grpc.ClientMethod<$0.DeletePluginParam, $1.Empty>(
          '/club.BotPlugin/DeletePlugin',
          ($0.DeletePluginParam value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$editPlugin = $grpc.ClientMethod<$0.EditPluginParam, $1.Empty>(
      '/club.BotPlugin/EditPlugin',
      ($0.EditPluginParam value) => value.writeToBuffer(),
      $1.Empty.fromBuffer);
  static final _$pluginList =
      $grpc.ClientMethod<$0.PluginListParam, $0.PluginInfoList>(
          '/club.BotPlugin/PluginList',
          ($0.PluginListParam value) => value.writeToBuffer(),
          $0.PluginInfoList.fromBuffer);
}

@$pb.GrpcServiceName('club.BotPlugin')
abstract class BotPluginServiceBase extends $grpc.Service {
  $core.String get $name => 'club.BotPlugin';

  BotPluginServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.BotDID, $0.FuncationList>(
        'NameList',
        nameList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.BotDID.fromBuffer(value),
        ($0.FuncationList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.BotDrawConfig>(
        'DrawConfig',
        drawConfig_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.BotDrawConfig value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreatePluginParam, $1.Empty>(
        'CreatePlugin',
        createPlugin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreatePluginParam.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeletePluginParam, $1.Empty>(
        'DeletePlugin',
        deletePlugin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeletePluginParam.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EditPluginParam, $1.Empty>(
        'EditPlugin',
        editPlugin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EditPluginParam.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PluginListParam, $0.PluginInfoList>(
        'PluginList',
        pluginList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PluginListParam.fromBuffer(value),
        ($0.PluginInfoList value) => value.writeToBuffer()));
  }

  $async.Future<$0.FuncationList> nameList_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.BotDID> $request) async {
    return nameList($call, await $request);
  }

  $async.Future<$0.FuncationList> nameList(
      $grpc.ServiceCall call, $0.BotDID request);

  $async.Future<$0.BotDrawConfig> drawConfig_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.Empty> $request) async {
    return drawConfig($call, await $request);
  }

  $async.Future<$0.BotDrawConfig> drawConfig(
      $grpc.ServiceCall call, $1.Empty request);

  $async.Future<$1.Empty> createPlugin_Pre($grpc.ServiceCall $call,
      $async.Future<$0.CreatePluginParam> $request) async {
    return createPlugin($call, await $request);
  }

  $async.Future<$1.Empty> createPlugin(
      $grpc.ServiceCall call, $0.CreatePluginParam request);

  $async.Future<$1.Empty> deletePlugin_Pre($grpc.ServiceCall $call,
      $async.Future<$0.DeletePluginParam> $request) async {
    return deletePlugin($call, await $request);
  }

  $async.Future<$1.Empty> deletePlugin(
      $grpc.ServiceCall call, $0.DeletePluginParam request);

  $async.Future<$1.Empty> editPlugin_Pre($grpc.ServiceCall $call,
      $async.Future<$0.EditPluginParam> $request) async {
    return editPlugin($call, await $request);
  }

  $async.Future<$1.Empty> editPlugin(
      $grpc.ServiceCall call, $0.EditPluginParam request);

  $async.Future<$0.PluginInfoList> pluginList_Pre($grpc.ServiceCall $call,
      $async.Future<$0.PluginListParam> $request) async {
    return pluginList($call, await $request);
  }

  $async.Future<$0.PluginInfoList> pluginList(
      $grpc.ServiceCall call, $0.PluginListParam request);
}
