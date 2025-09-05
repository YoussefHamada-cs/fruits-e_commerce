import 'package:flutter/material.dart';
import 'package:fruits_hub/core/router/app_routes.dart';
import 'package:fruits_hub/features/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:go_router/go_router.dart';
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  static const splashDuration = Duration(seconds: 3);

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(splashDuration, () {
        if (!mounted) return;
        context.pushReplacementNamed(AppRoutes.onboarding);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}
