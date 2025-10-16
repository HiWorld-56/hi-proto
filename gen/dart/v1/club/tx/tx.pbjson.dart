// This is a generated file - do not edit.
//
// Generated from v1/club/tx/tx.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getTxFeeReqDescriptor instead')
const GetTxFeeReq$json = {
  '1': 'GetTxFeeReq',
  '2': [
    {'1': 'coin', '3': 1, '4': 1, '5': 9, '10': 'coin'},
  ],
};

/// Descriptor for `GetTxFeeReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTxFeeReqDescriptor =
    $convert.base64Decode('CgtHZXRUeEZlZVJlcRISCgRjb2luGAEgASgJUgRjb2lu');

@$core.Deprecated('Use getTxFeeRespDescriptor instead')
const GetTxFeeResp$json = {
  '1': 'GetTxFeeResp',
  '2': [
    {'1': 'coin', '3': 1, '4': 1, '5': 9, '10': 'coin'},
    {'1': 'fee', '3': 2, '4': 1, '5': 9, '10': 'fee'},
  ],
};

/// Descriptor for `GetTxFeeResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTxFeeRespDescriptor = $convert.base64Decode(
    'CgxHZXRUeEZlZVJlc3ASEgoEY29pbhgBIAEoCVIEY29pbhIQCgNmZWUYAiABKAlSA2ZlZQ==');

@$core.Deprecated('Use getTxReqDescriptor instead')
const GetTxReq$json = {
  '1': 'GetTxReq',
  '2': [
    {'1': 'tx_id', '3': 1, '4': 1, '5': 9, '10': 'txId'},
    {'1': 'order_id', '3': 2, '4': 1, '5': 9, '10': 'orderId'},
  ],
};

/// Descriptor for `GetTxReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTxReqDescriptor = $convert.base64Decode(
    'CghHZXRUeFJlcRITCgV0eF9pZBgBIAEoCVIEdHhJZBIZCghvcmRlcl9pZBgCIAEoCVIHb3JkZX'
    'JJZA==');

@$core.Deprecated('Use txPartyDescriptor instead')
const TxParty$json = {
  '1': 'TxParty',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'coin', '3': 2, '4': 1, '5': 9, '10': 'coin'},
    {'1': 'total_amount', '3': 3, '4': 1, '5': 9, '10': 'totalAmount'},
    {'1': 'amount', '3': 4, '4': 1, '5': 9, '10': 'amount'},
    {'1': 'fee', '3': 5, '4': 1, '5': 9, '10': 'fee'},
  ],
};

/// Descriptor for `TxParty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List txPartyDescriptor = $convert.base64Decode(
    'CgdUeFBhcnR5EhAKA2RpZBgBIAEoCVIDZGlkEhIKBGNvaW4YAiABKAlSBGNvaW4SIQoMdG90YW'
    'xfYW1vdW50GAMgASgJUgt0b3RhbEFtb3VudBIWCgZhbW91bnQYBCABKAlSBmFtb3VudBIQCgNm'
    'ZWUYBSABKAlSA2ZlZQ==');

@$core.Deprecated('Use txOrderDescriptor instead')
const TxOrder$json = {
  '1': 'TxOrder',
  '2': [
    {'1': 'order_id', '3': 1, '4': 1, '5': 9, '10': 'orderId'},
    {'1': 'tx_hash', '3': 2, '4': 1, '5': 9, '10': 'txHash'},
    {'1': 'from', '3': 3, '4': 1, '5': 9, '10': 'from'},
    {'1': 'to', '3': 4, '4': 1, '5': 9, '10': 'to'},
    {'1': 'coin', '3': 5, '4': 1, '5': 9, '10': 'coin'},
    {'1': 'total_amount', '3': 6, '4': 1, '5': 9, '10': 'totalAmount'},
    {'1': 'amount', '3': 7, '4': 1, '5': 9, '10': 'amount'},
    {'1': 'order_status', '3': 8, '4': 1, '5': 9, '10': 'orderStatus'},
    {'1': 'created_at', '3': 9, '4': 1, '5': 9, '10': 'createdAt'},
    {'1': 'updated_at', '3': 10, '4': 1, '5': 9, '10': 'updatedAt'},
    {'1': 'status', '3': 11, '4': 1, '5': 9, '10': 'status'},
    {'1': 'tx_stage', '3': 12, '4': 1, '5': 9, '10': 'txStage'},
  ],
};

