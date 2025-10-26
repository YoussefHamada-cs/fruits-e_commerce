import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:fruits_hub/features/auth/presention/views/widgets/custom_social_login_button.dart';

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CustomSocialLoginButton(
          onPressed: _onGooglePressed,
          text: AppStrings.googleLogin,
          imagePath: AppImages.googleIcon,
        ),
        SizedBox(height: 12),
        CustomSocialLoginButton(
          onPressed: _onApplePressed,
          text: AppStrings.appleLogin,
          imagePath: AppImages.appleIcon,
        ),
        SizedBox(height: 12),
        CustomSocialLoginButton(
          onPressed: _onFacebookPressed,
          text: AppStrings.facebookLogin,
          imagePath: AppImages.facebookIcon,
        ),
      ],
    );
  }

  static void _onGooglePressed() {
    // تنفيذ تسجيل الدخول بـ Google
  }

  static void _onApplePressed() {
    // تنفيذ تسجيل الدخول بـ Apple
  }

  static void _onFacebookPressed() {
    // تنفيذ تسجيل الدخول بـ Facebook
  }
}
