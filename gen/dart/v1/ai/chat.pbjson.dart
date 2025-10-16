// This is a generated file - do not edit.
//
// Generated from v1/ai/chat.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use generateCidRespDescriptor instead')
const GenerateCidResp$json = {
  '1': 'GenerateCidResp',
  '2': [
    {'1': 'cid', '3': 1, '4': 1, '5': 9, '10': 'cid'},
  ],
};

/// Descriptor for `GenerateCidResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateCidRespDescriptor =
    $convert.base64Decode('Cg9HZW5lcmF0ZUNpZFJlc3ASEAoDY2lkGAEgASgJUgNjaWQ=');

@$core.Deprecated('Use messagesContentDescriptor instead')
const MessagesContent$json = {
  '1': 'MessagesContent',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 9, '10': 'type'},
    {'1': 'content', '3': 2, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `MessagesContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messagesContentDescriptor = $convert.base64Decode(
    'Cg9NZXNzYWdlc0NvbnRlbnQSEgoEdHlwZRgBIAEoCVIEdHlwZRIYCgdjb250ZW50GAIgASgJUg'
    'djb250ZW50');

@$core.Deprecated('Use dialogReqDescriptor instead')
const DialogReq$json = {
  '1': 'DialogReq',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'cid', '3': 2, '4': 1, '5': 9, '10': 'cid'},
    {
      '1': 'messages',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.ai.MessagesContent',
      '10': 'messages'
    },
    {'1': 'state', '3': 4, '4': 1, '5': 9, '10': 'state'},
    {'1': 'return_plugin_use', '3': 5, '4': 1, '5': 9, '10': 'returnPluginUse'},
    {
      '1': 'return_training_data',
      '3': 6,
      '4': 1,
      '5': 9,
      '10': 'returnTrainingData'
    },
    {'1': 'return_context', '3': 7, '4': 1, '5': 9, '10': 'returnContext'},
  ],
};

/// Descriptor for `DialogReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dialogReqDescriptor = $convert.base64Decode(
    'CglEaWFsb2dSZXESEAoDZGlkGAEgASgJUgNkaWQSEAoDY2lkGAIgASgJUgNjaWQSLwoIbWVzc2'
    'FnZXMYAyADKAsyEy5haS5NZXNzYWdlc0NvbnRlbnRSCG1lc3NhZ2VzEhQKBXN0YXRlGAQgASgJ'
    'UgVzdGF0ZRIqChFyZXR1cm5fcGx1Z2luX3VzZRgFIAEoCVIPcmV0dXJuUGx1Z2luVXNlEjAKFH'
    'JldHVybl90cmFpbmluZ19kYXRhGAYgASgJUhJyZXR1cm5UcmFpbmluZ0RhdGESJQoOcmV0dXJu'
    'X2NvbnRleHQYByABKAlSDXJldHVybkNvbnRleHQ=');

@$core.Deprecated('Use dialogRespDescriptor instead')
const DialogResp$json = {
  '1': 'DialogResp',
  '2': [
    {'1': 'reply', '3': 1, '4': 1, '5': 9, '10': 'reply'},
  ],
};

/// Descriptor for `DialogResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dialogRespDescriptor =
    $convert.base64Decode('CgpEaWFsb2dSZXNwEhQKBXJlcGx5GAEgASgJUgVyZXBseQ==');

@$core.Deprecated('Use dialogStreamReqDescriptor instead')
const DialogStreamReq$json = {
  '1': 'DialogStreamReq',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'cid', '3': 2, '4': 1, '5': 9, '10': 'cid'},
    {
      '1': 'messages',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.ai.MessagesContent',
      '10': 'messages'
    },
    {'1': 'state', '3': 4, '4': 1, '5': 9, '10': 'state'},
    {'1': 'return_plugin_use', '3': 5, '4': 1, '5': 9, '10': 'returnPluginUse'},
    {
      '1': 'return_training_data',
      '3': 6,
      '4': 1,
      '5': 9,
      '10': 'returnTrainingData'
    },
    {'1': 'return_context', '3': 7, '4': 1, '5': 9, '10': 'returnContext'},
  ],
};