/// Descriptor for `TxOrder`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List txOrderDescriptor = $convert.base64Decode(
    'CgdUeE9yZGVyEhkKCG9yZGVyX2lkGAEgASgJUgdvcmRlcklkEhcKB3R4X2hhc2gYAiABKAlSBn'
    'R4SGFzaBISCgRmcm9tGAMgASgJUgRmcm9tEg4KAnRvGAQgASgJUgJ0bxISCgRjb2luGAUgASgJ'
    'UgRjb2luEiEKDHRvdGFsX2Ftb3VudBgGIAEoCVILdG90YWxBbW91bnQSFgoGYW1vdW50GAcgAS'
    'gJUgZhbW91bnQSIQoMb3JkZXJfc3RhdHVzGAggASgJUgtvcmRlclN0YXR1cxIdCgpjcmVhdGVk'
    'X2F0GAkgASgJUgljcmVhdGVkQXQSHQoKdXBkYXRlZF9hdBgKIAEoCVIJdXBkYXRlZEF0EhYKBn'
    'N0YXR1cxgLIAEoCVIGc3RhdHVzEhkKCHR4X3N0YWdlGAwgASgJUgd0eFN0YWdl');

@$core.Deprecated('Use txInfoDescriptor instead')
const TxInfo$json = {
  '1': 'TxInfo',
  '2': [
    {'1': 'tx_id', '3': 1, '4': 1, '5': 9, '10': 'txId'},
    {'1': 'tx_status', '3': 2, '4': 1, '5': 9, '10': 'txStatus'},
    {
      '1': 'initiator',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.tx.TxParty',
      '10': 'initiator'
    },
    {
      '1': 'recipient',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.tx.TxParty',
      '10': 'recipient'
    },
    {
      '1': 'tx_orders',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.tx.TxInfo.TxOrdersEntry',
      '10': 'txOrders'
    },
    {'1': 'created_at', '3': 6, '4': 1, '5': 9, '10': 'createdAt'},
    {'1': 'updated_at', '3': 7, '4': 1, '5': 9, '10': 'updatedAt'},
    {'1': 'timestamp', '3': 8, '4': 1, '5': 9, '10': 'timestamp'},
  ],
  '3': [TxInfo_TxOrdersEntry$json],
};

@$core.Deprecated('Use txInfoDescriptor instead')
const TxInfo_TxOrdersEntry$json = {
  '1': 'TxOrdersEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.tx.TxOrder', '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `TxInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List txInfoDescriptor = $convert.base64Decode(
    'CgZUeEluZm8SEwoFdHhfaWQYASABKAlSBHR4SWQSGwoJdHhfc3RhdHVzGAIgASgJUgh0eFN0YX'
    'R1cxIpCglpbml0aWF0b3IYAyABKAsyCy50eC5UeFBhcnR5Uglpbml0aWF0b3ISKQoJcmVjaXBp'
    'ZW50GAQgASgLMgsudHguVHhQYXJ0eVIJcmVjaXBpZW50EjUKCXR4X29yZGVycxgFIAMoCzIYLn'
    'R4LlR4SW5mby5UeE9yZGVyc0VudHJ5Ugh0eE9yZGVycxIdCgpjcmVhdGVkX2F0GAYgASgJUglj'
    'cmVhdGVkQXQSHQoKdXBkYXRlZF9hdBgHIAEoCVIJdXBkYXRlZEF0EhwKCXRpbWVzdGFtcBgIIA'
    'EoCVIJdGltZXN0YW1wGkgKDVR4T3JkZXJzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSIQoFdmFs'
    'dWUYAiABKAsyCy50eC5UeE9yZGVyUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use getTxRespDescriptor instead')
const GetTxResp$json = {
  '1': 'GetTxResp',
  '2': [
    {
      '1': 'tx_info',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.tx.TxInfo',
      '10': 'txInfo'
    },
  ],
};

/// Descriptor for `GetTxResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTxRespDescriptor = $convert.base64Decode(
    'CglHZXRUeFJlc3ASIwoHdHhfaW5mbxgBIAEoCzIKLnR4LlR4SW5mb1IGdHhJbmZv');

@$core.Deprecated('Use addTxReqDescriptor instead')
const AddTxReq$json = {
  '1': 'AddTxReq',
  '2': [
    {
      '1': 'tx_info',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.tx.TxInfo',
      '10': 'txInfo'
    },
  ],
};

/// Descriptor for `AddTxReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addTxReqDescriptor = $convert.base64Decode(
    'CghBZGRUeFJlcRIjCgd0eF9pbmZvGAEgASgLMgoudHguVHhJbmZvUgZ0eEluZm8=');

