import 'package:auto_route/auto_route.dart';
import 'package:date_time_format/date_time_format.dart';
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
  Widget build(BuildContext context) => MultiBlocListener(
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
            padding: const EdgeInsets.only(bottom: 16),
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
                    icon: Icon(Entypo.dot_2,
                        color: context.colorScheme.secondary),
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
                        color:
                            context.colorScheme.onBackground.withOpacity(0.1)),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    children: [
                      /// image
                      Positioned.fill(
                          child: widget.poll.bannerImage.asNetworkImage()),

                      /// status
                      Positioned(
                        bottom: 8,
                        left: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: widget.poll.status == PollStatus.active
                                ? context.colorScheme.tertiary
                                : context.colorScheme.error,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(8),
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(24),
                              bottomRight: Radius.circular(8),
                            ),
                          ),
                          child: widget.poll.status.name.capitalize().subtitle2(
                              context,
                              color: widget.poll.status == PollStatus.active
                                  ? context.colorScheme.onTertiary
                                  : context.colorScheme.onError),
                        ),
                      ),

                      /// duration
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: context.colorScheme.secondary,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(24),
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  'Starting'.caption(context,
                                      emphasis: kEmphasisMedium,
                                      color: context.colorScheme.onSecondary),
                                  widget.poll.startTimestamp
                                      .toDateTime()
                                      .format('M j')
                                      .subtitle2(context,
                                          weight: FontWeight.bold,
                                          color:
                                              context.colorScheme.onSecondary),
                                ],
                              ),
                              Icon(FontAwesome.calendar,
                                      size: 16,
                                      color: context.colorScheme.onSecondary)
                                  .horizontal(16),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  'Ending'.caption(context,
                                      emphasis: kEmphasisMedium,
                                      color: context.colorScheme.onSecondary),
                                  widget.poll.endTimestamp
                                      .toDateTime()
                                      .format('M j')
                                      .subtitle2(context,
                                          weight: FontWeight.bold,
                                          color:
                                              context.colorScheme.onSecondary),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // poll details
                ListTile(
                  title: _poll.title.subtitle1(context,
                      weight: FontWeight.bold,
                      color: context.colorScheme.primary),
                  subtitle: _poll.description
                      .subtitle2(context,
                          emphasis: kEmphasisHigh,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis)
                      .top(4),
                  contentPadding:
                      const EdgeInsets.only(bottom: 12, left: 16, right: 16),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    /// candidates
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.supervisor_account,
                          color: context.colorScheme.primary,
                        ),
                        '${widget.poll.candidates.length}'
                            .subtitle1(context,
                                weight: FontWeight.bold,
                                color: context.colorScheme.primary)
                            .left(8),
                      ],
                    ),

                    /// categories
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.dashboard_customize,
                          color: context.colorScheme.primary,
                        ),
                        '${widget.poll.categories.length}'
                            .subtitle1(context,
                                weight: FontWeight.bold,
                                color: context.colorScheme.primary)
                            .left(8),
                      ],
                    ).left(24),
                  ],
                ).horizontal(16),
              ],
            ),
          ),
        ),
      );
}
