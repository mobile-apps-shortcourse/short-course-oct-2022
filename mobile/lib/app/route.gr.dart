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
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:mobile/features/election/presentation/pages/create.poll.dart'
    as _i5;
import 'package:mobile/features/election/presentation/pages/dashboard.dart'
    as _i4;
import 'package:mobile/features/election/presentation/pages/poll.details.dart'
    as _i7;
import 'package:mobile/features/election/presentation/pages/update.poll.dart'
    as _i6;
import 'package:mobile/features/onboarding/presentation/pages/setup.basic.info.dart'
    as _i3;
import 'package:mobile/features/onboarding/presentation/pages/user.type.picker.dart'
    as _i2;
import 'package:mobile/features/onboarding/presentation/pages/welcome.dart'
    as _i1;
import 'package:mobile/protos/auth.pb.dart' as _i10;
import 'package:mobile/protos/voting.pb.dart' as _i11;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    WelcomeRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.WelcomePage(),
      );
    },
    UserTypePickerRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.UserTypePickerPage(),
      );
    },
    SetupBasicInfoRoute.name: (routeData) {
      final args = routeData.argsAs<SetupBasicInfoRouteArgs>(
          orElse: () => const SetupBasicInfoRouteArgs());
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i3.SetupBasicInfoPage(
          key: args.key,
          userType: args.userType,
          currentUser: args.currentUser,
        ),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.DashboardPage(),
      );
    },
    CreatePollRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.CreatePollPage(),
      );
    },
    UpdatePollRoute.name: (routeData) {
      final args = routeData.argsAs<UpdatePollRouteArgs>();
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i6.UpdatePollPage(
          key: args.key,
          poll: args.poll,
        ),
      );
    },
    PollDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<PollDetailsRouteArgs>();
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i7.PollDetailsPage(
          key: args.key,
          poll: args.poll,
        ),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          WelcomeRoute.name,
          path: '/',
        ),
        _i8.RouteConfig(
          UserTypePickerRoute.name,
          path: '/user-type-picker-page',
        ),
        _i8.RouteConfig(
          SetupBasicInfoRoute.name,
          path: '/setup-basic-info-page',
        ),
        _i8.RouteConfig(
          DashboardRoute.name,
          path: '/dashboard-page',
        ),
        _i8.RouteConfig(
          CreatePollRoute.name,
          path: '/create-poll-page',
        ),
        _i8.RouteConfig(
          UpdatePollRoute.name,
          path: '/update-poll-page',
        ),
        _i8.RouteConfig(
          PollDetailsRoute.name,
          path: '/poll-details-page',
        ),
      ];
}

/// generated route for
/// [_i1.WelcomePage]
class WelcomeRoute extends _i8.PageRouteInfo<void> {
  const WelcomeRoute()
      : super(
          WelcomeRoute.name,
          path: '/',
        );

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i2.UserTypePickerPage]
class UserTypePickerRoute extends _i8.PageRouteInfo<void> {
  const UserTypePickerRoute()
      : super(
          UserTypePickerRoute.name,
          path: '/user-type-picker-page',
        );

  static const String name = 'UserTypePickerRoute';
}

/// generated route for
/// [_i3.SetupBasicInfoPage]
class SetupBasicInfoRoute extends _i8.PageRouteInfo<SetupBasicInfoRouteArgs> {
  SetupBasicInfoRoute({
    _i9.Key? key,
    _i10.UserType? userType,
    _i10.CrowderUser? currentUser,
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

  final _i9.Key? key;

  final _i10.UserType? userType;

  final _i10.CrowderUser? currentUser;

  @override
  String toString() {
    return 'SetupBasicInfoRouteArgs{key: $key, userType: $userType, currentUser: $currentUser}';
  }
}

/// generated route for
/// [_i4.DashboardPage]
class DashboardRoute extends _i8.PageRouteInfo<void> {
  const DashboardRoute()
      : super(
          DashboardRoute.name,
          path: '/dashboard-page',
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i5.CreatePollPage]
class CreatePollRoute extends _i8.PageRouteInfo<void> {
  const CreatePollRoute()
      : super(
          CreatePollRoute.name,
          path: '/create-poll-page',
        );

  static const String name = 'CreatePollRoute';
}

/// generated route for
/// [_i6.UpdatePollPage]
class UpdatePollRoute extends _i8.PageRouteInfo<UpdatePollRouteArgs> {
  UpdatePollRoute({
    _i9.Key? key,
    required _i11.Poll poll,
  }) : super(
          UpdatePollRoute.name,
          path: '/update-poll-page',
          args: UpdatePollRouteArgs(
            key: key,
            poll: poll,
          ),
        );

  static const String name = 'UpdatePollRoute';
}

class UpdatePollRouteArgs {
  const UpdatePollRouteArgs({
    this.key,
    required this.poll,
  });

  final _i9.Key? key;

  final _i11.Poll poll;

  @override
  String toString() {
    return 'UpdatePollRouteArgs{key: $key, poll: $poll}';
  }
}

/// generated route for
/// [_i7.PollDetailsPage]
class PollDetailsRoute extends _i8.PageRouteInfo<PollDetailsRouteArgs> {
  PollDetailsRoute({
    _i9.Key? key,
    required _i11.Poll poll,
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

  final _i9.Key? key;

  final _i11.Poll poll;

  @override
  String toString() {
    return 'PollDetailsRouteArgs{key: $key, poll: $poll}';
  }
}
