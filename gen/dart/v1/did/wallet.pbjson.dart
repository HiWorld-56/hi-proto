// This is a generated file - do not edit.
//
// Generated from v1/did/wallet.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use updateAddressesReqDescriptor instead')
const UpdateAddressesReq$json = {
  '1': 'UpdateAddressesReq',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'btc', '3': 2, '4': 1, '5': 9, '10': 'btc'},
    {'1': 'eth', '3': 3, '4': 1, '5': 9, '10': 'eth'},
    {'1': 'trx', '3': 4, '4': 1, '5': 9, '10': 'trx'},
    {'1': 'sol', '3': 5, '4': 1, '5': 9, '10': 'sol'},
    {'1': 'apt', '3': 6, '4': 1, '5': 9, '10': 'apt'},
  ],
};

/// Descriptor for `UpdateAddressesReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateAddressesReqDescriptor = $convert.base64Decode(
    'ChJVcGRhdGVBZGRyZXNzZXNSZXESEAoDZGlkGAEgASgJUgNkaWQSEAoDYnRjGAIgASgJUgNidG'
    'MSEAoDZXRoGAMgASgJUgNldGgSEAoDdHJ4GAQgASgJUgN0cngSEAoDc29sGAUgASgJUgNzb2wS'
    'EAoDYXB0GAYgASgJUgNhcHQ=');

@$core.Deprecated('Use getWalletReqDescriptor instead')
const GetWalletReq$json = {
  '1': 'GetWalletReq',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'coin', '3': 2, '4': 1, '5': 9, '10': 'coin'},
  ],
};

/// Descriptor for `GetWalletReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getWalletReqDescriptor = $convert.base64Decode(
    'CgxHZXRXYWxsZXRSZXESEAoDZGlkGAEgASgJUgNkaWQSEgoEY29pbhgCIAEoCVIEY29pbg==');

@$core.Deprecated('Use getWalletRespDescriptor instead')
const GetWalletResp$json = {
  '1': 'GetWalletResp',
  '2': [
    {
      '1': 'list',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.did.GetWalletResp.Unit',
      '10': 'list'
    },
  ],
  '3': [GetWalletResp_Unit$json],
};