/// Descriptor for `DialogStreamReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dialogStreamReqDescriptor = $convert.base64Decode(
    'Cg9EaWFsb2dTdHJlYW1SZXESEAoDZGlkGAEgASgJUgNkaWQSEAoDY2lkGAIgASgJUgNjaWQSLw'
    'oIbWVzc2FnZXMYAyADKAsyEy5haS5NZXNzYWdlc0NvbnRlbnRSCG1lc3NhZ2VzEhQKBXN0YXRl'
    'GAQgASgJUgVzdGF0ZRIqChFyZXR1cm5fcGx1Z2luX3VzZRgFIAEoCVIPcmV0dXJuUGx1Z2luVX'
    'NlEjAKFHJldHVybl90cmFpbmluZ19kYXRhGAYgASgJUhJyZXR1cm5UcmFpbmluZ0RhdGESJQoO'
    'cmV0dXJuX2NvbnRleHQYByABKAlSDXJldHVybkNvbnRleHQ=');

@$core.Deprecated('Use dialogStreamRespDescriptor instead')
const DialogStreamResp$json = {
  '1': 'DialogStreamResp',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 5, '10': 'code'},
    {'1': 'type', '3': 2, '4': 1, '5': 9, '10': 'type'},
    {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `DialogStreamResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dialogStreamRespDescriptor = $convert.base64Decode(
    'ChBEaWFsb2dTdHJlYW1SZXNwEhIKBGNvZGUYASABKAVSBGNvZGUSEgoEdHlwZRgCIAEoCVIEdH'
    'lwZRIYCgdtZXNzYWdlGAMgASgJUgdtZXNzYWdl');

@$core.Deprecated('Use clearContextReqDescriptor instead')
const ClearContextReq$json = {
  '1': 'ClearContextReq',
  '2': [
    {'1': 'cid', '3': 1, '4': 1, '5': 9, '10': 'cid'},
  ],
};

/// Descriptor for `ClearContextReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clearContextReqDescriptor =
    $convert.base64Decode('Cg9DbGVhckNvbnRleHRSZXESEAoDY2lkGAEgASgJUgNjaWQ=');

@$core.Deprecated('Use getContextReqDescriptor instead')
const GetContextReq$json = {
  '1': 'GetContextReq',
  '2': [
    {'1': 'cid', '3': 1, '4': 1, '5': 9, '10': 'cid'},
    {'1': 'bot_did', '3': 2, '4': 1, '5': 9, '10': 'botDid'},
  ],
};

/// Descriptor for `GetContextReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getContextReqDescriptor = $convert.base64Decode(
    'Cg1HZXRDb250ZXh0UmVxEhAKA2NpZBgBIAEoCVIDY2lkEhcKB2JvdF9kaWQYAiABKAlSBmJvdE'
    'RpZA==');

@$core.Deprecated('Use functionCallDescriptor instead')
const FunctionCall$json = {
  '1': 'FunctionCall',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'arguments', '3': 2, '4': 1, '5': 9, '10': 'arguments'},
  ],
};

/// Descriptor for `FunctionCall`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List functionCallDescriptor = $convert.base64Decode(
    'CgxGdW5jdGlvbkNhbGwSEgoEbmFtZRgBIAEoCVIEbmFtZRIcCglhcmd1bWVudHMYAiABKAlSCW'
    'FyZ3VtZW50cw==');

@$core.Deprecated('Use toolCallDescriptor instead')
const ToolCall$json = {
  '1': 'ToolCall',
  '2': [
    {'1': 'index', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'index', '17': true},
    {'1': 'id', '3': 2, '4': 1, '5': 9, '10': 'id'},
    {'1': 'type', '3': 3, '4': 1, '5': 9, '10': 'type'},
    {
      '1': 'function',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.ai.FunctionCall',
      '10': 'function'
    },
  ],
  '8': [
    {'1': '_index'},
  ],
};

/// Descriptor for `ToolCall`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List toolCallDescriptor = $convert.base64Decode(
    'CghUb29sQ2FsbBIZCgVpbmRleBgBIAEoBUgAUgVpbmRleIgBARIOCgJpZBgCIAEoCVICaWQSEg'
    'oEdHlwZRgDIAEoCVIEdHlwZRIsCghmdW5jdGlvbhgEIAEoCzIQLmFpLkZ1bmN0aW9uQ2FsbFII'
    'ZnVuY3Rpb25CCAoGX2luZGV4');

