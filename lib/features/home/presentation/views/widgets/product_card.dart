import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      color: AppColors.backgroundCard,

      child: Stack(
        children: [
          Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              child: Icon(Icons.favorite_border),
              onTap: () {},
            ),
          ),
          Positioned(top: 24, child: Image.asset(AppImages.watermelonTest)),
          Positioned(
            right: 4,
            bottom: 36,
            child: Text('بطيخ', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Positioned(
            right: 4,
            bottom: 4,
            child: Row(
              children: [
                Text(
                  '200 جنيه',
                  style: textTheme.bodyMedium!.copyWith(
                    color: AppColors.colorPrice,
                  ),
                ),
                Text(
                  ' / الكيلو',
                  style: textTheme.bodyMedium!.copyWith(
                    color: AppColors.colorUnitPrice,
                  ),
                ),
                SizedBox(width: 8),
                SvgPicture.asset(AppImages.plusIcon, height: 30, width: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
