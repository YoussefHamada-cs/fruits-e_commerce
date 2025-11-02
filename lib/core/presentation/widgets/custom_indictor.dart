
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: 25,
          width: 25,
          child: const CircularProgressIndicator(
            color: AppColors.green,
          ),
        ),
    );
  }
}
