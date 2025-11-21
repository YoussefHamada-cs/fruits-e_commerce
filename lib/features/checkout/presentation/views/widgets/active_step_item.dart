import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 11.5,
          backgroundColor: AppColors.green,
          child: Icon(Icons.check, size: 18, color: Colors.white),
        ),
        SizedBox(width: 4),
        Text(
          text,
          style: textTheme.bodyMedium!.copyWith(color: AppColors.green),
        ),
      ],
    );
  }
}
