// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:mobile/features/onboarding/presentation/pages/setup.basic.info.dart'
    as _i3;
import 'package:mobile/features/onboarding/presentation/pages/user.type.picker.dart'
    as _i2;
import 'package:mobile/features/onboarding/presentation/pages/welcome.dart'
    as _i1;
import 'package:mobile/protos/auth.pb.dart' as _i6;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    WelcomeRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.WelcomePage(),
      );
    },
    UserTypePickerRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.UserTypePickerPage(),
      );
    },
    SetupBasicInfoRoute.name: (routeData) {
      final args = routeData.argsAs<SetupBasicInfoRouteArgs>(
          orElse: () => const SetupBasicInfoRouteArgs());
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i3.SetupBasicInfoPage(
          key: args.key,
          userType: args.userType,
          currentUser: args.currentUser,
        ),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          WelcomeRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          UserTypePickerRoute.name,
          path: '/user-type-picker-page',
        ),
        _i4.RouteConfig(
          SetupBasicInfoRoute.name,
          path: '/setup-basic-info-page',
        ),
      ];
}

/// generated route for
/// [_i1.WelcomePage]
class WelcomeRoute extends _i4.PageRouteInfo<void> {
  const WelcomeRoute()
      : super(
          WelcomeRoute.name,
          path: '/',
        );

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i2.UserTypePickerPage]
class UserTypePickerRoute extends _i4.PageRouteInfo<void> {
  const UserTypePickerRoute()
      : super(
          UserTypePickerRoute.name,
          path: '/user-type-picker-page',
        );

  static const String name = 'UserTypePickerRoute';
}

/// generated route for
/// [_i3.SetupBasicInfoPage]
class SetupBasicInfoRoute extends _i4.PageRouteInfo<SetupBasicInfoRouteArgs> {
  SetupBasicInfoRoute({
    _i5.Key? key,
    _i6.UserType? userType,
    _i6.CrowderUser? currentUser,
  }) : super(
          SetupBasicInfoRoute.name,
          path: '/setup-basic-info-page',
          args: SetupBasicInfoRouteArgs(
            key: key,
            userType: userType,
            currentUser: currentUser,
          ),
        );

  static const String name = 'SetupBasicInfoRoute';
}

class SetupBasicInfoRouteArgs {
  const SetupBasicInfoRouteArgs({
    this.key,
    this.userType,
    this.currentUser,
  });

  final _i5.Key? key;

  final _i6.UserType? userType;

  final _i6.CrowderUser? currentUser;

  @override
  String toString() {
    return 'SetupBasicInfoRouteArgs{key: $key, userType: $userType, currentUser: $currentUser}';
  }
}
