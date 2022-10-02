///
//  Generated code. Do not modify.
//  source: auth.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use userTypeDescriptor instead')
const UserType$json = const {
  '1': 'UserType',
  '2': const [
    const {'1': 'voter', '2': 0},
    const {'1': 'candidate', '2': 1},
    const {'1': 'organizer', '2': 2},
  ],
};

/// Descriptor for `UserType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List userTypeDescriptor = $convert.base64Decode('CghVc2VyVHlwZRIJCgV2b3RlchAAEg0KCWNhbmRpZGF0ZRABEg0KCW9yZ2FuaXplchAC');
@$core.Deprecated('Use accountStatusDescriptor instead')
const AccountStatus$json = const {
  '1': 'AccountStatus',
  '2': const [
    const {'1': 'approved', '2': 0},
    const {'1': 'verified', '2': 1},
    const {'1': 'suspended', '2': 2},
    const {'1': 'blocked', '2': 3},
  ],
};

/// Descriptor for `AccountStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List accountStatusDescriptor = $convert.base64Decode('Cg1BY2NvdW50U3RhdHVzEgwKCGFwcHJvdmVkEAASDAoIdmVyaWZpZWQQARINCglzdXNwZW5kZWQQAhILCgdibG9ja2VkEAM=');
@$core.Deprecated('Use crowderUserDescriptor instead')
const CrowderUser$json = const {
  '1': 'CrowderUser',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'salt', '3': 4, '4': 1, '5': 9, '10': 'salt'},
    const {'1': 'type', '3': 5, '4': 1, '5': 14, '6': '.crowder.UserType', '10': 'type'},
    const {'1': 'avatar', '3': 6, '4': 1, '5': 9, '10': 'avatar'},
    const {'1': 'status', '3': 7, '4': 1, '5': 14, '6': '.crowder.AccountStatus', '10': 'status'},
  ],
};

/// Descriptor for `CrowderUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List crowderUserDescriptor = $convert.base64Decode('CgtDcm93ZGVyVXNlchIOCgJpZBgBIAEoCVICaWQSGgoIdXNlcm5hbWUYAiABKAlSCHVzZXJuYW1lEhoKCHBhc3N3b3JkGAMgASgJUghwYXNzd29yZBISCgRzYWx0GAQgASgJUgRzYWx0EiUKBHR5cGUYBSABKA4yES5jcm93ZGVyLlVzZXJUeXBlUgR0eXBlEhYKBmF2YXRhchgGIAEoCVIGYXZhdGFyEi4KBnN0YXR1cxgHIAEoDjIWLmNyb3dkZXIuQWNjb3VudFN0YXR1c1IGc3RhdHVz');
@$core.Deprecated('Use getUsersRequestDescriptor instead')
const GetUsersRequest$json = const {
  '1': 'GetUsersRequest',
  '2': const [
    const {'1': 'userType', '3': 1, '4': 1, '5': 14, '6': '.crowder.UserType', '10': 'userType'},
  ],
};

/// Descriptor for `GetUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUsersRequestDescriptor = $convert.base64Decode('Cg9HZXRVc2Vyc1JlcXVlc3QSLQoIdXNlclR5cGUYASABKA4yES5jcm93ZGVyLlVzZXJUeXBlUgh1c2VyVHlwZQ==');
@$core.Deprecated('Use getUsersResponseDescriptor instead')
const GetUsersResponse$json = const {
  '1': 'GetUsersResponse',
  '2': const [
    const {'1': 'users', '3': 1, '4': 3, '5': 11, '6': '.crowder.CrowderUser', '10': 'users'},
  ],
};

/// Descriptor for `GetUsersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUsersResponseDescriptor = $convert.base64Decode('ChBHZXRVc2Vyc1Jlc3BvbnNlEioKBXVzZXJzGAEgAygLMhQuY3Jvd2Rlci5Dcm93ZGVyVXNlclIFdXNlcnM=');
@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = const {
  '1': 'LoginRequest',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode('CgxMb2dpblJlcXVlc3QSGgoIdXNlcm5hbWUYASABKAlSCHVzZXJuYW1lEhoKCHBhc3N3b3JkGAIgASgJUghwYXNzd29yZA==');
@$core.Deprecated('Use userRequestDescriptor instead')
const UserRequest$json = const {
  '1': 'UserRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `UserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userRequestDescriptor = $convert.base64Decode('CgtVc2VyUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQ=');
@$core.Deprecated('Use authResponseDescriptor instead')
const AuthResponse$json = const {
  '1': 'AuthResponse',
  '2': const [
    const {'1': 'successful', '3': 1, '4': 1, '5': 8, '10': 'successful'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'user', '3': 3, '4': 1, '5': 11, '6': '.crowder.CrowderUser', '10': 'user'},
  ],
};

/// Descriptor for `AuthResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authResponseDescriptor = $convert.base64Decode('CgxBdXRoUmVzcG9uc2USHgoKc3VjY2Vzc2Z1bBgBIAEoCFIKc3VjY2Vzc2Z1bBIYCgdtZXNzYWdlGAIgASgJUgdtZXNzYWdlEigKBHVzZXIYAyABKAsyFC5jcm93ZGVyLkNyb3dkZXJVc2VyUgR1c2Vy');
