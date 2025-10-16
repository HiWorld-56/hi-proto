// This is a generated file - do not edit.
//
// Generated from v1/club/chat.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use cIDDescriptor instead')
const CID$json = {
  '1': 'CID',
  '2': [
    {'1': 'conversation_id', '3': 1, '4': 1, '5': 9, '10': 'conversationId'},
  ],
};

/// Descriptor for `CID`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cIDDescriptor = $convert.base64Decode(
    'CgNDSUQSJwoPY29udmVyc2F0aW9uX2lkGAEgASgJUg5jb252ZXJzYXRpb25JZA==');

@$core.Deprecated('Use speechToTextParamDescriptor instead')
const SpeechToTextParam$json = {
  '1': 'SpeechToTextParam',
  '2': [
    {'1': 'audio_url', '3': 1, '4': 1, '5': 9, '10': 'audioUrl'},
    {'1': 'Model', '3': 2, '4': 1, '5': 9, '10': 'Model'},
    {'1': 'Lang', '3': 3, '4': 1, '5': 9, '10': 'Lang'},
  ],
};

/// Descriptor for `SpeechToTextParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List speechToTextParamDescriptor = $convert.base64Decode(
    'ChFTcGVlY2hUb1RleHRQYXJhbRIbCglhdWRpb191cmwYASABKAlSCGF1ZGlvVXJsEhQKBU1vZG'
    'VsGAIgASgJUgVNb2RlbBISCgRMYW5nGAMgASgJUgRMYW5n');

@$core.Deprecated('Use chatReplyDescriptor instead')
const ChatReply$json = {
  '1': 'ChatReply',
  '2': [
    {'1': 'reply', '3': 1, '4': 1, '5': 9, '10': 'reply'},
  ],
};

/// Descriptor for `ChatReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatReplyDescriptor =
    $convert.base64Decode('CglDaGF0UmVwbHkSFAoFcmVwbHkYASABKAlSBXJlcGx5');

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

@$core.Deprecated('Use chatParamDescriptor instead')
const ChatParam$json = {
  '1': 'ChatParam',
  '2': [
    {'1': 'conversation_id', '3': 1, '4': 1, '5': 9, '10': 'conversationId'},
    {'1': 'bot_did', '3': 2, '4': 1, '5': 9, '10': 'botDid'},
    {
      '1': 'messages',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.club.MessagesContent',
      '10': 'messages'
    },
  ],
};

/// Descriptor for `ChatParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatParamDescriptor = $convert.base64Decode(
    'CglDaGF0UGFyYW0SJwoPY29udmVyc2F0aW9uX2lkGAEgASgJUg5jb252ZXJzYXRpb25JZBIXCg'
    'dib3RfZGlkGAIgASgJUgZib3REaWQSMQoIbWVzc2FnZXMYAyADKAsyFS5jbHViLk1lc3NhZ2Vz'
    'Q29udGVudFIIbWVzc2FnZXM=');

@$core.Deprecated('Use streamParamDescriptor instead')
const StreamParam$json = {
  '1': 'StreamParam',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'conversation_id', '3': 2, '4': 1, '5': 9, '10': 'conversationId'},
    {
      '1': 'messages',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.club.MessagesContent',
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

/// Descriptor for `StreamParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamParamDescriptor = $convert.base64Decode(
    'CgtTdHJlYW1QYXJhbRIQCgNkaWQYASABKAlSA2RpZBInCg9jb252ZXJzYXRpb25faWQYAiABKA'
    'lSDmNvbnZlcnNhdGlvbklkEjEKCG1lc3NhZ2VzGAMgAygLMhUuY2x1Yi5NZXNzYWdlc0NvbnRl'
    'bnRSCG1lc3NhZ2VzEhQKBXN0YXRlGAQgASgJUgVzdGF0ZRIqChFyZXR1cm5fcGx1Z2luX3VzZR'
    'gFIAEoCVIPcmV0dXJuUGx1Z2luVXNlEjAKFHJldHVybl90cmFpbmluZ19kYXRhGAYgASgJUhJy'
    'ZXR1cm5UcmFpbmluZ0RhdGESJQoOcmV0dXJuX2NvbnRleHQYByABKAlSDXJldHVybkNvbnRleH'
    'Q=');

