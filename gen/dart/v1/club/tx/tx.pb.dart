// This is a generated file - do not edit.
//
// Generated from v1/club/tx/tx.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../hi.pb.dart' as $2;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class GetTxFeeReq extends $pb.GeneratedMessage {
  factory GetTxFeeReq({
    $core.String? coin,
  }) {
    final result = create();
    if (coin != null) result.coin = coin;
    return result;
  }

  GetTxFeeReq._();

  factory GetTxFeeReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetTxFeeReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetTxFeeReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tx'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'coin')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTxFeeReq clone() => GetTxFeeReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTxFeeReq copyWith(void Function(GetTxFeeReq) updates) =>
      super.copyWith((message) => updates(message as GetTxFeeReq))
          as GetTxFeeReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTxFeeReq create() => GetTxFeeReq._();
  @$core.override
  GetTxFeeReq createEmptyInstance() => create();
  static $pb.PbList<GetTxFeeReq> createRepeated() => $pb.PbList<GetTxFeeReq>();
  @$core.pragma('dart2js:noInline')
  static GetTxFeeReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetTxFeeReq>(create);
  static GetTxFeeReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get coin => $_getSZ(0);
  @$pb.TagNumber(1)
  set coin($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCoin() => $_has(0);
  @$pb.TagNumber(1)
  void clearCoin() => $_clearField(1);
}

class GetTxFeeResp extends $pb.GeneratedMessage {
  factory GetTxFeeResp({
    $core.String? coin,
    $core.String? fee,
  }) {
    final result = create();
    if (coin != null) result.coin = coin;
    if (fee != null) result.fee = fee;
    return result;
  }

  GetTxFeeResp._();

