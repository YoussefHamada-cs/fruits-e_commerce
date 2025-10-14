import 'package:flutter/material.dart';
import 'package:fruits_hub/core/router/app_routes.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:fruits_hub/features/onBording/data/on_bording_service.dart';
import 'package:go_router/go_router.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    // الحصول على أبعاد الشاشة
    final Size screenSize = MediaQuery.of(context).size;
    final bool isSmallScreen = screenSize.height < 600;
    final bool isTablet = screenSize.width > 600;

    // ضبط الأحجام بناءً على حجم الشاشة
    final double horizontalPadding = isSmallScreen
        ? 10.0
        : isTablet
        ? 20.0
        : 15.0;
    final double verticalPadding = isSmallScreen
        ? 8.0
        : isTablet
        ? 12.0
        : 10.0;
    final double fontSize = isSmallScreen
        ? 14.0
        : isTablet
        ? 18.0
        : 16.0;

    final double spacingWidth = isSmallScreen
        ? 6.0
        : isTablet
        ? 10.0
        : 8.0;

    return ElevatedButton(
      onPressed: () async {
        // حفظ حالة مشاهدة الـ Onboarding
        await OnboardingService().completeOnboarding();
        // الانتقال للرئيسية
        context.pushReplacementNamed(AppRoutes.login);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.green,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(AppStrings.start, style: TextStyle(fontSize: fontSize)),
          SizedBox(width: spacingWidth),
        ],
      ),
    );
  }
}
