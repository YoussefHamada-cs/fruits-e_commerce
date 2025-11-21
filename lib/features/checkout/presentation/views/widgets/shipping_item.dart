import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/active_shippingItem_dot.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/in_active_shippingItem_dot.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.isSelected,
    required this.onTap,
  });

  final String title, subTitle;
  final int price;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: 81,
        decoration: BoxDecoration(
          color: Color(0x33D9D9D9),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: isSelected ? AppColors.green : Color(0x33D9D9D9),
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16,
            left: 13,
            right: 28,
            bottom: 16,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isSelected ? ActiveShippingItemDot() : InActiveShippingItemDot(),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: textTheme.bodyMedium),
                  SizedBox(height: 6),
                  Text(
                    subTitle,
                    style: textTheme.bodyMedium!.copyWith(
                      color: AppColors.colorTextinactivestepitem,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Center(
                child: Text(
                  '$priceجنيه',
                  style: textTheme.bodyMedium!.copyWith(
                    color: AppColors.lightGreen,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
