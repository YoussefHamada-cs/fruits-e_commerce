import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: Text(
            AppStrings.createAccount,
            style: textTheme.bodyLarge!.copyWith(color: AppColors.green),
          ),
        ),
        Text(
          AppStrings.haveAnAccount,
          style: textTheme.bodyLarge!.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
