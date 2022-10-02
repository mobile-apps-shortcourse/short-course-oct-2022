import 'package:auto_route/annotations.dart';
import 'package:mobile/features/onboarding/presentation/pages/user.type.picker.dart';
import 'package:mobile/features/onboarding/presentation/pages/welcome.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: WelcomePage, initial: true),
    AutoRoute(page: UserTypePickerPage),
  ],
)
class $AppRouter {}
