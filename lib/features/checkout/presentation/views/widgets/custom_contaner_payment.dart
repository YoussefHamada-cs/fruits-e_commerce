import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

class CustomContanerPayment extends StatelessWidget {
  const CustomContanerPayment({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.colorContainerPayment,
        borderRadius: BorderRadius.circular(4),
      ),
      child: child,
    );
  }
}
