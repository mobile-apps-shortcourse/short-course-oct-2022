import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mobile/protos/auth.pbgrpc.dart';
import 'package:mobile/utils/constants.dart';
import 'package:mobile/utils/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_utils/shared_utils.dart';

class AuthRepository {
  final _prefs = Injector.get<SharedPreferences>(),
      _authClient = Injector.get<AuthSvcClient>();

  Future<Either<CrowderUser, String>> createUser({
    required String displayName,
    required String username,
    required String password,
    required String avatar,
    required String bio,
    required UserType type,
  }) async {
    try {
      var request = CrowderUser(
          type: type,
          username: username,
          // convert image to base 64 string
          avatar: base64Encode(await File(avatar).readAsBytes()),
          password: password,
          displayName: displayName,
          bio: bio);
      var response = await _authClient.createUser(request);
      if (response.successful) {
        _prefs.setString(PrefUtils.kUserTypeKey, type.name);
        _prefs.setString(PrefUtils.kUserIdKey, response.user.id);
      }
      return response.successful
          ? Left(response.user)
          : Right(response.message);
    } catch (e) {
      logger.e(e);
      return const Right(MessageUtils.kConnectionIssueMessage);
    }
  }

  Future<void> logout() async {
    await _prefs.clear();
  }
}
