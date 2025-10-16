// This is a generated file - do not edit.
//
// Generated from v1/club/mqtt.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../hi.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

enum Packet_Kind { notice, message, notSet }

class Packet extends $pb.GeneratedMessage {
  factory Packet({
    Notice? notice,
    Message? message,
  }) {
    final result = create();
    if (notice != null) result.notice = notice;
    if (message != null) result.message = message;
    return result;
  }

  Packet._();

  factory Packet.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Packet.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Packet_Kind> _Packet_KindByTag = {
    1: Packet_Kind.notice,
    2: Packet_Kind.message,
    0: Packet_Kind.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Packet',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<Notice>(1, _omitFieldNames ? '' : 'notice', subBuilder: Notice.create)
    ..aOM<Message>(2, _omitFieldNames ? '' : 'message',
        subBuilder: Message.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Packet clone() => Packet()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Packet copyWith(void Function(Packet) updates) =>
      super.copyWith((message) => updates(message as Packet)) as Packet;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Packet create() => Packet._();
  @$core.override
  Packet createEmptyInstance() => create();
  static $pb.PbList<Packet> createRepeated() => $pb.PbList<Packet>();
  @$core.pragma('dart2js:noInline')
  static Packet getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Packet>(create);
  static Packet? _defaultInstance;

  Packet_Kind whichKind() => _Packet_KindByTag[$_whichOneof(0)]!;
  void clearKind() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Notice get notice => $_getN(0);
  @$pb.TagNumber(1)
  set notice(Notice value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasNotice() => $_has(0);
  @$pb.TagNumber(1)
  void clearNotice() => $_clearField(1);
  @$pb.TagNumber(1)
  Notice ensureNotice() => $_ensure(0);

  @$pb.TagNumber(2)
  Message get message => $_getN(1);
  @$pb.TagNumber(2)
  set message(Message value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
  @$pb.TagNumber(2)
  Message ensureMessage() => $_ensure(1);
}

class Notice extends $pb.GeneratedMessage {
  factory Notice({
    $core.String? uuid,
    $core.String? type,
    $0.Unit? from,
    $fixnum.Int64? timestamp,
    $fixnum.Int64? expiration,
    Extra? extra,
  }) {
    final result = create();
    if (uuid != null) result.uuid = uuid;
    if (type != null) result.type = type;
    if (from != null) result.from = from;
    if (timestamp != null) result.timestamp = timestamp;
    if (expiration != null) result.expiration = expiration;
    if (extra != null) result.extra = extra;
    return result;
  }

  Notice._();

  factory Notice.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Notice.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Notice',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..aOS(2, _omitFieldNames ? '' : 'type')
    ..aOM<$0.Unit>(3, _omitFieldNames ? '' : 'from', subBuilder: $0.Unit.create)
    ..aInt64(4, _omitFieldNames ? '' : 'timestamp')
    ..aInt64(5, _omitFieldNames ? '' : 'expiration')
    ..aOM<Extra>(6, _omitFieldNames ? '' : 'extra', subBuilder: Extra.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Notice clone() => Notice()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Notice copyWith(void Function(Notice) updates) =>
      super.copyWith((message) => updates(message as Notice)) as Notice;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Notice create() => Notice._();
  @$core.override
  Notice createEmptyInstance() => create();
  static $pb.PbList<Notice> createRepeated() => $pb.PbList<Notice>();
  @$core.pragma('dart2js:noInline')
  static Notice getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Notice>(create);
  static Notice? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get type => $_getSZ(1);
  @$pb.TagNumber(2)
  set type($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  @$pb.TagNumber(3)
  $0.Unit get from => $_getN(2);
  @$pb.TagNumber(3)
  set from($0.Unit value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasFrom() => $_has(2);
  @$pb.TagNumber(3)
  void clearFrom() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.Unit ensureFrom() => $_ensure(2);

  @$pb.TagNumber(4)
  $fixnum.Int64 get timestamp => $_getI64(3);
  @$pb.TagNumber(4)
  set timestamp($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTimestamp() => $_has(3);
  @$pb.TagNumber(4)
  void clearTimestamp() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get expiration => $_getI64(4);
  @$pb.TagNumber(5)
  set expiration($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasExpiration() => $_has(4);
  @$pb.TagNumber(5)
  void clearExpiration() => $_clearField(5);

  @$pb.TagNumber(6)
  Extra get extra => $_getN(5);
  @$pb.TagNumber(6)
  set extra(Extra value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasExtra() => $_has(5);
  @$pb.TagNumber(6)
  void clearExtra() => $_clearField(6);
  @$pb.TagNumber(6)
  Extra ensureExtra() => $_ensure(5);
}

class Message extends $pb.GeneratedMessage {
  factory Message({
    $core.String? uuid,
    $core.String? cid,
    $core.String? type,
    $0.Unit? from,
    $core.Iterable<Content>? content,
    $fixnum.Int64? timestamp,
    Extra? extra,
  }) {
    final result = create();
    if (uuid != null) result.uuid = uuid;
    if (cid != null) result.cid = cid;
    if (type != null) result.type = type;
    if (from != null) result.from = from;
    if (content != null) result.content.addAll(content);
    if (timestamp != null) result.timestamp = timestamp;
    if (extra != null) result.extra = extra;
    return result;
  }

  Message._();

  factory Message.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Message.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Message',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..aOS(2, _omitFieldNames ? '' : 'cid')
    ..aOS(3, _omitFieldNames ? '' : 'type')
    ..aOM<$0.Unit>(4, _omitFieldNames ? '' : 'from', subBuilder: $0.Unit.create)
    ..pc<Content>(5, _omitFieldNames ? '' : 'content', $pb.PbFieldType.PM,
        subBuilder: Content.create)
    ..aInt64(6, _omitFieldNames ? '' : 'timestamp')
    ..aOM<Extra>(7, _omitFieldNames ? '' : 'extra', subBuilder: Extra.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Message clone() => Message()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Message copyWith(void Function(Message) updates) =>
      super.copyWith((message) => updates(message as Message)) as Message;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Message create() => Message._();
  @$core.override
  Message createEmptyInstance() => create();
  static $pb.PbList<Message> createRepeated() => $pb.PbList<Message>();
  @$core.pragma('dart2js:noInline')
  static Message getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Message>(create);
  static Message? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get cid => $_getSZ(1);
  @$pb.TagNumber(2)
  set cid($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCid() => $_has(1);
  @$pb.TagNumber(2)
  void clearCid() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get type => $_getSZ(2);
  @$pb.TagNumber(3)
  set type($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => $_clearField(3);

  @$pb.TagNumber(4)
  $0.Unit get from => $_getN(3);
  @$pb.TagNumber(4)
  set from($0.Unit value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasFrom() => $_has(3);
  @$pb.TagNumber(4)
  void clearFrom() => $_clearField(4);
  @$pb.TagNumber(4)
  $0.Unit ensureFrom() => $_ensure(3);

  @$pb.TagNumber(5)
  $pb.PbList<Content> get content => $_getList(4);

  @$pb.TagNumber(6)
  $fixnum.Int64 get timestamp => $_getI64(5);
  @$pb.TagNumber(6)
  set timestamp($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTimestamp() => $_has(5);
  @$pb.TagNumber(6)
  void clearTimestamp() => $_clearField(6);

  @$pb.TagNumber(7)
  Extra get extra => $_getN(6);
  @$pb.TagNumber(7)
  set extra(Extra value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasExtra() => $_has(6);
  @$pb.TagNumber(7)
  void clearExtra() => $_clearField(7);
  @$pb.TagNumber(7)
  Extra ensureExtra() => $_ensure(6);
}

enum Extra_Kind { unit, mention, member, memberExit, groupInfo, notSet }

class Extra extends $pb.GeneratedMessage {
  factory Extra({
    $0.Unit? unit,
    Mention? mention,
    Member? member,
    MemberExit? memberExit,
    GroupInfo? groupInfo,
  }) {
    final result = create();
    if (unit != null) result.unit = unit;
    if (mention != null) result.mention = mention;
    if (member != null) result.member = member;
    if (memberExit != null) result.memberExit = memberExit;
    if (groupInfo != null) result.groupInfo = groupInfo;
    return result;
  }

  Extra._();

  factory Extra.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Extra.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Extra_Kind> _Extra_KindByTag = {
    1: Extra_Kind.unit,
    2: Extra_Kind.mention,
    3: Extra_Kind.member,
    4: Extra_Kind.memberExit,
    5: Extra_Kind.groupInfo,
    0: Extra_Kind.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Extra',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5])
    ..aOM<$0.Unit>(1, _omitFieldNames ? '' : 'unit', subBuilder: $0.Unit.create)
    ..aOM<Mention>(2, _omitFieldNames ? '' : 'mention',
        subBuilder: Mention.create)
    ..aOM<Member>(3, _omitFieldNames ? '' : 'member', subBuilder: Member.create)
    ..aOM<MemberExit>(4, _omitFieldNames ? '' : 'memberExit',
        subBuilder: MemberExit.create)
    ..aOM<GroupInfo>(5, _omitFieldNames ? '' : 'groupInfo',
        subBuilder: GroupInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Extra clone() => Extra()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Extra copyWith(void Function(Extra) updates) =>
      super.copyWith((message) => updates(message as Extra)) as Extra;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Extra create() => Extra._();
  @$core.override
  Extra createEmptyInstance() => create();
  static $pb.PbList<Extra> createRepeated() => $pb.PbList<Extra>();
  @$core.pragma('dart2js:noInline')
  static Extra getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Extra>(create);
  static Extra? _defaultInstance;

  Extra_Kind whichKind() => _Extra_KindByTag[$_whichOneof(0)]!;
  void clearKind() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $0.Unit get unit => $_getN(0);
  @$pb.TagNumber(1)
  set unit($0.Unit value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUnit() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnit() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.Unit ensureUnit() => $_ensure(0);

  @$pb.TagNumber(2)
  Mention get mention => $_getN(1);
  @$pb.TagNumber(2)
  set mention(Mention value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasMention() => $_has(1);
  @$pb.TagNumber(2)
  void clearMention() => $_clearField(2);
  @$pb.TagNumber(2)
  Mention ensureMention() => $_ensure(1);

  @$pb.TagNumber(3)
  Member get member => $_getN(2);
  @$pb.TagNumber(3)
  set member(Member value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasMember() => $_has(2);
  @$pb.TagNumber(3)
  void clearMember() => $_clearField(3);
  @$pb.TagNumber(3)
  Member ensureMember() => $_ensure(2);

  @$pb.TagNumber(4)
  MemberExit get memberExit => $_getN(3);
  @$pb.TagNumber(4)
  set memberExit(MemberExit value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasMemberExit() => $_has(3);
  @$pb.TagNumber(4)
  void clearMemberExit() => $_clearField(4);
  @$pb.TagNumber(4)
  MemberExit ensureMemberExit() => $_ensure(3);

  @$pb.TagNumber(5)
  GroupInfo get groupInfo => $_getN(4);
  @$pb.TagNumber(5)
  set groupInfo(GroupInfo value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasGroupInfo() => $_has(4);
  @$pb.TagNumber(5)
  void clearGroupInfo() => $_clearField(5);
  @$pb.TagNumber(5)
  GroupInfo ensureGroupInfo() => $_ensure(4);
}

class Mention extends $pb.GeneratedMessage {
  factory Mention({
    $0.Unit? group,
    $core.bool? all,
    $core.Iterable<$0.Unit>? list,
  }) {
    final result = create();
    if (group != null) result.group = group;
    if (all != null) result.all = all;
    if (list != null) result.list.addAll(list);
    return result;
  }

  Mention._();

  factory Mention.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Mention.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Mention',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOM<$0.Unit>(1, _omitFieldNames ? '' : 'group',
        subBuilder: $0.Unit.create)
    ..aOB(2, _omitFieldNames ? '' : 'all')
    ..pc<$0.Unit>(3, _omitFieldNames ? '' : 'list', $pb.PbFieldType.PM,
        subBuilder: $0.Unit.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Mention clone() => Mention()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Mention copyWith(void Function(Mention) updates) =>
      super.copyWith((message) => updates(message as Mention)) as Mention;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Mention create() => Mention._();
  @$core.override
  Mention createEmptyInstance() => create();
  static $pb.PbList<Mention> createRepeated() => $pb.PbList<Mention>();
  @$core.pragma('dart2js:noInline')
  static Mention getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Mention>(create);
  static Mention? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Unit get group => $_getN(0);
  @$pb.TagNumber(1)
  set group($0.Unit value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasGroup() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroup() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.Unit ensureGroup() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.bool get all => $_getBF(1);
  @$pb.TagNumber(2)
  set all($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAll() => $_has(1);
  @$pb.TagNumber(2)
  void clearAll() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$0.Unit> get list => $_getList(2);
}

class Member extends $pb.GeneratedMessage {
  factory Member({
    $0.Unit? group,
    $0.Unit? user,
  }) {
    final result = create();
    if (group != null) result.group = group;
    if (user != null) result.user = user;
    return result;
  }

  Member._();

  factory Member.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Member.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Member',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOM<$0.Unit>(1, _omitFieldNames ? '' : 'group',
        subBuilder: $0.Unit.create)
    ..aOM<$0.Unit>(2, _omitFieldNames ? '' : 'user', subBuilder: $0.Unit.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Member clone() => Member()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Member copyWith(void Function(Member) updates) =>
      super.copyWith((message) => updates(message as Member)) as Member;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Member create() => Member._();
  @$core.override
  Member createEmptyInstance() => create();
  static $pb.PbList<Member> createRepeated() => $pb.PbList<Member>();
  @$core.pragma('dart2js:noInline')
  static Member getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Member>(create);
  static Member? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Unit get group => $_getN(0);
  @$pb.TagNumber(1)
  set group($0.Unit value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasGroup() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroup() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.Unit ensureGroup() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.Unit get user => $_getN(1);
  @$pb.TagNumber(2)
  set user($0.Unit value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Unit ensureUser() => $_ensure(1);
}

class MemberExit extends $pb.GeneratedMessage {
  factory MemberExit({
    Member? member,
    $core.String? type,
  }) {
    final result = create();
    if (member != null) result.member = member;
    if (type != null) result.type = type;
    return result;
  }

  MemberExit._();

  factory MemberExit.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MemberExit.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MemberExit',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOM<Member>(1, _omitFieldNames ? '' : 'member', subBuilder: Member.create)
    ..aOS(2, _omitFieldNames ? '' : 'type')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MemberExit clone() => MemberExit()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MemberExit copyWith(void Function(MemberExit) updates) =>
      super.copyWith((message) => updates(message as MemberExit)) as MemberExit;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MemberExit create() => MemberExit._();
  @$core.override
  MemberExit createEmptyInstance() => create();
  static $pb.PbList<MemberExit> createRepeated() => $pb.PbList<MemberExit>();
  @$core.pragma('dart2js:noInline')
  static MemberExit getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MemberExit>(create);
  static MemberExit? _defaultInstance;

  @$pb.TagNumber(1)
  Member get member => $_getN(0);
  @$pb.TagNumber(1)
  set member(Member value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasMember() => $_has(0);
  @$pb.TagNumber(1)
  void clearMember() => $_clearField(1);
  @$pb.TagNumber(1)
  Member ensureMember() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get type => $_getSZ(1);
  @$pb.TagNumber(2)
  set type($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);
}

class Content extends $pb.GeneratedMessage {
  factory Content({
    $core.String? type,
    $core.String? content,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (content != null) result.content = content;
    return result;
  }

  Content._();

  factory Content.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Content.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Content',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'type')
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Content clone() => Content()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Content copyWith(void Function(Content) updates) =>
      super.copyWith((message) => updates(message as Content)) as Content;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Content create() => Content._();
  @$core.override
  Content createEmptyInstance() => create();
  static $pb.PbList<Content> createRepeated() => $pb.PbList<Content>();
  @$core.pragma('dart2js:noInline')
  static Content getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Content>(create);
  static Content? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => $_clearField(2);
}

class GroupInfo extends $pb.GeneratedMessage {
  factory GroupInfo({
    $0.Unit? base,
    $core.String? backGround,
    $core.bool? mute,
  }) {
    final result = create();
    if (base != null) result.base = base;
    if (backGround != null) result.backGround = backGround;
    if (mute != null) result.mute = mute;
    return result;
  }

  GroupInfo._();

  factory GroupInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GroupInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GroupInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'club'),
      createEmptyInstance: create)
    ..aOM<$0.Unit>(1, _omitFieldNames ? '' : 'base', subBuilder: $0.Unit.create)
    ..aOS(2, _omitFieldNames ? '' : 'backGround')
    ..aOB(3, _omitFieldNames ? '' : 'mute')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupInfo clone() => GroupInfo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupInfo copyWith(void Function(GroupInfo) updates) =>
      super.copyWith((message) => updates(message as GroupInfo)) as GroupInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GroupInfo create() => GroupInfo._();
  @$core.override
  GroupInfo createEmptyInstance() => create();
  static $pb.PbList<GroupInfo> createRepeated() => $pb.PbList<GroupInfo>();
  @$core.pragma('dart2js:noInline')
  static GroupInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GroupInfo>(create);
  static GroupInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Unit get base => $_getN(0);
  @$pb.TagNumber(1)
  set base($0.Unit value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.Unit ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get backGround => $_getSZ(1);
  @$pb.TagNumber(2)
  set backGround($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBackGround() => $_has(1);
  @$pb.TagNumber(2)
  void clearBackGround() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get mute => $_getBF(2);
  @$pb.TagNumber(3)
  set mute($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMute() => $_has(2);
  @$pb.TagNumber(3)
  void clearMute() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
