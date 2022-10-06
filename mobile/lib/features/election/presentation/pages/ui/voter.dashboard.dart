part of '../dashboard.dart';

class _VoterDashboardPage extends StatefulWidget {
  final int currentPageIndex;
  final CrowderUser? user;

  const _VoterDashboardPage({
    required this.currentPageIndex,
    this.user,
  });

  @override
  State<_VoterDashboardPage> createState() => __VoterDashboardPageState();
}

class __VoterDashboardPageState extends State<_VoterDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return LoadingIndicator(
      lottieAnimResource: kLoadingAnimUrl,
      child: Container(color: Colors.green),
    );
  }
}
