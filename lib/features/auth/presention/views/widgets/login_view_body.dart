import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_from_field.dart';
import 'package:fruits_hub/features/auth/presention/views/widgets/custom_social_login_button.dart';
import 'package:fruits_hub/features/auth/presention/views/widgets/dont_have_an_account.dart';
import 'package:fruits_hub/features/auth/presention/views/widgets/or_divider.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: TextEditingController(),
            hintText: AppStrings.email,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.emailError;
              }
              return null;
            },
          ),
          CustomTextFormField(
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: const Icon(
              Icons.visibility_off,
              color: AppColors.textSecondary,
            ),
            obscureText: true,
            controller: TextEditingController(),
            hintText: AppStrings.password,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.passwordError;
              }
              return null;
            },
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              AppStrings.forgotPassword,
              style: textTheme.bodyLarge!.copyWith(color: AppColors.green),
            ),
          ),
          Center(
            child: CustomButton(text: AppStrings.login, onPressed: () {}),
          ),
          const SizedBox(height: 16),
          DontHaveAnAccount(textTheme: textTheme),
          const SizedBox(height: 8),
          OrDivider(textTheme: textTheme),
          const SizedBox(height: 16),

          CustomSocialLoginButton(
            onPressed: () {},
            text: AppStrings.googleLogin,
            imagePath: AppImages.googleIcon,
          ),
          SizedBox(height: 12),
          CustomSocialLoginButton(
            onPressed: () {},
            text: AppStrings.appleLogin,
            imagePath: AppImages.appleIcon,
          ),
          SizedBox(height: 12),
          CustomSocialLoginButton(
            onPressed: () {},
            text: AppStrings.facebookLogin,
            imagePath: AppImages.facebookIcon,
          ),
        ],
      ),
    );
  }
}
