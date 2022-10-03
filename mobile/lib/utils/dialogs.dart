import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/onboarding/presentation/manager/onboarding_cubit.dart';
import 'package:mobile/utils/constants.dart';
import 'package:mobile/utils/validator.dart';
import 'package:shared_utils/shared_utils.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

/// show login sheet
Future<void> showLoginSheet(BuildContext context) async {
  final controller = SheetController(), authFormKey = GlobalKey<FormState>();
  late final _onboardingCubit = context.read<OnboardingCubit>(),
      usernameController =
          TextEditingController(text: _onboardingCubit.kUsername),
      passwordController =
          TextEditingController(text: _onboardingCubit.kPassword);
  var loading = false;

  await showSlidingBottomSheet(context, builder: (context) {
    return SlidingSheetDialog(
      elevation: 8,
      controller: controller,
      cornerRadius: 16,
      color: context.colorScheme.surface,
      duration: kSidebarFooterDuration,
      dismissOnBackdropTap: false,
      avoidStatusBar: true,
      scrollSpec: ScrollSpec.overscroll(color: context.colorScheme.primary),
      snapSpec: const SnapSpec(
        snap: true,
        snappings: [0.6, 0.7, 1.0],
        positioning: SnapPositioning.relativeToAvailableSpace,
      ),
      headerBuilder: (context, _) => Material(
        color: context.colorScheme.surface,
        child: AnimatedColumn(
          animateType: AnimateType.slideUp,
          children: [
            kAppLogo.avatar(size: 72, fromAsset: true).centered(),
            'Welcome back! 🥳'
                .h6(context,
                    weight: FontWeight.bold,
                    alignment: TextAlign.center,
                    color: context.colorScheme.onBackground)
                .top(12),
            'Enter your credentials to get started'
                .subtitle1(context,
                    alignment: TextAlign.center,
                    color: context.colorScheme.onBackground,
                    emphasis: kEmphasisHigh)
                .top(8),
            const Divider(),
          ],
        ).top(16),
      ).fillMaxWidth(context),
      footerBuilder: (context, _) => Material(
        color: context.colorScheme.surface,
        child: SafeArea(
          top: false,
          child: AnimatedColumn(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppRoundedButton(
                enabled: !loading,
                layoutSize: LayoutSize.wrapContent,
                text: loading ? 'Authenticating...' : 'Sign in',
                onTap: () async {
                  if (authFormKey.currentState != null &&
                      authFormKey.currentState!.validate()) {
                    authFormKey.currentState?.save();

                    logger.i(
                        'signing in with username(${_onboardingCubit.kUsername}) & password(${_onboardingCubit.kPassword})');

                    // todo => perform authentication here

                    loading = true;
                    controller.rebuild();
                    await Future.delayed(const Duration(seconds: 2));
                    loading = false;
                    controller.rebuild();
                  }
                },
              ),
              Visibility(
                visible: !loading,
                child: AppRoundedButton(
                  text: 'Cancel',
                  layoutSize: LayoutSize.wrapContent,
                  onTap: context.router.pop,
                  outlined: true,
                ).top(12),
              ),
            ],
          ).horizontal(40),
        ),
      ),
      builder: (context, state) {
        return Material(
          color: context.colorScheme.surface,
          child: SafeArea(
            top: false,
            child: Form(
              key: authFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppTextField(
                    'Username',
                    enabled: !loading,
                    controller: usernameController,
                    inputType: TextInputType.emailAddress,
                    onChange: (input) {
                      _onboardingCubit.kUsername = input?.trim() ?? '';
                      controller.rebuild();
                    },
                    validator: Validators.validateEmail,
                  ),
                  AppTextField(
                    'Password',
                    enabled: !loading,
                    controller: passwordController,
                    textFieldType: AppTextFieldType.password,
                    onChange: (input) {
                      _onboardingCubit.kPassword = input?.trim() ?? '';
                      controller.rebuild();
                    },
                    validator: Validators.validatePassword,
                  ),
                ],
              ).horizontal(40).vertical(12),
            ),
          ),
        );
      },
    );
  });
}
