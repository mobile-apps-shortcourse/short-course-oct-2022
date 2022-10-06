part of '../dashboard.dart';

// organizer dashboard page
class _OrganizerDashboardPage extends StatefulWidget {
  final int currentPageIndex;
  final CrowderUser? user;
  const _OrganizerDashboardPage({
    required this.currentPageIndex,
    this.user,
  });

  @override
  State<_OrganizerDashboardPage> createState() =>
      __OrganizerDashboardPageState();
}

class __OrganizerDashboardPageState extends State<_OrganizerDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return LoadingIndicator(
      lottieAnimResource: kLoadingAnimUrl,
      child: Container(color: Colors.indigo),
    );
  }
}
