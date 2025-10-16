// This is a generated file - do not edit.
//
// Generated from v1/source/source.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use uploadReqDescriptor instead')
const UploadReq$json = {
  '1': 'UploadReq',
  '2': [
    {'1': 'file_type', '3': 1, '4': 1, '5': 9, '10': 'fileType'},
    {'1': 'filename', '3': 2, '4': 1, '5': 9, '10': 'filename'},
    {'1': 'content', '3': 3, '4': 1, '5': 12, '10': 'content'},
  ],
};

/// Descriptor for `UploadReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadReqDescriptor = $convert.base64Decode(
    'CglVcGxvYWRSZXESGwoJZmlsZV90eXBlGAEgASgJUghmaWxlVHlwZRIaCghmaWxlbmFtZRgCIA'
    'EoCVIIZmlsZW5hbWUSGAoHY29udGVudBgDIAEoDFIHY29udGVudA==');

@$core.Deprecated('Use uploadRespDescriptor instead')
const UploadResp$json = {
  '1': 'UploadResp',
  '2': [
    {'1': 'file_url', '3': 1, '4': 1, '5': 9, '10': 'fileUrl'},
  ],
};

/// Descriptor for `UploadResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadRespDescriptor = $convert
    .base64Decode('CgpVcGxvYWRSZXNwEhkKCGZpbGVfdXJsGAEgASgJUgdmaWxlVXJs');

@$core.Deprecated('Use downloadReqDescriptor instead')
const DownloadReq$json = {
  '1': 'DownloadReq',
  '2': [
    {'1': 'bucket_name', '3': 1, '4': 1, '5': 9, '10': 'bucketName'},
    {'1': 'filename', '3': 2, '4': 1, '5': 9, '10': 'filename'},
  ],
};

/// Descriptor for `DownloadReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List downloadReqDescriptor = $convert.base64Decode(
    'CgtEb3dubG9hZFJlcRIfCgtidWNrZXRfbmFtZRgBIAEoCVIKYnVja2V0TmFtZRIaCghmaWxlbm'
    'FtZRgCIAEoCVIIZmlsZW5hbWU=');

@$core.Deprecated('Use downloadRespDescriptor instead')
const DownloadResp$json = {
  '1': 'DownloadResp',
  '2': [
    {'1': 'content', '3': 1, '4': 1, '5': 12, '10': 'content'},
  ],
};

/// Descriptor for `DownloadResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List downloadRespDescriptor = $convert
    .base64Decode('CgxEb3dubG9hZFJlc3ASGAoHY29udGVudBgBIAEoDFIHY29udGVudA==');
