import 'package:grpc/grpc.dart';

import 'constants.dart';

/// configuration to connect to grpc server
class GrpcConnectionConfig {
  late ClientChannel clientChannel;

  final _kBaseUrl = "192.168.10.15";
  // final _kBaseUrl = "192.168.0.170";

  late final _connectionOptions = const ChannelOptions(
    credentials: ChannelCredentials.insecure(),
    idleTimeout: Duration(seconds: 9),
    userAgent: kAppName,
  );

  GrpcConnectionConfig._internal() {
    clientChannel =
        ClientChannel(_kBaseUrl, port: 2022, options: _connectionOptions);
  }

  static Future<GrpcConnectionConfig> get() async =>
      GrpcConnectionConfig._internal();
}