@$core.Deprecated('Use getContextParamDescriptor instead')
const GetContextParam$json = {
  '1': 'GetContextParam',
  '2': [
    {'1': 'conversation_id', '3': 1, '4': 1, '5': 9, '10': 'conversationId'},
    {'1': 'bot_did', '3': 2, '4': 1, '5': 9, '10': 'botDid'},
  ],
};

/// Descriptor for `GetContextParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getContextParamDescriptor = $convert.base64Decode(
    'Cg9HZXRDb250ZXh0UGFyYW0SJwoPY29udmVyc2F0aW9uX2lkGAEgASgJUg5jb252ZXJzYXRpb2'
    '5JZBIXCgdib3RfZGlkGAIgASgJUgZib3REaWQ=');

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
      '6': '.club.FunctionDefinition',
      '10': 'function'
    },
  ],
};

/// Descriptor for `Tool`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List toolDescriptor = $convert.base64Decode(
    'CgRUb29sEhIKBHR5cGUYASABKAlSBHR5cGUSNAoIZnVuY3Rpb24YAiABKAsyGC5jbHViLkZ1bm'
    'N0aW9uRGVmaW5pdGlvblIIZnVuY3Rpb24=');

@$core.Deprecated('Use textToTextParamDescriptor instead')
const TextToTextParam$json = {
  '1': 'TextToTextParam',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'conversation_id', '3': 2, '4': 1, '5': 9, '10': 'conversationId'},
    {
      '1': 'messages',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.club.MessagesContent',
      '10': 'messages'
    },
    {'1': 'voice', '3': 4, '4': 1, '5': 9, '10': 'voice'},
    {'1': 'tools', '3': 5, '4': 3, '5': 11, '6': '.club.Tool', '10': 'tools'},
    {'1': 'tool_choice', '3': 6, '4': 1, '5': 9, '10': 'toolChoice'},
    {'1': 'customer', '3': 7, '4': 1, '5': 9, '10': 'customer'},
    {'1': 'state', '3': 8, '4': 1, '5': 9, '10': 'state'},
  ],
};

/// Descriptor for `TextToTextParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List textToTextParamDescriptor = $convert.base64Decode(
    'Cg9UZXh0VG9UZXh0UGFyYW0SEAoDZGlkGAEgASgJUgNkaWQSJwoPY29udmVyc2F0aW9uX2lkGA'
    'IgASgJUg5jb252ZXJzYXRpb25JZBIxCghtZXNzYWdlcxgDIAMoCzIVLmNsdWIuTWVzc2FnZXND'
    'b250ZW50UghtZXNzYWdlcxIUCgV2b2ljZRgEIAEoCVIFdm9pY2USIAoFdG9vbHMYBSADKAsyCi'
    '5jbHViLlRvb2xSBXRvb2xzEh8KC3Rvb2xfY2hvaWNlGAYgASgJUgp0b29sQ2hvaWNlEhoKCGN1'
    'c3RvbWVyGAcgASgJUghjdXN0b21lchIUCgVzdGF0ZRgIIAEoCVIFc3RhdGU=');

@$core.Deprecated('Use speechToSpeechParamDescriptor instead')
const SpeechToSpeechParam$json = {
  '1': 'SpeechToSpeechParam',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'conversation_id', '3': 2, '4': 1, '5': 9, '10': 'conversationId'},
    {
      '1': 'messages',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.club.MessagesContent',
      '10': 'messages'
    },
    {'1': 'voice', '3': 4, '4': 1, '5': 9, '10': 'voice'},
    {'1': 'tools', '3': 5, '4': 3, '5': 11, '6': '.club.Tool', '10': 'tools'},
    {'1': 'tool_choice', '3': 6, '4': 1, '5': 9, '10': 'toolChoice'},
    {'1': 'customer', '3': 7, '4': 1, '5': 9, '10': 'customer'},
    {'1': 'state', '3': 8, '4': 1, '5': 9, '10': 'state'},
  ],
};

