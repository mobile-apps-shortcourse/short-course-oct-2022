import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/route.gr.dart';
import 'package:mobile/features/onboarding/presentation/manager/onboarding_cubit.dart';
import 'package:mobile/features/shared/presentation/manager/poll_cubit.dart';
import 'package:mobile/features/shared/presentation/manager/user_cubit.dart';
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
  late final _lightTheme = kLightTheme(context: context)
          .copyWith(useMaterial3: true, textTheme: _textTheme),
      _darkTheme = kDarkTheme(context: context)
          .copyWith(useMaterial3: true, textTheme: _textTheme);

  @override
  Widget build(BuildContext context) => DismissKeyboard(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => OnboardingCubit()),
            BlocProvider(create: (_) => UserCubit()),
            BlocProvider(create: (_) => PollCubit()),
          ],
          child: MaterialApp.router(
            /// basic
            title: kAppName,
            debugShowCheckedModeBanner: false,

            /// theming
            theme: _lightTheme.copyWith(
              colorScheme: _lightTheme.colorScheme.copyWith(
                background: const Color(0xffF3F5F7),
                surface: const Color(0xffF5F5F5),
                primary: const Color(0xff4d1417),
                onPrimary: const Color(0xffedb66e),
                secondary: const Color(0xffedb66e),
                onSecondary: const Color(0xff4d1417),
                tertiary: Colors.green,
              ),
            ),
            darkTheme: _darkTheme.copyWith(
              colorScheme: _darkTheme.colorScheme.copyWith(
                onSurface: kWhiteColor,
              ),
            ),
            themeMode: ThemeMode.light,

            /// router config per documentation
            routeInformationParser: _appRouter.defaultRouteParser(),
            routerDelegate: _appRouter.delegate(),
          ),
        ),
      );
}
