import 'package:flutter/material.dart';
import 'package:fruits_hub/core/router/app_routes.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:go_router/go_router.dart';

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
          onPressed: () {
            context.pushNamed(AppRoutes.bestSelling);
          },
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
