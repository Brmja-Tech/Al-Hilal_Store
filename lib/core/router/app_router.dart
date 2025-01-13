import 'package:alhilal_store/features/home/presentation/view/home_screen.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/login/presentation/view/login_screen.dart';

abstract class AppRouters {
  static const kdefultRoute = '/';
  static const khomeRoute = '/home';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: kdefultRoute,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: khomeRoute,
        builder: (context, state) => const LoginScreen(),
      ),
    ],
  );
}