  factory GetTxFeeResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetTxFeeResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetTxFeeResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tx'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'coin')
    ..aOS(2, _omitFieldNames ? '' : 'fee')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTxFeeResp clone() => GetTxFeeResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTxFeeResp copyWith(void Function(GetTxFeeResp) updates) =>
      super.copyWith((message) => updates(message as GetTxFeeResp))
          as GetTxFeeResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTxFeeResp create() => GetTxFeeResp._();
  @$core.override
  GetTxFeeResp createEmptyInstance() => create();
  static $pb.PbList<GetTxFeeResp> createRepeated() =>
      $pb.PbList<GetTxFeeResp>();
  @$core.pragma('dart2js:noInline')
  static GetTxFeeResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetTxFeeResp>(create);
  static GetTxFeeResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get coin => $_getSZ(0);
  @$pb.TagNumber(1)
  set coin($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCoin() => $_has(0);
  @$pb.TagNumber(1)
  void clearCoin() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get fee => $_getSZ(1);
  @$pb.TagNumber(2)
  set fee($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFee() => $_has(1);
  @$pb.TagNumber(2)
  void clearFee() => $_clearField(2);
}

class GetTxReq extends $pb.GeneratedMessage {
  factory GetTxReq({
    $core.String? txId,
    $core.String? orderId,
  }) {
    final result = create();
    if (txId != null) result.txId = txId;
    if (orderId != null) result.orderId = orderId;
    return result;
  }

  GetTxReq._();

  factory GetTxReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetTxReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetTxReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tx'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'txId')
    ..aOS(2, _omitFieldNames ? '' : 'orderId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTxReq clone() => GetTxReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTxReq copyWith(void Function(GetTxReq) updates) =>
      super.copyWith((message) => updates(message as GetTxReq)) as GetTxReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTxReq create() => GetTxReq._();
  @$core.override
  GetTxReq createEmptyInstance() => create();
  static $pb.PbList<GetTxReq> createRepeated() => $pb.PbList<GetTxReq>();
  @$core.pragma('dart2js:noInline')
  static GetTxReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTxReq>(create);
  static GetTxReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get txId => $_getSZ(0);
  @$pb.TagNumber(1)
  set txId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTxId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTxId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get orderId => $_getSZ(1);
  @$pb.TagNumber(2)
  set orderId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOrderId() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrderId() => $_clearField(2);
}

/// 交易方信息
class TxParty extends $pb.GeneratedMessage {
  factory TxParty({
    $core.String? did,
    $core.String? coin,
    $core.String? totalAmount,
    $core.String? amount,
    $core.String? fee,
  }) {
    final result = create();
    if (did != null) result.did = did;
    if (coin != null) result.coin = coin;
    if (totalAmount != null) result.totalAmount = totalAmount;
    if (amount != null) result.amount = amount;
    if (fee != null) result.fee = fee;
    return result;
  }

  TxParty._();

  factory TxParty.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TxParty.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TxParty',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tx'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..aOS(2, _omitFieldNames ? '' : 'coin')
    ..aOS(3, _omitFieldNames ? '' : 'totalAmount')
    ..aOS(4, _omitFieldNames ? '' : 'amount')
    ..aOS(5, _omitFieldNames ? '' : 'fee')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TxParty clone() => TxParty()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TxParty copyWith(void Function(TxParty) updates) =>
      super.copyWith((message) => updates(message as TxParty)) as TxParty;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TxParty create() => TxParty._();
  @$core.override
  TxParty createEmptyInstance() => create();
  static $pb.PbList<TxParty> createRepeated() => $pb.PbList<TxParty>();
  @$core.pragma('dart2js:noInline')
  static TxParty getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TxParty>(create);
  static TxParty? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get did => $_getSZ(0);
  @$pb.TagNumber(1)
  set did($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get coin => $_getSZ(1);
  @$pb.TagNumber(2)
  set coin($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCoin() => $_has(1);
  @$pb.TagNumber(2)
  void clearCoin() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get totalAmount => $_getSZ(2);
  @$pb.TagNumber(3)
  set totalAmount($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotalAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalAmount() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get amount => $_getSZ(3);
  @$pb.TagNumber(4)
  set amount($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAmount() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get fee => $_getSZ(4);
  @$pb.TagNumber(5)
  set fee($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFee() => $_has(4);
  @$pb.TagNumber(5)
  void clearFee() => $_clearField(5);
}

class TxOrder extends $pb.GeneratedMessage {
  factory TxOrder({
    $core.String? orderId,
    $core.String? txHash,
    $core.String? from,
    $core.String? to,
    $core.String? coin,
    $core.String? totalAmount,
    $core.String? amount,
    $core.String? orderStatus,
    $core.String? createdAt,
    $core.String? updatedAt,
    $core.String? status,
    $core.String? txStage,
  }) {
    final result = create();
    if (orderId != null) result.orderId = orderId;
    if (txHash != null) result.txHash = txHash;
    if (from != null) result.from = from;
    if (to != null) result.to = to;
    if (coin != null) result.coin = coin;
    if (totalAmount != null) result.totalAmount = totalAmount;
    if (amount != null) result.amount = amount;
    if (orderStatus != null) result.orderStatus = orderStatus;
    if (createdAt != null) result.createdAt = createdAt;
    if (updatedAt != null) result.updatedAt = updatedAt;
    if (status != null) result.status = status;
    if (txStage != null) result.txStage = txStage;
    return result;
  }

  TxOrder._();

  factory TxOrder.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TxOrder.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TxOrder',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tx'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'orderId')
    ..aOS(2, _omitFieldNames ? '' : 'txHash')
    ..aOS(3, _omitFieldNames ? '' : 'from')
    ..aOS(4, _omitFieldNames ? '' : 'to')
    ..aOS(5, _omitFieldNames ? '' : 'coin')
    ..aOS(6, _omitFieldNames ? '' : 'totalAmount')
    ..aOS(7, _omitFieldNames ? '' : 'amount')
    ..aOS(8, _omitFieldNames ? '' : 'orderStatus')
    ..aOS(9, _omitFieldNames ? '' : 'createdAt')
    ..aOS(10, _omitFieldNames ? '' : 'updatedAt')
    ..aOS(11, _omitFieldNames ? '' : 'status')
    ..aOS(12, _omitFieldNames ? '' : 'txStage')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TxOrder clone() => TxOrder()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TxOrder copyWith(void Function(TxOrder) updates) =>
      super.copyWith((message) => updates(message as TxOrder)) as TxOrder;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TxOrder create() => TxOrder._();
  @$core.override
  TxOrder createEmptyInstance() => create();
  static $pb.PbList<TxOrder> createRepeated() => $pb.PbList<TxOrder>();
  @$core.pragma('dart2js:noInline')
  static TxOrder getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TxOrder>(create);
  static TxOrder? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get orderId => $_getSZ(0);
  @$pb.TagNumber(1)
  set orderId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOrderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrderId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get txHash => $_getSZ(1);
  @$pb.TagNumber(2)
  set txHash($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTxHash() => $_has(1);
  @$pb.TagNumber(2)
  void clearTxHash() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get from => $_getSZ(2);
  @$pb.TagNumber(3)
  set from($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFrom() => $_has(2);
  @$pb.TagNumber(3)
  void clearFrom() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get to => $_getSZ(3);
  @$pb.TagNumber(4)
  set to($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTo() => $_has(3);
  @$pb.TagNumber(4)
  void clearTo() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get coin => $_getSZ(4);
  @$pb.TagNumber(5)
  set coin($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCoin() => $_has(4);
  @$pb.TagNumber(5)
  void clearCoin() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get totalAmount => $_getSZ(5);
  @$pb.TagNumber(6)
  set totalAmount($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTotalAmount() => $_has(5);
  @$pb.TagNumber(6)
  void clearTotalAmount() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get amount => $_getSZ(6);
  @$pb.TagNumber(7)
  set amount($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasAmount() => $_has(6);
  @$pb.TagNumber(7)
  void clearAmount() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get orderStatus => $_getSZ(7);
  @$pb.TagNumber(8)
  set orderStatus($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasOrderStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearOrderStatus() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get createdAt => $_getSZ(8);
  @$pb.TagNumber(9)
  set createdAt($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasCreatedAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearCreatedAt() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get updatedAt => $_getSZ(9);
  @$pb.TagNumber(10)
  set updatedAt($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasUpdatedAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearUpdatedAt() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get status => $_getSZ(10);
  @$pb.TagNumber(11)
  set status($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasStatus() => $_has(10);
  @$pb.TagNumber(11)
  void clearStatus() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get txStage => $_getSZ(11);
  @$pb.TagNumber(12)
  set txStage($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasTxStage() => $_has(11);
  @$pb.TagNumber(12)
  void clearTxStage() => $_clearField(12);
}

class TxInfo extends $pb.GeneratedMessage {
  factory TxInfo({
    $core.String? txId,
    $core.String? txStatus,
    TxParty? initiator,
    TxParty? recipient,
    $core.Iterable<$core.MapEntry<$core.String, TxOrder>>? txOrders,
    $core.String? createdAt,
    $core.String? updatedAt,
    $core.String? timestamp,
  }) {
    final result = create();
    if (txId != null) result.txId = txId;
    if (txStatus != null) result.txStatus = txStatus;
    if (initiator != null) result.initiator = initiator;
    if (recipient != null) result.recipient = recipient;
    if (txOrders != null) result.txOrders.addEntries(txOrders);
    if (createdAt != null) result.createdAt = createdAt;
    if (updatedAt != null) result.updatedAt = updatedAt;
    if (timestamp != null) result.timestamp = timestamp;
    return result;
  }

  TxInfo._();

  factory TxInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TxInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TxInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tx'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'txId')
    ..aOS(2, _omitFieldNames ? '' : 'txStatus')
    ..aOM<TxParty>(3, _omitFieldNames ? '' : 'initiator',
        subBuilder: TxParty.create)
    ..aOM<TxParty>(4, _omitFieldNames ? '' : 'recipient',
        subBuilder: TxParty.create)
    ..m<$core.String, TxOrder>(5, _omitFieldNames ? '' : 'txOrders',
        entryClassName: 'TxInfo.TxOrdersEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: TxOrder.create,
        valueDefaultOrMaker: TxOrder.getDefault,
        packageName: const $pb.PackageName('tx'))
    ..aOS(6, _omitFieldNames ? '' : 'createdAt')
    ..aOS(7, _omitFieldNames ? '' : 'updatedAt')
    ..aOS(8, _omitFieldNames ? '' : 'timestamp')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TxInfo clone() => TxInfo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TxInfo copyWith(void Function(TxInfo) updates) =>
      super.copyWith((message) => updates(message as TxInfo)) as TxInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TxInfo create() => TxInfo._();
  @$core.override
  TxInfo createEmptyInstance() => create();
  static $pb.PbList<TxInfo> createRepeated() => $pb.PbList<TxInfo>();
  @$core.pragma('dart2js:noInline')
  static TxInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TxInfo>(create);
  static TxInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get txId => $_getSZ(0);
  @$pb.TagNumber(1)
  set txId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTxId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTxId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get txStatus => $_getSZ(1);
  @$pb.TagNumber(2)
  set txStatus($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTxStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearTxStatus() => $_clearField(2);

  @$pb.TagNumber(3)
  TxParty get initiator => $_getN(2);
  @$pb.TagNumber(3)
  set initiator(TxParty value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasInitiator() => $_has(2);
  @$pb.TagNumber(3)
  void clearInitiator() => $_clearField(3);
  @$pb.TagNumber(3)
  TxParty ensureInitiator() => $_ensure(2);

  @$pb.TagNumber(4)
  TxParty get recipient => $_getN(3);
  @$pb.TagNumber(4)
  set recipient(TxParty value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasRecipient() => $_has(3);
  @$pb.TagNumber(4)
  void clearRecipient() => $_clearField(4);
  @$pb.TagNumber(4)
  TxParty ensureRecipient() => $_ensure(3);

  @$pb.TagNumber(5)
  $pb.PbMap<$core.String, TxOrder> get txOrders => $_getMap(4);

  @$pb.TagNumber(6)
  $core.String get createdAt => $_getSZ(5);
  @$pb.TagNumber(6)
  set createdAt($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCreatedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreatedAt() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get updatedAt => $_getSZ(6);
  @$pb.TagNumber(7)
  set updatedAt($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasUpdatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpdatedAt() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get timestamp => $_getSZ(7);
  @$pb.TagNumber(8)
  set timestamp($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasTimestamp() => $_has(7);
  @$pb.TagNumber(8)
  void clearTimestamp() => $_clearField(8);
}

class GetTxResp extends $pb.GeneratedMessage {
  factory GetTxResp({
    TxInfo? txInfo,
  }) {
    final result = create();
    if (txInfo != null) result.txInfo = txInfo;
    return result;
  }

  GetTxResp._();

  factory GetTxResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetTxResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetTxResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tx'),
      createEmptyInstance: create)
    ..aOM<TxInfo>(1, _omitFieldNames ? '' : 'txInfo', subBuilder: TxInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTxResp clone() => GetTxResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTxResp copyWith(void Function(GetTxResp) updates) =>
      super.copyWith((message) => updates(message as GetTxResp)) as GetTxResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTxResp create() => GetTxResp._();
  @$core.override
  GetTxResp createEmptyInstance() => create();
  static $pb.PbList<GetTxResp> createRepeated() => $pb.PbList<GetTxResp>();
  @$core.pragma('dart2js:noInline')
  static GetTxResp getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTxResp>(create);
  static GetTxResp? _defaultInstance;

  @$pb.TagNumber(1)
  TxInfo get txInfo => $_getN(0);
  @$pb.TagNumber(1)
  set txInfo(TxInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTxInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearTxInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  TxInfo ensureTxInfo() => $_ensure(0);
}

class AddTxReq extends $pb.GeneratedMessage {
  factory AddTxReq({
    TxInfo? txInfo,
  }) {
    final result = create();
    if (txInfo != null) result.txInfo = txInfo;
    return result;
  }

  AddTxReq._();

  factory AddTxReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddTxReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddTxReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tx'),
      createEmptyInstance: create)
    ..aOM<TxInfo>(1, _omitFieldNames ? '' : 'txInfo', subBuilder: TxInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddTxReq clone() => AddTxReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddTxReq copyWith(void Function(AddTxReq) updates) =>
      super.copyWith((message) => updates(message as AddTxReq)) as AddTxReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddTxReq create() => AddTxReq._();
  @$core.override
  AddTxReq createEmptyInstance() => create();
  static $pb.PbList<AddTxReq> createRepeated() => $pb.PbList<AddTxReq>();
  @$core.pragma('dart2js:noInline')
  static AddTxReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddTxReq>(create);
  static AddTxReq? _defaultInstance;

  @$pb.TagNumber(1)
  TxInfo get txInfo => $_getN(0);
  @$pb.TagNumber(1)
  set txInfo(TxInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTxInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearTxInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  TxInfo ensureTxInfo() => $_ensure(0);
}

class AddTxResp extends $pb.GeneratedMessage {
  factory AddTxResp({
    TxInfo? txInfo,
  }) {
    final result = create();
    if (txInfo != null) result.txInfo = txInfo;
    return result;
  }

  AddTxResp._();

  factory AddTxResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddTxResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddTxResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tx'),
      createEmptyInstance: create)
    ..aOM<TxInfo>(1, _omitFieldNames ? '' : 'txInfo', subBuilder: TxInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddTxResp clone() => AddTxResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddTxResp copyWith(void Function(AddTxResp) updates) =>
      super.copyWith((message) => updates(message as AddTxResp)) as AddTxResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddTxResp create() => AddTxResp._();
  @$core.override
  AddTxResp createEmptyInstance() => create();
  static $pb.PbList<AddTxResp> createRepeated() => $pb.PbList<AddTxResp>();
  @$core.pragma('dart2js:noInline')
  static AddTxResp getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddTxResp>(create);
  static AddTxResp? _defaultInstance;

  @$pb.TagNumber(1)
  TxInfo get txInfo => $_getN(0);
  @$pb.TagNumber(1)
  set txInfo(TxInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTxInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearTxInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  TxInfo ensureTxInfo() => $_ensure(0);
}

class UpdateOrderTxHashReq extends $pb.GeneratedMessage {
  factory UpdateOrderTxHashReq({
    TxOrder? txOrder,
  }) {
    final result = create();
    if (txOrder != null) result.txOrder = txOrder;
    return result;
  }

  UpdateOrderTxHashReq._();

  factory UpdateOrderTxHashReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateOrderTxHashReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateOrderTxHashReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tx'),
      createEmptyInstance: create)
    ..aOM<TxOrder>(1, _omitFieldNames ? '' : 'txOrder',
        subBuilder: TxOrder.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateOrderTxHashReq clone() =>
      UpdateOrderTxHashReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateOrderTxHashReq copyWith(void Function(UpdateOrderTxHashReq) updates) =>
      super.copyWith((message) => updates(message as UpdateOrderTxHashReq))
          as UpdateOrderTxHashReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateOrderTxHashReq create() => UpdateOrderTxHashReq._();
  @$core.override
  UpdateOrderTxHashReq createEmptyInstance() => create();
  static $pb.PbList<UpdateOrderTxHashReq> createRepeated() =>
      $pb.PbList<UpdateOrderTxHashReq>();
  @$core.pragma('dart2js:noInline')
  static UpdateOrderTxHashReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateOrderTxHashReq>(create);
  static UpdateOrderTxHashReq? _defaultInstance;

  @$pb.TagNumber(1)
  TxOrder get txOrder => $_getN(0);
  @$pb.TagNumber(1)
  set txOrder(TxOrder value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTxOrder() => $_has(0);
  @$pb.TagNumber(1)
  void clearTxOrder() => $_clearField(1);
  @$pb.TagNumber(1)
  TxOrder ensureTxOrder() => $_ensure(0);
}

class GetTxListReq extends $pb.GeneratedMessage {
  factory GetTxListReq({
    $core.String? did,
    $2.Pagination? pagination,
  }) {
    final result = create();
    if (did != null) result.did = did;
    if (pagination != null) result.pagination = pagination;
    return result;
  }

  GetTxListReq._();

  factory GetTxListReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetTxListReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetTxListReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tx'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..aOM<$2.Pagination>(2, _omitFieldNames ? '' : 'pagination',
        subBuilder: $2.Pagination.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTxListReq clone() => GetTxListReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTxListReq copyWith(void Function(GetTxListReq) updates) =>
      super.copyWith((message) => updates(message as GetTxListReq))
          as GetTxListReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTxListReq create() => GetTxListReq._();
  @$core.override
  GetTxListReq createEmptyInstance() => create();
  static $pb.PbList<GetTxListReq> createRepeated() =>
      $pb.PbList<GetTxListReq>();
  @$core.pragma('dart2js:noInline')
  static GetTxListReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetTxListReq>(create);
  static GetTxListReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get did => $_getSZ(0);
  @$pb.TagNumber(1)
  set did($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $2.Pagination get pagination => $_getN(1);
  @$pb.TagNumber(2)
  set pagination($2.Pagination value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(2)
  void clearPagination() => $_clearField(2);
  @$pb.TagNumber(2)
  $2.Pagination ensurePagination() => $_ensure(1);
}

class GetTxListResp extends $pb.GeneratedMessage {
  factory GetTxListResp({
    $core.int? count,
    $core.Iterable<TxInfo>? infos,
  }) {
    final result = create();
    if (count != null) result.count = count;
    if (infos != null) result.infos.addAll(infos);
    return result;
  }

  GetTxListResp._();

  factory GetTxListResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetTxListResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetTxListResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tx'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'count', $pb.PbFieldType.O3)
    ..pc<TxInfo>(2, _omitFieldNames ? '' : 'infos', $pb.PbFieldType.PM,
        subBuilder: TxInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTxListResp clone() => GetTxListResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTxListResp copyWith(void Function(GetTxListResp) updates) =>
      super.copyWith((message) => updates(message as GetTxListResp))
          as GetTxListResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTxListResp create() => GetTxListResp._();
  @$core.override
  GetTxListResp createEmptyInstance() => create();
  static $pb.PbList<GetTxListResp> createRepeated() =>
      $pb.PbList<GetTxListResp>();
  @$core.pragma('dart2js:noInline')
  static GetTxListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetTxListResp>(create);
  static GetTxListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get count => $_getIZ(0);
  @$pb.TagNumber(1)
  set count($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearCount() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<TxInfo> get infos => $_getList(1);
}

class GetAllTxInfoReq extends $pb.GeneratedMessage {
  factory GetAllTxInfoReq({
    $core.String? id,
    $2.Pagination? pagination,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (pagination != null) result.pagination = pagination;
    return result;
  }

  GetAllTxInfoReq._();

  factory GetAllTxInfoReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetAllTxInfoReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetAllTxInfoReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tx'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOM<$2.Pagination>(2, _omitFieldNames ? '' : 'pagination',
        subBuilder: $2.Pagination.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAllTxInfoReq clone() => GetAllTxInfoReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAllTxInfoReq copyWith(void Function(GetAllTxInfoReq) updates) =>
      super.copyWith((message) => updates(message as GetAllTxInfoReq))
          as GetAllTxInfoReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAllTxInfoReq create() => GetAllTxInfoReq._();
  @$core.override
  GetAllTxInfoReq createEmptyInstance() => create();
  static $pb.PbList<GetAllTxInfoReq> createRepeated() =>
      $pb.PbList<GetAllTxInfoReq>();
  @$core.pragma('dart2js:noInline')
  static GetAllTxInfoReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetAllTxInfoReq>(create);
  static GetAllTxInfoReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $2.Pagination get pagination => $_getN(1);
  @$pb.TagNumber(2)
  set pagination($2.Pagination value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(2)
  void clearPagination() => $_clearField(2);
  @$pb.TagNumber(2)
  $2.Pagination ensurePagination() => $_ensure(1);
}

class GetAllTxInfoResp extends $pb.GeneratedMessage {
  factory GetAllTxInfoResp({
    $fixnum.Int64? total,
    $core.int? count,
    $core.Iterable<TxInfo>? infos,
  }) {
    final result = create();
    if (total != null) result.total = total;
    if (count != null) result.count = count;
    if (infos != null) result.infos.addAll(infos);
    return result;
  }

  GetAllTxInfoResp._();

  factory GetAllTxInfoResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetAllTxInfoResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetAllTxInfoResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tx'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'total')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'count', $pb.PbFieldType.O3)
    ..pc<TxInfo>(3, _omitFieldNames ? '' : 'infos', $pb.PbFieldType.PM,
        subBuilder: TxInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAllTxInfoResp clone() => GetAllTxInfoResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAllTxInfoResp copyWith(void Function(GetAllTxInfoResp) updates) =>
      super.copyWith((message) => updates(message as GetAllTxInfoResp))
          as GetAllTxInfoResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAllTxInfoResp create() => GetAllTxInfoResp._();
  @$core.override
  GetAllTxInfoResp createEmptyInstance() => create();
  static $pb.PbList<GetAllTxInfoResp> createRepeated() =>
      $pb.PbList<GetAllTxInfoResp>();
  @$core.pragma('dart2js:noInline')
  static GetAllTxInfoResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetAllTxInfoResp>(create);
  static GetAllTxInfoResp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get total => $_getI64(0);
  @$pb.TagNumber(1)
  set total($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotal() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotal() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<TxInfo> get infos => $_getList(2);
}

class PcOrderData extends $pb.GeneratedMessage {
  factory PcOrderData({
    $core.String? did,
    $core.String? rn,
  }) {
    final result = create();
    if (did != null) result.did = did;
    if (rn != null) result.rn = rn;
    return result;
  }

  PcOrderData._();

  factory PcOrderData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PcOrderData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PcOrderData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tx'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..aOS(2, _omitFieldNames ? '' : 'rn')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PcOrderData clone() => PcOrderData()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PcOrderData copyWith(void Function(PcOrderData) updates) =>
      super.copyWith((message) => updates(message as PcOrderData))
          as PcOrderData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PcOrderData create() => PcOrderData._();
  @$core.override
  PcOrderData createEmptyInstance() => create();
  static $pb.PbList<PcOrderData> createRepeated() => $pb.PbList<PcOrderData>();
  @$core.pragma('dart2js:noInline')
  static PcOrderData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PcOrderData>(create);
  static PcOrderData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get did => $_getSZ(0);
  @$pb.TagNumber(1)
  set did($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get rn => $_getSZ(1);
  @$pb.TagNumber(2)
  set rn($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRn() => $_has(1);
  @$pb.TagNumber(2)
  void clearRn() => $_clearField(2);
}

class PcOrder extends $pb.GeneratedMessage {
  factory PcOrder({
    $core.String? id,
    $core.String? orderId,
    $core.String? toDid,
    $core.String? amount,
    $core.String? type,
    $core.String? createdAt,
    $core.String? updatedAt,
    $core.String? deletedAt,
    $core.String? did,
    $core.String? status,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (orderId != null) result.orderId = orderId;
    if (toDid != null) result.toDid = toDid;
    if (amount != null) result.amount = amount;
    if (type != null) result.type = type;
    if (createdAt != null) result.createdAt = createdAt;
    if (updatedAt != null) result.updatedAt = updatedAt;
    if (deletedAt != null) result.deletedAt = deletedAt;
    if (did != null) result.did = did;
    if (status != null) result.status = status;
    return result;
  }

  PcOrder._();

  factory PcOrder.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PcOrder.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PcOrder',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tx'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'orderId')
    ..aOS(3, _omitFieldNames ? '' : 'toDid')
    ..aOS(4, _omitFieldNames ? '' : 'amount')
    ..aOS(5, _omitFieldNames ? '' : 'type')
    ..aOS(6, _omitFieldNames ? '' : 'createdAt')
    ..aOS(7, _omitFieldNames ? '' : 'updatedAt')
    ..aOS(8, _omitFieldNames ? '' : 'deletedAt')
    ..aOS(9, _omitFieldNames ? '' : 'did')
    ..aOS(10, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PcOrder clone() => PcOrder()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PcOrder copyWith(void Function(PcOrder) updates) =>
      super.copyWith((message) => updates(message as PcOrder)) as PcOrder;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PcOrder create() => PcOrder._();
  @$core.override
  PcOrder createEmptyInstance() => create();
  static $pb.PbList<PcOrder> createRepeated() => $pb.PbList<PcOrder>();
  @$core.pragma('dart2js:noInline')
  static PcOrder getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PcOrder>(create);
  static PcOrder? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get orderId => $_getSZ(1);
  @$pb.TagNumber(2)
  set orderId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOrderId() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrderId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get toDid => $_getSZ(2);
  @$pb.TagNumber(3)
  set toDid($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasToDid() => $_has(2);
  @$pb.TagNumber(3)
  void clearToDid() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get amount => $_getSZ(3);
  @$pb.TagNumber(4)
  set amount($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAmount() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get type => $_getSZ(4);
  @$pb.TagNumber(5)
  set type($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasType() => $_has(4);
  @$pb.TagNumber(5)
  void clearType() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get createdAt => $_getSZ(5);
  @$pb.TagNumber(6)
  set createdAt($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCreatedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreatedAt() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get updatedAt => $_getSZ(6);
  @$pb.TagNumber(7)
  set updatedAt($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasUpdatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpdatedAt() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get deletedAt => $_getSZ(7);
  @$pb.TagNumber(8)
  set deletedAt($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasDeletedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearDeletedAt() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get did => $_getSZ(8);
  @$pb.TagNumber(9)
  set did($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasDid() => $_has(8);
  @$pb.TagNumber(9)
  void clearDid() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get status => $_getSZ(9);
  @$pb.TagNumber(10)
  set status($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasStatus() => $_has(9);
  @$pb.TagNumber(10)
  void clearStatus() => $_clearField(10);
}

class GetNotPulledPcOrdersResp extends $pb.GeneratedMessage {
  factory GetNotPulledPcOrdersResp({
    $core.Iterable<PcOrder>? orders,
  }) {
    final result = create();
    if (orders != null) result.orders.addAll(orders);
    return result;
  }

  GetNotPulledPcOrdersResp._();

  factory GetNotPulledPcOrdersResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetNotPulledPcOrdersResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetNotPulledPcOrdersResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tx'),
      createEmptyInstance: create)
    ..pc<PcOrder>(1, _omitFieldNames ? '' : 'orders', $pb.PbFieldType.PM,
        subBuilder: PcOrder.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetNotPulledPcOrdersResp clone() =>
      GetNotPulledPcOrdersResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetNotPulledPcOrdersResp copyWith(
          void Function(GetNotPulledPcOrdersResp) updates) =>
      super.copyWith((message) => updates(message as GetNotPulledPcOrdersResp))
          as GetNotPulledPcOrdersResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNotPulledPcOrdersResp create() => GetNotPulledPcOrdersResp._();
  @$core.override
  GetNotPulledPcOrdersResp createEmptyInstance() => create();
  static $pb.PbList<GetNotPulledPcOrdersResp> createRepeated() =>
      $pb.PbList<GetNotPulledPcOrdersResp>();
  @$core.pragma('dart2js:noInline')
  static GetNotPulledPcOrdersResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetNotPulledPcOrdersResp>(create);
  static GetNotPulledPcOrdersResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<PcOrder> get orders => $_getList(0);
}

class UpdatePulledPcOrder extends $pb.GeneratedMessage {
  factory UpdatePulledPcOrder({
    $core.String? orderId,
    $core.String? status,
    $core.String? txHash,
    $fixnum.Int64? timestamp,
  }) {
    final result = create();
    if (orderId != null) result.orderId = orderId;
    if (status != null) result.status = status;
    if (txHash != null) result.txHash = txHash;
    if (timestamp != null) result.timestamp = timestamp;
    return result;
  }

  UpdatePulledPcOrder._();

  factory UpdatePulledPcOrder.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdatePulledPcOrder.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdatePulledPcOrder',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tx'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'orderId')
    ..aOS(2, _omitFieldNames ? '' : 'status')
    ..aOS(3, _omitFieldNames ? '' : 'txHash')
    ..aInt64(4, _omitFieldNames ? '' : 'timestamp')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdatePulledPcOrder clone() => UpdatePulledPcOrder()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdatePulledPcOrder copyWith(void Function(UpdatePulledPcOrder) updates) =>
      super.copyWith((message) => updates(message as UpdatePulledPcOrder))
          as UpdatePulledPcOrder;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePulledPcOrder create() => UpdatePulledPcOrder._();
  @$core.override
  UpdatePulledPcOrder createEmptyInstance() => create();
  static $pb.PbList<UpdatePulledPcOrder> createRepeated() =>
      $pb.PbList<UpdatePulledPcOrder>();
  @$core.pragma('dart2js:noInline')
  static UpdatePulledPcOrder getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdatePulledPcOrder>(create);
  static UpdatePulledPcOrder? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get orderId => $_getSZ(0);
  @$pb.TagNumber(1)
  set orderId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOrderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrderId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get status => $_getSZ(1);
  @$pb.TagNumber(2)
  set status($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get txHash => $_getSZ(2);
  @$pb.TagNumber(3)
  set txHash($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTxHash() => $_has(2);
  @$pb.TagNumber(3)
  void clearTxHash() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get timestamp => $_getI64(3);
  @$pb.TagNumber(4)
  set timestamp($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTimestamp() => $_has(3);
  @$pb.TagNumber(4)
  void clearTimestamp() => $_clearField(4);
}

class UpdatePulledPcOrderData extends $pb.GeneratedMessage {
  factory UpdatePulledPcOrderData({
    $core.String? did,
    $core.Iterable<UpdatePulledPcOrder>? orders,
  }) {
    final result = create();
    if (did != null) result.did = did;
    if (orders != null) result.orders.addAll(orders);
    return result;
  }

  UpdatePulledPcOrderData._();

  factory UpdatePulledPcOrderData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdatePulledPcOrderData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdatePulledPcOrderData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tx'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'did')
    ..pc<UpdatePulledPcOrder>(
        2, _omitFieldNames ? '' : 'orders', $pb.PbFieldType.PM,
        subBuilder: UpdatePulledPcOrder.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdatePulledPcOrderData clone() =>
      UpdatePulledPcOrderData()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdatePulledPcOrderData copyWith(
          void Function(UpdatePulledPcOrderData) updates) =>
      super.copyWith((message) => updates(message as UpdatePulledPcOrderData))
          as UpdatePulledPcOrderData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePulledPcOrderData create() => UpdatePulledPcOrderData._();
  @$core.override
  UpdatePulledPcOrderData createEmptyInstance() => create();
  static $pb.PbList<UpdatePulledPcOrderData> createRepeated() =>
      $pb.PbList<UpdatePulledPcOrderData>();
  @$core.pragma('dart2js:noInline')
  static UpdatePulledPcOrderData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdatePulledPcOrderData>(create);
  static UpdatePulledPcOrderData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get did => $_getSZ(0);
  @$pb.TagNumber(1)
  set did($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearDid() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<UpdatePulledPcOrder> get orders => $_getList(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
