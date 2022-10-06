///
//  Generated code. Do not modify.
//  source: voting.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class PollStatus extends $pb.ProtobufEnum {
  static const PollStatus unknown = PollStatus._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'unknown');
  static const PollStatus pending = PollStatus._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'pending');
  static const PollStatus active = PollStatus._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'active');
  static const PollStatus expired = PollStatus._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'expired');

  static const $core.List<PollStatus> values = <PollStatus> [
    unknown,
    pending,
    active,
    expired,
  ];

  static final $core.Map<$core.int, PollStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PollStatus? valueOf($core.int value) => _byValue[value];

  const PollStatus._($core.int v, $core.String n) : super(v, n);
}

