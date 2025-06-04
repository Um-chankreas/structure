import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_project/app/routes/app_route.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

class AppRouter {
  static GoRouter get router => _goRouter;

  static String? routeNavigate;

  static void setRouteNavigate(String route) {
    routeNavigate = route;
  }

  static final _navigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter _goRouter = GoRouter(
      initialLocation: AppRoute.welcome.path,
      observers: [routeObserver],
      navigatorKey: _navigatorKey,
      routes: []);
}
