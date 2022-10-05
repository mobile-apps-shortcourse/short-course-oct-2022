import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/app/route.gr.dart';
import 'package:mobile/features/onboarding/presentation/manager/onboarding_cubit.dart';
import 'package:mobile/features/shared/presentation/widgets/app.bar.dart';
import 'package:mobile/protos/auth.pb.dart';
import 'package:mobile/utils/constants.dart';
import 'package:mobile/utils/validator.dart';
import 'package:shared_utils/shared_utils.dart';

part 'setup/avatar.dart';

part 'setup/personal.details.dart';

/// setup profile information
class SetupBasicInfoPage extends StatefulWidget {
  final UserType? userType;
  final CrowderUser? currentUser;

  const SetupBasicInfoPage({
    Key? key,
    this.userType,
    this.currentUser,
  }) : super(key: key);

  @override
  State<SetupBasicInfoPage> createState() => _SetupBasicInfoPageState();
}

class _SetupBasicInfoPageState extends State<SetupBasicInfoPage> {
  var _currentPage = 0, _loading = false;
  final _pageController = PageController();
  late final _onboardingCubit = context.read<OnboardingCubit>();

  @override
  Widget build(BuildContext context) => BlocListener(
        bloc: _onboardingCubit,
        listener: (context, state) {
          if (!mounted) return;

          setState(() => _loading = state is LoadingState);

          if (state is ErrorState<String>) {
            context.showCustomDialog(
                headerIconAsset: kAppLogo, message: state.failure);
          }

          if (state is SuccessState<CrowderUser>) {
            context.router.pushAndPopUntil(const DashboardRoute(),
                predicate: (_) => false);
          }
        },
        child: Scaffold(
          backgroundColor: context.colorScheme.surface,
          body: CrowderAppBar(
            title:
                _currentPage == 0 ? 'Profile Information' : 'One more step...',
            onBackPressed: () {
              if (_currentPage == 0) {
                context.router.pop();
              } else {
                _pageController.animateToPage(--_currentPage,
                    duration: kSidebarDuration, curve: Curves.easeInOut);
              }
            },
            child: LoadingIndicator(
              isLoading: _loading,
              lottieAnimResource: kLoadingAnimUrl,
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (page) => setState(() => _currentPage = page),
                children: [
                  _PersonalDetailsPage(user: widget.currentUser),
                  _AvatarPage(user: widget.currentUser),
                ],
              ),
            ),
          ),
          bottomNavigationBar: SafeArea(
            top: false,
            child: AppRoundedButton(
              enabled: !_loading,
              text: _currentPage == 0 ? 'Next' : 'Save & Continue',
              onTap: () {
                if (_currentPage == 0) {
                  _pageController.animateToPage(++_currentPage,
                      duration: kSidebarDuration, curve: Curves.easeInOut);
                } else {
                  _onboardingCubit.createAccount();
                }
              },
            ).horizontal(context.width * 0.1).top(16),
          ),
        ),
      );
}
