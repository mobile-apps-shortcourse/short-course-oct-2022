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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:mobile/features/election/presentation/pages/dashboard.dart'
    as _i4;
import 'package:mobile/features/election/presentation/pages/poll.details.dart'
    as _i5;
import 'package:mobile/features/onboarding/presentation/pages/setup.basic.info.dart'
    as _i3;
import 'package:mobile/features/onboarding/presentation/pages/user.type.picker.dart'
    as _i2;
import 'package:mobile/features/onboarding/presentation/pages/welcome.dart'
    as _i1;
import 'package:mobile/protos/auth.pb.dart' as _i8;
import 'package:mobile/protos/voting.pb.dart' as _i9;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    WelcomeRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.WelcomePage(),
      );
    },
    UserTypePickerRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.UserTypePickerPage(),
      );
    },
    SetupBasicInfoRoute.name: (routeData) {
      final args = routeData.argsAs<SetupBasicInfoRouteArgs>(
          orElse: () => const SetupBasicInfoRouteArgs());
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i3.SetupBasicInfoPage(
          key: args.key,
          userType: args.userType,
          currentUser: args.currentUser,
        ),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.DashboardPage(),
      );
    },
    PollDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<PollDetailsRouteArgs>();
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i5.PollDetailsPage(
          key: args.key,
          poll: args.poll,
        ),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          WelcomeRoute.name,
          path: '/',
        ),
        _i6.RouteConfig(
          UserTypePickerRoute.name,
          path: '/user-type-picker-page',
        ),
        _i6.RouteConfig(
          SetupBasicInfoRoute.name,
          path: '/setup-basic-info-page',
        ),
        _i6.RouteConfig(
          DashboardRoute.name,
          path: '/dashboard-page',
        ),
        _i6.RouteConfig(
          PollDetailsRoute.name,
          path: '/poll-details-page',
        ),
      ];
}

/// generated route for
/// [_i1.WelcomePage]
class WelcomeRoute extends _i6.PageRouteInfo<void> {
  const WelcomeRoute()
      : super(
          WelcomeRoute.name,
          path: '/',
        );

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i2.UserTypePickerPage]
class UserTypePickerRoute extends _i6.PageRouteInfo<void> {
  const UserTypePickerRoute()
      : super(
          UserTypePickerRoute.name,
          path: '/user-type-picker-page',
        );

  static const String name = 'UserTypePickerRoute';
}

/// generated route for
/// [_i3.SetupBasicInfoPage]
class SetupBasicInfoRoute extends _i6.PageRouteInfo<SetupBasicInfoRouteArgs> {
  SetupBasicInfoRoute({
    _i7.Key? key,
    _i8.UserType? userType,
    _i8.CrowderUser? currentUser,
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

  final _i7.Key? key;

  final _i8.UserType? userType;

  final _i8.CrowderUser? currentUser;

  @override
  String toString() {
    return 'SetupBasicInfoRouteArgs{key: $key, userType: $userType, currentUser: $currentUser}';
  }
}

/// generated route for
/// [_i4.DashboardPage]
class DashboardRoute extends _i6.PageRouteInfo<void> {
  const DashboardRoute()
      : super(
          DashboardRoute.name,
          path: '/dashboard-page',
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i5.PollDetailsPage]
class PollDetailsRoute extends _i6.PageRouteInfo<PollDetailsRouteArgs> {
  PollDetailsRoute({
    _i7.Key? key,
    required _i9.Poll poll,
  }) : super(
          PollDetailsRoute.name,
          path: '/poll-details-page',
          args: PollDetailsRouteArgs(
            key: key,
            poll: poll,
          ),
        );

  static const String name = 'PollDetailsRoute';
}

class PollDetailsRouteArgs {
  const PollDetailsRouteArgs({
    this.key,
    required this.poll,
  });

  final _i7.Key? key;

  final _i9.Poll poll;

  @override
  String toString() {
    return 'PollDetailsRouteArgs{key: $key, poll: $poll}';
  }
}
