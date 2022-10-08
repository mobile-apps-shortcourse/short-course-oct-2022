import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/app/route.gr.dart';
import 'package:mobile/features/shared/presentation/manager/poll_cubit.dart';
import 'package:mobile/features/shared/presentation/manager/user_cubit.dart';
import 'package:mobile/protos/auth.pb.dart';
import 'package:mobile/protos/voting.pb.dart';
import 'package:mobile/utils/constants.dart';
import 'package:shared_utils/shared_utils.dart';

// poll list item
class PollListTile extends StatefulWidget {
  final Poll poll;

  const PollListTile({super.key, required this.poll});

  @override
  State<PollListTile> createState() => _PollListTileState();
}

class _PollListTileState extends State<PollListTile> {
  final _pollCubit = PollCubit(), _userCubit = UserCubit();
  late var _poll = widget.poll, _loading = false;
  CrowderUser? _organizer;

  @override
  void initState() {
    super.initState();
    doAfterDelay(() {
      _userCubit.getUser(_poll.organizer);
      _pollCubit.getPoll(id: _poll.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener(
          bloc: _userCubit,
          listener: (context, state) {
            if (!mounted) return;

            setState(() => _loading = state is LoadingState);

            if (state is ErrorState<String>) {
              context.showCustomDialog(
                  headerIconAsset: kAppLogo, message: state.failure);
            }

            if (state is SuccessState<CrowderUser>) {
              setState(() => _organizer = state.data);
            }
          },
        ),
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
              setState(() => _poll = state.data);
            }
          },
        ),
      ],
      child: GestureDetector(
        onTap: () => context.router.push(PollDetailsRoute(poll: _poll)),
        child: Container(
          decoration: BoxDecoration(
            color: context.colorScheme.background,
            border: Border.all(
                color: context.colorScheme.onBackground.withOpacity(0.1)),
            borderRadius: BorderRadius.circular(24),
          ),
          child: AnimatedColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // organizer details
              ListTile(
                leading: _organizer?.avatar.avatar(size: 48, circular: true),
                title: _organizer?.displayName
                    .subtitle1(context, weight: FontWeight.bold),
                subtitle: _organizer?.bio.subtitle2(context,
                    emphasis: kEmphasisHigh,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                trailing: IconButton(
                  onPressed: () => context.showCustomDialog(
                      headerIconAsset: kAppLogo, message: kFeatureUnderDev),
                  icon:
                      Icon(Entypo.dot_2, color: context.colorScheme.secondary),
                ),
              ),

              Container(
                height: context.height * 0.2,
                width: context.width,
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: context.colorScheme.surface,
                  border: Border.all(
                      color: context.colorScheme.onBackground.withOpacity(0.1)),
                  borderRadius: BorderRadius.circular(24),
                ),
              ),

              // poll details
              ListTile(
                // leading: _organizer?.avatar.avatar(size: 48, circular: true),
                title: _poll.title.subtitle1(context, weight: FontWeight.bold),
                subtitle: _poll.description.subtitle2(context,
                    emphasis: kEmphasisHigh,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis),
                contentPadding:
                    const EdgeInsets.only(bottom: 12, left: 16, right: 16),
              ),

              AnimatedRow(
                animateType: AnimateType.slideUp,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
