
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/router/app_routes.dart';
import 'package:fruits_hub/core/service/firebase_auth_service.dart';
import 'package:fruits_hub/features/onBording/data/on_bording_service.dart';
import 'package:fruits_hub/features/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
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
    _navigateAfterSplash();
  }

  Future<void> _navigateAfterSplash() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // تأكد من فتح الصندوق
      await Hive.openBox('appBox');

      // حمّل بيانات الخدمة
      final onboardingService = OnboardingService();
      await onboardingService.initialize();

      Future.delayed(splashDuration, () {
    var user = FirebaseAuthService().isLoggedIn();
        if (!mounted) return;
       if (user) {
          // المستخدم مسجل دخول → روح للصفحة الرئيسية
          context.pushReplacementNamed(AppRoutes.login);
        } else if (onboardingService.onboardingCompleted) {
          // المستخدم شاف الـ Onboarding قبل كده → روح للـ Login
          context.pushReplacementNamed(AppRoutes.login);
        } else {
          // أول مرة → روح لـ Onboarding
          context.pushReplacementNamed(AppRoutes.onboarding);
        }
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
