import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/presentation/ui/calendar/calendar_screen.dart';
import 'package:todo_list/presentation/ui/calendar_detail/calendar_detail_screen.dart';
import 'package:todo_list/presentation/ui/home/home_screen.dart';
import 'package:todo_list/presentation/ui/index/index_screen.dart';
import 'package:todo_list/presentation/ui/index_detail/index_detail_screen.dart';
import 'package:todo_list/presentation/ui/login/login_screen.dart';
import 'package:todo_list/presentation/ui/onboarding/onboarding_screen.dart';
import 'package:todo_list/presentation/ui/profile/profile_screen.dart';
import 'package:todo_list/presentation/ui/register/register_screen.dart';
import 'package:todo_list/presentation/ui/splash/splash_screen.dart';
import 'package:todo_list/presentation/ui/start/start_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final List<String> pathShowBottomNavigation = [
  RouterPath.index,
  RouterPath.calendar,
  RouterPath.profile,
];

final route = GoRouter(
  initialLocation: RouterPath.splash,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        final bool isShowBottomNavigation =
            pathShowBottomNavigation.contains(state.location);
        return isShowBottomNavigation
            ? HomeScreen(
                child: child,
              )
            : Container(
                child: child,
              );
      },
      routes: [
        GoRoute(
          path: RouterPath.index,
          builder: (context, state) => const IndexScreen(),
          routes: [
            GoRoute(
              path: RouterPath.indexDetail,
              builder: (context, state) => const IndexDetailScreen(),
            )
          ],
        ),
        GoRoute(
          path: RouterPath.calendar,
          builder: (context, state) => const CalendarScreen(),
          routes: [
            GoRoute(
              path: RouterPath.calendarDetail,
              builder: (context, state) => const CalendarDetailScreen(),
            )
          ],
        ),
        GoRoute(
          path: RouterPath.profile,
          builder: (context, state) => const ProfileScreen(),
        ),
        GoRoute(
          path: RouterPath.splash,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: RouterPath.onboarding,
          builder: (context, state) => const OnboardingScreen(),
        ),
        GoRoute(
          path: RouterPath.start,
          builder: (context, state) => const StartScreen(),
        ),
        GoRoute(
          path: RouterPath.login,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: RouterPath.register,
          builder: (context, state) => const RegisterScreen(),
        ),
      ],
    )
  ],
  debugLogDiagnostics: true,
);

class RouterPath {
  static const splash = '/splash';
  static const onboarding = '/onboarding';
  static const start = '/start';
  static const login = '/login';
  static const register = '/register';

  static const index = '/index';
  static const indexDetail = 'detail';

  static const calendar = '/calendar';
  static const calendarDetail = 'detail';

  static const profile = '/profile';
}
