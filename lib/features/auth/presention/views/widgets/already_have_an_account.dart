import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:go_router/go_router.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key, required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Text(
            AppStrings.login,
            style: textTheme.bodyLarge!.copyWith(color: AppColors.green),
          ),
        ),
        Text(
          AppStrings.alreadyHaveAccount,
          style: textTheme.bodyLarge!.copyWith(color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
