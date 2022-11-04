part of '../dashboard.dart';

// candidate home page
class _CandidateDashboardPage extends StatefulWidget {
  final int currentPageIndex;
  final CrowderUser? user;

  const _CandidateDashboardPage({
    required this.currentPageIndex,
    this.user,
  });

  @override
  State<_CandidateDashboardPage> createState() =>
      __CandidateDashboardPageState();
}

class __CandidateDashboardPageState extends State<_CandidateDashboardPage> {
  final _pollCubit = PollCubit();
  var _loading = false, _polls = List<Poll>.empty();

  @override
  void initState() {
    super.initState();
    doAfterDelay(() => _pollCubit.getPollsForUser());
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
        isLoading: widget.user == null || _loading,
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
              logger.i('polls => ${state.data.map((e) => e.title).toList()}');
              setState(() => _polls = state.data);
            }
          },
          child: AnimatedListView(
            children: [
              Container(
                height: context.height * 0.2,
                width: context.width,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: context.colorScheme.secondary,
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              TabContainer(
                color: context.colorScheme.surface,
                radius: 24,
                selectedTextStyle: context.theme.textTheme.button?.copyWith(
                    color: context.colorScheme.secondary,
                    fontWeight: FontWeight.bold),
                unselectedTextStyle: context.theme.textTheme.button
                    ?.copyWith(color: context.colorScheme.onSurface),
                tabs: const ['My Polls', 'All Polls'],
                isStringTabs: true,
                children: [
                  _currentUserPolls(),
                  const EmptyContentPlaceholder(
                      title: kFeatureUnderDev, subtitle: kAppDesc),
                ],
              ).fillMaxSize(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _currentUserPolls() => _polls.isEmpty
      ? const EmptyContentPlaceholder(
          icon: FontAwesome5.poll,
          title: 'No polls found',
          subtitle: 'You\'re not part of any active polls')
      : Column(
          children: [
            AppTextField(
              'Search for a poll...',
              readOnly: true,
              onTap: () => context.showCustomDialog(
                  headerIconAsset: kAppLogo, message: kFeatureUnderDev),
              enabled: !_loading,
              suffixIcon: const Icon(FeatherIcons.search),
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) =>
                    PollListTile(poll: _polls[index]),
                separatorBuilder: (_, __) => const SizedBox(height: 24),
                itemCount: _polls.length,
                padding: const EdgeInsets.only(top: 16),
              ),
            ),
          ],
        );
}
