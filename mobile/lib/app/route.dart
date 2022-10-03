import 'package:auto_route/annotations.dart';
import 'package:mobile/features/election/presentation/pages/dashboard.dart';
import 'package:mobile/features/onboarding/presentation/pages/setup.basic.info.dart';
import 'package:mobile/features/onboarding/presentation/pages/user.type.picker.dart';
import 'package:mobile/features/onboarding/presentation/pages/welcome.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: WelcomePage, initial: true),

    /// onboarding
    AutoRoute(page: UserTypePickerPage),
    AutoRoute(page: SetupBasicInfoPage),

    /// dashboard
    AutoRoute(page: DashboardPage),

  ],
)
class $AppRouter {}
