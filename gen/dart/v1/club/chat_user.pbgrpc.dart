// This is a generated file - do not edit.
//
// Generated from v1/club/chat_user.proto.

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
import 'chat_user.pb.dart' as $1;

export 'chat_user.pb.dart';

@$pb.GrpcServiceName('club.ChatUser')
class ChatUserClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  ChatUserClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.ChatUserInfo> currentUser(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$currentUser, request, options: options);
  }

  $grpc.ResponseFuture<$1.ChatUserInfo> userBasicInfo(
    $1.UserInfoParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$userBasicInfo, request, options: options);
  }

  $grpc.ResponseFuture<$1.ChatUserInfo> userInfo(
    $1.UserInfoParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$userInfo, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> updateUserInfo(
    $1.UpdateUserInfoParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateUserInfo, request, options: options);
  }

  $grpc.ResponseFuture<$1.SystemMessages> systemMessageList(
    $1.SystemMessageListParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$systemMessageList, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> deleteSystemMessage(
    $1.DeleteSystemMessageParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteSystemMessage, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> deleteAllSystemMessage(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteAllSystemMessage, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.Empty> handleSystemMessage(
    $1.HandleSystemMessageParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$handleSystemMessage, request, options: options);
  }

  $grpc.ResponseFuture<$1.ChatUserInfoList> currentUserFriend(
    $2.Pagination request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$currentUserFriend, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> addFriend(
    $1.FriendParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$addFriend, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> deleteFriend(
    $1.FriendParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteFriend, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> registerEmail(
    $1.EmailParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$registerEmail, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> editEmail(
    $1.EmailParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$editEmail, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> sendAbout(
    $1.SendAboutParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$sendAbout, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> sendCard(
    $1.SendCardParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$sendCard, request, options: options);
  }

  $grpc.ResponseFuture<$1.BotGroupCodeList> botGroupCode(
    $1.BotGroupCodeParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$botGroupCode, request, options: options);
  }

  // method descriptors

  static final _$currentUser = $grpc.ClientMethod<$0.Empty, $1.ChatUserInfo>(
      '/club.ChatUser/CurrentUser',
      ($0.Empty value) => value.writeToBuffer(),
      $1.ChatUserInfo.fromBuffer);
  static final _$userBasicInfo =
      $grpc.ClientMethod<$1.UserInfoParam, $1.ChatUserInfo>(
          '/club.ChatUser/UserBasicInfo',
          ($1.UserInfoParam value) => value.writeToBuffer(),
          $1.ChatUserInfo.fromBuffer);
  static final _$userInfo =
      $grpc.ClientMethod<$1.UserInfoParam, $1.ChatUserInfo>(
          '/club.ChatUser/UserInfo',
          ($1.UserInfoParam value) => value.writeToBuffer(),
          $1.ChatUserInfo.fromBuffer);
  static final _$updateUserInfo =
      $grpc.ClientMethod<$1.UpdateUserInfoParam, $0.Empty>(
          '/club.ChatUser/UpdateUserInfo',
          ($1.UpdateUserInfoParam value) => value.writeToBuffer(),
          $0.Empty.fromBuffer);
  static final _$systemMessageList =
      $grpc.ClientMethod<$1.SystemMessageListParam, $1.SystemMessages>(
          '/club.ChatUser/SystemMessageList',
          ($1.SystemMessageListParam value) => value.writeToBuffer(),
          $1.SystemMessages.fromBuffer);
  static final _$deleteSystemMessage =
      $grpc.ClientMethod<$1.DeleteSystemMessageParam, $0.Empty>(
          '/club.ChatUser/DeleteSystemMessage',
          ($1.DeleteSystemMessageParam value) => value.writeToBuffer(),
          $0.Empty.fromBuffer);
  static final _$deleteAllSystemMessage =
      $grpc.ClientMethod<$0.Empty, $0.Empty>(
          '/club.ChatUser/DeleteAllSystemMessage',
          ($0.Empty value) => value.writeToBuffer(),
          $0.Empty.fromBuffer);
  static final _$handleSystemMessage =
      $grpc.ClientMethod<$1.HandleSystemMessageParam, $0.Empty>(
          '/club.ChatUser/HandleSystemMessage',
          ($1.HandleSystemMessageParam value) => value.writeToBuffer(),
          $0.Empty.fromBuffer);
  static final _$currentUserFriend =
      $grpc.ClientMethod<$2.Pagination, $1.ChatUserInfoList>(
          '/club.ChatUser/CurrentUserFriend',
          ($2.Pagination value) => value.writeToBuffer(),
          $1.ChatUserInfoList.fromBuffer);
  static final _$addFriend = $grpc.ClientMethod<$1.FriendParam, $0.Empty>(
      '/club.ChatUser/AddFriend',
      ($1.FriendParam value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
  static final _$deleteFriend = $grpc.ClientMethod<$1.FriendParam, $0.Empty>(
      '/club.ChatUser/DeleteFriend',
      ($1.FriendParam value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
  static final _$registerEmail = $grpc.ClientMethod<$1.EmailParam, $0.Empty>(
      '/club.ChatUser/RegisterEmail',
      ($1.EmailParam value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
  static final _$editEmail = $grpc.ClientMethod<$1.EmailParam, $0.Empty>(
      '/club.ChatUser/EditEmail',
      ($1.EmailParam value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
  static final _$sendAbout = $grpc.ClientMethod<$1.SendAboutParam, $0.Empty>(
      '/club.ChatUser/SendAbout',
      ($1.SendAboutParam value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
  static final _$sendCard = $grpc.ClientMethod<$1.SendCardParam, $0.Empty>(
      '/club.ChatUser/SendCard',
      ($1.SendCardParam value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
  static final _$botGroupCode =
      $grpc.ClientMethod<$1.BotGroupCodeParam, $1.BotGroupCodeList>(
          '/club.ChatUser/BotGroupCode',
          ($1.BotGroupCodeParam value) => value.writeToBuffer(),
          $1.BotGroupCodeList.fromBuffer);
}

@$pb.GrpcServiceName('club.ChatUser')
abstract class ChatUserServiceBase extends $grpc.Service {
  $core.String get $name => 'club.ChatUser';

  ChatUserServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.ChatUserInfo>(
        'CurrentUser',
        currentUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.ChatUserInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.UserInfoParam, $1.ChatUserInfo>(
        'UserBasicInfo',
        userBasicInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.UserInfoParam.fromBuffer(value),
        ($1.ChatUserInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.UserInfoParam, $1.ChatUserInfo>(
        'UserInfo',
        userInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.UserInfoParam.fromBuffer(value),
        ($1.ChatUserInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.UpdateUserInfoParam, $0.Empty>(
        'UpdateUserInfo',
        updateUserInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.UpdateUserInfoParam.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.SystemMessageListParam, $1.SystemMessages>(
            'SystemMessageList',
            systemMessageList_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.SystemMessageListParam.fromBuffer(value),
            ($1.SystemMessages value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.DeleteSystemMessageParam, $0.Empty>(
        'DeleteSystemMessage',
        deleteSystemMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.DeleteSystemMessageParam.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.Empty>(
        'DeleteAllSystemMessage',
        deleteAllSystemMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.HandleSystemMessageParam, $0.Empty>(
        'HandleSystemMessage',
        handleSystemMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.HandleSystemMessageParam.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Pagination, $1.ChatUserInfoList>(
        'CurrentUserFriend',
        currentUserFriend_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Pagination.fromBuffer(value),
        ($1.ChatUserInfoList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.FriendParam, $0.Empty>(
        'AddFriend',
        addFriend_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.FriendParam.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.FriendParam, $0.Empty>(
        'DeleteFriend',
        deleteFriend_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.FriendParam.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.EmailParam, $0.Empty>(
        'RegisterEmail',
        registerEmail_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.EmailParam.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.EmailParam, $0.Empty>(
        'EditEmail',
        editEmail_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.EmailParam.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.SendAboutParam, $0.Empty>(
        'SendAbout',
        sendAbout_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.SendAboutParam.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.SendCardParam, $0.Empty>(
        'SendCard',
        sendCard_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.SendCardParam.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.BotGroupCodeParam, $1.BotGroupCodeList>(
        'BotGroupCode',
        botGroupCode_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.BotGroupCodeParam.fromBuffer(value),
        ($1.BotGroupCodeList value) => value.writeToBuffer()));
  }

  $async.Future<$1.ChatUserInfo> currentUser_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return currentUser($call, await $request);
  }

  $async.Future<$1.ChatUserInfo> currentUser(
      $grpc.ServiceCall call, $0.Empty request);

  $async.Future<$1.ChatUserInfo> userBasicInfo_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.UserInfoParam> $request) async {
    return userBasicInfo($call, await $request);
  }

  $async.Future<$1.ChatUserInfo> userBasicInfo(
      $grpc.ServiceCall call, $1.UserInfoParam request);

  $async.Future<$1.ChatUserInfo> userInfo_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.UserInfoParam> $request) async {
    return userInfo($call, await $request);
  }

  $async.Future<$1.ChatUserInfo> userInfo(
      $grpc.ServiceCall call, $1.UserInfoParam request);

  $async.Future<$0.Empty> updateUserInfo_Pre($grpc.ServiceCall $call,
      $async.Future<$1.UpdateUserInfoParam> $request) async {
    return updateUserInfo($call, await $request);
  }

  $async.Future<$0.Empty> updateUserInfo(
      $grpc.ServiceCall call, $1.UpdateUserInfoParam request);

  $async.Future<$1.SystemMessages> systemMessageList_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$1.SystemMessageListParam> $request) async {
    return systemMessageList($call, await $request);
  }

  $async.Future<$1.SystemMessages> systemMessageList(
      $grpc.ServiceCall call, $1.SystemMessageListParam request);

  $async.Future<$0.Empty> deleteSystemMessage_Pre($grpc.ServiceCall $call,
      $async.Future<$1.DeleteSystemMessageParam> $request) async {
    return deleteSystemMessage($call, await $request);
  }

  $async.Future<$0.Empty> deleteSystemMessage(
      $grpc.ServiceCall call, $1.DeleteSystemMessageParam request);

  $async.Future<$0.Empty> deleteAllSystemMessage_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return deleteAllSystemMessage($call, await $request);
  }

  $async.Future<$0.Empty> deleteAllSystemMessage(
      $grpc.ServiceCall call, $0.Empty request);

  $async.Future<$0.Empty> handleSystemMessage_Pre($grpc.ServiceCall $call,
      $async.Future<$1.HandleSystemMessageParam> $request) async {
    return handleSystemMessage($call, await $request);
  }

  $async.Future<$0.Empty> handleSystemMessage(
      $grpc.ServiceCall call, $1.HandleSystemMessageParam request);

  $async.Future<$1.ChatUserInfoList> currentUserFriend_Pre(
      $grpc.ServiceCall $call, $async.Future<$2.Pagination> $request) async {
    return currentUserFriend($call, await $request);
  }

  $async.Future<$1.ChatUserInfoList> currentUserFriend(
      $grpc.ServiceCall call, $2.Pagination request);

  $async.Future<$0.Empty> addFriend_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.FriendParam> $request) async {
    return addFriend($call, await $request);
  }

  $async.Future<$0.Empty> addFriend(
      $grpc.ServiceCall call, $1.FriendParam request);

  $async.Future<$0.Empty> deleteFriend_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.FriendParam> $request) async {
    return deleteFriend($call, await $request);
  }

  $async.Future<$0.Empty> deleteFriend(
      $grpc.ServiceCall call, $1.FriendParam request);

  $async.Future<$0.Empty> registerEmail_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.EmailParam> $request) async {
    return registerEmail($call, await $request);
  }

  $async.Future<$0.Empty> registerEmail(
      $grpc.ServiceCall call, $1.EmailParam request);

  $async.Future<$0.Empty> editEmail_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.EmailParam> $request) async {
    return editEmail($call, await $request);
  }

  $async.Future<$0.Empty> editEmail(
      $grpc.ServiceCall call, $1.EmailParam request);

  $async.Future<$0.Empty> sendAbout_Pre($grpc.ServiceCall $call,
      $async.Future<$1.SendAboutParam> $request) async {
    return sendAbout($call, await $request);
  }

  $async.Future<$0.Empty> sendAbout(
      $grpc.ServiceCall call, $1.SendAboutParam request);

  $async.Future<$0.Empty> sendCard_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.SendCardParam> $request) async {
    return sendCard($call, await $request);
  }

  $async.Future<$0.Empty> sendCard(
      $grpc.ServiceCall call, $1.SendCardParam request);

  $async.Future<$1.BotGroupCodeList> botGroupCode_Pre($grpc.ServiceCall $call,
      $async.Future<$1.BotGroupCodeParam> $request) async {
    return botGroupCode($call, await $request);
  }

  $async.Future<$1.BotGroupCodeList> botGroupCode(
      $grpc.ServiceCall call, $1.BotGroupCodeParam request);
}
