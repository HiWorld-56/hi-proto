// This is a generated file - do not edit.
//
// Generated from v1/did/trans.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../hi.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class TransactionInfo extends $pb.GeneratedMessage {
  factory TransactionInfo({
    $core.String? hash,
    $core.String? from,
    $core.String? to,
    $core.String? amount,
    $core.String? coin,
  }) {
    final result = create();
    if (hash != null) result.hash = hash;
    if (from != null) result.from = from;
    if (to != null) result.to = to;
    if (amount != null) result.amount = amount;
    if (coin != null) result.coin = coin;
    return result;
  }

  TransactionInfo._();

  factory TransactionInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TransactionInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransactionInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'hash')
    ..aOS(2, _omitFieldNames ? '' : 'from')
    ..aOS(3, _omitFieldNames ? '' : 'to')
    ..aOS(4, _omitFieldNames ? '' : 'amount')
    ..aOS(5, _omitFieldNames ? '' : 'coin')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransactionInfo clone() => TransactionInfo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransactionInfo copyWith(void Function(TransactionInfo) updates) =>
      super.copyWith((message) => updates(message as TransactionInfo))
          as TransactionInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionInfo create() => TransactionInfo._();
  @$core.override
  TransactionInfo createEmptyInstance() => create();
  static $pb.PbList<TransactionInfo> createRepeated() =>
      $pb.PbList<TransactionInfo>();
  @$core.pragma('dart2js:noInline')
  static TransactionInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransactionInfo>(create);
  static TransactionInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hash => $_getSZ(0);
  @$pb.TagNumber(1)
  set hash($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearHash() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get from => $_getSZ(1);
  @$pb.TagNumber(2)
  set from($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFrom() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrom() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get to => $_getSZ(2);
  @$pb.TagNumber(3)
  set to($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTo() => $_has(2);
  @$pb.TagNumber(3)
  void clearTo() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get amount => $_getSZ(3);
  @$pb.TagNumber(4)
  set amount($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAmount() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get coin => $_getSZ(4);
  @$pb.TagNumber(5)
  set coin($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCoin() => $_has(4);
  @$pb.TagNumber(5)
  void clearCoin() => $_clearField(5);
}

class ListTransactionsReq extends $pb.GeneratedMessage {
  factory ListTransactionsReq({
    $core.String? coin,
    $core.String? address,
    $1.Pagination? pagination,
  }) {
    final result = create();
    if (coin != null) result.coin = coin;
    if (address != null) result.address = address;
    if (pagination != null) result.pagination = pagination;
    return result;
  }

  ListTransactionsReq._();

  factory ListTransactionsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListTransactionsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListTransactionsReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'coin')
    ..aOS(2, _omitFieldNames ? '' : 'address')
    ..aOM<$1.Pagination>(4, _omitFieldNames ? '' : 'pagination',
        subBuilder: $1.Pagination.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListTransactionsReq clone() => ListTransactionsReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListTransactionsReq copyWith(void Function(ListTransactionsReq) updates) =>
      super.copyWith((message) => updates(message as ListTransactionsReq))
          as ListTransactionsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListTransactionsReq create() => ListTransactionsReq._();
  @$core.override
  ListTransactionsReq createEmptyInstance() => create();
  static $pb.PbList<ListTransactionsReq> createRepeated() =>
      $pb.PbList<ListTransactionsReq>();
  @$core.pragma('dart2js:noInline')
  static ListTransactionsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListTransactionsReq>(create);
  static ListTransactionsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get coin => $_getSZ(0);
  @$pb.TagNumber(1)
  set coin($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCoin() => $_has(0);
  @$pb.TagNumber(1)
  void clearCoin() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get address => $_getSZ(1);
  @$pb.TagNumber(2)
  set address($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddress() => $_clearField(2);

  @$pb.TagNumber(4)
  $1.Pagination get pagination => $_getN(2);
  @$pb.TagNumber(4)
  set pagination($1.Pagination value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasPagination() => $_has(2);
  @$pb.TagNumber(4)
  void clearPagination() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.Pagination ensurePagination() => $_ensure(2);
}

class ListTransactionsResp_Unit extends $pb.GeneratedMessage {
  factory ListTransactionsResp_Unit({
    TransactionInfo? trans,
    $core.int? direction,
    $core.int? status,
    $fixnum.Int64? timestamp,
  }) {
    final result = create();
    if (trans != null) result.trans = trans;
    if (direction != null) result.direction = direction;
    if (status != null) result.status = status;
    if (timestamp != null) result.timestamp = timestamp;
    return result;
  }

  ListTransactionsResp_Unit._();

  factory ListTransactionsResp_Unit.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListTransactionsResp_Unit.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListTransactionsResp.Unit',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..aOM<TransactionInfo>(1, _omitFieldNames ? '' : 'trans',
        subBuilder: TransactionInfo.create)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'direction', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'status', $pb.PbFieldType.O3)
    ..aInt64(7, _omitFieldNames ? '' : 'timestamp')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListTransactionsResp_Unit clone() =>
      ListTransactionsResp_Unit()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListTransactionsResp_Unit copyWith(
          void Function(ListTransactionsResp_Unit) updates) =>
      super.copyWith((message) => updates(message as ListTransactionsResp_Unit))
          as ListTransactionsResp_Unit;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListTransactionsResp_Unit create() => ListTransactionsResp_Unit._();
  @$core.override
  ListTransactionsResp_Unit createEmptyInstance() => create();
  static $pb.PbList<ListTransactionsResp_Unit> createRepeated() =>
      $pb.PbList<ListTransactionsResp_Unit>();
  @$core.pragma('dart2js:noInline')
  static ListTransactionsResp_Unit getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListTransactionsResp_Unit>(create);
  static ListTransactionsResp_Unit? _defaultInstance;

  @$pb.TagNumber(1)
  TransactionInfo get trans => $_getN(0);
  @$pb.TagNumber(1)
  set trans(TransactionInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTrans() => $_has(0);
  @$pb.TagNumber(1)
  void clearTrans() => $_clearField(1);
  @$pb.TagNumber(1)
  TransactionInfo ensureTrans() => $_ensure(0);

  @$pb.TagNumber(5)
  $core.int get direction => $_getIZ(1);
  @$pb.TagNumber(5)
  set direction($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(5)
  $core.bool hasDirection() => $_has(1);
  @$pb.TagNumber(5)
  void clearDirection() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get status => $_getIZ(2);
  @$pb.TagNumber(6)
  set status($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(6)
  void clearStatus() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get timestamp => $_getI64(3);
  @$pb.TagNumber(7)
  set timestamp($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(7)
  $core.bool hasTimestamp() => $_has(3);
  @$pb.TagNumber(7)
  void clearTimestamp() => $_clearField(7);
}

class ListTransactionsResp extends $pb.GeneratedMessage {
  factory ListTransactionsResp({
    $core.Iterable<ListTransactionsResp_Unit>? list,
    $core.bool? isEnd,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    if (isEnd != null) result.isEnd = isEnd;
    return result;
  }

  ListTransactionsResp._();

  factory ListTransactionsResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListTransactionsResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListTransactionsResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..pc<ListTransactionsResp_Unit>(
        1, _omitFieldNames ? '' : 'list', $pb.PbFieldType.PM,
        subBuilder: ListTransactionsResp_Unit.create)
    ..aOB(3, _omitFieldNames ? '' : 'isEnd')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListTransactionsResp clone() =>
      ListTransactionsResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListTransactionsResp copyWith(void Function(ListTransactionsResp) updates) =>
      super.copyWith((message) => updates(message as ListTransactionsResp))
          as ListTransactionsResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListTransactionsResp create() => ListTransactionsResp._();
  @$core.override
  ListTransactionsResp createEmptyInstance() => create();
  static $pb.PbList<ListTransactionsResp> createRepeated() =>
      $pb.PbList<ListTransactionsResp>();
  @$core.pragma('dart2js:noInline')
  static ListTransactionsResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListTransactionsResp>(create);
  static ListTransactionsResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ListTransactionsResp_Unit> get list => $_getList(0);

  @$pb.TagNumber(3)
  $core.bool get isEnd => $_getBF(1);
  @$pb.TagNumber(3)
  set isEnd($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(3)
  $core.bool hasIsEnd() => $_has(1);
  @$pb.TagNumber(3)
  void clearIsEnd() => $_clearField(3);
}

class GetTransactionDetailReq extends $pb.GeneratedMessage {
  factory GetTransactionDetailReq({
    TransactionInfo? trans,
    $core.String? verifyHashDump,
    $core.String? verifyTran,
  }) {
    final result = create();
    if (trans != null) result.trans = trans;
    if (verifyHashDump != null) result.verifyHashDump = verifyHashDump;
    if (verifyTran != null) result.verifyTran = verifyTran;
    return result;
  }

  GetTransactionDetailReq._();

  factory GetTransactionDetailReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetTransactionDetailReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetTransactionDetailReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..aOM<TransactionInfo>(1, _omitFieldNames ? '' : 'trans',
        subBuilder: TransactionInfo.create)
    ..aOS(6, _omitFieldNames ? '' : 'verifyHashDump')
    ..aOS(7, _omitFieldNames ? '' : 'verifyTran')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTransactionDetailReq clone() =>
      GetTransactionDetailReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTransactionDetailReq copyWith(
          void Function(GetTransactionDetailReq) updates) =>
      super.copyWith((message) => updates(message as GetTransactionDetailReq))
          as GetTransactionDetailReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTransactionDetailReq create() => GetTransactionDetailReq._();
  @$core.override
  GetTransactionDetailReq createEmptyInstance() => create();
  static $pb.PbList<GetTransactionDetailReq> createRepeated() =>
      $pb.PbList<GetTransactionDetailReq>();
  @$core.pragma('dart2js:noInline')
  static GetTransactionDetailReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetTransactionDetailReq>(create);
  static GetTransactionDetailReq? _defaultInstance;

  @$pb.TagNumber(1)
  TransactionInfo get trans => $_getN(0);
  @$pb.TagNumber(1)
  set trans(TransactionInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTrans() => $_has(0);
  @$pb.TagNumber(1)
  void clearTrans() => $_clearField(1);
  @$pb.TagNumber(1)
  TransactionInfo ensureTrans() => $_ensure(0);

  @$pb.TagNumber(6)
  $core.String get verifyHashDump => $_getSZ(1);
  @$pb.TagNumber(6)
  set verifyHashDump($core.String value) => $_setString(1, value);
  @$pb.TagNumber(6)
  $core.bool hasVerifyHashDump() => $_has(1);
  @$pb.TagNumber(6)
  void clearVerifyHashDump() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get verifyTran => $_getSZ(2);
  @$pb.TagNumber(7)
  set verifyTran($core.String value) => $_setString(2, value);
  @$pb.TagNumber(7)
  $core.bool hasVerifyTran() => $_has(2);
  @$pb.TagNumber(7)
  void clearVerifyTran() => $_clearField(7);
}

class GetTransactionDetailResp extends $pb.GeneratedMessage {
  factory GetTransactionDetailResp({
    TransactionInfo? trans,
    $core.String? timestamp,
    $fixnum.Int64? confirmedBlocks,
    $core.String? status,
    $core.String? error,
  }) {
    final result = create();
    if (trans != null) result.trans = trans;
    if (timestamp != null) result.timestamp = timestamp;
    if (confirmedBlocks != null) result.confirmedBlocks = confirmedBlocks;
    if (status != null) result.status = status;
    if (error != null) result.error = error;
    return result;
  }

  GetTransactionDetailResp._();

  factory GetTransactionDetailResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetTransactionDetailResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetTransactionDetailResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'did'),
      createEmptyInstance: create)
    ..aOM<TransactionInfo>(1, _omitFieldNames ? '' : 'trans',
        subBuilder: TransactionInfo.create)
    ..aOS(2, _omitFieldNames ? '' : 'timestamp')
    ..aInt64(3, _omitFieldNames ? '' : 'confirmedBlocks')
    ..aOS(4, _omitFieldNames ? '' : 'status')
    ..aOS(5, _omitFieldNames ? '' : 'error')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTransactionDetailResp clone() =>
      GetTransactionDetailResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTransactionDetailResp copyWith(
          void Function(GetTransactionDetailResp) updates) =>
      super.copyWith((message) => updates(message as GetTransactionDetailResp))
          as GetTransactionDetailResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTransactionDetailResp create() => GetTransactionDetailResp._();
  @$core.override
  GetTransactionDetailResp createEmptyInstance() => create();
  static $pb.PbList<GetTransactionDetailResp> createRepeated() =>
      $pb.PbList<GetTransactionDetailResp>();
  @$core.pragma('dart2js:noInline')
  static GetTransactionDetailResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetTransactionDetailResp>(create);
  static GetTransactionDetailResp? _defaultInstance;

  @$pb.TagNumber(1)
  TransactionInfo get trans => $_getN(0);
  @$pb.TagNumber(1)
  set trans(TransactionInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTrans() => $_has(0);
  @$pb.TagNumber(1)
  void clearTrans() => $_clearField(1);
  @$pb.TagNumber(1)
  TransactionInfo ensureTrans() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get timestamp => $_getSZ(1);
  @$pb.TagNumber(2)
  set timestamp($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTimestamp() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimestamp() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get confirmedBlocks => $_getI64(2);
  @$pb.TagNumber(3)
  set confirmedBlocks($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasConfirmedBlocks() => $_has(2);
  @$pb.TagNumber(3)
  void clearConfirmedBlocks() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get status => $_getSZ(3);
  @$pb.TagNumber(4)
  set status($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get error => $_getSZ(4);
  @$pb.TagNumber(5)
  set error($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasError() => $_has(4);
  @$pb.TagNumber(5)
  void clearError() => $_clearField(5);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
