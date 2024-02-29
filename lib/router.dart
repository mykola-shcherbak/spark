import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spark_test/screens/home_screen.dart';
import 'package:spark_test/screens/preview_screen.dart';
import 'package:spark_test/screens/process_screen.dart';
import 'package:spark_test/screens/result_screen.dart';

final GoRouter router =
    GoRouter(initialLocation: HomeScreen.path, routes: <RouteBase>[
  GoRoute(
      path: HomeScreen.path,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: ProcessScreen.route,
          builder: (BuildContext context, GoRouterState state) {
            return const ProcessScreen();
          },
        ),
        GoRoute(
          path: ResultScreen.route,
          builder: (BuildContext context, GoRouterState state) {
            return const ResultScreen();
          },
        ),
        GoRoute(
          path: PreviewScreen.route,
          builder: (BuildContext context, GoRouterState state) {
            return const PreviewScreen();
          },
        ),
      ]),
]);
