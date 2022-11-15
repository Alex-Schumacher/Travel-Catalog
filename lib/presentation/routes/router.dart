import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:travel_catalog/presentation/HomePage/activity_page.dart';
import 'package:travel_catalog/presentation/HomePage/detail_activity_page.dart';
import 'package:travel_catalog/presentation/HomePage/home_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(
      page: ActivityPage,
    ),
    AutoRoute(page: DetailledActivity)
  ],
)
class $AppRouter {}
