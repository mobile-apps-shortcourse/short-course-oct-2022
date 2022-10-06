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
}
