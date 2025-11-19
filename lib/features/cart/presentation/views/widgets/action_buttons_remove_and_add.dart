import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

class ActionButtonsRemoveAndAdd extends StatelessWidget {
  const ActionButtonsRemoveAndAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        CircleAvatar(
          radius: 14,

          backgroundColor: AppColors.green,
          child: Icon(Icons.add, color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('3', style: textTheme.titleMedium),
        ),
        CircleAvatar(
          backgroundColor: AppColors.backgroundCard,
          radius: 14,
          child: Icon(Icons.remove, color: Colors.grey),
        ),
      ],
    );
  }
}
