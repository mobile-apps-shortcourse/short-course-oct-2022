import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/app/route.gr.dart';
import 'package:mobile/utils/constants.dart';
import 'package:mobile/utils/dialogs.dart';
import 'package:shared_utils/shared_utils.dart';

/// initial page of the application
///
/// shows a walkthrough for unauthenticated users
/// or a single info page for authenticated users
class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: context.colorScheme.background,
        systemNavigationBarColor: context.colorScheme.background,
        statusBarIconBrightness: context.invertedThemeBrightness,
        systemNavigationBarDividerColor: context.colorScheme.background,
        systemNavigationBarIconBrightness: context.invertedThemeBrightness,
        statusBarBrightness: context.theme.brightness,
        systemStatusBarContrastEnforced: false,
        systemNavigationBarContrastEnforced: false,
      ),
    );

    return Scaffold(
      extendBody: true,
      body: AnimatedColumn(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          kAppLogo.asAssetImage(
              height: context.height * 0.3, width: context.width),
          kAppName.h4(context).top(40),
          kAppDesc
              .subtitle1(context,
                  alignment: TextAlign.center, emphasis: kEmphasisHigh)
              .top(12)
              .horizontal(24),
        ],
      ).centered(),
      bottomNavigationBar: SafeArea(
        top: false,
        child: AnimatedColumn(
          animateType: AnimateType.slideUp,
          mainAxisSize: MainAxisSize.min,
          duration: 850,
          children: [
            AppRoundedButton(
              text: 'Create an account',
              layoutSize: LayoutSize.wrapContent,
              onTap: () => context.router.push(const UserTypePickerRoute()),
            ),
            AppRoundedButton(
              text: 'I already have an account',
              outlined: true,
              layoutSize: LayoutSize.wrapContent,
              onTap: () async => await showLoginSheet(context),
            ).top(16),
          ],
        ).horizontal(24).top(40),
      ),
    );
  }
}
