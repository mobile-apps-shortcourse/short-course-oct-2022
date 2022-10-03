import 'package:flutter/material.dart';
import 'package:mobile/utils/constants.dart';
import 'package:shared_utils/shared_utils.dart';

part 'ui/candidate.dashboard.dart';

part 'ui/organizer.dashboard.dart';

part 'ui/voter.dashboard.dart';

/// dashboard for all users
class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final _iconSize = 28.0;

  @override
  Widget build(BuildContext context) {
    kUseDefaultOverlays(context, statusBarBrightness: context.theme.brightness);

    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(40), topLeft: Radius.circular(40))),
        child: SafeArea(
          top: false,
          child: AnimatedRow(
            animateType: AnimateType.slideUp,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              /// home
              GestureDetector(
                onTap: () => context.showCustomDialog(
                    headerIconAsset: kAppLogo, message: kFeatureUnderDev),
                child: AnimatedColumn(
                  duration: 850,
                  children: [
                    Icon(Icons.add_home_outlined,
                        size: _iconSize, color: context.colorScheme.secondary),
                    'Home'
                        .button(context,
                            color: context.colorScheme.secondary,
                            weight: FontWeight.w600)
                        .top(8),
                  ],
                ),
              ),

              /// search
              GestureDetector(
                onTap: () => context.showCustomDialog(
                    headerIconAsset: kAppLogo, message: kFeatureUnderDev),
                child: AnimatedColumn(
                  duration: 850,
                  children: [
                    Icon(FeatherIcons.search,
                        size: _iconSize, color: context.theme.disabledColor),
                    'Search'
                        .button(context,
                            color: context.theme.disabledColor,
                            weight: FontWeight.w600)
                        .top(8),
                  ],
                ),
              ),

              /// contest
              GestureDetector(
                onTap: () => context.showCustomDialog(
                    headerIconAsset: kAppLogo, message: kFeatureUnderDev),
                child: AnimatedColumn(
                  duration: 850,
                  children: [
                    Icon(Icons.add_box_outlined,
                        size: _iconSize, color: context.theme.disabledColor),
                    'Contest'
                        .button(context,
                            color: context.theme.disabledColor,
                            weight: FontWeight.w600)
                        .top(8),
                  ],
                ),
              ),

              /// activity
              GestureDetector(
                onTap: () => context.showCustomDialog(
                    headerIconAsset: kAppLogo, message: kFeatureUnderDev),
                child: AnimatedColumn(
                  animateType: AnimateType.slideUp,
                  duration: 850,
                  children: [
                    Icon(Icons.favorite_border_outlined,
                        size: _iconSize, color: context.theme.disabledColor),
                    'Activity'
                        .button(context,
                            color: context.theme.disabledColor,
                            weight: FontWeight.w600)
                        .top(8),
                  ],
                ),
              ),

              /// profile
              GestureDetector(
                onTap: () => context.showCustomDialog(
                    headerIconAsset: kAppLogo, message: kFeatureUnderDev),
                child: AnimatedColumn(
                  animateType: AnimateType.slideUp,
                  duration: 850,
                  children: [
                    Icon(FeatherIcons.user,
                        size: _iconSize, color: context.theme.disabledColor),
                    'Profile'
                        .button(context,
                            color: context.theme.disabledColor,
                            weight: FontWeight.w600)
                        .top(8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => context.showCustomDialog(
      //       headerIconAsset: kAppLogo, message: kFeatureUnderDev),
      //   child: Icon(Icons.add_box_outlined,
      //       size: _iconSize, /*color: context.theme.disabledColor*/),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: const EmptyContentPlaceholder(
        title: kFeatureUnderDev,
        subtitle: 'Check back again',
      ),
    );
  }
}
