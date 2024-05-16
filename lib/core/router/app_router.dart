import 'package:go_router/go_router.dart';

import '../app/view/app_view.dart';

class AppRouter {
  AppRouter._();

  static const String home = '/';

  static final _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: home,
        builder: (context, state) => const AppView(),
        routes: <RouteBase>[],
      ),
    ],
  );

  static GoRouter get router => _router;
}
