import 'package:flutter/material.dart';
import 'package:fruits_hub/core/router/app_router.dart';
import 'package:fruits_hub/core/theme/app_theme.dart';
import 'package:fruits_hub/features/onBording/data/on_bording_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
  // تهيئة Hive
  await Hive.initFlutter();
  await Hive.openBox('appBox');

  // تهيئة خدمة الشاشة التعريفية
  await OnboardingService().initialize();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FruitsHub());
}

class FruitsHub extends StatelessWidget {
  const FruitsHub({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: AppTheme.theme,
     
    );
  }
}
