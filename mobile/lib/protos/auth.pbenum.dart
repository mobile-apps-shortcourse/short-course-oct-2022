///
//  Generated code. Do not modify.
//  source: auth.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class UserType extends $pb.ProtobufEnum {
  static const UserType voter = UserType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'voter');
  static const UserType candidate = UserType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'candidate');
  static const UserType organizer = UserType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'organizer');

  static const $core.List<UserType> values = <UserType> [
    voter,
    candidate,
    organizer,
  ];

  static final $core.Map<$core.int, UserType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static UserType? valueOf($core.int value) => _byValue[value];

  const UserType._($core.int v, $core.String n) : super(v, n);
}

class AccountStatus extends $pb.ProtobufEnum {
  static const AccountStatus approved = AccountStatus._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'approved');
  static const AccountStatus verified = AccountStatus._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'verified');
  static const AccountStatus suspended = AccountStatus._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'suspended');
  static const AccountStatus blocked = AccountStatus._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'blocked');

  static const $core.List<AccountStatus> values = <AccountStatus> [
    approved,
    verified,
    suspended,
    blocked,
  ];

  static final $core.Map<$core.int, AccountStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AccountStatus? valueOf($core.int value) => _byValue[value];

  const AccountStatus._($core.int v, $core.String n) : super(v, n);
}

