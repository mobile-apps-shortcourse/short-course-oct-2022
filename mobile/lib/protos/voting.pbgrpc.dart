///
//  Generated code. Do not modify.
//  source: voting.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
export 'voting.pb.dart';

class VotingSvcClient extends $grpc.Client {
  VotingSvcClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);
}

abstract class VotingSvcServiceBase extends $grpc.Service {
  $core.String get $name => 'crowder.VotingSvc';

  VotingSvcServiceBase() {}
}
