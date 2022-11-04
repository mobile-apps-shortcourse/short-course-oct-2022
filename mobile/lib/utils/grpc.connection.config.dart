import 'package:grpc/grpc.dart';

import 'constants.dart';

/// configuration to connect to grpc server
class GrpcConnectionConfig {
  late ClientChannel clientChannel;

  final _kBaseUrl = "192.168.0.170",
      _port = 2022,
      _credentials = const ChannelCredentials.insecure();
  // final _kBaseUrl = "137.66.52.132",
  //     _port = 443,
  //     _credentials = const ChannelCredentials.secure();

  late final _connectionOptions = ChannelOptions(
    credentials: _credentials,
    idleTimeout: const Duration(seconds: 9),
    userAgent: kAppName,
  );

  GrpcConnectionConfig._internal() {
    clientChannel =
        ClientChannel(_kBaseUrl, port: _port, options: _connectionOptions);
  }

  static Future<GrpcConnectionConfig> get() async =>
      GrpcConnectionConfig._internal();
}
