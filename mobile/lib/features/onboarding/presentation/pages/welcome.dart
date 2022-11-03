// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/route.gr.dart';
import 'package:mobile/features/shared/presentation/manager/user_cubit.dart';
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
  final _userCubit = UserCubit();

  @override
  Widget build(BuildContext context) {
    kUseDefaultOverlays(context, statusBarBrightness: context.theme.brightness);

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
              .top(4)
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
            if (_userCubit.isLoggedIn) ...{
              AppRoundedButton(
                text: 'Explore',
                onTap: () => context.router.pushAndPopUntil(
                    const DashboardRoute(),
                    predicate: (_) => false),
              ),
            } else ...{
              AppRoundedButton(
                text: 'Create an account',
                layoutSize: LayoutSize.wrapContent,
                onTap: () async {
                  await context.router.push(const UserTypePickerRoute());
                  kUseDefaultOverlays(context,
                      statusBarBrightness: context.theme.brightness);
                },
              ),
              AppRoundedButton(
                text: 'I already have an account',
                outlined: true,
                layoutSize: LayoutSize.wrapContent,
                onTap: () async => await showLoginSheet(context),
              ).top(12),
            },
          ],
        ).horizontal(context.width * 0.1),
      ),
    );
  }
}
