import 'package:flutter/material.dart';
import 'package:fruits_hub/core/presentation/main_views/main_views.dart';
import 'package:fruits_hub/core/router/app_routes.dart';
import 'package:fruits_hub/core/router/app_transitions.dart';
import 'package:fruits_hub/features/auth/presention/views/login_view.dart';
import 'package:fruits_hub/features/auth/presention/views/signup_view.dart';
import 'package:fruits_hub/features/cart/presentation/views/cart_view.dart';
import 'package:fruits_hub/features/home/presentation/views/best_selling_view.dart';
import 'package:fruits_hub/features/home/presentation/views/home_view.dart';
import 'package:fruits_hub/features/onBording/presention/views/onbording_view.dart';
import 'package:fruits_hub/features/products/presentation/views/products_view.dart';
import 'package:fruits_hub/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,

    routes: [
      // ----------------------- Public routes (no bottom nav) -----------------------
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
        pageBuilder: (context, state) => AppTransitions.size(
          context: context,
          state: state,
          child: OnBoardingView(),
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
      GoRoute(
        path: AppRoutes.signUp,
        name: AppRoutes.signUp,
        pageBuilder: (context, state) => AppTransitions.size(
          context: context,
          state: state,
          child: const SignupView(),
        ),
      ),
// ----------------------- Authenticated routes (with bottom nav) -----------------------
StatefulShellRoute.indexedStack(
  builder: (context, state, navigationShell) =>
      MainViews(shell: navigationShell),

  branches: [

    // ---------------- HOME ----------------
    StatefulShellBranch(
      routes: [
        GoRoute(
          path: AppRoutes.home,
          name: AppRoutes.home,
          pageBuilder: (context, state) => AppTransitions.size(
            context: context,
            state: state,
            child: HomeView(),
          ),
          routes: [
            GoRoute(
              path: AppRoutes.bestSelling,
              name: AppRoutes.bestSelling,
              pageBuilder: (context, state) => AppTransitions.size(
                context: context,
                state: state,
                child: const BestSellingView(),
              ),
            ),
          ],
        ),
      ],
    ),

   
  

    // ---------------- PRODUCTS ----------------
    StatefulShellBranch(
      routes: [
        GoRoute(
          path: AppRoutes.products,
          name: AppRoutes.products,
          pageBuilder: (context, state) => AppTransitions.size(
            context: context,
            state: state,
            child: const ProductsView(),
          ),
        ),
      ],
    ),
     // ---------------- CART ----------------
      StatefulShellBranch(
      routes: [
        GoRoute(
          path: AppRoutes.cart,
          name: AppRoutes.cart,
          pageBuilder: (context, state) => AppTransitions.size(
            context: context,
            state: state,
            child:CartView(),
          ),
        ),
      ],
    ),

    // ---------------- PROFILE ----------------
    StatefulShellBranch(
      routes: [
        GoRoute(
          path: AppRoutes.profile,
          name: AppRoutes.profile,
          pageBuilder: (context, state) => AppTransitions.size(
            context: context,
            state: state,
            child: const Scaffold(
              body: Center(child: Text('Profile View')),
            ),
          ),
        ),
      ],
    ),
  ],
),

    ],
  );
}
