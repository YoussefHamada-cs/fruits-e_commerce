import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';

class HeaderBestSelling extends StatelessWidget {
  const HeaderBestSelling({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(AppStrings.bestSelling, style: textTheme.bodyLarge),
        TextButton(
          onPressed: () {},
          child: Text(
            AppStrings.more,
            style: textTheme.bodyMedium!.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
