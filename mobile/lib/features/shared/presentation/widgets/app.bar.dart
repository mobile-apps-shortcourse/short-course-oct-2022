import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_utils/shared_utils.dart';

class CrowderAppBar extends StatefulWidget {
  final String title;
  final bool showBackButton;
  final Widget child;

  const CrowderAppBar({
    Key? key,
    required this.title,
    required this.showBackButton,
    required this.child,
  }) : super(key: key);

  @override
  State<CrowderAppBar> createState() => _CrowderAppBarState();
}

class _CrowderAppBarState extends State<CrowderAppBar> {
  @override
  Widget build(BuildContext context) {
    kUseDefaultOverlays(context, statusBarBrightness: context.theme.brightness);

    return Container(
      height: context.height,
      width: context.width,
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: SafeArea(
              bottom: false,
              child: widget.title
                  .capitalize()
                  .h6(context,
                      weight: FontWeight.w600,
                      color: context.colorScheme.onSurface)
                  .top(8)
                  .centered(),
            ),
          ),

          /// page content
          Positioned.fill(
              top: context.height * 0.15,
              child: DecoratedBox(
                  decoration:
                      BoxDecoration(color: context.colorScheme.background),
                  child: widget.child)),

          /// back nav
          if (widget.showBackButton) ...{
            Positioned(
              top: context.height * 0.05,
              left: 12,
              child: SafeArea(
                bottom: false,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: context.colorScheme.onSurface,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: IconButton(
                    icon: RotatedBox(
                      quarterTurns: 2,
                      child: Icon(
                        Icons.arrow_right_alt,
                        color: context.colorScheme.surface,
                      ),
                    ),
                    onPressed: context.router.pop,
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),
            ),
          },
        ],
      ),
    );
  }
}
