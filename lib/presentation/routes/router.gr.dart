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

import '../../domain/Activity.dart' as _i6;
import '../HomePage/activity_page.dart' as _i2;
import '../HomePage/detail_activity_page.dart' as _i3;
import '../HomePage/home_page.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    ActivityRoute.name: (routeData) {
      final args = routeData.argsAs<ActivityRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.ActivityPage(
          backgroundImageUrl: args.backgroundImageUrl,
          key: args.key,
        ),
      );
    },
    DetailledActivity.name: (routeData) {
      final args = routeData.argsAs<DetailledActivityArgs>();
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.DetailledActivity(
          backgroundImageUrl: args.backgroundImageUrl,
          activity: args.activity,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          HomeRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          ActivityRoute.name,
          path: '/activity-page',
        ),
        _i4.RouteConfig(
          DetailledActivity.name,
          path: '/detailled-activity',
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.ActivityPage]
class ActivityRoute extends _i4.PageRouteInfo<ActivityRouteArgs> {
  ActivityRoute({
    required String backgroundImageUrl,
    _i5.Key? key,
  }) : super(
          ActivityRoute.name,
          path: '/activity-page',
          args: ActivityRouteArgs(
            backgroundImageUrl: backgroundImageUrl,
            key: key,
          ),
        );

  static const String name = 'ActivityRoute';
}

class ActivityRouteArgs {
  const ActivityRouteArgs({
    required this.backgroundImageUrl,
    this.key,
  });

  final String backgroundImageUrl;

  final _i5.Key? key;

  @override
  String toString() {
    return 'ActivityRouteArgs{backgroundImageUrl: $backgroundImageUrl, key: $key}';
  }
}

/// generated route for
/// [_i3.DetailledActivity]
class DetailledActivity extends _i4.PageRouteInfo<DetailledActivityArgs> {
  DetailledActivity({
    required String backgroundImageUrl,
    required _i6.Activity activity,
    _i5.Key? key,
  }) : super(
          DetailledActivity.name,
          path: '/detailled-activity',
          args: DetailledActivityArgs(
            backgroundImageUrl: backgroundImageUrl,
            activity: activity,
            key: key,
          ),
        );

  static const String name = 'DetailledActivity';
}

class DetailledActivityArgs {
  const DetailledActivityArgs({
    required this.backgroundImageUrl,
    required this.activity,
    this.key,
  });

  final String backgroundImageUrl;

  final _i6.Activity activity;

  final _i5.Key? key;

  @override
  String toString() {
    return 'DetailledActivityArgs{backgroundImageUrl: $backgroundImageUrl, activity: $activity, key: $key}';
  }
}
