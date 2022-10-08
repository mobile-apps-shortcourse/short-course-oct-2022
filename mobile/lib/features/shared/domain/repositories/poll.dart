import 'package:dartz/dartz.dart';
import 'package:mobile/protos/auth.pbgrpc.dart';
import 'package:mobile/protos/voting.pbgrpc.dart';
import 'package:mobile/utils/constants.dart';
import 'package:mobile/utils/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PollRepository {
  final _prefs = Injector.get<SharedPreferences>(),
      _votingClient = Injector.get<VotingSvcClient>();

  Future<Stream<Either<Poll, String>>> getPoll({required String id}) async {
    try {
      var request = GetVotingItemRequest(id: id);
      return _votingClient.getPoll(request).map((event) =>
          event.successful ? Left(event.poll) : Right(event.message));
    } catch (e) {
      return Stream.value(const Right(MessageUtils.kConnectionIssueMessage));
    }
  }

  Future<Either<String, String>> deletePoll({required String id}) async {
    try {
      var request = DeleteVotingItemRequest(id: id);
      var response = await _votingClient.deletePoll(request);
      return response.successful
          ? Left(response.message)
          : Right(response.message);
    } catch (e) {
      return const Right(MessageUtils.kConnectionIssueMessage);
    }
  }

  Future<Either<Poll, String>> updatePoll({required Poll poll}) async {
    try {
      var response = await _votingClient.updatePoll(poll);
      return response.successful
          ? Left(response.poll)
          : Right(response.message);
    } catch (e) {
      return const Right(MessageUtils.kConnectionIssueMessage);
    }
  }

  Future<Stream<Either<List<Poll>, String>>> getPolls(
      {required PollStatus status}) async {
    try {
      var request = GetPollsRequest(
          status: status,
          userId: _prefs.getString(PrefUtils.kUserIdKey),
          userType: UserType.values
              .firstWhere((element) =>
                  element.name == _prefs.getString(PrefUtils.kUserTypeKey))
              .value);
      return _votingClient.getPolls(request).map((event) => Left(event.polls));
    } catch (e) {
      return Stream.value(const Right(MessageUtils.kConnectionIssueMessage));
    }
  }

  Future<Stream<Either<List<Poll>, String>>> getPollsForUser() async {
    try {
      var request = GetPollsRequest(
          userId: _prefs.getString(PrefUtils.kUserIdKey),
          userType: UserType.values
              .firstWhere((element) =>
                  element.name == _prefs.getString(PrefUtils.kUserTypeKey))
              .value);
      return _votingClient
          .getPollsForUser(request)
          .map((event) => Left(event.polls));
    } catch (e) {
      return Stream.value(const Right(MessageUtils.kConnectionIssueMessage));
    }
  }

  Future<Either<PollCategory, String>> getCategory({required String id}) async {
    try {
      var request = GetVotingItemRequest(id: id);
      var response = await _votingClient.getCategory(request);
      return response.successful
          ? Left(response.category)
          : Right(response.message);
    } catch (e) {
      return const Right(MessageUtils.kConnectionIssueMessage);
    }
  }

  Future<Stream<Either<List<PollCategory>, String>>> getCategoriesForPoll(
      {required String poll}) async {
    try {
      var request = GetCategoriesRequest(poll: poll);
      return _votingClient
          .getCategories(request)
          .map((event) => Left(event.categories));
    } catch (e) {
      return Stream.value(const Right(MessageUtils.kConnectionIssueMessage));
    }
  }
}
