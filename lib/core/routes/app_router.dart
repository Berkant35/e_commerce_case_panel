import 'package:go_router/go_router.dart';
import 'package:untitled/core/routes/route_names.dart';

import '../../features/splash/presentation/pages/splash_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: RouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),
    ],
  );
}
