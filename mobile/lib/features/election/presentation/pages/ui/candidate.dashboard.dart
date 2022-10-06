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
    return LoadingIndicator(
      lottieAnimResource: kLoadingAnimUrl,
      isLoading: widget.user == null || _loading,
      // child: AnimatedColumn(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     widget.user!.avatar.asNetworkImage(
      //       height: context.height * 0.4,
      //       width: context.width,
      //     ),
      //     widget.user!.displayName.h5(context).vertical(16),
      //     widget.user!.bio
      //         .subtitle1(context, alignment: TextAlign.center)
      //         .horizontal(24),
      //   ],
      // ),
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
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Container(
                height: context.height * 0.2,
                width: context.width,
                clipBehavior: Clip.hardEdge,
                margin: const EdgeInsets.fromLTRB(24, 16, 24, 20),
                decoration: BoxDecoration(
                  color: context.colorScheme.primary,
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              Expanded(
                child: TabContainer(
                  color: context.colorScheme.surface,
                  radius: 24,
                  selectedTextStyle: context.theme.textTheme.button?.copyWith(
                      color: context.colorScheme.secondary,
                      fontWeight: FontWeight.bold),
                  unselectedTextStyle: context.theme.textTheme.button
                      ?.copyWith(color: context.colorScheme.onSurface),
                  children: [
                    _currentUserPolls(),
                    Container(color: context.colorScheme.surface),
                  ],
                  tabs: ['My Polls', 'All Polls'],
                  isStringTabs: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _currentUserPolls() => _polls.isEmpty
      ? const EmptyContentPlaceholder(
          title: 'No polls found',
          subtitle: 'You\'re not part of any active polls')
      : ListView.separated(
          itemBuilder: (context, index) => Container(
            color: context.colorScheme.secondary,
            height: 40,
            width: context.width,
          ),
          separatorBuilder: (_, __) => const SizedBox(height: 24),
          itemCount: _polls.length,
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
        );
}
