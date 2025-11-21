import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({super.key, required this.text, required this.index});
  final String text;
  final int index;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 11.5,
          backgroundColor: AppColors.colorinactivestepitem,
          child: Text(index.toString(), style: textTheme.bodyMedium),
        ),
        SizedBox(width: 4),
        Text(
          text,
          style: textTheme.bodyMedium!.copyWith(
            color: AppColors.colorTextinactivestepitem,
          ),
        ),
      ],
    );
  }
}