@$core.Deprecated('Use chatMessageImageURLDescriptor instead')
const ChatMessageImageURL$json = {
  '1': 'ChatMessageImageURL',
  '2': [
    {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
    {'1': 'detail', '3': 2, '4': 1, '5': 9, '10': 'detail'},
  ],
};

/// Descriptor for `ChatMessageImageURL`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatMessageImageURLDescriptor = $convert.base64Decode(
    'ChNDaGF0TWVzc2FnZUltYWdlVVJMEhAKA3VybBgBIAEoCVIDdXJsEhYKBmRldGFpbBgCIAEoCV'
    'IGZGV0YWls');

@$core.Deprecated('Use chatMessagePartDescriptor instead')
const ChatMessagePart$json = {
  '1': 'ChatMessagePart',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 9, '10': 'type'},
    {'1': 'text', '3': 2, '4': 1, '5': 9, '10': 'text'},
    {
      '1': 'image_url',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.ai.ChatMessageImageURL',
      '10': 'imageUrl'
    },
  ],
};

/// Descriptor for `ChatMessagePart`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatMessagePartDescriptor = $convert.base64Decode(
    'Cg9DaGF0TWVzc2FnZVBhcnQSEgoEdHlwZRgBIAEoCVIEdHlwZRISCgR0ZXh0GAIgASgJUgR0ZX'
    'h0EjQKCWltYWdlX3VybBgDIAEoCzIXLmFpLkNoYXRNZXNzYWdlSW1hZ2VVUkxSCGltYWdlVXJs');

@$core.Deprecated('Use chatCompletionMessageDescriptor instead')
const ChatCompletionMessage$json = {
  '1': 'ChatCompletionMessage',
  '2': [
    {'1': 'role', '3': 1, '4': 1, '5': 9, '10': 'role'},
    {'1': 'content', '3': 2, '4': 1, '5': 9, '10': 'content'},
    {'1': 'refusal', '3': 3, '4': 1, '5': 9, '10': 'refusal'},
    {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    {
      '1': 'function_call',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.ai.FunctionCall',
      '10': 'functionCall'
    },
    {
      '1': 'tool_calls',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.ai.ToolCall',
      '10': 'toolCalls'
    },
    {'1': 'tool_call_id', '3': 7, '4': 1, '5': 9, '10': 'toolCallId'},
    {
      '1': 'multi_content',
      '3': 8,
      '4': 3,
      '5': 11,
      '6': '.ai.ChatMessagePart',
      '10': 'multiContent'
    },
  ],
};

/// Descriptor for `ChatCompletionMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatCompletionMessageDescriptor = $convert.base64Decode(
    'ChVDaGF0Q29tcGxldGlvbk1lc3NhZ2USEgoEcm9sZRgBIAEoCVIEcm9sZRIYCgdjb250ZW50GA'
    'IgASgJUgdjb250ZW50EhgKB3JlZnVzYWwYAyABKAlSB3JlZnVzYWwSEgoEbmFtZRgEIAEoCVIE'
    'bmFtZRI1Cg1mdW5jdGlvbl9jYWxsGAUgASgLMhAuYWkuRnVuY3Rpb25DYWxsUgxmdW5jdGlvbk'
    'NhbGwSKwoKdG9vbF9jYWxscxgGIAMoCzIMLmFpLlRvb2xDYWxsUgl0b29sQ2FsbHMSIAoMdG9v'
    'bF9jYWxsX2lkGAcgASgJUgp0b29sQ2FsbElkEjgKDW11bHRpX2NvbnRlbnQYCCADKAsyEy5haS'
    '5DaGF0TWVzc2FnZVBhcnRSDG11bHRpQ29udGVudA==');

@$core.Deprecated('Use getContextRespDescriptor instead')
const GetContextResp$json = {
  '1': 'GetContextResp',
  '2': [
    {
      '1': 'message_list',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.ai.ChatCompletionMessage',
      '10': 'messageList'
    },
  ],
};

/// Descriptor for `GetContextResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getContextRespDescriptor = $convert.base64Decode(
    'Cg5HZXRDb250ZXh0UmVzcBI8CgxtZXNzYWdlX2xpc3QYASADKAsyGS5haS5DaGF0Q29tcGxldG'
    'lvbk1lc3NhZ2VSC21lc3NhZ2VMaXN0');

