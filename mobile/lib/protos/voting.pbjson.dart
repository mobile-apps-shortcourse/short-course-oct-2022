///
//  Generated code. Do not modify.
//  source: voting.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use pollStatusDescriptor instead')
const PollStatus$json = const {
  '1': 'PollStatus',
  '2': const [
    const {'1': 'unknown', '2': 0},
    const {'1': 'pending', '2': 1},
    const {'1': 'active', '2': 2},
    const {'1': 'expired', '2': 3},
  ],
};

/// Descriptor for `PollStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List pollStatusDescriptor = $convert.base64Decode('CgpQb2xsU3RhdHVzEgsKB3Vua25vd24QABILCgdwZW5kaW5nEAESCgoGYWN0aXZlEAISCwoHZXhwaXJlZBAD');
@$core.Deprecated('Use pollDescriptor instead')
const Poll$json = const {
  '1': 'Poll',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'organizer', '3': 3, '4': 1, '5': 9, '10': 'organizer'},
    const {'1': 'categories', '3': 4, '4': 3, '5': 9, '10': 'categories'},
    const {'1': 'status', '3': 5, '4': 1, '5': 14, '6': '.crowder.PollStatus', '10': 'status'},
    const {'1': 'description', '3': 6, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'candidates', '3': 7, '4': 3, '5': 11, '6': '.crowder.PollCandidate', '10': 'candidates'},
    const {'1': 'startTimestamp', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'startTimestamp'},
    const {'1': 'endTimestamp', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'endTimestamp'},
    const {'1': 'bannerImage', '3': 10, '4': 1, '5': 9, '10': 'bannerImage'},
  ],
};

/// Descriptor for `Poll`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pollDescriptor = $convert.base64Decode('CgRQb2xsEg4KAmlkGAEgASgJUgJpZBIUCgV0aXRsZRgCIAEoCVIFdGl0bGUSHAoJb3JnYW5pemVyGAMgASgJUglvcmdhbml6ZXISHgoKY2F0ZWdvcmllcxgEIAMoCVIKY2F0ZWdvcmllcxIrCgZzdGF0dXMYBSABKA4yEy5jcm93ZGVyLlBvbGxTdGF0dXNSBnN0YXR1cxIgCgtkZXNjcmlwdGlvbhgGIAEoCVILZGVzY3JpcHRpb24SNgoKY2FuZGlkYXRlcxgHIAMoCzIWLmNyb3dkZXIuUG9sbENhbmRpZGF0ZVIKY2FuZGlkYXRlcxJCCg5zdGFydFRpbWVzdGFtcBgIIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSDnN0YXJ0VGltZXN0YW1wEj4KDGVuZFRpbWVzdGFtcBgJIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSDGVuZFRpbWVzdGFtcBIgCgtiYW5uZXJJbWFnZRgKIAEoCVILYmFubmVySW1hZ2U=');
@$core.Deprecated('Use pollCategoryDescriptor instead')
const PollCategory$json = const {
  '1': 'PollCategory',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'bannerImage', '3': 3, '4': 1, '5': 9, '10': 'bannerImage'},
    const {'1': 'poll', '3': 4, '4': 1, '5': 9, '10': 'poll'},
  ],
};

/// Descriptor for `PollCategory`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pollCategoryDescriptor = $convert.base64Decode('CgxQb2xsQ2F0ZWdvcnkSDgoCaWQYASABKAlSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSIAoLYmFubmVySW1hZ2UYAyABKAlSC2Jhbm5lckltYWdlEhIKBHBvbGwYBCABKAlSBHBvbGw=');
@$core.Deprecated('Use pollCandidateDescriptor instead')
const PollCandidate$json = const {
  '1': 'PollCandidate',
  '2': const [
    const {'1': 'candidate', '3': 1, '4': 1, '5': 9, '10': 'candidate'},
    const {'1': 'category', '3': 2, '4': 1, '5': 9, '10': 'category'},
    const {'1': 'votes', '3': 3, '4': 3, '5': 9, '10': 'votes'},
  ],
};

/// Descriptor for `PollCandidate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pollCandidateDescriptor = $convert.base64Decode('Cg1Qb2xsQ2FuZGlkYXRlEhwKCWNhbmRpZGF0ZRgBIAEoCVIJY2FuZGlkYXRlEhoKCGNhdGVnb3J5GAIgASgJUghjYXRlZ29yeRIUCgV2b3RlcxgDIAMoCVIFdm90ZXM=');
@$core.Deprecated('Use getPollsResponseDescriptor instead')
const GetPollsResponse$json = const {
  '1': 'GetPollsResponse',
  '2': const [
    const {'1': 'polls', '3': 1, '4': 3, '5': 11, '6': '.crowder.Poll', '10': 'polls'},
  ],
};

