import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key, required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        children: [
          Expanded(
            child: Divider(color: AppColors.textSecondary, thickness: 1),
          ),
          const SizedBox(width: 18.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'أو',
              style: textTheme.bodyLarge!.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          const SizedBox(width: 18.0),
          Expanded(
            child: Divider(color: AppColors.textSecondary, thickness: 1),
          ),
        ],
      ),
    );
  }
}