@$core.Deprecated('Use getWalletRespDescriptor instead')
const GetWalletResp_Unit$json = {
  '1': 'Unit',
  '2': [
    {'1': 'coin', '3': 1, '4': 1, '5': 9, '10': 'coin'},
    {'1': 'address', '3': 2, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `GetWalletResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getWalletRespDescriptor = $convert.base64Decode(
    'Cg1HZXRXYWxsZXRSZXNwEisKBGxpc3QYASADKAsyFy5kaWQuR2V0V2FsbGV0UmVzcC5Vbml0Ug'
    'RsaXN0GjQKBFVuaXQSEgoEY29pbhgBIAEoCVIEY29pbhIYCgdhZGRyZXNzGAIgASgJUgdhZGRy'
    'ZXNz');

@$core.Deprecated('Use listAddressesReqDescriptor instead')
const ListAddressesReq$json = {
  '1': 'ListAddressesReq',
  '2': [
    {
      '1': 'list',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.did.ListAddressesReq.Unit',
      '10': 'list'
    },
  ],
  '3': [ListAddressesReq_Unit$json],
};

@$core.Deprecated('Use listAddressesReqDescriptor instead')
const ListAddressesReq_Unit$json = {
  '1': 'Unit',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'coin', '3': 2, '4': 1, '5': 9, '10': 'coin'},
  ],
};

/// Descriptor for `ListAddressesReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAddressesReqDescriptor = $convert.base64Decode(
    'ChBMaXN0QWRkcmVzc2VzUmVxEi4KBGxpc3QYASADKAsyGi5kaWQuTGlzdEFkZHJlc3Nlc1JlcS'
    '5Vbml0UgRsaXN0GiwKBFVuaXQSEAoDZGlkGAEgASgJUgNkaWQSEgoEY29pbhgCIAEoCVIEY29p'
    'bg==');

@$core.Deprecated('Use listAddressesRespDescriptor instead')
const ListAddressesResp$json = {
  '1': 'ListAddressesResp',
  '2': [
    {
      '1': 'list',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.did.ListAddressesResp.Unit',
      '10': 'list'
    },
  ],
  '3': [ListAddressesResp_Unit$json],
};

@$core.Deprecated('Use listAddressesRespDescriptor instead')
const ListAddressesResp_Unit$json = {
  '1': 'Unit',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'coin', '3': 2, '4': 1, '5': 11, '6': '.did.Coin', '10': 'coin'},
    {'1': 'address', '3': 3, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `ListAddressesResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAddressesRespDescriptor = $convert.base64Decode(
    'ChFMaXN0QWRkcmVzc2VzUmVzcBIvCgRsaXN0GAEgAygLMhsuZGlkLkxpc3RBZGRyZXNzZXNSZX'
    'NwLlVuaXRSBGxpc3QaUQoEVW5pdBIQCgNkaWQYASABKAlSA2RpZBIdCgRjb2luGAIgASgLMgku'
    'ZGlkLkNvaW5SBGNvaW4SGAoHYWRkcmVzcxgDIAEoCVIHYWRkcmVzcw==');

@$core.Deprecated('Use totalAssetsReqDescriptor instead')
const TotalAssetsReq$json = {
  '1': 'TotalAssetsReq',
  '2': [
    {'1': 'coin', '3': 1, '4': 1, '5': 9, '10': 'coin'},
  ],
};

/// Descriptor for `TotalAssetsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List totalAssetsReqDescriptor =
    $convert.base64Decode('Cg5Ub3RhbEFzc2V0c1JlcRISCgRjb2luGAEgASgJUgRjb2lu');

@$core.Deprecated('Use totalAssetsRespDescriptor instead')
const TotalAssetsResp$json = {
  '1': 'TotalAssetsResp',
  '2': [
    {'1': 'n', '3': 1, '4': 1, '5': 9, '10': 'n'},
  ],
};

/// Descriptor for `TotalAssetsResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List totalAssetsRespDescriptor =
    $convert.base64Decode('Cg9Ub3RhbEFzc2V0c1Jlc3ASDAoBbhgBIAEoCVIBbg==');

@$core.Deprecated('Use listUsersAssetsReqDescriptor instead')
const ListUsersAssetsReq$json = {
  '1': 'ListUsersAssetsReq',
  '2': [
    {'1': 'coin', '3': 1, '4': 1, '5': 9, '10': 'coin'},
    {'1': 'p', '3': 2, '4': 1, '5': 11, '6': '.hi.Pagination', '10': 'p'},
  ],
};

/// Descriptor for `ListUsersAssetsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listUsersAssetsReqDescriptor = $convert.base64Decode(
    'ChJMaXN0VXNlcnNBc3NldHNSZXESEgoEY29pbhgBIAEoCVIEY29pbhIcCgFwGAIgASgLMg4uaG'
    'kuUGFnaW5hdGlvblIBcA==');

@$core.Deprecated('Use listUsersAssetsRespDescriptor instead')
const ListUsersAssetsResp$json = {
  '1': 'ListUsersAssetsResp',
  '2': [
    {'1': 'n', '3': 2, '4': 3, '5': 9, '10': 'n'},
  ],
};

/// Descriptor for `ListUsersAssetsResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listUsersAssetsRespDescriptor =
    $convert.base64Decode('ChNMaXN0VXNlcnNBc3NldHNSZXNwEgwKAW4YAiADKAlSAW4=');

@$core.Deprecated('Use getUserAssetsReqDescriptor instead')
const GetUserAssetsReq$json = {
  '1': 'GetUserAssetsReq',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'coin', '3': 2, '4': 1, '5': 9, '10': 'coin'},
  ],
};

/// Descriptor for `GetUserAssetsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserAssetsReqDescriptor = $convert.base64Decode(
    'ChBHZXRVc2VyQXNzZXRzUmVxEhAKA2RpZBgBIAEoCVIDZGlkEhIKBGNvaW4YAiABKAlSBGNvaW'
    '4=');

@$core.Deprecated('Use getUserAssetsRespDescriptor instead')
const GetUserAssetsResp$json = {
  '1': 'GetUserAssetsResp',
  '2': [
    {
      '1': 'unit',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.did.GetUserAssetsResp.Unit',
      '10': 'unit'
    },
  ],
  '3': [GetUserAssetsResp_Unit$json],
};

