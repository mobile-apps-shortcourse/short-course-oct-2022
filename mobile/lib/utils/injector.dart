import 'package:mobile/protos/auth.pbgrpc.dart';
import 'package:mobile/protos/common.pbgrpc.dart';
import 'package:mobile/protos/voting.pbgrpc.dart';
import 'package:mobile/utils/grpc.connection.config.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// dependency injection mock
class Injector {
  /// dependencies
  static final _dependencies = [];

  /// register dependencies
  static Future<void> init() async {
    /// local storage
    var prefs = await SharedPreferences.getInstance();
    _dependencies.add(prefs);

    /// grpc
    var grpcConfig = await GrpcConnectionConfig.get();
    var authClient = AuthSvcClient(grpcConfig.clientChannel);
    var commonClient = CommonSvcClient(grpcConfig.clientChannel);
    var votingClient = VotingSvcClient(grpcConfig.clientChannel);
    _dependencies.add(authClient);
    _dependencies.add(commonClient);
    _dependencies.add(votingClient);
  }

  /// get dependency by type, or throw an Exception if otherwise
  static R get<R>() {
    for (var value in _dependencies) {
      if (value is R) return value;
    }
    throw Exception(
        'Could not find the requested dependency. Register $R first');
  }
}
