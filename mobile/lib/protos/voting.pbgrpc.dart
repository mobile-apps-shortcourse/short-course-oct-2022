///
//  Generated code. Do not modify.
//  source: voting.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'voting.pb.dart' as $0;
export 'voting.pb.dart';

class VotingSvcClient extends $grpc.Client {
  static final _$createPoll = $grpc.ClientMethod<$0.Poll, $0.VotingResponse>(
      '/crowder.VotingSvc/createPoll',
      ($0.Poll value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.VotingResponse.fromBuffer(value));
  static final _$updatePoll = $grpc.ClientMethod<$0.Poll, $0.VotingResponse>(
      '/crowder.VotingSvc/updatePoll',
      ($0.Poll value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.VotingResponse.fromBuffer(value));
  static final _$deletePoll =
      $grpc.ClientMethod<$0.DeleteVotingItemRequest, $0.VotingResponse>(
          '/crowder.VotingSvc/deletePoll',
          ($0.DeleteVotingItemRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.VotingResponse.fromBuffer(value));
  static final _$getPolls =
      $grpc.ClientMethod<$0.GetPollsRequest, $0.GetPollsResponse>(
          '/crowder.VotingSvc/getPolls',
          ($0.GetPollsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetPollsResponse.fromBuffer(value));
  static final _$getPoll =
      $grpc.ClientMethod<$0.GetVotingItemRequest, $0.VotingResponse>(
          '/crowder.VotingSvc/getPoll',
          ($0.GetVotingItemRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.VotingResponse.fromBuffer(value));
  static final _$getPollsForUser =
      $grpc.ClientMethod<$0.GetPollsRequest, $0.GetPollsResponse>(
          '/crowder.VotingSvc/getPollsForUser',
          ($0.GetPollsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetPollsResponse.fromBuffer(value));
  static final _$createCategory =
      $grpc.ClientMethod<$0.PollCategory, $0.VotingResponse>(
          '/crowder.VotingSvc/createCategory',
          ($0.PollCategory value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.VotingResponse.fromBuffer(value));
  static final _$updateCategory =
      $grpc.ClientMethod<$0.PollCategory, $0.VotingResponse>(
          '/crowder.VotingSvc/updateCategory',
          ($0.PollCategory value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.VotingResponse.fromBuffer(value));
  static final _$deleteCategory =
      $grpc.ClientMethod<$0.DeleteVotingItemRequest, $0.VotingResponse>(
          '/crowder.VotingSvc/deleteCategory',
          ($0.DeleteVotingItemRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.VotingResponse.fromBuffer(value));
  static final _$getCategory =
      $grpc.ClientMethod<$0.GetVotingItemRequest, $0.VotingResponse>(
          '/crowder.VotingSvc/getCategory',
          ($0.GetVotingItemRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.VotingResponse.fromBuffer(value));
  static final _$getCategories =
      $grpc.ClientMethod<$0.GetCategoriesRequest, $0.GetCategoriesResponse>(
          '/crowder.VotingSvc/getCategories',
          ($0.GetCategoriesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetCategoriesResponse.fromBuffer(value));

  VotingSvcClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.VotingResponse> createPoll($0.Poll request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createPoll, request, options: options);
  }

  $grpc.ResponseFuture<$0.VotingResponse> updatePoll($0.Poll request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updatePoll, request, options: options);
  }

  $grpc.ResponseFuture<$0.VotingResponse> deletePoll(
      $0.DeleteVotingItemRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deletePoll, request, options: options);
  }

  $grpc.ResponseStream<$0.GetPollsResponse> getPolls($0.GetPollsRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$getPolls, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.VotingResponse> getPoll(
      $0.GetVotingItemRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$getPoll, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.GetPollsResponse> getPollsForUser(
      $0.GetPollsRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$getPollsForUser, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.VotingResponse> createCategory(
      $0.PollCategory request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createCategory, request, options: options);
  }

  $grpc.ResponseFuture<$0.VotingResponse> updateCategory(
      $0.PollCategory request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateCategory, request, options: options);
  }

  $grpc.ResponseFuture<$0.VotingResponse> deleteCategory(
      $0.DeleteVotingItemRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteCategory, request, options: options);
  }

  $grpc.ResponseFuture<$0.VotingResponse> getCategory(
      $0.GetVotingItemRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCategory, request, options: options);
  }

  $grpc.ResponseStream<$0.GetCategoriesResponse> getCategories(
      $0.GetCategoriesRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$getCategories, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class VotingSvcServiceBase extends $grpc.Service {
  $core.String get $name => 'crowder.VotingSvc';

  VotingSvcServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Poll, $0.VotingResponse>(
        'createPoll',
        createPoll_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Poll.fromBuffer(value),
        ($0.VotingResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Poll, $0.VotingResponse>(
        'updatePoll',
        updatePoll_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Poll.fromBuffer(value),
        ($0.VotingResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.DeleteVotingItemRequest, $0.VotingResponse>(
            'deletePoll',
            deletePoll_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.DeleteVotingItemRequest.fromBuffer(value),
            ($0.VotingResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetPollsRequest, $0.GetPollsResponse>(
        'getPolls',
        getPolls_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.GetPollsRequest.fromBuffer(value),
        ($0.GetPollsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetVotingItemRequest, $0.VotingResponse>(
        'getPoll',
        getPoll_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $0.GetVotingItemRequest.fromBuffer(value),
        ($0.VotingResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetPollsRequest, $0.GetPollsResponse>(
        'getPollsForUser',
        getPollsForUser_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.GetPollsRequest.fromBuffer(value),
        ($0.GetPollsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PollCategory, $0.VotingResponse>(
        'createCategory',
        createCategory_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PollCategory.fromBuffer(value),
        ($0.VotingResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PollCategory, $0.VotingResponse>(
        'updateCategory',
        updateCategory_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PollCategory.fromBuffer(value),
        ($0.VotingResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.DeleteVotingItemRequest, $0.VotingResponse>(
            'deleteCategory',
            deleteCategory_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.DeleteVotingItemRequest.fromBuffer(value),
            ($0.VotingResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetVotingItemRequest, $0.VotingResponse>(
        'getCategory',
        getCategory_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetVotingItemRequest.fromBuffer(value),
        ($0.VotingResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetCategoriesRequest, $0.GetCategoriesResponse>(
            'getCategories',
            getCategories_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $0.GetCategoriesRequest.fromBuffer(value),
            ($0.GetCategoriesResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.VotingResponse> createPoll_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Poll> request) async {
    return createPoll(call, await request);
  }

  $async.Future<$0.VotingResponse> updatePoll_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Poll> request) async {
    return updatePoll(call, await request);
  }

  $async.Future<$0.VotingResponse> deletePoll_Pre($grpc.ServiceCall call,
      $async.Future<$0.DeleteVotingItemRequest> request) async {
    return deletePoll(call, await request);
  }

  $async.Stream<$0.GetPollsResponse> getPolls_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetPollsRequest> request) async* {
    yield* getPolls(call, await request);
  }

  $async.Stream<$0.VotingResponse> getPoll_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetVotingItemRequest> request) async* {
    yield* getPoll(call, await request);
  }

  $async.Stream<$0.GetPollsResponse> getPollsForUser_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetPollsRequest> request) async* {
    yield* getPollsForUser(call, await request);
  }

  $async.Future<$0.VotingResponse> createCategory_Pre(
      $grpc.ServiceCall call, $async.Future<$0.PollCategory> request) async {
    return createCategory(call, await request);
  }

  $async.Future<$0.VotingResponse> updateCategory_Pre(
      $grpc.ServiceCall call, $async.Future<$0.PollCategory> request) async {
    return updateCategory(call, await request);
  }

  $async.Future<$0.VotingResponse> deleteCategory_Pre($grpc.ServiceCall call,
      $async.Future<$0.DeleteVotingItemRequest> request) async {
    return deleteCategory(call, await request);
  }

  $async.Future<$0.VotingResponse> getCategory_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetVotingItemRequest> request) async {
    return getCategory(call, await request);
  }

  $async.Stream<$0.GetCategoriesResponse> getCategories_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetCategoriesRequest> request) async* {
    yield* getCategories(call, await request);
  }

  $async.Future<$0.VotingResponse> createPoll(
      $grpc.ServiceCall call, $0.Poll request);
  $async.Future<$0.VotingResponse> updatePoll(
      $grpc.ServiceCall call, $0.Poll request);
  $async.Future<$0.VotingResponse> deletePoll(
      $grpc.ServiceCall call, $0.DeleteVotingItemRequest request);
  $async.Stream<$0.GetPollsResponse> getPolls(
      $grpc.ServiceCall call, $0.GetPollsRequest request);
  $async.Stream<$0.VotingResponse> getPoll(
      $grpc.ServiceCall call, $0.GetVotingItemRequest request);
  $async.Stream<$0.GetPollsResponse> getPollsForUser(
      $grpc.ServiceCall call, $0.GetPollsRequest request);
  $async.Future<$0.VotingResponse> createCategory(
      $grpc.ServiceCall call, $0.PollCategory request);
  $async.Future<$0.VotingResponse> updateCategory(
      $grpc.ServiceCall call, $0.PollCategory request);
  $async.Future<$0.VotingResponse> deleteCategory(
      $grpc.ServiceCall call, $0.DeleteVotingItemRequest request);
  $async.Future<$0.VotingResponse> getCategory(
      $grpc.ServiceCall call, $0.GetVotingItemRequest request);
  $async.Stream<$0.GetCategoriesResponse> getCategories(
      $grpc.ServiceCall call, $0.GetCategoriesRequest request);
}
