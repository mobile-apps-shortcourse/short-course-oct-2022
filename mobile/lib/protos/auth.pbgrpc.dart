///
//  Generated code. Do not modify.
//  source: auth.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'auth.pb.dart' as $1;
export 'auth.pb.dart';

class AuthSvcClient extends $grpc.Client {
  static final _$createUser =
      $grpc.ClientMethod<$1.CrowderUser, $1.AuthResponse>(
          '/crowder.AuthSvc/createUser',
          ($1.CrowderUser value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.AuthResponse.fromBuffer(value));
  static final _$getUser = $grpc.ClientMethod<$1.UserRequest, $1.AuthResponse>(
      '/crowder.AuthSvc/getUser',
      ($1.UserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.AuthResponse.fromBuffer(value));
  static final _$updateUser =
      $grpc.ClientMethod<$1.CrowderUser, $1.CrowderUser>(
          '/crowder.AuthSvc/updateUser',
          ($1.CrowderUser value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.CrowderUser.fromBuffer(value));
  static final _$deleteUser =
      $grpc.ClientMethod<$1.UserRequest, $1.AuthResponse>(
          '/crowder.AuthSvc/deleteUser',
          ($1.UserRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.AuthResponse.fromBuffer(value));
  static final _$getUsers =
      $grpc.ClientMethod<$1.GetUsersRequest, $1.GetUsersResponse>(
          '/crowder.AuthSvc/getUsers',
          ($1.GetUsersRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.GetUsersResponse.fromBuffer(value));
  static final _$login = $grpc.ClientMethod<$1.LoginRequest, $1.AuthResponse>(
      '/crowder.AuthSvc/login',
      ($1.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.AuthResponse.fromBuffer(value));
  static final _$resetPassword =
      $grpc.ClientMethod<$1.ResetPasswordRequest, $1.AuthResponse>(
          '/crowder.AuthSvc/resetPassword',
          ($1.ResetPasswordRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.AuthResponse.fromBuffer(value));

  AuthSvcClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.AuthResponse> createUser($1.CrowderUser request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createUser, request, options: options);
  }

  $grpc.ResponseStream<$1.AuthResponse> getUser($1.UserRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$getUser, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$1.CrowderUser> updateUser($1.CrowderUser request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateUser, request, options: options);
  }

  $grpc.ResponseFuture<$1.AuthResponse> deleteUser($1.UserRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteUser, request, options: options);
  }

  $grpc.ResponseStream<$1.GetUsersResponse> getUsers($1.GetUsersRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$getUsers, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$1.AuthResponse> login($1.LoginRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$1.AuthResponse> resetPassword(
      $1.ResetPasswordRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$resetPassword, request, options: options);
  }
}

abstract class AuthSvcServiceBase extends $grpc.Service {
  $core.String get $name => 'crowder.AuthSvc';

  AuthSvcServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.CrowderUser, $1.AuthResponse>(
        'createUser',
        createUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.CrowderUser.fromBuffer(value),
        ($1.AuthResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.UserRequest, $1.AuthResponse>(
        'getUser',
        getUser_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.UserRequest.fromBuffer(value),
        ($1.AuthResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.CrowderUser, $1.CrowderUser>(
        'updateUser',
        updateUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.CrowderUser.fromBuffer(value),
        ($1.CrowderUser value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.UserRequest, $1.AuthResponse>(
        'deleteUser',
        deleteUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.UserRequest.fromBuffer(value),
        ($1.AuthResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetUsersRequest, $1.GetUsersResponse>(
        'getUsers',
        getUsers_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.GetUsersRequest.fromBuffer(value),
        ($1.GetUsersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.LoginRequest, $1.AuthResponse>(
        'login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.LoginRequest.fromBuffer(value),
        ($1.AuthResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ResetPasswordRequest, $1.AuthResponse>(
        'resetPassword',
        resetPassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.ResetPasswordRequest.fromBuffer(value),
        ($1.AuthResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.AuthResponse> createUser_Pre(
      $grpc.ServiceCall call, $async.Future<$1.CrowderUser> request) async {
    return createUser(call, await request);
  }

  $async.Stream<$1.AuthResponse> getUser_Pre(
      $grpc.ServiceCall call, $async.Future<$1.UserRequest> request) async* {
    yield* getUser(call, await request);
  }

  $async.Future<$1.CrowderUser> updateUser_Pre(
      $grpc.ServiceCall call, $async.Future<$1.CrowderUser> request) async {
    return updateUser(call, await request);
  }

  $async.Future<$1.AuthResponse> deleteUser_Pre(
      $grpc.ServiceCall call, $async.Future<$1.UserRequest> request) async {
    return deleteUser(call, await request);
  }

  $async.Stream<$1.GetUsersResponse> getUsers_Pre($grpc.ServiceCall call,
      $async.Future<$1.GetUsersRequest> request) async* {
    yield* getUsers(call, await request);
  }

  $async.Future<$1.AuthResponse> login_Pre(
      $grpc.ServiceCall call, $async.Future<$1.LoginRequest> request) async {
    return login(call, await request);
  }

  $async.Future<$1.AuthResponse> resetPassword_Pre($grpc.ServiceCall call,
      $async.Future<$1.ResetPasswordRequest> request) async {
    return resetPassword(call, await request);
  }

  $async.Future<$1.AuthResponse> createUser(
      $grpc.ServiceCall call, $1.CrowderUser request);
  $async.Stream<$1.AuthResponse> getUser(
      $grpc.ServiceCall call, $1.UserRequest request);
  $async.Future<$1.CrowderUser> updateUser(
      $grpc.ServiceCall call, $1.CrowderUser request);
  $async.Future<$1.AuthResponse> deleteUser(
      $grpc.ServiceCall call, $1.UserRequest request);
  $async.Stream<$1.GetUsersResponse> getUsers(
      $grpc.ServiceCall call, $1.GetUsersRequest request);
  $async.Future<$1.AuthResponse> login(
      $grpc.ServiceCall call, $1.LoginRequest request);
  $async.Future<$1.AuthResponse> resetPassword(
      $grpc.ServiceCall call, $1.ResetPasswordRequest request);
}
