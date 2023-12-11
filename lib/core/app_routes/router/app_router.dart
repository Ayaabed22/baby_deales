import 'package:babi_dealz_app/features/auth/view/pages/maps_page.dart';
import 'package:babi_dealz_app/features/auth/view/pages/otp_page.dart';
import 'package:babi_dealz_app/features/auth/view/pages/register_page.dart';
import 'package:go_router/go_router.dart';
import '../../../../features/onboarding_screen/view/pages/onboarding_view_page.dart';
import '../../../features/auth/view/pages/login_page.dart';
import '../../../features/splash/view/pages/splash_page_view.dart';
import '../routes/app_routes.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const SplashViewPage(),
      ),
      GoRoute(
        path: AppRoutes.onBoardingViewPageRoute,
        builder: (context, state) => const OnBoardingViewPage(),
      ),
      GoRoute(
        path: AppRoutes.loginViewRoute,
        builder: (context, state) => const LoginViewPage(),
      ),
      GoRoute(
        path: AppRoutes.registerRoute,
        builder: (context, state) => const RegisterPageView(),
      ),
      GoRoute(
        path: AppRoutes.otpViewRoute,
        builder: (context, state) => const OtpViewPage(),
      ),
      GoRoute(
        path: AppRoutes.mapsRoute,
        builder: (context, state) => MapsScreen(),
      ),
    ],
  );
}
