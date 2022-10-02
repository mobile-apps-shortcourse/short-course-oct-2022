import 'package:mobile/utils/grpc.connection.config.dart';

/// dependency injection mock
class Injector {
  /// dependencies
  static final _dependencies = [];

  /// register dependencies
  static Future<void> init() async {
    var grpcConfig = await GrpcConnectionConfig.get();
    _dependencies.add(grpcConfig);
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