@$core.Deprecated('Use addTxRespDescriptor instead')
const AddTxResp$json = {
  '1': 'AddTxResp',
  '2': [
    {
      '1': 'tx_info',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.tx.TxInfo',
      '10': 'txInfo'
    },
  ],
};

/// Descriptor for `AddTxResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addTxRespDescriptor = $convert.base64Decode(
    'CglBZGRUeFJlc3ASIwoHdHhfaW5mbxgBIAEoCzIKLnR4LlR4SW5mb1IGdHhJbmZv');

@$core.Deprecated('Use updateOrderTxHashReqDescriptor instead')
const UpdateOrderTxHashReq$json = {
  '1': 'UpdateOrderTxHashReq',
  '2': [
    {
      '1': 'tx_order',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.tx.TxOrder',
      '10': 'txOrder'
    },
  ],
};

/// Descriptor for `UpdateOrderTxHashReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateOrderTxHashReqDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVPcmRlclR4SGFzaFJlcRImCgh0eF9vcmRlchgBIAEoCzILLnR4LlR4T3JkZXJSB3'
    'R4T3JkZXI=');

@$core.Deprecated('Use getTxListReqDescriptor instead')
const GetTxListReq$json = {
  '1': 'GetTxListReq',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {
      '1': 'pagination',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.hi.Pagination',
      '10': 'pagination'
    },
  ],
};

/// Descriptor for `GetTxListReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTxListReqDescriptor = $convert.base64Decode(
    'CgxHZXRUeExpc3RSZXESEAoDZGlkGAEgASgJUgNkaWQSLgoKcGFnaW5hdGlvbhgCIAEoCzIOLm'
    'hpLlBhZ2luYXRpb25SCnBhZ2luYXRpb24=');

@$core.Deprecated('Use getTxListRespDescriptor instead')
const GetTxListResp$json = {
  '1': 'GetTxListResp',
  '2': [
    {'1': 'count', '3': 1, '4': 1, '5': 5, '10': 'count'},
    {'1': 'infos', '3': 2, '4': 3, '5': 11, '6': '.tx.TxInfo', '10': 'infos'},
  ],
};

/// Descriptor for `GetTxListResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTxListRespDescriptor = $convert.base64Decode(
    'Cg1HZXRUeExpc3RSZXNwEhQKBWNvdW50GAEgASgFUgVjb3VudBIgCgVpbmZvcxgCIAMoCzIKLn'
    'R4LlR4SW5mb1IFaW5mb3M=');

@$core.Deprecated('Use getAllTxInfoReqDescriptor instead')
const GetAllTxInfoReq$json = {
  '1': 'GetAllTxInfoReq',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {
      '1': 'pagination',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.hi.Pagination',
      '10': 'pagination'
    },
  ],
};

/// Descriptor for `GetAllTxInfoReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAllTxInfoReqDescriptor = $convert.base64Decode(
    'Cg9HZXRBbGxUeEluZm9SZXESDgoCaWQYASABKAlSAmlkEi4KCnBhZ2luYXRpb24YAiABKAsyDi'
    '5oaS5QYWdpbmF0aW9uUgpwYWdpbmF0aW9u');

@$core.Deprecated('Use getAllTxInfoRespDescriptor instead')
const GetAllTxInfoResp$json = {
  '1': 'GetAllTxInfoResp',
  '2': [
    {'1': 'total', '3': 1, '4': 1, '5': 3, '10': 'total'},
    {'1': 'count', '3': 2, '4': 1, '5': 5, '10': 'count'},
    {'1': 'infos', '3': 3, '4': 3, '5': 11, '6': '.tx.TxInfo', '10': 'infos'},
  ],
};

/// Descriptor for `GetAllTxInfoResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAllTxInfoRespDescriptor = $convert.base64Decode(
    'ChBHZXRBbGxUeEluZm9SZXNwEhQKBXRvdGFsGAEgASgDUgV0b3RhbBIUCgVjb3VudBgCIAEoBV'
    'IFY291bnQSIAoFaW5mb3MYAyADKAsyCi50eC5UeEluZm9SBWluZm9z');

@$core.Deprecated('Use pcOrderDataDescriptor instead')
const PcOrderData$json = {
  '1': 'PcOrderData',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'rn', '3': 2, '4': 1, '5': 9, '10': 'rn'},
  ],
};

/// Descriptor for `PcOrderData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pcOrderDataDescriptor = $convert.base64Decode(
    'CgtQY09yZGVyRGF0YRIQCgNkaWQYASABKAlSA2RpZBIOCgJybhgCIAEoCVICcm4=');