@$core.Deprecated('Use functionDefinitionDescriptor instead')
const FunctionDefinition$json = {
  '1': 'FunctionDefinition',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    {'1': 'strict', '3': 3, '4': 1, '5': 8, '10': 'strict'},
    {'1': 'parameters', '3': 4, '4': 1, '5': 12, '10': 'parameters'},
  ],
};

/// Descriptor for `FunctionDefinition`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List functionDefinitionDescriptor = $convert.base64Decode(
    'ChJGdW5jdGlvbkRlZmluaXRpb24SEgoEbmFtZRgBIAEoCVIEbmFtZRIgCgtkZXNjcmlwdGlvbh'
    'gCIAEoCVILZGVzY3JpcHRpb24SFgoGc3RyaWN0GAMgASgIUgZzdHJpY3QSHgoKcGFyYW1ldGVy'
    'cxgEIAEoDFIKcGFyYW1ldGVycw==');

@$core.Deprecated('Use toolDescriptor instead')
const Tool$json = {
  '1': 'Tool',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 9, '10': 'type'},
    {
      '1': 'function',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.ai.FunctionDefinition',
      '10': 'function'
    },
  ],
};

/// Descriptor for `Tool`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List toolDescriptor = $convert.base64Decode(
    'CgRUb29sEhIKBHR5cGUYASABKAlSBHR5cGUSMgoIZnVuY3Rpb24YAiABKAsyFi5haS5GdW5jdG'
    'lvbkRlZmluaXRpb25SCGZ1bmN0aW9u');

@$core.Deprecated('Use speechToSpeechReqDescriptor instead')
const SpeechToSpeechReq$json = {
  '1': 'SpeechToSpeechReq',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'cid', '3': 2, '4': 1, '5': 9, '10': 'cid'},
    {
      '1': 'messages',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.ai.MessagesContent',
      '10': 'messages'
    },
    {'1': 'voice', '3': 4, '4': 1, '5': 9, '10': 'voice'},
    {'1': 'tools', '3': 5, '4': 3, '5': 11, '6': '.ai.Tool', '10': 'tools'},
    {'1': 'tool_choice', '3': 6, '4': 1, '5': 9, '10': 'toolChoice'},
    {'1': 'customer', '3': 7, '4': 1, '5': 9, '10': 'customer'},
    {'1': 'state', '3': 8, '4': 1, '5': 9, '10': 'state'},
  ],
};

/// Descriptor for `SpeechToSpeechReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List speechToSpeechReqDescriptor = $convert.base64Decode(
    'ChFTcGVlY2hUb1NwZWVjaFJlcRIQCgNkaWQYASABKAlSA2RpZBIQCgNjaWQYAiABKAlSA2NpZB'
    'IvCghtZXNzYWdlcxgDIAMoCzITLmFpLk1lc3NhZ2VzQ29udGVudFIIbWVzc2FnZXMSFAoFdm9p'
    'Y2UYBCABKAlSBXZvaWNlEh4KBXRvb2xzGAUgAygLMgguYWkuVG9vbFIFdG9vbHMSHwoLdG9vbF'
    '9jaG9pY2UYBiABKAlSCnRvb2xDaG9pY2USGgoIY3VzdG9tZXIYByABKAlSCGN1c3RvbWVyEhQK'
    'BXN0YXRlGAggASgJUgVzdGF0ZQ==');

@$core.Deprecated('Use speechToSpeechRespDescriptor instead')
const SpeechToSpeechResp$json = {
  '1': 'SpeechToSpeechResp',
  '2': [
    {'1': 'path', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'path', '17': true},
    {
      '1': 'tool_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'toolId',
      '17': true
    },
    {
      '1': 'tool_calls',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.ai.ToolCall',
      '10': 'toolCalls'
    },
  ],
  '8': [
    {'1': '_path'},
    {'1': '_tool_id'},
  ],
};

/// Descriptor for `SpeechToSpeechResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List speechToSpeechRespDescriptor = $convert.base64Decode(
    'ChJTcGVlY2hUb1NwZWVjaFJlc3ASFwoEcGF0aBgBIAEoCUgAUgRwYXRoiAEBEhwKB3Rvb2xfaW'
    'QYAiABKAlIAVIGdG9vbElkiAEBEisKCnRvb2xfY2FsbHMYAyADKAsyDC5haS5Ub29sQ2FsbFIJ'
    'dG9vbENhbGxzQgcKBV9wYXRoQgoKCF90b29sX2lk');

