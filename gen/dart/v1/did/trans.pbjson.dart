// This is a generated file - do not edit.
//
// Generated from v1/did/trans.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use transactionInfoDescriptor instead')
const TransactionInfo$json = {
  '1': 'TransactionInfo',
  '2': [
    {'1': 'hash', '3': 1, '4': 1, '5': 9, '10': 'hash'},
    {'1': 'from', '3': 2, '4': 1, '5': 9, '10': 'from'},
    {'1': 'to', '3': 3, '4': 1, '5': 9, '10': 'to'},
    {'1': 'amount', '3': 4, '4': 1, '5': 9, '10': 'amount'},
    {'1': 'coin', '3': 5, '4': 1, '5': 9, '10': 'coin'},
  ],
};

/// Descriptor for `TransactionInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionInfoDescriptor = $convert.base64Decode(
    'Cg9UcmFuc2FjdGlvbkluZm8SEgoEaGFzaBgBIAEoCVIEaGFzaBISCgRmcm9tGAIgASgJUgRmcm'
    '9tEg4KAnRvGAMgASgJUgJ0bxIWCgZhbW91bnQYBCABKAlSBmFtb3VudBISCgRjb2luGAUgASgJ'
    'UgRjb2lu');

@$core.Deprecated('Use listTransactionsReqDescriptor instead')
const ListTransactionsReq$json = {
  '1': 'ListTransactionsReq',
  '2': [
    {'1': 'coin', '3': 1, '4': 1, '5': 9, '10': 'coin'},
    {'1': 'address', '3': 2, '4': 1, '5': 9, '10': 'address'},
    {
      '1': 'pagination',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.hi.Pagination',
      '10': 'pagination'
    },
  ],
};

/// Descriptor for `ListTransactionsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTransactionsReqDescriptor = $convert.base64Decode(
    'ChNMaXN0VHJhbnNhY3Rpb25zUmVxEhIKBGNvaW4YASABKAlSBGNvaW4SGAoHYWRkcmVzcxgCIA'
    'EoCVIHYWRkcmVzcxIuCgpwYWdpbmF0aW9uGAQgASgLMg4uaGkuUGFnaW5hdGlvblIKcGFnaW5h'
    'dGlvbg==');

@$core.Deprecated('Use listTransactionsRespDescriptor instead')
const ListTransactionsResp$json = {
  '1': 'ListTransactionsResp',
  '2': [
    {
      '1': 'list',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.did.ListTransactionsResp.Unit',
      '10': 'list'
    },
    {'1': 'is_end', '3': 3, '4': 1, '5': 8, '10': 'isEnd'},
  ],
  '3': [ListTransactionsResp_Unit$json],
};

@$core.Deprecated('Use listTransactionsRespDescriptor instead')
const ListTransactionsResp_Unit$json = {
  '1': 'Unit',
  '2': [
    {
      '1': 'trans',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.did.TransactionInfo',
      '10': 'trans'
    },
    {'1': 'direction', '3': 5, '4': 1, '5': 5, '10': 'direction'},
    {'1': 'status', '3': 6, '4': 1, '5': 5, '10': 'status'},
    {'1': 'timestamp', '3': 7, '4': 1, '5': 3, '10': 'timestamp'},
  ],
};

/// Descriptor for `ListTransactionsResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTransactionsRespDescriptor = $convert.base64Decode(
    'ChRMaXN0VHJhbnNhY3Rpb25zUmVzcBIyCgRsaXN0GAEgAygLMh4uZGlkLkxpc3RUcmFuc2FjdG'
    'lvbnNSZXNwLlVuaXRSBGxpc3QSFQoGaXNfZW5kGAMgASgIUgVpc0VuZBqGAQoEVW5pdBIqCgV0'
    'cmFucxgBIAEoCzIULmRpZC5UcmFuc2FjdGlvbkluZm9SBXRyYW5zEhwKCWRpcmVjdGlvbhgFIA'
    'EoBVIJZGlyZWN0aW9uEhYKBnN0YXR1cxgGIAEoBVIGc3RhdHVzEhwKCXRpbWVzdGFtcBgHIAEo'
    'A1IJdGltZXN0YW1w');

@$core.Deprecated('Use getTransactionDetailReqDescriptor instead')
const GetTransactionDetailReq$json = {
  '1': 'GetTransactionDetailReq',
  '2': [
    {
      '1': 'trans',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.did.TransactionInfo',
      '10': 'trans'
    },
    {'1': 'verify_hash_dump', '3': 6, '4': 1, '5': 9, '10': 'verifyHashDump'},
    {'1': 'verify_tran', '3': 7, '4': 1, '5': 9, '10': 'verifyTran'},
  ],
};

/// Descriptor for `GetTransactionDetailReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTransactionDetailReqDescriptor = $convert.base64Decode(
    'ChdHZXRUcmFuc2FjdGlvbkRldGFpbFJlcRIqCgV0cmFucxgBIAEoCzIULmRpZC5UcmFuc2FjdG'
    'lvbkluZm9SBXRyYW5zEigKEHZlcmlmeV9oYXNoX2R1bXAYBiABKAlSDnZlcmlmeUhhc2hEdW1w'
    'Eh8KC3ZlcmlmeV90cmFuGAcgASgJUgp2ZXJpZnlUcmFu');

@$core.Deprecated('Use getTransactionDetailRespDescriptor instead')
const GetTransactionDetailResp$json = {
  '1': 'GetTransactionDetailResp',
  '2': [
    {
      '1': 'trans',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.did.TransactionInfo',
      '10': 'trans'
    },
    {'1': 'timestamp', '3': 2, '4': 1, '5': 9, '10': 'timestamp'},
    {'1': 'confirmed_blocks', '3': 3, '4': 1, '5': 3, '10': 'confirmedBlocks'},
    {'1': 'status', '3': 4, '4': 1, '5': 9, '10': 'status'},
    {'1': 'error', '3': 5, '4': 1, '5': 9, '10': 'error'},
  ],
};

/// Descriptor for `GetTransactionDetailResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTransactionDetailRespDescriptor = $convert.base64Decode(
    'ChhHZXRUcmFuc2FjdGlvbkRldGFpbFJlc3ASKgoFdHJhbnMYASABKAsyFC5kaWQuVHJhbnNhY3'
    'Rpb25JbmZvUgV0cmFucxIcCgl0aW1lc3RhbXAYAiABKAlSCXRpbWVzdGFtcBIpChBjb25maXJt'
    'ZWRfYmxvY2tzGAMgASgDUg9jb25maXJtZWRCbG9ja3MSFgoGc3RhdHVzGAQgASgJUgZzdGF0dX'
    'MSFAoFZXJyb3IYBSABKAlSBWVycm9y');