/// Descriptor for `SpeechToSpeechParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List speechToSpeechParamDescriptor = $convert.base64Decode(
    'ChNTcGVlY2hUb1NwZWVjaFBhcmFtEhAKA2RpZBgBIAEoCVIDZGlkEicKD2NvbnZlcnNhdGlvbl'
    '9pZBgCIAEoCVIOY29udmVyc2F0aW9uSWQSMQoIbWVzc2FnZXMYAyADKAsyFS5jbHViLk1lc3Nh'
    'Z2VzQ29udGVudFIIbWVzc2FnZXMSFAoFdm9pY2UYBCABKAlSBXZvaWNlEiAKBXRvb2xzGAUgAy'
    'gLMgouY2x1Yi5Ub29sUgV0b29scxIfCgt0b29sX2Nob2ljZRgGIAEoCVIKdG9vbENob2ljZRIa'
    'CghjdXN0b21lchgHIAEoCVIIY3VzdG9tZXISFAoFc3RhdGUYCCABKAlSBXN0YXRl');

@$core.Deprecated('Use speechToSpeechReplyDescriptor instead')
const SpeechToSpeechReply$json = {
  '1': 'SpeechToSpeechReply',
  '2': [
    {
      '1': 'audio_url',
      '3': 1,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'audioUrl',
      '17': true
    },
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
      '6': '.club.ToolCall',
      '10': 'toolCalls'
    },
  ],
  '8': [
    {'1': '_audio_url'},
    {'1': '_tool_id'},
  ],
};

/// Descriptor for `SpeechToSpeechReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List speechToSpeechReplyDescriptor = $convert.base64Decode(
    'ChNTcGVlY2hUb1NwZWVjaFJlcGx5EiAKCWF1ZGlvX3VybBgBIAEoCUgAUghhdWRpb1VybIgBAR'
    'IcCgd0b29sX2lkGAIgASgJSAFSBnRvb2xJZIgBARItCgp0b29sX2NhbGxzGAMgAygLMg4uY2x1'
    'Yi5Ub29sQ2FsbFIJdG9vbENhbGxzQgwKCl9hdWRpb191cmxCCgoIX3Rvb2xfaWQ=');

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
    {'1': 'index', '3': 1, '4': 1, '5': 5, '10': 'index'},
    {'1': 'id', '3': 2, '4': 1, '5': 9, '10': 'id'},
    {'1': 'type', '3': 3, '4': 1, '5': 9, '10': 'type'},
    {
      '1': 'function',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.club.FunctionCall',
      '10': 'function'
    },
  ],
};

/// Descriptor for `ToolCall`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List toolCallDescriptor = $convert.base64Decode(
    'CghUb29sQ2FsbBIUCgVpbmRleBgBIAEoBVIFaW5kZXgSDgoCaWQYAiABKAlSAmlkEhIKBHR5cG'
    'UYAyABKAlSBHR5cGUSLgoIZnVuY3Rpb24YBCABKAsyEi5jbHViLkZ1bmN0aW9uQ2FsbFIIZnVu'
    'Y3Rpb24=');

@$core.Deprecated('Use textToTextReplyDescriptor instead')
const TextToTextReply$json = {
  '1': 'TextToTextReply',
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
      '6': '.club.ToolCall',
      '10': 'toolCalls'
    },
  ],
  '8': [
    {'1': '_reply'},
    {'1': '_tool_id'},
  ],
};

