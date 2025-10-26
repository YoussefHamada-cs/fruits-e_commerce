import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';

class ForgotPasswordButton extends StatelessWidget {
  final TextTheme textTheme;

  const ForgotPasswordButton({super.key, required this.textTheme});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // هنا تقدر تضيف الانتقال لصفحة نسيان كلمة المرور
      },
      child: Text(
        AppStrings.forgotPassword,
        style: textTheme.bodyLarge!.copyWith(
          color: AppColors.lightGreen,
        ),
      ),
    );
  }
}