@$core.Deprecated('Use getUserAssetsRespDescriptor instead')
const GetUserAssetsResp_Unit$json = {
  '1': 'Unit',
  '2': [
    {'1': 'coin', '3': 1, '4': 1, '5': 11, '6': '.did.Coin', '10': 'coin'},
    {'1': 'address', '3': 2, '4': 1, '5': 9, '10': 'address'},
    {'1': 'amount', '3': 3, '4': 1, '5': 9, '10': 'amount'},
    {'1': 'cny', '3': 4, '4': 1, '5': 9, '10': 'cny'},
    {'1': 'usd', '3': 5, '4': 1, '5': 9, '10': 'usd'},
  ],
};

/// Descriptor for `GetUserAssetsResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserAssetsRespDescriptor = $convert.base64Decode(
    'ChFHZXRVc2VyQXNzZXRzUmVzcBIvCgR1bml0GAEgAygLMhsuZGlkLkdldFVzZXJBc3NldHNSZX'
    'NwLlVuaXRSBHVuaXQaewoEVW5pdBIdCgRjb2luGAEgASgLMgkuZGlkLkNvaW5SBGNvaW4SGAoH'
    'YWRkcmVzcxgCIAEoCVIHYWRkcmVzcxIWCgZhbW91bnQYAyABKAlSBmFtb3VudBIQCgNjbnkYBC'
    'ABKAlSA2NueRIQCgN1c2QYBSABKAlSA3VzZA==');

@$core.Deprecated('Use updateAssetsReqDescriptor instead')
const UpdateAssetsReq$json = {
  '1': 'UpdateAssetsReq',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'btc', '3': 2, '4': 1, '5': 9, '10': 'btc'},
    {'1': 'eth', '3': 31, '4': 1, '5': 9, '10': 'eth'},
    {'1': 'usdt_erc20', '3': 32, '4': 1, '5': 9, '10': 'usdtErc20'},
    {'1': 'trx', '3': 41, '4': 1, '5': 9, '10': 'trx'},
    {'1': 'usdt_trc20', '3': 42, '4': 1, '5': 9, '10': 'usdtTrc20'},
    {'1': 'whds_trc20', '3': 43, '4': 1, '5': 9, '10': 'whdsTrc20'},
    {'1': 'bt_trc20', '3': 44, '4': 1, '5': 9, '10': 'btTrc20'},
    {'1': 'sol', '3': 51, '4': 1, '5': 9, '10': 'sol'},
    {'1': 'usdt_sol', '3': 52, '4': 1, '5': 9, '10': 'usdtSol'},
    {'1': 'bt_sol', '3': 53, '4': 1, '5': 9, '10': 'btSol'},
    {'1': 'panda_sol', '3': 54, '4': 1, '5': 9, '10': 'pandaSol'},
    {'1': 'apt', '3': 61, '4': 1, '5': 9, '10': 'apt'},
  ],
};

/// Descriptor for `UpdateAssetsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateAssetsReqDescriptor = $convert.base64Decode(
    'Cg9VcGRhdGVBc3NldHNSZXESEAoDZGlkGAEgASgJUgNkaWQSEAoDYnRjGAIgASgJUgNidGMSEA'
    'oDZXRoGB8gASgJUgNldGgSHQoKdXNkdF9lcmMyMBggIAEoCVIJdXNkdEVyYzIwEhAKA3RyeBgp'
    'IAEoCVIDdHJ4Eh0KCnVzZHRfdHJjMjAYKiABKAlSCXVzZHRUcmMyMBIdCgp3aGRzX3RyYzIwGC'
    'sgASgJUgl3aGRzVHJjMjASGQoIYnRfdHJjMjAYLCABKAlSB2J0VHJjMjASEAoDc29sGDMgASgJ'
    'UgNzb2wSGQoIdXNkdF9zb2wYNCABKAlSB3VzZHRTb2wSFQoGYnRfc29sGDUgASgJUgVidFNvbB'
    'IbCglwYW5kYV9zb2wYNiABKAlSCHBhbmRhU29sEhAKA2FwdBg9IAEoCVIDYXB0');