/// Descriptor for `TextToTextReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List textToTextReplyDescriptor = $convert.base64Decode(
    'Cg9UZXh0VG9UZXh0UmVwbHkSGQoFcmVwbHkYASABKAlIAFIFcmVwbHmIAQESHAoHdG9vbF9pZB'
    'gCIAEoCUgBUgZ0b29sSWSIAQESLQoKdG9vbF9jYWxscxgDIAMoCzIOLmNsdWIuVG9vbENhbGxS'
    'CXRvb2xDYWxsc0IICgZfcmVwbHlCCgoIX3Rvb2xfaWQ=');

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
      '6': '.club.MessagesContent',
      '10': 'results'
    },
  ],
};

/// Descriptor for `ToolCallsResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List toolCallsResultDescriptor = $convert.base64Decode(
    'Cg9Ub29sQ2FsbHNSZXN1bHQSIAoMdG9vbF9jYWxsX2lkGAEgASgJUgp0b29sQ2FsbElkEi8KB3'
    'Jlc3VsdHMYAiADKAsyFS5jbHViLk1lc3NhZ2VzQ29udGVudFIHcmVzdWx0cw==');

@$core.Deprecated('Use callToolsParamDescriptor instead')
const CallToolsParam$json = {
  '1': 'CallToolsParam',
  '2': [
    {'1': 'tool_id', '3': 1, '4': 1, '5': 9, '10': 'toolId'},
    {
      '1': 'tool_results',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.club.ToolCallsResult',
      '10': 'toolResults'
    },
  ],
};

/// Descriptor for `CallToolsParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List callToolsParamDescriptor = $convert.base64Decode(
    'Cg5DYWxsVG9vbHNQYXJhbRIXCgd0b29sX2lkGAEgASgJUgZ0b29sSWQSOAoMdG9vbF9yZXN1bH'
    'RzGAIgAygLMhUuY2x1Yi5Ub29sQ2FsbHNSZXN1bHRSC3Rvb2xSZXN1bHRz');

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
      '6': '.club.FunctionCall',
      '10': 'functionCall'
    },
    {
      '1': 'tool_calls',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.club.ToolCall',
      '10': 'toolCalls'
    },
    {'1': 'tool_call_id', '3': 7, '4': 1, '5': 9, '10': 'toolCallId'},
  ],
};

/// Descriptor for `ChatCompletionMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatCompletionMessageDescriptor = $convert.base64Decode(
    'ChVDaGF0Q29tcGxldGlvbk1lc3NhZ2USEgoEcm9sZRgBIAEoCVIEcm9sZRIYCgdjb250ZW50GA'
    'IgASgJUgdjb250ZW50EhgKB3JlZnVzYWwYAyABKAlSB3JlZnVzYWwSEgoEbmFtZRgEIAEoCVIE'
    'bmFtZRI3Cg1mdW5jdGlvbl9jYWxsGAUgASgLMhIuY2x1Yi5GdW5jdGlvbkNhbGxSDGZ1bmN0aW'
    '9uQ2FsbBItCgp0b29sX2NhbGxzGAYgAygLMg4uY2x1Yi5Ub29sQ2FsbFIJdG9vbENhbGxzEiAK'
    'DHRvb2xfY2FsbF9pZBgHIAEoCVIKdG9vbENhbGxJZA==');

@$core.Deprecated('Use chatCompletionMessageListDescriptor instead')
const ChatCompletionMessageList$json = {
  '1': 'ChatCompletionMessageList',
  '2': [
    {
      '1': 'message_list',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.club.ChatCompletionMessage',
      '10': 'messageList'
    },
  ],
};

/// Descriptor for `ChatCompletionMessageList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatCompletionMessageListDescriptor =
    $convert.base64Decode(
        'ChlDaGF0Q29tcGxldGlvbk1lc3NhZ2VMaXN0Ej4KDG1lc3NhZ2VfbGlzdBgBIAMoCzIbLmNsdW'
        'IuQ2hhdENvbXBsZXRpb25NZXNzYWdlUgttZXNzYWdlTGlzdA==');
