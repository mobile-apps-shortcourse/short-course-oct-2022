import 'package:flutter/material.dart';
import 'package:mobile/features/election/presentation/widgets/bottom.nav.dart';
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
  var _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    kUseDefaultOverlays(context, statusBarBrightness: context.theme.brightness);

    return Scaffold(
      bottomNavigationBar: CrowderBottomNavigationView(
        onTap: (index) => setState(() => _currentTabIndex = index),
        activeIndex: _currentTabIndex,
        items: const [
          CrowderBottomNavigationViewItem(
              activeIcon: Icons.add_home,
              inactiveIcon: Icons.add_home_outlined,
              label: 'Home'),
          CrowderBottomNavigationViewItem(
              activeIcon: FeatherIcons.search,
              inactiveIcon: FeatherIcons.search,
              label: 'Search'),
          CrowderBottomNavigationViewItem(
              activeIcon: Icons.add_box,
              inactiveIcon: Icons.add_box_outlined,
              label: 'Contests'),
          CrowderBottomNavigationViewItem(
              activeIcon: Icons.favorite,
              inactiveIcon: Icons.favorite_border_outlined,
              label: 'Activity'),
          CrowderBottomNavigationViewItem(
              activeIcon: FeatherIcons.user,
              inactiveIcon: FeatherIcons.user,
              label: 'Profile'),
        ],
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
