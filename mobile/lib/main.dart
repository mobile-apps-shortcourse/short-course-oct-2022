import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/app/app.dart';
import 'package:mobile/utils/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// inject dependencies
  await Injector.init();

  /// set default device orientation to portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const CrowderApp());
}
