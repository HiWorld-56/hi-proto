// This is a generated file - do not edit.
//
// Generated from v1/base.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class ListSuperAdminUsersResp extends $pb.GeneratedMessage {
  factory ListSuperAdminUsersResp({
    $core.Iterable<$core.String>? list,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    return result;
  }

  ListSuperAdminUsersResp._();

  factory ListSuperAdminUsersResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListSuperAdminUsersResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListSuperAdminUsersResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'hi'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'list')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSuperAdminUsersResp clone() =>
      ListSuperAdminUsersResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSuperAdminUsersResp copyWith(
          void Function(ListSuperAdminUsersResp) updates) =>
      super.copyWith((message) => updates(message as ListSuperAdminUsersResp))
          as ListSuperAdminUsersResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSuperAdminUsersResp create() => ListSuperAdminUsersResp._();
  @$core.override
  ListSuperAdminUsersResp createEmptyInstance() => create();
  static $pb.PbList<ListSuperAdminUsersResp> createRepeated() =>
      $pb.PbList<ListSuperAdminUsersResp>();
  @$core.pragma('dart2js:noInline')
  static ListSuperAdminUsersResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListSuperAdminUsersResp>(create);
  static ListSuperAdminUsersResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get list => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
