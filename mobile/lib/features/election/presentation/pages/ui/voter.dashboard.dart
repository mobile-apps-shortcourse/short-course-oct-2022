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
  var _loading = false, _polls = List<Poll>.empty();
  final _pollCubit = PollCubit();

  @override
  void initState() {
    super.initState();
    doAfterDelay(() => _pollCubit.getPolls(PollStatus.active));
  }

  @override
  Widget build(BuildContext context) {
    return CrowderAppBar(
      title: kAppName,
      showCurrentUser: true,
      showAppIcon: true,
      showBackButton: false,
      child: LoadingIndicator(
        lottieAnimResource: kLoadingAnimUrl,
        isLoading: _loading,
        child: BlocListener(
          bloc: _pollCubit,
          listener: (context, state) {
            if (!mounted) return;

            setState(() => _loading = state is LoadingState);

            if (state is ErrorState<String>) {
              context.showCustomDialog(
                  headerIconAsset: kAppLogo, message: state.failure);
            }

            if (state is SuccessState<List<Poll>>) {
              setState(() => _polls = state.data);
            }
          },
          child: CustomScrollView(
            slivers: [
              /// search
              SliverToBoxAdapter(
                child: AppTextField(
                  'Search for a poll...',
                  readOnly: true,
                  onTap: () => context.showCustomDialog(
                      headerIconAsset: kAppLogo, message: kFeatureUnderDev),
                  enabled: !_loading,
                  suffixIcon: const Icon(FeatherIcons.search),
                ),
              ),
              /// recently added polls
              SliverToBoxAdapter(
                child: 'Recently Added'
                    .h6(context,
                        weight: FontWeight.bold,
                        color: context.colorScheme.primary),
              ),
              if (_polls.isEmpty) ...{
                SliverToBoxAdapter(
                  child: const EmptyContentPlaceholder(
                          icon: FontAwesome5.poll,
                          title: 'No running polls',
                          subtitle:
                              'There are no recent polls available. Check back again later')
                      .top(24),
                ),
              } else ...{
                SliverPadding(
                  padding: const EdgeInsets.only(top: 24),
                  sliver: SliverSafeArea(
                    top: false,
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) =>
                            PollListTile(poll: _polls[index]).bottom(24),
                        childCount: _polls.length,
                      ),
                    ),
                  ),
                ),
              },
            ],
          ),
        ),
      ),
    );
  }
}
