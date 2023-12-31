import 'package:go_router/go_router.dart';
import 'package:ticket/features/auth/presentation/pages/login_page.dart';
import 'package:ticket/features/events/data/models/event_model.dart';
import 'package:ticket/features/events/presentation/pages/details_page.dart';
import 'package:ticket/features/events/presentation/pages/event_create.dart';
import 'package:ticket/features/events/presentation/pages/events_all.dart';
import 'package:ticket/features/home_page/presentation/home_page.dart';
import 'package:ticket/features/reservation/presentations/all_resrvation.dart';
import 'package:ticket/welcome_page.dart';

import '../../features/auth/presentation/pages/register_page.dart';

class AppRoute {
  static String initialRoute = '/welcome';
  static String loginRoute = '/login';
  static String registerRoute = '/register';
  static String eventsAllRoute = '/eventsAll';
  static String eventCreateRoute = '/eventCreate';
  static String detailPageRoute = '/detailPage';
  static String reservationAllRoute = '/reservationAll';

  static GoRouter router = GoRouter(
    initialLocation: initialRoute,
    routes: [
      GoRoute(path: initialRoute, builder: (context, state) => const WelcomPage(), routes: [
        GoRoute(
          path: 'register',
          builder: (context, state) => const RegisterPage(),
        ),
        GoRoute(
          path: 'login',
          builder: (context, state) => const LoginPage(),
        ),
      ]),
      ShellRoute(
        builder: (context, state, child) => HomePage(
          child: child,
        ),
        routes: [
          GoRoute(
            path: '/eventsAll',
            builder: (context, state) => const EventsAll(),
            routes: [
              GoRoute(
                path: 'detailPage',
                builder: (context, state) => DeatailPage(
                  data: (state.extra as EventModel),
                ),
              ),
            ],
          ),
          GoRoute(
            path: '/eventCreate',
            builder: (context, state) => const EventCreate(),
          ),
          GoRoute(
            path: '/reservationAll',
            builder: (context, state) => const ReservationAll(),
          ),
        ],
      )
    ],
  );
}