@$core.Deprecated('Use toolCallsResultDescriptor instead')
const ToolCallsResult$json = {
  '1': 'ToolCallsResult',
  '2': [
    {'1': 'tool_call_id', '3': 1, '4': 1, '5': 9, '10': 'toolCallId'},
    {
      '1': 'results',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.ai.MessagesContent',
      '10': 'results'
    },
  ],
};

/// Descriptor for `ToolCallsResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List toolCallsResultDescriptor = $convert.base64Decode(
    'Cg9Ub29sQ2FsbHNSZXN1bHQSIAoMdG9vbF9jYWxsX2lkGAEgASgJUgp0b29sQ2FsbElkEi0KB3'
    'Jlc3VsdHMYAiADKAsyEy5haS5NZXNzYWdlc0NvbnRlbnRSB3Jlc3VsdHM=');

@$core.Deprecated('Use callToolsReqDescriptor instead')
const CallToolsReq$json = {
  '1': 'CallToolsReq',
  '2': [
    {'1': 'tool_id', '3': 1, '4': 1, '5': 9, '10': 'toolId'},
    {
      '1': 'tool_results',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.ai.ToolCallsResult',
      '10': 'toolResults'
    },
  ],
};

/// Descriptor for `CallToolsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List callToolsReqDescriptor = $convert.base64Decode(
    'CgxDYWxsVG9vbHNSZXESFwoHdG9vbF9pZBgBIAEoCVIGdG9vbElkEjYKDHRvb2xfcmVzdWx0cx'
    'gCIAMoCzITLmFpLlRvb2xDYWxsc1Jlc3VsdFILdG9vbFJlc3VsdHM=');

@$core.Deprecated('Use textToTextReqDescriptor instead')
const TextToTextReq$json = {
  '1': 'TextToTextReq',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'cid', '3': 2, '4': 1, '5': 9, '10': 'cid'},
    {
      '1': 'messages',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.ai.MessagesContent',
      '10': 'messages'
    },
    {'1': 'voice', '3': 4, '4': 1, '5': 9, '10': 'voice'},
    {'1': 'tools', '3': 5, '4': 3, '5': 11, '6': '.ai.Tool', '10': 'tools'},
    {'1': 'tool_choice', '3': 6, '4': 1, '5': 9, '10': 'toolChoice'},
    {'1': 'customer', '3': 7, '4': 1, '5': 9, '10': 'customer'},
    {'1': 'state', '3': 8, '4': 1, '5': 9, '10': 'state'},
  ],
};

/// Descriptor for `TextToTextReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List textToTextReqDescriptor = $convert.base64Decode(
    'Cg1UZXh0VG9UZXh0UmVxEhAKA2RpZBgBIAEoCVIDZGlkEhAKA2NpZBgCIAEoCVIDY2lkEi8KCG'
    '1lc3NhZ2VzGAMgAygLMhMuYWkuTWVzc2FnZXNDb250ZW50UghtZXNzYWdlcxIUCgV2b2ljZRgE'
    'IAEoCVIFdm9pY2USHgoFdG9vbHMYBSADKAsyCC5haS5Ub29sUgV0b29scxIfCgt0b29sX2Nob2'
    'ljZRgGIAEoCVIKdG9vbENob2ljZRIaCghjdXN0b21lchgHIAEoCVIIY3VzdG9tZXISFAoFc3Rh'
    'dGUYCCABKAlSBXN0YXRl');

@$core.Deprecated('Use textToTextRespDescriptor instead')
const TextToTextResp$json = {
  '1': 'TextToTextResp',
  '2': [
    {'1': 'path', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'path', '17': true},
    {
      '1': 'tool_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'toolId',
      '17': true
    },
    {
      '1': 'tool_calls',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.ai.ToolCall',
      '10': 'toolCalls'
    },
  ],
  '8': [
    {'1': '_path'},
    {'1': '_tool_id'},
  ],
};

