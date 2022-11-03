import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/app/route.gr.dart';
import 'package:mobile/features/shared/presentation/manager/user_cubit.dart';
import 'package:mobile/protos/auth.pb.dart';
import 'package:mobile/utils/constants.dart';
import 'package:shared_utils/shared_utils.dart';

class CrowderAppBar extends StatefulWidget {
  final String title;
  final bool showBackButton;
  final Color? contentBackground;
  final Widget child;
  final void Function()? onBackPressed;
  final EdgeInsets contentPadding;
  final bool showCurrentUser;
  final bool showAppIcon;

  const CrowderAppBar({
    Key? key,
    required this.title,
    required this.child,
    this.showBackButton = true,
    this.showCurrentUser = false,
    this.showAppIcon = false,
    this.contentBackground,
    this.onBackPressed,
    this.contentPadding = const EdgeInsets.fromLTRB(24, 36, 24, 0),
  }) : super(key: key);

  @override
  State<CrowderAppBar> createState() => _CrowderAppBarState();
}

class _CrowderAppBarState extends State<CrowderAppBar> {
  final _userCubit = UserCubit();

  @override
  void initState() {
    super.initState();
    doAfterDelay(() {
      if (!widget.showCurrentUser) return;
      _userCubit.currentUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    kUseDefaultOverlays(context,
        statusBarBrightness: context.invertedThemeBrightness);

    return Container(
      height: context.height,
      width: context.width,
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          /// title & user avatar
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: SafeArea(
              bottom: false,
              child: AnimatedRow(
                animateType: AnimateType.slideUp,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  widget.showAppIcon
                      ? kAppLogo.avatar(
                          size: 40, fromAsset: true, circular: true)
                      : const SizedBox(width: 40, height: 40),
                  widget.title.capitalize().h6(context,
                      weight: FontWeight.w600,
                      color: context.colorScheme.onPrimary),
                  widget.showCurrentUser
                      ? BlocBuilder(
                          bloc: _userCubit,
                          builder: (context, state) =>
                              state is SuccessState<CrowderUser>
                                  ? state.data.avatar
                                      .avatar(size: 40, circular: true)
                                      .clickable(onTap: _showLogoutOption)
                                  : const SizedBox(width: 40, height: 40),
                        )
                      : const SizedBox(width: 40, height: 40),
                ],
              ).top(8).horizontal(24),
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
                    color: context.colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: IconButton(
                    icon: RotatedBox(
                      quarterTurns: 2,
                      child: Icon(
                        Icons.arrow_right_alt,
                        color: context.colorScheme.primary,
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
