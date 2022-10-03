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
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:mobile/features/election/presentation/pages/dashboard.dart'
    as _i4;
import 'package:mobile/features/onboarding/presentation/pages/setup.basic.info.dart'
    as _i3;
import 'package:mobile/features/onboarding/presentation/pages/user.type.picker.dart'
    as _i2;
import 'package:mobile/features/onboarding/presentation/pages/welcome.dart'
    as _i1;
import 'package:mobile/protos/auth.pb.dart' as _i7;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    WelcomeRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.WelcomePage(),
      );
    },
    UserTypePickerRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.UserTypePickerPage(),
      );
    },
    SetupBasicInfoRoute.name: (routeData) {
      final args = routeData.argsAs<SetupBasicInfoRouteArgs>(
          orElse: () => const SetupBasicInfoRouteArgs());
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i3.SetupBasicInfoPage(
          key: args.key,
          userType: args.userType,
          currentUser: args.currentUser,
        ),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.DashboardPage(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          WelcomeRoute.name,
          path: '/',
        ),
        _i5.RouteConfig(
          UserTypePickerRoute.name,
          path: '/user-type-picker-page',
        ),
        _i5.RouteConfig(
          SetupBasicInfoRoute.name,
          path: '/setup-basic-info-page',
        ),
        _i5.RouteConfig(
          DashboardRoute.name,
          path: '/dashboard-page',
        ),
      ];
}

/// generated route for
/// [_i1.WelcomePage]
class WelcomeRoute extends _i5.PageRouteInfo<void> {
  const WelcomeRoute()
      : super(
          WelcomeRoute.name,
          path: '/',
        );

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i2.UserTypePickerPage]
class UserTypePickerRoute extends _i5.PageRouteInfo<void> {
  const UserTypePickerRoute()
      : super(
          UserTypePickerRoute.name,
          path: '/user-type-picker-page',
        );

  static const String name = 'UserTypePickerRoute';
}

/// generated route for
/// [_i3.SetupBasicInfoPage]
class SetupBasicInfoRoute extends _i5.PageRouteInfo<SetupBasicInfoRouteArgs> {
  SetupBasicInfoRoute({
    _i6.Key? key,
    _i7.UserType? userType,
    _i7.CrowderUser? currentUser,
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

  final _i6.Key? key;

  final _i7.UserType? userType;

  final _i7.CrowderUser? currentUser;

  @override
  String toString() {
    return 'SetupBasicInfoRouteArgs{key: $key, userType: $userType, currentUser: $currentUser}';
  }
}

/// generated route for
/// [_i4.DashboardPage]
class DashboardRoute extends _i5.PageRouteInfo<void> {
  const DashboardRoute()
      : super(
          DashboardRoute.name,
          path: '/dashboard-page',
        );

  static const String name = 'DashboardRoute';
}
