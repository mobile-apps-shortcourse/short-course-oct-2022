import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/shared/presentation/manager/poll_cubit.dart';
import 'package:mobile/features/shared/presentation/widgets/app.bar.dart';
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
  final _pollCubit = PollCubit();
  var _loading = false, _pollCategories = List<PollCategory>.empty();
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
  Widget build(BuildContext context) {
    return BlocListener(
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
      child: Scaffold(
        body: CrowderAppBar(
          title: 'Poll Details',
          child: LoadingIndicator(
            lottieAnimResource: kLoadingAnimUrl,
            isLoading: _loading,
            child: CustomScrollView(
              shrinkWrap: true,
              slivers: [
                SliverToBoxAdapter(
                  child: AnimatedColumn(
                    children: [
                      _poll.title.h5(context, weight: FontWeight.bold),
                      _poll.description.subtitle1(context),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: AppDropdownField(
                    label: 'Category',
                    values: _pollCategories.map((e) => e.name).toList(),
                    onSelected: (option) {
                      setState(() => _selectedCategory = _pollCategories
                          .firstWhere((element) => element.name == option));
                    },
                    current: _selectedCategory?.name,
                    enabled: !_loading,
                  ).top(40),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.colorScheme.background,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
