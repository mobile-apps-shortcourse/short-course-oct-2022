import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/app/app.dart';
import 'package:mobile/protos/auth.pbgrpc.dart';
import 'package:mobile/utils/grpc.connection.config.dart';
import 'package:mobile/utils/injector.dart';
import 'package:shared_utils/shared_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// inject dependencies
  await Injector.init();

  /// set default device orientation to portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  /// apply overlays for UI

  _checkConnection();
  runApp(const CrowderApp());
}

void _checkConnection() async {
  var config = Injector.get<GrpcConnectionConfig>();
  var authClient = AuthSvcClient(config.clientChannel);
  logger.d('created client => ${authClient.runtimeType}');
  // todo => test connection here
}
