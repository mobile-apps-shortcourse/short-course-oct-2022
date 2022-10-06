import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/app/route.gr.dart';
import 'package:mobile/features/onboarding/presentation/manager/onboarding_cubit.dart';
import 'package:mobile/protos/auth.pbgrpc.dart';
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
                .vertical(8),
          ],
        ).top(16),
      ).fillMaxWidth(context),
      footerBuilder: (context, _) => Material(
        color: context.colorScheme.surface,
        child: SafeArea(
          top: false,
          child: BlocListener(
            bloc: _onboardingCubit,
            listener: (context, state) {
              loading = state is LoadingState;
              controller.rebuild();

              if (state is SuccessState<CrowderUser>) {
                context.router.pushAndPopUntil(const DashboardRoute(),
                    predicate: (_) => false);
              }

              if (state is ErrorState<String>) {
                context.showCustomDialog(
                    headerIconAsset: kAppLogo, message: state.failure);
              }
            },
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

                      _onboardingCubit.login();
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
            ),
          ).horizontal(40),
        ),
      ),
      builder: (context, state) {
        return Material(
          color: context.colorScheme.surface,
          child: SafeArea(
            top: false,
            child: BlocBuilder(
              bloc: _onboardingCubit,
              builder: (context, state) {
                if (state is LoadingState) {
                  return const LoadingIndicatorItem(
                    message: 'Signing in...',
                    loadingAnimationUrl: kLoadingAnimUrl,
                  );
                }

                return Form(
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
                );
              },
            ),
          ),
        );
      },
    );
  });
}
