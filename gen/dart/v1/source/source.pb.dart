// This is a generated file - do not edit.
//
// Generated from v1/source/source.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class UploadReq extends $pb.GeneratedMessage {
  factory UploadReq({
    $core.String? fileType,
    $core.String? filename,
    $core.List<$core.int>? content,
  }) {
    final result = create();
    if (fileType != null) result.fileType = fileType;
    if (filename != null) result.filename = filename;
    if (content != null) result.content = content;
    return result;
  }

  UploadReq._();

  factory UploadReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UploadReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UploadReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'source'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fileType')
    ..aOS(2, _omitFieldNames ? '' : 'filename')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'content', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadReq clone() => UploadReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadReq copyWith(void Function(UploadReq) updates) =>
      super.copyWith((message) => updates(message as UploadReq)) as UploadReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadReq create() => UploadReq._();
  @$core.override
  UploadReq createEmptyInstance() => create();
  static $pb.PbList<UploadReq> createRepeated() => $pb.PbList<UploadReq>();
  @$core.pragma('dart2js:noInline')
  static UploadReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UploadReq>(create);
  static UploadReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fileType => $_getSZ(0);
  @$pb.TagNumber(1)
  set fileType($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFileType() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get filename => $_getSZ(1);
  @$pb.TagNumber(2)
  set filename($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFilename() => $_has(1);
  @$pb.TagNumber(2)
  void clearFilename() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get content => $_getN(2);
  @$pb.TagNumber(3)
  set content($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => $_clearField(3);
}

class UploadResp extends $pb.GeneratedMessage {
  factory UploadResp({
    $core.String? fileUrl,
  }) {
    final result = create();
    if (fileUrl != null) result.fileUrl = fileUrl;
    return result;
  }

  UploadResp._();

  factory UploadResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UploadResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UploadResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'source'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fileUrl')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadResp clone() => UploadResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadResp copyWith(void Function(UploadResp) updates) =>
      super.copyWith((message) => updates(message as UploadResp)) as UploadResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadResp create() => UploadResp._();
  @$core.override
  UploadResp createEmptyInstance() => create();
  static $pb.PbList<UploadResp> createRepeated() => $pb.PbList<UploadResp>();
  @$core.pragma('dart2js:noInline')
  static UploadResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UploadResp>(create);
  static UploadResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fileUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set fileUrl($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFileUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileUrl() => $_clearField(1);
}

class DownloadReq extends $pb.GeneratedMessage {
  factory DownloadReq({
    $core.String? bucketName,
    $core.String? filename,
  }) {
    final result = create();
    if (bucketName != null) result.bucketName = bucketName;
    if (filename != null) result.filename = filename;
    return result;
  }

  DownloadReq._();

  factory DownloadReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DownloadReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DownloadReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'source'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'bucketName')
    ..aOS(2, _omitFieldNames ? '' : 'filename')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DownloadReq clone() => DownloadReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DownloadReq copyWith(void Function(DownloadReq) updates) =>
      super.copyWith((message) => updates(message as DownloadReq))
          as DownloadReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DownloadReq create() => DownloadReq._();
  @$core.override
  DownloadReq createEmptyInstance() => create();
  static $pb.PbList<DownloadReq> createRepeated() => $pb.PbList<DownloadReq>();
  @$core.pragma('dart2js:noInline')
  static DownloadReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DownloadReq>(create);
  static DownloadReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get bucketName => $_getSZ(0);
  @$pb.TagNumber(1)
  set bucketName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBucketName() => $_has(0);
  @$pb.TagNumber(1)
  void clearBucketName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get filename => $_getSZ(1);
  @$pb.TagNumber(2)
  set filename($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFilename() => $_has(1);
  @$pb.TagNumber(2)
  void clearFilename() => $_clearField(2);
}

class DownloadResp extends $pb.GeneratedMessage {
  factory DownloadResp({
    $core.List<$core.int>? content,
  }) {
    final result = create();
    if (content != null) result.content = content;
    return result;
  }

  DownloadResp._();

  factory DownloadResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DownloadResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DownloadResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'source'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'content', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DownloadResp clone() => DownloadResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DownloadResp copyWith(void Function(DownloadResp) updates) =>
      super.copyWith((message) => updates(message as DownloadResp))
          as DownloadResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DownloadResp create() => DownloadResp._();
  @$core.override
  DownloadResp createEmptyInstance() => create();
  static $pb.PbList<DownloadResp> createRepeated() =>
      $pb.PbList<DownloadResp>();
  @$core.pragma('dart2js:noInline')
  static DownloadResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DownloadResp>(create);
  static DownloadResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get content => $_getN(0);
  @$pb.TagNumber(1)
  set content($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
