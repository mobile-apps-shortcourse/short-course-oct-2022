///
//  Generated code. Do not modify.
//  source: auth.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'auth.pb.dart' as $0;
export 'auth.pb.dart';

class AuthSvcClient extends $grpc.Client {
  static final _$createUser =
      $grpc.ClientMethod<$0.CrowderUser, $0.AuthResponse>(
          '/crowder.AuthSvc/createUser',
          ($0.CrowderUser value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.AuthResponse.fromBuffer(value));
  static final _$getUser = $grpc.ClientMethod<$0.UserRequest, $0.AuthResponse>(
      '/crowder.AuthSvc/getUser',
      ($0.UserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AuthResponse.fromBuffer(value));
  static final _$updateUser =
      $grpc.ClientMethod<$0.CrowderUser, $0.CrowderUser>(
          '/crowder.AuthSvc/updateUser',
          ($0.CrowderUser value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.CrowderUser.fromBuffer(value));
  static final _$deleteUser =
      $grpc.ClientMethod<$0.UserRequest, $0.AuthResponse>(
          '/crowder.AuthSvc/deleteUser',
          ($0.UserRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.AuthResponse.fromBuffer(value));
  static final _$getUsers =
      $grpc.ClientMethod<$0.GetUsersRequest, $0.GetUsersResponse>(
          '/crowder.AuthSvc/getUsers',
          ($0.GetUsersRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetUsersResponse.fromBuffer(value));
  static final _$login = $grpc.ClientMethod<$0.LoginRequest, $0.AuthResponse>(
      '/crowder.AuthSvc/login',
      ($0.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AuthResponse.fromBuffer(value));
  static final _$resetPassword =
      $grpc.ClientMethod<$0.ResetPasswordRequest, $0.AuthResponse>(
          '/crowder.AuthSvc/resetPassword',
          ($0.ResetPasswordRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.AuthResponse.fromBuffer(value));

  AuthSvcClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.AuthResponse> createUser($0.CrowderUser request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createUser, request, options: options);
  }

  $grpc.ResponseStream<$0.AuthResponse> getUser($0.UserRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$getUser, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.CrowderUser> updateUser($0.CrowderUser request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.AuthResponse> deleteUser($0.UserRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteUser, request, options: options);
  }

  $grpc.ResponseStream<$0.GetUsersResponse> getUsers($0.GetUsersRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$getUsers, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.AuthResponse> login($0.LoginRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$0.AuthResponse> resetPassword(
      $0.ResetPasswordRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$resetPassword, request, options: options);
  }
}

abstract class AuthSvcServiceBase extends $grpc.Service {
  $core.String get $name => 'crowder.AuthSvc';

  AuthSvcServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CrowderUser, $0.AuthResponse>(
        'createUser',
        createUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CrowderUser.fromBuffer(value),
        ($0.AuthResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserRequest, $0.AuthResponse>(
        'getUser',
        getUser_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.UserRequest.fromBuffer(value),
        ($0.AuthResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CrowderUser, $0.CrowderUser>(
        'updateUser',
        updateUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CrowderUser.fromBuffer(value),
        ($0.CrowderUser value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserRequest, $0.AuthResponse>(
        'deleteUser',
        deleteUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserRequest.fromBuffer(value),
        ($0.AuthResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetUsersRequest, $0.GetUsersResponse>(
        'getUsers',
        getUsers_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.GetUsersRequest.fromBuffer(value),
        ($0.GetUsersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $0.AuthResponse>(
        'login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($0.AuthResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ResetPasswordRequest, $0.AuthResponse>(
        'resetPassword',
        resetPassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ResetPasswordRequest.fromBuffer(value),
        ($0.AuthResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.AuthResponse> createUser_Pre(
      $grpc.ServiceCall call, $async.Future<$0.CrowderUser> request) async {
    return createUser(call, await request);
  }

  $async.Stream<$0.AuthResponse> getUser_Pre(
      $grpc.ServiceCall call, $async.Future<$0.UserRequest> request) async* {
    yield* getUser(call, await request);
  }

  $async.Future<$0.CrowderUser> updateUser_Pre(
      $grpc.ServiceCall call, $async.Future<$0.CrowderUser> request) async {
    return updateUser(call, await request);
  }

  $async.Future<$0.AuthResponse> deleteUser_Pre(
      $grpc.ServiceCall call, $async.Future<$0.UserRequest> request) async {
    return deleteUser(call, await request);
  }

  $async.Stream<$0.GetUsersResponse> getUsers_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetUsersRequest> request) async* {
    yield* getUsers(call, await request);
  }

  $async.Future<$0.AuthResponse> login_Pre(
      $grpc.ServiceCall call, $async.Future<$0.LoginRequest> request) async {
    return login(call, await request);
  }

  $async.Future<$0.AuthResponse> resetPassword_Pre($grpc.ServiceCall call,
      $async.Future<$0.ResetPasswordRequest> request) async {
    return resetPassword(call, await request);
  }

  $async.Future<$0.AuthResponse> createUser(
      $grpc.ServiceCall call, $0.CrowderUser request);
  $async.Stream<$0.AuthResponse> getUser(
      $grpc.ServiceCall call, $0.UserRequest request);
  $async.Future<$0.CrowderUser> updateUser(
      $grpc.ServiceCall call, $0.CrowderUser request);
  $async.Future<$0.AuthResponse> deleteUser(
      $grpc.ServiceCall call, $0.UserRequest request);
  $async.Stream<$0.GetUsersResponse> getUsers(
      $grpc.ServiceCall call, $0.GetUsersRequest request);
  $async.Future<$0.AuthResponse> login(
      $grpc.ServiceCall call, $0.LoginRequest request);
  $async.Future<$0.AuthResponse> resetPassword(
      $grpc.ServiceCall call, $0.ResetPasswordRequest request);
}
