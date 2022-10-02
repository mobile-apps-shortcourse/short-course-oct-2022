import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/route.gr.dart';
import 'package:mobile/utils/constants.dart';
import 'package:shared_utils/shared_utils.dart';

/// entrypoint of the application
///
/// root widget for the Flutter application
class CrowderApp extends StatefulWidget {
  const CrowderApp({Key? key}) : super(key: key);

  @override
  State<CrowderApp> createState() => _CrowderAppState();
}

class _CrowderAppState extends State<CrowderApp> {
  final _appRouter = AppRouter();
  final _textTheme = GoogleFonts.spaceGroteskTextTheme();

  // final _textTheme = GoogleFonts.dmMonoTextTheme();
  late final _lightTheme =
          kLightTheme(context: context).copyWith(textTheme: _textTheme),
      _darkTheme = kDarkTheme(context: context).copyWith(textTheme: _textTheme);

  @override
  Widget build(BuildContext context) => DismissKeyboard(
        child: MaterialApp.router(
          /// basic
          title: kAppName,
          debugShowCheckedModeBanner: false,

          /// theming
          theme: _lightTheme.copyWith(
            colorScheme: _lightTheme.colorScheme.copyWith(
              background: const Color(0xffF3F5F7),
              surface: kWhiteColor,
            ),
          ),
          darkTheme: _darkTheme,
          themeMode: ThemeMode.system,

          /// router config per documentation
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: _appRouter.delegate(),
        ),
      );
}
