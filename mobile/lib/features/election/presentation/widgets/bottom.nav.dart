import 'package:flutter/material.dart';
import 'package:shared_utils/shared_utils.dart';

/// bottom navigation
class CrowderBottomNavigationView extends StatefulWidget {
  final List<CrowderBottomNavigationViewItem> items;
  final void Function(int) onTap;
  final int activeIndex;

  const CrowderBottomNavigationView({
    Key? key,
    required this.items,
    required this.onTap,
    required this.activeIndex,
  })  : assert(items.length > 2),
        super(key: key);

  @override
  State<CrowderBottomNavigationView> createState() =>
      _CrowderBottomNavigationViewState();
}

class _CrowderBottomNavigationViewState
    extends State<CrowderBottomNavigationView> {
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(40), topLeft: Radius.circular(40))),
        child: SafeArea(
          top: false,
          child: AnimatedRow(
            animateType: AnimateType.slideUp,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: widget.items
                .map(
                  (e) => GestureDetector(
                    onTap: () => widget.onTap(widget.items.indexOf(e)),
                    child: CrowderBottomNavigationViewItem(
                        label: e.label,
                        active: widget.items.indexOf(e) == widget.activeIndex,
                        activeIcon: e.activeIcon,
                        inactiveIcon: e.inactiveIcon),
                  ),
                )
                .toList(),
          ),
        ),
      );
}

/// bottom nav item
class CrowderBottomNavigationViewItem extends StatelessWidget {
  final IconData activeIcon;
  final IconData inactiveIcon;
  final String label;
  final bool active;

  const CrowderBottomNavigationViewItem({
    Key? key,
    required this.activeIcon,
    required this.inactiveIcon,
    required this.label,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AnimatedColumn(
        animateType: AnimateType.slideUp,
        duration: 850,
        children: [
          Icon(active ? activeIcon : inactiveIcon,
              size: 28,
              color: active
                  ? context.colorScheme.primary
                  : context.theme.disabledColor),
          label
              .button(context,
                  color: active
                      ? context.colorScheme.primary
                      : context.theme.disabledColor,
                  weight: FontWeight.w600)
              .top(8),
        ],
      );
}
