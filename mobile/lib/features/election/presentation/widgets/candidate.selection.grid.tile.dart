import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/protos/auth.pb.dart';
import 'package:shared_utils/shared_utils.dart';

/// grid tile for candidate selection for [Poll]
class CandidateSelectionGridTile extends StatefulWidget {
  final CrowderUser user;
  final bool isEnrolled;
  final void Function()? onTap;
  final void Function() onButtonPressed;

  const CandidateSelectionGridTile({
    Key? key,
    required this.user,
    required this.onButtonPressed,
    this.onTap,
    this.isEnrolled = false,
  }) : super(key: key);

  @override
  State<CandidateSelectionGridTile> createState() => _CandidateSelectionGridTileState();
}

class _CandidateSelectionGridTileState extends State<CandidateSelectionGridTile> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () async {
          showModalBottomSheet(
              context: context,

              backgroundColor: Colors.transparent,
              useRootNavigator: true,
              clipBehavior: Clip.none,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24),
                  topLeft: Radius.circular(24),
                ),
              ),
              builder: (context) {
                return SizedBox(
                  height: context.height * 0.35,
                  width: context.width,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      /// info
                      Positioned.fill(
                        top: 60,
                        child: Container(
                          width: context.width,
                          clipBehavior: Clip.hardEdge,
                          padding: const EdgeInsets.fromLTRB(24, 86, 24, 16),
                          decoration: BoxDecoration(
                            color: context.colorScheme.surface,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: AnimatedColumn(
                            animateType: AnimateType.slideUp,
                            children: [
                              widget.user.displayName.h5(context,
                                  weight: FontWeight.bold,
                                  color: context.colorScheme.primary),
                              widget.user.username.subtitle1(context,
                                  emphasis: kEmphasisMedium),
                              AppRoundedButton(
                                text: widget.isEnrolled ? 'Remove' : 'Add',
                                outlined: widget.isEnrolled,
                                onTap: () async {
                                  widget.onButtonPressed();
                                  context.router.pop();
                                },
                              ).top(16),
                            ],
                          ),
                        ),
                      ),

                      /// avatar
                      Positioned(
                        top: -24,
                        left: 0,
                        right: 0,
                        child: widget.user.avatar
                            .avatar(size: 160, circular: true)
                            .centered(),
                      ),
                    ],
                  ),
                );
              });
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            /// content
            Positioned.fill(
              top: 48,
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 42, 16, 12),
                decoration: BoxDecoration(
                  color: context.colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: AnimatedColumn(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    widget.user.displayName.subtitle1(context,
                        color: context.colorScheme.primary,
                        weight: FontWeight.bold),
                    widget.user.bio
                        .subtitle2(context,
                            alignment: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis)
                        .top(6),
                    AppRoundedButton(
                      text: widget.isEnrolled ? 'Remove' : 'Add',
                      outlined: widget.isEnrolled,
                      onTap: widget.onButtonPressed,
                    ).top(12),
                  ],
                ),
              ),
            ),

            /// user avatar
            Positioned(
                top: -16,
                left: 0,
                right: 0,
                child: widget.user.avatar.avatar(size: 96, circular: true).centered()),
          ],
        ),
      );
}
