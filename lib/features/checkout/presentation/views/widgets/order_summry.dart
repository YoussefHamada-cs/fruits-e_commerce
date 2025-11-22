
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/custom_contaner_payment.dart';

class OrderSummry extends StatelessWidget {
  const OrderSummry({
    super.key,
    
  });


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;  
    return CustomContanerPayment(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'المجموع الفرعي:',
                style: textTheme.bodyMedium!.copyWith(
                  color: AppColors.colorTextinactivestepitem,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              Text(
                '150 جنيه',
                style: textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                'التوصيل:',
                style: textTheme.bodyMedium!.copyWith(
                  color: AppColors.colorTextinactivestepitem,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              Text(
                '50 جنيه',
                style: textTheme.bodyMedium!.copyWith(
                  color: AppColors.colorTextinactivestepitem,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 9),
          Divider(thickness: 1),
          SizedBox(height: 9),
          Row(
            children: [
              Text('الكلي:', style: textTheme.titleSmall),
              const Spacer(),
              Text('200 جنيه', style: textTheme.titleSmall),
            ],
          ),
        ],
      ),
    );
  }
}
