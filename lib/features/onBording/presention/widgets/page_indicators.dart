import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

class PageIndicators extends StatelessWidget {
  final int currentPage;
  final int pageCount;

  const PageIndicators({
    super.key,
    required this.currentPage,
    required this.pageCount,
  });
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: pageCount,
      
      decorator: DotsDecorator(
        activeColor: AppColors.green,
        color: currentPage == 1
            ? AppColors.green
            : AppColors.green.withOpacity(0.5),
      ),
    );
  }
}