/// Descriptor for `GetPollsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPollsResponseDescriptor = $convert.base64Decode('ChBHZXRQb2xsc1Jlc3BvbnNlEiMKBXBvbGxzGAEgAygLMg0uY3Jvd2Rlci5Qb2xsUgVwb2xscw==');
@$core.Deprecated('Use getPollsRequestDescriptor instead')
const GetPollsRequest$json = const {
  '1': 'GetPollsRequest',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.crowder.PollStatus', '10': 'status'},
    const {'1': 'userId', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'userType', '3': 3, '4': 1, '5': 5, '10': 'userType'},
  ],
};

/// Descriptor for `GetPollsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPollsRequestDescriptor = $convert.base64Decode('Cg9HZXRQb2xsc1JlcXVlc3QSKwoGc3RhdHVzGAEgASgOMhMuY3Jvd2Rlci5Qb2xsU3RhdHVzUgZzdGF0dXMSFgoGdXNlcklkGAIgASgJUgZ1c2VySWQSGgoIdXNlclR5cGUYAyABKAVSCHVzZXJUeXBl');
@$core.Deprecated('Use getCategoriesRequestDescriptor instead')
const GetCategoriesRequest$json = const {
  '1': 'GetCategoriesRequest',
  '2': const [
    const {'1': 'poll', '3': 1, '4': 1, '5': 9, '10': 'poll'},
  ],
};

/// Descriptor for `GetCategoriesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCategoriesRequestDescriptor = $convert.base64Decode('ChRHZXRDYXRlZ29yaWVzUmVxdWVzdBISCgRwb2xsGAEgASgJUgRwb2xs');
@$core.Deprecated('Use getVotingItemRequestDescriptor instead')
const GetVotingItemRequest$json = const {
  '1': 'GetVotingItemRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `GetVotingItemRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getVotingItemRequestDescriptor = $convert.base64Decode('ChRHZXRWb3RpbmdJdGVtUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQ=');
@$core.Deprecated('Use getCategoriesResponseDescriptor instead')
const GetCategoriesResponse$json = const {
  '1': 'GetCategoriesResponse',
  '2': const [
    const {'1': 'categories', '3': 1, '4': 3, '5': 11, '6': '.crowder.PollCategory', '10': 'categories'},
  ],
};

/// Descriptor for `GetCategoriesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCategoriesResponseDescriptor = $convert.base64Decode('ChVHZXRDYXRlZ29yaWVzUmVzcG9uc2USNQoKY2F0ZWdvcmllcxgBIAMoCzIVLmNyb3dkZXIuUG9sbENhdGVnb3J5UgpjYXRlZ29yaWVz');
@$core.Deprecated('Use deleteVotingItemRequestDescriptor instead')
const DeleteVotingItemRequest$json = const {
  '1': 'DeleteVotingItemRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `DeleteVotingItemRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteVotingItemRequestDescriptor = $convert.base64Decode('ChdEZWxldGVWb3RpbmdJdGVtUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQ=');
@$core.Deprecated('Use votingResponseDescriptor instead')
const VotingResponse$json = const {
  '1': 'VotingResponse',
  '2': const [
    const {'1': 'successful', '3': 1, '4': 1, '5': 8, '10': 'successful'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'poll', '3': 3, '4': 1, '5': 11, '6': '.crowder.Poll', '10': 'poll'},
    const {'1': 'category', '3': 4, '4': 1, '5': 11, '6': '.crowder.PollCategory', '10': 'category'},
  ],
};

/// Descriptor for `VotingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List votingResponseDescriptor = $convert.base64Decode('Cg5Wb3RpbmdSZXNwb25zZRIeCgpzdWNjZXNzZnVsGAEgASgIUgpzdWNjZXNzZnVsEhgKB21lc3NhZ2UYAiABKAlSB21lc3NhZ2USIQoEcG9sbBgDIAEoCzINLmNyb3dkZXIuUG9sbFIEcG9sbBIxCghjYXRlZ29yeRgEIAEoCzIVLmNyb3dkZXIuUG9sbENhdGVnb3J5UghjYXRlZ29yeQ==');
