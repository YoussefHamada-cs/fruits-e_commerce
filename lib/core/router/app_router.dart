
import 'package:fruits_hub/core/router/app_routes.dart';
import 'package:fruits_hub/core/router/app_transitions.dart';
import 'package:fruits_hub/features/auth/presention/views/login_view.dart';
import 'package:fruits_hub/features/auth/presention/views/signup_view.dart';
import 'package:fruits_hub/features/home/presentation/views/home_view.dart';
import 'package:fruits_hub/features/onBording/presention/views/onbording_view.dart';
import 'package:fruits_hub/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';


class AppRouter {
  static final GoRouter router = GoRouter(
    // ignore: unrelated_type_equality_checks
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        name: AppRoutes.splash,
        pageBuilder: (context, state) => AppTransitions.size(
          context: context,
          state: state,
          child: const SplashView(),
       
        ),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        name: AppRoutes.onboarding,
        pageBuilder: (context, state) => AppTransitions.slideFromLeft(
          context: context,
          state: state,
          child: const OnBoardingView(),
        ),
       ),
      GoRoute(
        path: AppRoutes.login,
        name: AppRoutes.login,
        pageBuilder: (context, state) => AppTransitions.size(
          context: context,
          state: state,
          child: const LoginView(),
        ),
      ),
      // size
      GoRoute(
        path: AppRoutes.signUp,
        name: AppRoutes.signUp,
        pageBuilder: (context, state) => AppTransitions.size(
          context: context,
          state: state,
          child: const SignupView(),
        ),
      ),

      // GoRoute(
      //   path: AppRoutes.forgotPassword,
      //   name: AppRoutes.forgotPassword,
      //   pageBuilder: (context, state) => AppTransitions.size(
      //     context: context,
      //     state: state,
      //     child: BlocProvider(
      //       create: (context) => sl<ForgotPasswordCubit>(),
      //       child: const ForgotPasswordView(),
      //     ),
      //   ),
      // ),
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        pageBuilder: (context, state) => AppTransitions.slideFromRight(
          context: context,
          state: state,
          child: HomeView(),
        ),
      ),
      // GoRoute(
      //   path: AppRoutes.settings,
      //   name: AppRoutes.settings,
      //   pageBuilder: (context, state) => AppTransitions.slideFromRight(
      //     context: context,
      //     state: state,
      //     child: SettingsView(),
      //   ),
      // ),
    ],
  );
}