/// Descriptor for `TextToTextResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List textToTextRespDescriptor = $convert.base64Decode(
    'Cg5UZXh0VG9UZXh0UmVzcBIXCgRwYXRoGAEgASgJSABSBHBhdGiIAQESHAoHdG9vbF9pZBgCIA'
    'EoCUgBUgZ0b29sSWSIAQESKwoKdG9vbF9jYWxscxgDIAMoCzIMLmFpLlRvb2xDYWxsUgl0b29s'
    'Q2FsbHNCBwoFX3BhdGhCCgoIX3Rvb2xfaWQ=');

@$core.Deprecated('Use textToSpeechReqDescriptor instead')
const TextToSpeechReq$json = {
  '1': 'TextToSpeechReq',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
    {'1': 'gpt_model', '3': 2, '4': 1, '5': 9, '10': 'gptModel'},
    {'1': 'voice', '3': 3, '4': 1, '5': 9, '10': 'voice'},
  ],
};

/// Descriptor for `TextToSpeechReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List textToSpeechReqDescriptor = $convert.base64Decode(
    'Cg9UZXh0VG9TcGVlY2hSZXESGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZRIbCglncHRfbW9kZW'
    'wYAiABKAlSCGdwdE1vZGVsEhQKBXZvaWNlGAMgASgJUgV2b2ljZQ==');

@$core.Deprecated('Use textToSpeechRespDescriptor instead')
const TextToSpeechResp$json = {
  '1': 'TextToSpeechResp',
  '2': [
    {'1': 'path', '3': 1, '4': 1, '5': 9, '10': 'path'},
  ],
};

/// Descriptor for `TextToSpeechResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List textToSpeechRespDescriptor = $convert
    .base64Decode('ChBUZXh0VG9TcGVlY2hSZXNwEhIKBHBhdGgYASABKAlSBHBhdGg=');

@$core.Deprecated('Use speechToTextReqDescriptor instead')
const SpeechToTextReq$json = {
  '1': 'SpeechToTextReq',
  '2': [
    {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
    {
      '1': 'transcription_model',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'transcriptionModel'
    },
    {'1': 'lang', '3': 3, '4': 1, '5': 9, '10': 'lang'},
  ],
};

/// Descriptor for `SpeechToTextReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List speechToTextReqDescriptor = $convert.base64Decode(
    'Cg9TcGVlY2hUb1RleHRSZXESEAoDdXJsGAEgASgJUgN1cmwSLwoTdHJhbnNjcmlwdGlvbl9tb2'
    'RlbBgCIAEoCVISdHJhbnNjcmlwdGlvbk1vZGVsEhIKBGxhbmcYAyABKAlSBGxhbmc=');

@$core.Deprecated('Use speechToTextRespDescriptor instead')
const SpeechToTextResp$json = {
  '1': 'SpeechToTextResp',
  '2': [
    {'1': 'reply', '3': 1, '4': 1, '5': 9, '10': 'reply'},
  ],
};

/// Descriptor for `SpeechToTextResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List speechToTextRespDescriptor = $convert
    .base64Decode('ChBTcGVlY2hUb1RleHRSZXNwEhQKBXJlcGx5GAEgASgJUgVyZXBseQ==');

@$core.Deprecated('Use multiModalDialogReqDescriptor instead')
const MultiModalDialogReq$json = {
  '1': 'MultiModalDialogReq',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'cid', '3': 2, '4': 1, '5': 9, '10': 'cid'},
    {
      '1': 'messages',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.ai.MessagesContent',
      '10': 'messages'
    },
    {'1': 'voice', '3': 4, '4': 1, '5': 9, '10': 'voice'},
    {'1': 'tools', '3': 5, '4': 3, '5': 11, '6': '.ai.Tool', '10': 'tools'},
    {'1': 'tool_choice', '3': 6, '4': 1, '5': 9, '10': 'toolChoice'},
    {'1': 'customer', '3': 7, '4': 1, '5': 9, '10': 'customer'},
    {'1': 'state', '3': 8, '4': 1, '5': 9, '10': 'state'},
    {'1': 'enable_sts', '3': 9, '4': 1, '5': 8, '10': 'enableSts'},
  ],
};

