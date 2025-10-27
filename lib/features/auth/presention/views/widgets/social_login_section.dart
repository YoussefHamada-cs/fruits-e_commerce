import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:fruits_hub/features/auth/presention/cubits/login/login_cubit.dart';
import 'package:fruits_hub/features/auth/presention/views/widgets/custom_social_login_button.dart';

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        CustomSocialLoginButton(
          onPressed: () {
                context.read<LoginCubit>().loginWithGoogle();
          },
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

 

  static void _onApplePressed() {
    // تنفيذ تسجيل الدخول بـ Apple
  }

  static void _onFacebookPressed() {
    // تنفيذ تسجيل الدخول بـ Facebook
  }
}