@$core.Deprecated('Use pcOrderDescriptor instead')
const PcOrder$json = {
  '1': 'PcOrder',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'order_id', '3': 2, '4': 1, '5': 9, '10': 'orderId'},
    {'1': 'to_did', '3': 3, '4': 1, '5': 9, '10': 'toDid'},
    {'1': 'amount', '3': 4, '4': 1, '5': 9, '10': 'amount'},
    {'1': 'type', '3': 5, '4': 1, '5': 9, '10': 'type'},
    {'1': 'created_at', '3': 6, '4': 1, '5': 9, '10': 'createdAt'},
    {'1': 'updated_at', '3': 7, '4': 1, '5': 9, '10': 'updatedAt'},
    {'1': 'deleted_at', '3': 8, '4': 1, '5': 9, '10': 'deletedAt'},
    {'1': 'did', '3': 9, '4': 1, '5': 9, '10': 'did'},
    {'1': 'status', '3': 10, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `PcOrder`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pcOrderDescriptor = $convert.base64Decode(
    'CgdQY09yZGVyEg4KAmlkGAEgASgJUgJpZBIZCghvcmRlcl9pZBgCIAEoCVIHb3JkZXJJZBIVCg'
    'Z0b19kaWQYAyABKAlSBXRvRGlkEhYKBmFtb3VudBgEIAEoCVIGYW1vdW50EhIKBHR5cGUYBSAB'
    'KAlSBHR5cGUSHQoKY3JlYXRlZF9hdBgGIAEoCVIJY3JlYXRlZEF0Eh0KCnVwZGF0ZWRfYXQYBy'
    'ABKAlSCXVwZGF0ZWRBdBIdCgpkZWxldGVkX2F0GAggASgJUglkZWxldGVkQXQSEAoDZGlkGAkg'
    'ASgJUgNkaWQSFgoGc3RhdHVzGAogASgJUgZzdGF0dXM=');

@$core.Deprecated('Use getNotPulledPcOrdersRespDescriptor instead')
const GetNotPulledPcOrdersResp$json = {
  '1': 'GetNotPulledPcOrdersResp',
  '2': [
    {
      '1': 'orders',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.tx.PcOrder',
      '10': 'orders'
    },
  ],
};

/// Descriptor for `GetNotPulledPcOrdersResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNotPulledPcOrdersRespDescriptor =
    $convert.base64Decode(
        'ChhHZXROb3RQdWxsZWRQY09yZGVyc1Jlc3ASIwoGb3JkZXJzGAEgAygLMgsudHguUGNPcmRlcl'
        'IGb3JkZXJz');

@$core.Deprecated('Use updatePulledPcOrderDescriptor instead')
const UpdatePulledPcOrder$json = {
  '1': 'UpdatePulledPcOrder',
  '2': [
    {'1': 'order_id', '3': 1, '4': 1, '5': 9, '10': 'orderId'},
    {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
    {'1': 'tx_hash', '3': 3, '4': 1, '5': 9, '10': 'txHash'},
    {'1': 'timestamp', '3': 4, '4': 1, '5': 3, '10': 'timestamp'},
  ],
};

/// Descriptor for `UpdatePulledPcOrder`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePulledPcOrderDescriptor = $convert.base64Decode(
    'ChNVcGRhdGVQdWxsZWRQY09yZGVyEhkKCG9yZGVyX2lkGAEgASgJUgdvcmRlcklkEhYKBnN0YX'
    'R1cxgCIAEoCVIGc3RhdHVzEhcKB3R4X2hhc2gYAyABKAlSBnR4SGFzaBIcCgl0aW1lc3RhbXAY'
    'BCABKANSCXRpbWVzdGFtcA==');

@$core.Deprecated('Use updatePulledPcOrderDataDescriptor instead')
const UpdatePulledPcOrderData$json = {
  '1': 'UpdatePulledPcOrderData',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {
      '1': 'orders',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.tx.UpdatePulledPcOrder',
      '10': 'orders'
    },
  ],
};

/// Descriptor for `UpdatePulledPcOrderData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePulledPcOrderDataDescriptor =
    $convert.base64Decode(
        'ChdVcGRhdGVQdWxsZWRQY09yZGVyRGF0YRIQCgNkaWQYASABKAlSA2RpZBIvCgZvcmRlcnMYAi'
        'ADKAsyFy50eC5VcGRhdGVQdWxsZWRQY09yZGVyUgZvcmRlcnM=');
