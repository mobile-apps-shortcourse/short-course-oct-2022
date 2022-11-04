import 'package:flutter/material.dart';
import 'package:mobile/protos/auth.pb.dart';
import 'package:shared_utils/shared_utils.dart';

/// grid tile for candidate selection for [Poll]
class CandidateSelectionGridTile extends StatelessWidget {
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
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
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
                    user.displayName.subtitle1(context,
                        color: context.colorScheme.primary,
                        weight: FontWeight.bold),
                    user.bio
                        .subtitle2(context,
                            alignment: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis)
                        .top(6),
                    AppRoundedButton(
                      text: isEnrolled ? 'Remove' : 'Add',
                      outlined: isEnrolled,
                      onTap: onButtonPressed,
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
                child: user.avatar.avatar(size: 96, circular: true).centered()),
          ],
        ),
      );
}
