import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mobile/features/election/presentation/widgets/candidate.selection.grid.tile.dart';
import 'package:mobile/features/shared/presentation/manager/poll_cubit.dart';
import 'package:mobile/features/shared/presentation/manager/user_cubit.dart';
import 'package:mobile/features/shared/presentation/widgets/app.bar.dart';
import 'package:mobile/protos/auth.pb.dart';
import 'package:mobile/protos/voting.pb.dart';
import 'package:mobile/utils/constants.dart';
import 'package:shared_utils/shared_utils.dart';

// details page for [Poll]s
class PollDetailsPage extends StatefulWidget {
  final Poll poll;

  const PollDetailsPage({super.key, required this.poll});

  @override
  State<PollDetailsPage> createState() => _PollDetailsPageState();
}

class _PollDetailsPageState extends State<PollDetailsPage> {
  final _pollCubit = PollCubit(),
      _updatePollCubit = PollCubit(),
      _userCubit = UserCubit();
  var _loading = false,
      _pollCategories = List<PollCategory>.empty(),
      _candidates = List<CrowderUser>.empty();
  late var _poll = widget.poll;
  PollCategory? _selectedCategory;

  @override
  void initState() {
    super.initState();
    doAfterDelay(() => _pollCubit
      ..getPoll(id: widget.poll.id)
      ..getCategoriesForPoll(poll: widget.poll.id));
  }

  @override
  Widget build(BuildContext context) => MultiBlocListener(
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

              if (state is SuccessState<Poll>) {
                logger.i('poll => ${state.data}');
                setState(() => _poll = state.data);
              }

              if (state is SuccessState<List<PollCategory>>) {
                logger.i(
                    'poll categories => ${state.data.map((e) => e.name).toList()}');
                setState(() => _pollCategories = state.data);
              }
            },
          ),
          BlocListener(
            bloc: _updatePollCubit,
            listener: (context, state) {
              if (!mounted) return;

              setState(() => _loading = state is LoadingState);

              if (state is ErrorState<String>) {
                context.showCustomDialog(
                    headerIconAsset: kAppLogo, message: state.failure);
              }

              if (state is SuccessState<Poll>) {
                setState(() => _poll = state.data);
              }
            },
          ),
          BlocListener(
            bloc: _userCubit,
            listener: (context, state) {
              if (!mounted) return;

              setState(() => _loading = state is LoadingState);

              if (state is ErrorState<String>) {
                context.showCustomDialog(
                    headerIconAsset: kAppLogo, message: state.failure);
              }

              if (state is SuccessState<List<CrowderUser>>) {
                logger.i(
                    'candidates => ${state.data.map((e) => e.displayName).toList()}');
                setState(() => _candidates = state.data);
              }
            },
          ),
        ],
        child: Scaffold(
          body: CrowderAppBar(
            title: 'Poll Details',
            child: LoadingIndicator(
              lottieAnimResource: kLoadingAnimUrl,
              isLoading: _loading,
              child: AnimationLimiter(
                child: CustomScrollView(
                  shrinkWrap: true,
                  slivers: [
                    SliverToBoxAdapter(
                      child: AnimatedColumn(
                        children: [
                          /// banner image
                          Container(
                              height: context.height * 0.3,
                              width: context.width,
                              margin: const EdgeInsets.only(bottom: 24),
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(24),
                                  topLeft: Radius.circular(24),
                                  bottomRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                ),
                              ),
                              child: _poll.bannerImage.asNetworkImage()),

                          /// title
                          _poll.title.h5(context,
                              alignment: TextAlign.center,
                              color: context.colorScheme.primary,
                              weight: FontWeight.bold),

                          /// description
                          _poll.description.subtitle1(context).top(12),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          'Tap to select a category'
                              .subtitle1(context,
                                  color: context.colorScheme.primary,
                                  weight: FontWeight.bold)
                              .align(Alignment.centerLeft)
                              .bottom(16),
                          AppDropdownField(
                            label: 'Category',
                            values: _pollCategories.map((e) => e.name).toList(),
                            onSelected: (option) {
                              setState(() => _selectedCategory =
                                  _pollCategories.firstWhere(
                                      (element) => element.name == option));
                              _userCubit.getUsers(UserType.candidate);
                            },
                            current: _selectedCategory?.name,
                            enabled: !_loading,
                          ),
                        ],
                      ).top(40),
                    ),
                    if (_selectedCategory != null) ...{
                      /// candidates
                      SliverPadding(
                        padding: const EdgeInsets.only(top: 16),
                        sliver: SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              var user = _candidates[index],
                                  isEnrolled = _poll.candidates
                                      .where((data) =>
                                          data.category ==
                                              _selectedCategory?.id &&
                                          data.candidate == user.id)
                                      .toList()
                                      .isNotEmpty;

                              return CandidateSelectionGridTile(
                                user: user,
                                isEnrolled: isEnrolled,
                                onButtonPressed: () {
                                  if (isEnrolled) {
                                    _poll.candidates.removeWhere((data) =>
                                        data.candidate == user.id &&
                                        data.category == _selectedCategory?.id);
                                  } else {
                                    _poll.candidates.add(PollCandidate(
                                        candidate: user.id,
                                        category: _selectedCategory?.id));
                                  }
                                  _updatePollCubit.updatePoll(poll: _poll);
                                },
                              );
                            },
                            childCount: _candidates.length,
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 16,
                                  crossAxisSpacing: 16,
                                  childAspectRatio: 3 / 4),
                        ),
                      ),

                      /// spacing
                      const SliverToBoxAdapter(child: SizedBox(height: 40)),
                    }
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
