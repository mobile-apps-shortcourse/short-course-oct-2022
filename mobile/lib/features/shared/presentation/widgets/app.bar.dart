import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_utils/shared_utils.dart';

class CrowderAppBar extends StatefulWidget {
  final String title;
  final bool showBackButton;
  final Color? contentBackground;
  final Widget child;
  final void Function()? onBackPressed;
  final EdgeInsets contentPadding;

  const CrowderAppBar({
    Key? key,
    required this.title,
    this.showBackButton = true,
    required this.child,
    this.contentBackground,
    this.onBackPressed,
    this.contentPadding = const EdgeInsets.fromLTRB(24, 36, 24, 0),
  }) : super(key: key);

  @override
  State<CrowderAppBar> createState() => _CrowderAppBarState();
}

class _CrowderAppBarState extends State<CrowderAppBar> {
  @override
  Widget build(BuildContext context) {
    kUseDefaultOverlays(context,
        statusBarBrightness: context.invertedThemeBrightness);

    return Container(
      height: context.height,
      width: context.width,
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
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
                      color: context.colorScheme.onSecondary)
                  .top(8)
                  .centered(),
            ),
          ),

          /// page content
          Positioned.fill(
              top: context.height * 0.14,
              child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24)),
                      color: widget.contentBackground ??
                          context.colorScheme.surface),
                  padding: widget.contentPadding,
                  child: widget.child)),

          /// back nav
          if (widget.showBackButton) ...{
            AnimatedPositioned(
              duration: kSidebarDuration,
              top: context.height * 0.05,
              left: widget.showBackButton ? 12 : -context.width * 0.2,
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
                    onPressed: widget.onBackPressed == null
                        ? context.router.pop
                        : widget.onBackPressed!,
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
