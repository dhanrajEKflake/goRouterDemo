import 'package:flutter/material.dart';
import 'package:flutter_shell_demo/bottom_nav.dart';
import 'package:flutter_shell_demo/detail_homescreen.dart';
import 'package:flutter_shell_demo/details_profilescreen.dart';
import 'package:flutter_shell_demo/homescreen.dart';
// import 'package:flutter_shell_demo/main.dart';
import 'package:flutter_shell_demo/profile_screen.dart';
import 'package:flutter_shell_demo/simple_animation.dart';
import 'package:flutter_shell_demo/splashscreen.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GlobalKey<NavigatorState> _sectionANavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');
final GoRouter router = GoRouter(
    initialLocation: '/splashscreen',
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
          path: '/splashscreen',
          builder: (context, state) => const SplashScreen()),
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) =>
              BottomNav(statefulNavigationShell: navigationShell),
          branches: [
            StatefulShellBranch(navigatorKey: _sectionANavigatorKey, routes: [
              GoRoute(
                  path: '/home',
                  builder: (context, state) => const HomeScreen(),
                  routes: [
                    GoRoute(
                      path: 'homeDetails',
                      builder: (context, state) => const DetailHomeScreen(),
                    ),
                    GoRoute(
                      path: 'simpleAnimation',
                      builder: (context, state) => const SimpleAnimationDemo(),
                    )
                  ])
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                  path: '/profile',
                  builder: (context, state) => const ProfileScreen(),
                  routes: [
                    GoRoute(
                      path: 'detailProfile/:param',
                      builder: (context, state) => DetailProfileScreen(
                        paramData: state.pathParameters['param'],
                        extra: state.extra,
                      ),
                    )
                  ])
            ])
          ])
    ]);
