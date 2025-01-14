import 'package:alhilal_store/features/auth/forget_password/presentation/view/forget_password.dart';
import 'package:alhilal_store/features/auth/otp/presentation/view/otp.dart';
import 'package:alhilal_store/features/auth/sign_up/presentation/view/signup_screen.dart';
import 'package:alhilal_store/features/onboarding/presentation/view/started_screen.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/login/presentation/view/login_screen.dart';

abstract class AppRouters {
  static const kdefultRoute = '/';
  static const kloginRoute = '/login';
  static const ksplashScreen = '/splash';
  static const koptScreen = '/otp';
  static const kstartScreen = '/start';
  static const kSignUpScreen = '/signuo';
  static const kforgetPasswordScreen = '/forget';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: kdefultRoute,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: kloginRoute,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: koptScreen,
        builder: (context, state) => const OtpScreen(),
      ),
      GoRoute(
        path: kstartScreen,
        builder: (context, state) => const StartedScreen(),
      ),
      GoRoute(
        path: kSignUpScreen,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: kforgetPasswordScreen,
        builder: (context, state) => ForgetPassword(),
      ),
    ],
  );
}
