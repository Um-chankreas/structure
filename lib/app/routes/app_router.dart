import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_project/app/routes/app_route.dart';
import 'package:sample_project/screens/auth/login_screen.dart';
import 'package:sample_project/screens/home_screen.dart';

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
      initialLocation: AppRoute.home.path,
      observers: [routeObserver],
      navigatorKey: _navigatorKey,
      routes: [
        GoRoute(
            path: AppRoute.home.path,
            name: AppRoute.home.name,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: HomeScreen()),
            routes: [
              GoRoute(
                path: AppRoute.login.path,
                name: AppRoute.login.name,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: LoginScreen()),
              )
            ])
      ]);
}
