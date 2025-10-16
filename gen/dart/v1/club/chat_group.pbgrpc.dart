// This is a generated file - do not edit.
//
// Generated from v1/club/chat_group.proto.

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
import 'chat_group.pb.dart' as $0;
import 'chat_user.pb.dart' as $2;

export 'chat_group.pb.dart';

@$pb.GrpcServiceName('club.ChatGroup')
class ChatGroupClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  ChatGroupClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.ChatGroupInfo> groupInfo(
    $0.GroupInfoParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$groupInfo, request, options: options);
  }

  $grpc.ResponseFuture<$0.ChatGroupInfo> createGroup(
    $0.CreateGroupParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createGroup, request, options: options);
  }

  $grpc.ResponseFuture<$0.ChatGroupInfo> createSingleGroup(
    $0.CreateSingleGroupParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createSingleGroup, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> updateGroup(
    $0.UpdateGroupParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateGroup, request, options: options);
  }

  $grpc.ResponseFuture<$0.GroupInfoList> groupList(
    $1.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$groupList, request, options: options);
  }

  $grpc.ResponseFuture<$2.ChatUserInfoList> groupMemberList(
    $0.GroupMemberParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$groupMemberList, request, options: options);
  }

  $grpc.ResponseFuture<$0.MemberTotal> groupMemberTotal(
    $0.MemberTotalParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$groupMemberTotal, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> groupInvite(
    $0.GroupInviteParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$groupInvite, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> groupJoin(
    $0.GroupJoinParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$groupJoin, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> groupQuit(
    $0.GroupQuitParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$groupQuit, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> groupRemove(
    $0.GroupRemoveParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$groupRemove, request, options: options);
  }

  $grpc.ResponseFuture<$0.MessageList> groupMessageList(
    $0.MessageListParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$groupMessageList, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> updateLastUUID(
    $0.LastUUIDParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateLastUUID, request, options: options);
  }

  $grpc.ResponseFuture<$0.LastUUIDListParam> checkLastUUID(
    $0.LastUUIDListParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$checkLastUUID, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> setGroupAdmin(
    $0.SetGroupAdminParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$setGroupAdmin, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> setUserMuted(
    $0.SetUserMutedParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$setUserMuted, request, options: options);
  }

  $grpc.ResponseFuture<$0.ChatGroupInfo> groupInfoByCode(
    $0.GroupCodeParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$groupInfoByCode, request, options: options);
  }

  $grpc.ResponseFuture<$0.GroupInfoList> botGroupList(
    $0.BotGroupListParam request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$botGroupList, request, options: options);
  }

  // method descriptors

  static final _$groupInfo =
      $grpc.ClientMethod<$0.GroupInfoParam, $0.ChatGroupInfo>(
          '/club.ChatGroup/GroupInfo',
          ($0.GroupInfoParam value) => value.writeToBuffer(),
          $0.ChatGroupInfo.fromBuffer);
  static final _$createGroup =
      $grpc.ClientMethod<$0.CreateGroupParam, $0.ChatGroupInfo>(
          '/club.ChatGroup/CreateGroup',
          ($0.CreateGroupParam value) => value.writeToBuffer(),
          $0.ChatGroupInfo.fromBuffer);
  static final _$createSingleGroup =
      $grpc.ClientMethod<$0.CreateSingleGroupParam, $0.ChatGroupInfo>(
          '/club.ChatGroup/CreateSingleGroup',
          ($0.CreateSingleGroupParam value) => value.writeToBuffer(),
          $0.ChatGroupInfo.fromBuffer);
  static final _$updateGroup =
      $grpc.ClientMethod<$0.UpdateGroupParam, $1.Empty>(
          '/club.ChatGroup/UpdateGroup',
          ($0.UpdateGroupParam value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$groupList = $grpc.ClientMethod<$1.Empty, $0.GroupInfoList>(
      '/club.ChatGroup/GroupList',
      ($1.Empty value) => value.writeToBuffer(),
      $0.GroupInfoList.fromBuffer);
  static final _$groupMemberList =
      $grpc.ClientMethod<$0.GroupMemberParam, $2.ChatUserInfoList>(
          '/club.ChatGroup/GroupMemberList',
          ($0.GroupMemberParam value) => value.writeToBuffer(),
          $2.ChatUserInfoList.fromBuffer);
  static final _$groupMemberTotal =
      $grpc.ClientMethod<$0.MemberTotalParam, $0.MemberTotal>(
          '/club.ChatGroup/GroupMemberTotal',
          ($0.MemberTotalParam value) => value.writeToBuffer(),
          $0.MemberTotal.fromBuffer);
  static final _$groupInvite =
      $grpc.ClientMethod<$0.GroupInviteParam, $1.Empty>(
          '/club.ChatGroup/GroupInvite',
          ($0.GroupInviteParam value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$groupJoin = $grpc.ClientMethod<$0.GroupJoinParam, $1.Empty>(
      '/club.ChatGroup/GroupJoin',
      ($0.GroupJoinParam value) => value.writeToBuffer(),
      $1.Empty.fromBuffer);
  static final _$groupQuit = $grpc.ClientMethod<$0.GroupQuitParam, $1.Empty>(
      '/club.ChatGroup/GroupQuit',
      ($0.GroupQuitParam value) => value.writeToBuffer(),
      $1.Empty.fromBuffer);
  static final _$groupRemove =
      $grpc.ClientMethod<$0.GroupRemoveParam, $1.Empty>(
          '/club.ChatGroup/GroupRemove',
          ($0.GroupRemoveParam value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$groupMessageList =
      $grpc.ClientMethod<$0.MessageListParam, $0.MessageList>(
          '/club.ChatGroup/GroupMessageList',
          ($0.MessageListParam value) => value.writeToBuffer(),
          $0.MessageList.fromBuffer);
  static final _$updateLastUUID =
      $grpc.ClientMethod<$0.LastUUIDParam, $1.Empty>(
          '/club.ChatGroup/UpdateLastUUID',
          ($0.LastUUIDParam value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$checkLastUUID =
      $grpc.ClientMethod<$0.LastUUIDListParam, $0.LastUUIDListParam>(
          '/club.ChatGroup/CheckLastUUID',
          ($0.LastUUIDListParam value) => value.writeToBuffer(),
          $0.LastUUIDListParam.fromBuffer);
  static final _$setGroupAdmin =
      $grpc.ClientMethod<$0.SetGroupAdminParam, $1.Empty>(
          '/club.ChatGroup/SetGroupAdmin',
          ($0.SetGroupAdminParam value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$setUserMuted =
      $grpc.ClientMethod<$0.SetUserMutedParam, $1.Empty>(
          '/club.ChatGroup/SetUserMuted',
          ($0.SetUserMutedParam value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$groupInfoByCode =
      $grpc.ClientMethod<$0.GroupCodeParam, $0.ChatGroupInfo>(
          '/club.ChatGroup/GroupInfoByCode',
          ($0.GroupCodeParam value) => value.writeToBuffer(),
          $0.ChatGroupInfo.fromBuffer);
  static final _$botGroupList =
      $grpc.ClientMethod<$0.BotGroupListParam, $0.GroupInfoList>(
          '/club.ChatGroup/BotGroupList',
          ($0.BotGroupListParam value) => value.writeToBuffer(),
          $0.GroupInfoList.fromBuffer);
}

@$pb.GrpcServiceName('club.ChatGroup')
abstract class ChatGroupServiceBase extends $grpc.Service {
  $core.String get $name => 'club.ChatGroup';

  ChatGroupServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GroupInfoParam, $0.ChatGroupInfo>(
        'GroupInfo',
        groupInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GroupInfoParam.fromBuffer(value),
        ($0.ChatGroupInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateGroupParam, $0.ChatGroupInfo>(
        'CreateGroup',
        createGroup_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateGroupParam.fromBuffer(value),
        ($0.ChatGroupInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateSingleGroupParam, $0.ChatGroupInfo>(
        'CreateSingleGroup',
        createSingleGroup_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateSingleGroupParam.fromBuffer(value),
        ($0.ChatGroupInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateGroupParam, $1.Empty>(
        'UpdateGroup',
        updateGroup_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateGroupParam.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.GroupInfoList>(
        'GroupList',
        groupList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.GroupInfoList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GroupMemberParam, $2.ChatUserInfoList>(
        'GroupMemberList',
        groupMemberList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GroupMemberParam.fromBuffer(value),
        ($2.ChatUserInfoList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MemberTotalParam, $0.MemberTotal>(
        'GroupMemberTotal',
        groupMemberTotal_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MemberTotalParam.fromBuffer(value),
        ($0.MemberTotal value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GroupInviteParam, $1.Empty>(
        'GroupInvite',
        groupInvite_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GroupInviteParam.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GroupJoinParam, $1.Empty>(
        'GroupJoin',
        groupJoin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GroupJoinParam.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GroupQuitParam, $1.Empty>(
        'GroupQuit',
        groupQuit_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GroupQuitParam.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GroupRemoveParam, $1.Empty>(
        'GroupRemove',
        groupRemove_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GroupRemoveParam.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MessageListParam, $0.MessageList>(
        'GroupMessageList',
        groupMessageList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MessageListParam.fromBuffer(value),
        ($0.MessageList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LastUUIDParam, $1.Empty>(
        'UpdateLastUUID',
        updateLastUUID_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LastUUIDParam.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LastUUIDListParam, $0.LastUUIDListParam>(
        'CheckLastUUID',
        checkLastUUID_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LastUUIDListParam.fromBuffer(value),
        ($0.LastUUIDListParam value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SetGroupAdminParam, $1.Empty>(
        'SetGroupAdmin',
        setGroupAdmin_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.SetGroupAdminParam.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SetUserMutedParam, $1.Empty>(
        'SetUserMuted',
        setUserMuted_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SetUserMutedParam.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GroupCodeParam, $0.ChatGroupInfo>(
        'GroupInfoByCode',
        groupInfoByCode_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GroupCodeParam.fromBuffer(value),
        ($0.ChatGroupInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.BotGroupListParam, $0.GroupInfoList>(
        'BotGroupList',
        botGroupList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.BotGroupListParam.fromBuffer(value),
        ($0.GroupInfoList value) => value.writeToBuffer()));
  }

  $async.Future<$0.ChatGroupInfo> groupInfo_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GroupInfoParam> $request) async {
    return groupInfo($call, await $request);
  }

  $async.Future<$0.ChatGroupInfo> groupInfo(
      $grpc.ServiceCall call, $0.GroupInfoParam request);

  $async.Future<$0.ChatGroupInfo> createGroup_Pre($grpc.ServiceCall $call,
      $async.Future<$0.CreateGroupParam> $request) async {
    return createGroup($call, await $request);
  }

  $async.Future<$0.ChatGroupInfo> createGroup(
      $grpc.ServiceCall call, $0.CreateGroupParam request);

  $async.Future<$0.ChatGroupInfo> createSingleGroup_Pre($grpc.ServiceCall $call,
      $async.Future<$0.CreateSingleGroupParam> $request) async {
    return createSingleGroup($call, await $request);
  }

  $async.Future<$0.ChatGroupInfo> createSingleGroup(
      $grpc.ServiceCall call, $0.CreateSingleGroupParam request);

  $async.Future<$1.Empty> updateGroup_Pre($grpc.ServiceCall $call,
      $async.Future<$0.UpdateGroupParam> $request) async {
    return updateGroup($call, await $request);
  }

  $async.Future<$1.Empty> updateGroup(
      $grpc.ServiceCall call, $0.UpdateGroupParam request);

  $async.Future<$0.GroupInfoList> groupList_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.Empty> $request) async {
    return groupList($call, await $request);
  }

  $async.Future<$0.GroupInfoList> groupList(
      $grpc.ServiceCall call, $1.Empty request);

  $async.Future<$2.ChatUserInfoList> groupMemberList_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GroupMemberParam> $request) async {
    return groupMemberList($call, await $request);
  }

  $async.Future<$2.ChatUserInfoList> groupMemberList(
      $grpc.ServiceCall call, $0.GroupMemberParam request);

  $async.Future<$0.MemberTotal> groupMemberTotal_Pre($grpc.ServiceCall $call,
      $async.Future<$0.MemberTotalParam> $request) async {
    return groupMemberTotal($call, await $request);
  }

  $async.Future<$0.MemberTotal> groupMemberTotal(
      $grpc.ServiceCall call, $0.MemberTotalParam request);

  $async.Future<$1.Empty> groupInvite_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GroupInviteParam> $request) async {
    return groupInvite($call, await $request);
  }

  $async.Future<$1.Empty> groupInvite(
      $grpc.ServiceCall call, $0.GroupInviteParam request);

  $async.Future<$1.Empty> groupJoin_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GroupJoinParam> $request) async {
    return groupJoin($call, await $request);
  }

  $async.Future<$1.Empty> groupJoin(
      $grpc.ServiceCall call, $0.GroupJoinParam request);

  $async.Future<$1.Empty> groupQuit_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GroupQuitParam> $request) async {
    return groupQuit($call, await $request);
  }

  $async.Future<$1.Empty> groupQuit(
      $grpc.ServiceCall call, $0.GroupQuitParam request);

  $async.Future<$1.Empty> groupRemove_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GroupRemoveParam> $request) async {
    return groupRemove($call, await $request);
  }

  $async.Future<$1.Empty> groupRemove(
      $grpc.ServiceCall call, $0.GroupRemoveParam request);

  $async.Future<$0.MessageList> groupMessageList_Pre($grpc.ServiceCall $call,
      $async.Future<$0.MessageListParam> $request) async {
    return groupMessageList($call, await $request);
  }

  $async.Future<$0.MessageList> groupMessageList(
      $grpc.ServiceCall call, $0.MessageListParam request);

  $async.Future<$1.Empty> updateLastUUID_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.LastUUIDParam> $request) async {
    return updateLastUUID($call, await $request);
  }

  $async.Future<$1.Empty> updateLastUUID(
      $grpc.ServiceCall call, $0.LastUUIDParam request);

  $async.Future<$0.LastUUIDListParam> checkLastUUID_Pre($grpc.ServiceCall $call,
      $async.Future<$0.LastUUIDListParam> $request) async {
    return checkLastUUID($call, await $request);
  }

  $async.Future<$0.LastUUIDListParam> checkLastUUID(
      $grpc.ServiceCall call, $0.LastUUIDListParam request);

  $async.Future<$1.Empty> setGroupAdmin_Pre($grpc.ServiceCall $call,
      $async.Future<$0.SetGroupAdminParam> $request) async {
    return setGroupAdmin($call, await $request);
  }

  $async.Future<$1.Empty> setGroupAdmin(
      $grpc.ServiceCall call, $0.SetGroupAdminParam request);

  $async.Future<$1.Empty> setUserMuted_Pre($grpc.ServiceCall $call,
      $async.Future<$0.SetUserMutedParam> $request) async {
    return setUserMuted($call, await $request);
  }

  $async.Future<$1.Empty> setUserMuted(
      $grpc.ServiceCall call, $0.SetUserMutedParam request);

  $async.Future<$0.ChatGroupInfo> groupInfoByCode_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GroupCodeParam> $request) async {
    return groupInfoByCode($call, await $request);
  }

  $async.Future<$0.ChatGroupInfo> groupInfoByCode(
      $grpc.ServiceCall call, $0.GroupCodeParam request);

  $async.Future<$0.GroupInfoList> botGroupList_Pre($grpc.ServiceCall $call,
      $async.Future<$0.BotGroupListParam> $request) async {
    return botGroupList($call, await $request);
  }

  $async.Future<$0.GroupInfoList> botGroupList(
      $grpc.ServiceCall call, $0.BotGroupListParam request);
}
