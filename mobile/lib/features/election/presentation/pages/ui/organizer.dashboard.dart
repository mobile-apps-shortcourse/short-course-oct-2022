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
  var _loading = false,
      _useBiometrics = false,
      _polls = List<Poll>.empty();
  final _pollCubit = PollCubit();
  late final _userCubit = context.read<UserCubit>();

  @override
  void initState() {
    super.initState();
    doAfterDelay( _pollCubit.getPollsForUser);
  }

  @override
  Widget build(BuildContext context) => CrowderAppBar(
        title: kAppName,
        showAppIcon: true,
        showCurrentUser: widget.currentPageIndex != 3,
        showBackButton: false,
        child: MultiBlocListener(
          listeners: [
            BlocListener(
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
            ),
          ],
          child: LoadingIndicator(
            lottieAnimResource: kLoadingAnimUrl,
            isLoading: _loading,
            child: widget.currentPageIndex == 0
                ? _buildHomeWidget()
                : _buildProfileWidget(),
          ),
        ),
      );

  /// home
  Widget _buildHomeWidget() => CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: AppTextField(
              'Search for a poll or candidate...',
              readOnly: true,
              onTap: () => context.showCustomDialog(
                  headerIconAsset: kAppLogo, message: kFeatureUnderDev),
              enabled: !_loading,
              suffixIcon: const Icon(FeatherIcons.search),
            ),
          ),

          /// polls created
          SliverToBoxAdapter(
            child: 'My Polls'.h6(context,
                weight: FontWeight.bold, color: context.colorScheme.primary),
          ),
          if (_polls.isEmpty) ...{
            SliverToBoxAdapter(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const EmptyContentPlaceholder(
                      icon: FontAwesome5.poll,
                      title: 'You have no polls',
                      subtitle: 'Add a new poll to get started'),
                  AppRoundedButton(
                    text: 'Create one',
                    onTap: () => context.router.push(const CreatePollRoute()),
                  ).top(24),
                ],
              ).top(24),
            ),
          } else ...{
            SliverPadding(
              padding: const EdgeInsets.only(top: 24),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) =>
                      PollListTile(poll: _polls[index]).bottom(24),
                  childCount: _polls.length,
                ),
              ),
            ),
          },
        ],
      );

  /// profile
  Widget _buildProfileWidget() => BlocBuilder(
        bloc: _userCubit,
        builder: (context, state) {
          if (state is LoadingState) {
            return const LoadingIndicatorItem(
                message: 'Getting your profile',
                loadingAnimationUrl: kLoadingAnimUrl);
          }

          if (state is ErrorState<String>) {
            return EmptyContentPlaceholder(
                title: state.failure, subtitle: 'Please try again');
          }

          if (state is SuccessState<CrowderUser>) {
            return CustomScrollView(
              slivers: [
                /// avatar
                SliverToBoxAdapter(
                  child: state.data.avatar
                      .avatar(size: context.width * 0.35, circular: true)
                      .centered(),
                ),

                /// name & email
                SliverToBoxAdapter(
                  child: AnimatedColumn(
                    children: [
                      state.data.displayName.h5(context,
                          weight: FontWeight.bold,
                          color: context.colorScheme.primary),
                      state.data.username
                          .subtitle2(context, emphasis: kEmphasisMedium),
                    ],
                  ).centered().top(24),
                ),

                SliverToBoxAdapter(
                  child: AnimatedColumn(
                    animateType: AnimateType.slideUp,
                    children: [
                      const Divider(),
                      ListTile(
                        title: const Text('My Bio'),
                        subtitle: Text(
                          state.data.bio.isNullOrEmpty()
                              ? 'Create a new bio'
                              : state.data.bio,
                          style:
                              const TextStyle(overflow: TextOverflow.ellipsis),
                        ),
                        leading: Icon(FeatherIcons.info,
                            color: context.colorScheme.primary),
                      ),
                      ListTile(
                        title: const Text('Account Status'),
                        subtitle: Text(
                          state.data.status.name.capitalize(),
                          style: TextStyle(
                            color: state.data.status ==
                                        AccountStatus.approved ||
                                    state.data.status == AccountStatus.verified
                                ? context.colorScheme.tertiary
                                : context.colorScheme.error,
                          ),
                        ),
                        leading: Icon(FeatherIcons.userCheck,
                            color: context.colorScheme.primary),
                      ),
                      ListTile(
                        title: const Text('Account Type'),
                        subtitle: Text(state.data.type.name.capitalize()),
                        leading: Icon(Icons.supervised_user_circle,
                            color: context.colorScheme.primary),
                      ),
                      ListTile(
                        title: const Text('Reset Password'),
                        // todo => reset user password
                        onTap: () => context.showCustomDialog(
                            headerIconAsset: kAppLogo,
                            message: kFeatureUnderDev),
                        subtitle: const Text('Reset your password'),
                        leading: Icon(Icons.password,
                            color: context.colorScheme.primary),
                        trailing: Icon(FeatherIcons.edit3,
                            color: context.colorScheme.secondary),
                      ),
                      const Divider(),
                      ListTile(
                        title: const Text('Biometric Security'),
                        subtitle: Text(
                            'Turn on ${Platform.isAndroid ? 'fingerprint/face' : 'face/touch'} authentication'),
                        trailing: CupertinoSwitch(
                          value: _useBiometrics,
                          onChanged: (useFaceUnlock) =>
                              setState(() => _useBiometrics = useFaceUnlock),
                          activeColor: context.colorScheme.secondary,
                        ),
                      ),
                      AppRoundedButton(
                        text: 'Sign out',
                        outlined: true,
                        icon: FontAwesome.logout,
                        onTap: _showLogoutOption,
                      ).top(40),
                      AppRoundedButton(
                        text: 'Delete my account',
                        icon: Entypo.trash,
                        backgroundColor: context.colorScheme.error,
                        textColor: context.colorScheme.onError,
                        // todo => delete user account
                        onTap: () => context.showCustomDialog(
                            headerIconAsset: kAppLogo,
                            message: kFeatureUnderDev),
                      ).top(16),
                    ],
                  ).top(16),
                ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      );

  /// show logout dialog
  void _showLogoutOption() async {
    await context.showCustomDialog(
      headerIconAsset: kAppLogo,
      message: 'Do you want to log out?',
      negativeButtonText: 'No',
      actions: [
        DialogAction(
          label: 'Yes',
          onTap: () async {
            await context.read<UserCubit>().logout();
            context.router
                .pushAndPopUntil(const WelcomeRoute(), predicate: (_) => false);
          },
        ),
      ],
    );
  }
}