/// Descriptor for `MultiModalDialogReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List multiModalDialogReqDescriptor = $convert.base64Decode(
    'ChNNdWx0aU1vZGFsRGlhbG9nUmVxEhAKA2RpZBgBIAEoCVIDZGlkEhAKA2NpZBgCIAEoCVIDY2'
    'lkEi8KCG1lc3NhZ2VzGAMgAygLMhMuYWkuTWVzc2FnZXNDb250ZW50UghtZXNzYWdlcxIUCgV2'
    'b2ljZRgEIAEoCVIFdm9pY2USHgoFdG9vbHMYBSADKAsyCC5haS5Ub29sUgV0b29scxIfCgt0b2'
    '9sX2Nob2ljZRgGIAEoCVIKdG9vbENob2ljZRIaCghjdXN0b21lchgHIAEoCVIIY3VzdG9tZXIS'
    'FAoFc3RhdGUYCCABKAlSBXN0YXRlEh0KCmVuYWJsZV9zdHMYCSABKAhSCWVuYWJsZVN0cw==');

@$core.Deprecated('Use multiModalDialogRespDescriptor instead')
const MultiModalDialogResp$json = {
  '1': 'MultiModalDialogResp',
  '2': [
    {'1': 'reply', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'reply', '17': true},
    {
      '1': 'tool_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'toolId',
      '17': true
    },
    {
      '1': 'tool_calls',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.ai.ToolCall',
      '10': 'toolCalls'
    },
  ],
  '8': [
    {'1': '_reply'},
    {'1': '_tool_id'},
  ],
};

/// Descriptor for `MultiModalDialogResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List multiModalDialogRespDescriptor = $convert.base64Decode(
    'ChRNdWx0aU1vZGFsRGlhbG9nUmVzcBIZCgVyZXBseRgBIAEoCUgAUgVyZXBseYgBARIcCgd0b2'
    '9sX2lkGAIgASgJSAFSBnRvb2xJZIgBARIrCgp0b29sX2NhbGxzGAMgAygLMgwuYWkuVG9vbENh'
    'bGxSCXRvb2xDYWxsc0IICgZfcmVwbHlCCgoIX3Rvb2xfaWQ=');

@$core.Deprecated('Use multiModalDialogToolCallsReqDescriptor instead')
const MultiModalDialogToolCallsReq$json = {
  '1': 'MultiModalDialogToolCallsReq',
  '2': [
    {'1': 'tool_id', '3': 1, '4': 1, '5': 9, '10': 'toolId'},
    {
      '1': 'tool_results',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.ai.ToolCallsResult',
      '10': 'toolResults'
    },
    {'1': 'enable_sts', '3': 3, '4': 1, '5': 8, '10': 'enableSts'},
  ],
};

/// Descriptor for `MultiModalDialogToolCallsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List multiModalDialogToolCallsReqDescriptor =
    $convert.base64Decode(
        'ChxNdWx0aU1vZGFsRGlhbG9nVG9vbENhbGxzUmVxEhcKB3Rvb2xfaWQYASABKAlSBnRvb2xJZB'
        'I2Cgx0b29sX3Jlc3VsdHMYAiADKAsyEy5haS5Ub29sQ2FsbHNSZXN1bHRSC3Rvb2xSZXN1bHRz'
        'Eh0KCmVuYWJsZV9zdHMYAyABKAhSCWVuYWJsZVN0cw==');

@$core.Deprecated('Use multiModalDialogToolCallsRespDescriptor instead')
const MultiModalDialogToolCallsResp$json = {
  '1': 'MultiModalDialogToolCallsResp',
  '2': [
    {'1': 'reply', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'reply', '17': true},
    {
      '1': 'tool_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'toolId',
      '17': true
    },
    {
      '1': 'tool_calls',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.ai.ToolCall',
      '10': 'toolCalls'
    },
  ],
  '8': [
    {'1': '_reply'},
    {'1': '_tool_id'},
  ],
};

/// Descriptor for `MultiModalDialogToolCallsResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List multiModalDialogToolCallsRespDescriptor =
    $convert.base64Decode(
        'Ch1NdWx0aU1vZGFsRGlhbG9nVG9vbENhbGxzUmVzcBIZCgVyZXBseRgBIAEoCUgAUgVyZXBseY'
        'gBARIcCgd0b29sX2lkGAIgASgJSAFSBnRvb2xJZIgBARIrCgp0b29sX2NhbGxzGAMgAygLMgwu'
        'YWkuVG9vbENhbGxSCXRvb2xDYWxsc0IICgZfcmVwbHlCCgoIX3Rvb2xfaWQ=');
