
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/custom_contaner_payment.dart';

class AddressCommuniction extends StatelessWidget {
  const AddressCommuniction({
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
              Text('عنوان التوصيل:', style: textTheme.bodyMedium),
              Spacer(),
              Icon(
                Icons.edit_location_outlined,
                color: AppColors.textSecondary,
              ),
              Text(
                'تعديل',
                style: textTheme.bodyMedium!.copyWith(
                  color: AppColors.colorTextinactivestepitem,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: AppColors.textSecondary,
              ),
              Text(
                'شارع النيل مبني رقم 80',
                style: textTheme.bodyMedium!.copyWith(
                  color: AppColors.colorTextinactivestepitem,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
