import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/election/presentation/widgets/bottom.nav.dart';
import 'package:mobile/features/shared/presentation/manager/poll_cubit.dart';
import 'package:mobile/features/shared/presentation/manager/user_cubit.dart';
import 'package:mobile/protos/auth.pbgrpc.dart';
import 'package:mobile/protos/voting.pb.dart';
import 'package:mobile/utils/constants.dart';
import 'package:shared_utils/shared_utils.dart';
import 'package:tab_container/tab_container.dart';

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
  var _currentTabIndex = 0, _loading = false;
  late final _userCubit = context.read<UserCubit>();
  CrowderUser? _currentUser;

  @override
  void initState() {
    super.initState();
    doAfterDelay(_userCubit.currentUser);
  }

  @override
  Widget build(BuildContext context) {
    kUseDefaultOverlays(context, statusBarBrightness: context.theme.brightness);

    return BlocListener(
      bloc: _userCubit,
      listener: (context, state) {
        if (!mounted) return;

        setState(() => _loading = state is LoadingState);

        if (state is SuccessState<CrowderUser>) {
          setState(() => _currentUser = state.data);
        }
      },
      child: Scaffold(
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
        body: LoadingIndicator(
          isLoading: _loading,
          lottieAnimResource: kLoadingAnimUrl,
          child: _currentUser == null
              ? const SizedBox.shrink()
              : _currentUser?.type == UserType.voter
                  ? _VoterDashboardPage(
                      currentPageIndex: _currentTabIndex,
                      user: _currentUser,
                    )
                  : _currentUser?.type == UserType.candidate
                      ? _CandidateDashboardPage(
                          currentPageIndex: _currentTabIndex,
                          user: _currentUser,
                        )
                      : _OrganizerDashboardPage(
                          currentPageIndex: _currentTabIndex,
                          user: _currentUser,
                        ),
        ),
      ),
    );
  }
}
