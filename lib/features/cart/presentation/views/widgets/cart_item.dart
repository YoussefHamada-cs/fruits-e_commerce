import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/features/cart/presentation/views/widgets/action_buttons_remove_and_add.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          children: [
            Container(
              width: 73,
              height: 92,
              color: AppColors.backgroundCard,
              child: Center(child: Image.asset(AppImages.watermelonTest)),
            ),
            const SizedBox(width: 17),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('بطيخ', style: textTheme.displayMedium),
                SizedBox(height: 10),
                Text(
                  '3كيلو',
                  style: textTheme.bodyMedium!.copyWith(
                    color: AppColors.colorUnitPrice,
                  ),
                ),
                SizedBox(height: 15),
                ActionButtonsRemoveAndAdd(),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(AppImages.trash),
                ),
                SizedBox(height: 40),
                Text(
                  '60 جنيه',
                  style: textTheme.titleMedium!.copyWith(
                    color: AppColors.colorPrice,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
