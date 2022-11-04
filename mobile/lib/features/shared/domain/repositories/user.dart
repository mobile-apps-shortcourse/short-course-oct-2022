import 'package:dartz/dartz.dart';
import 'package:mobile/protos/auth.pbgrpc.dart';
import 'package:mobile/utils/constants.dart';
import 'package:mobile/utils/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_utils/shared_utils.dart';

class UserRepository {
  final _prefs = Injector.get<SharedPreferences>(),
      _authClient = Injector.get<AuthSvcClient>();

  Future<Stream<Either<CrowderUser, String>>> currentUser() async {
    try {
      var userId = _prefs.getString(PrefUtils.kUserIdKey);
      if (userId.isNullOrEmpty()) {
        return Stream.value(
            const Right(MessageUtils.kUnauthenticatedIssueMessage));
      }

      var request = UserRequest(id: userId);
      return _authClient.getUser(request).map((event) =>
          event.successful ? Left(event.user) : Right(event.message));
    } catch (e) {
      logger.e(e);
      return Stream.value(const Right(MessageUtils.kConnectionIssueMessage));
    }
  }

  Future<Stream<Either<CrowderUser, String>>> getUser(
      {required String id}) async {
    try {
      var request = UserRequest(id: id);
      return _authClient.getUser(request).map((event) =>
          event.successful ? Left(event.user) : Right(event.message));
    } catch (e) {
      logger.e(e);
      return Stream.value(const Right(MessageUtils.kConnectionIssueMessage));
    }
  }

  Future<Stream<Either<List<CrowderUser>, String>>> getUsers(
      UserType type) async {
    try {
      var request = GetUsersRequest(userType: type);
      return _authClient.getUsers(request).map((event) => event.users.isNotEmpty
          ? Left(event.users)
          : const Right('No users found'));
    } catch (e) {
      logger.e(e);
      return Stream.value(const Right(MessageUtils.kConnectionIssueMessage));
    }
  }
}
