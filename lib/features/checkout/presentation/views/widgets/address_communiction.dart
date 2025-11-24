import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/features/checkout/domain/entites/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/custom_contaner_payment.dart';
import 'package:provider/provider.dart';

class AddressCommuniction extends StatelessWidget {
  const AddressCommuniction({super.key, required this.pageController});
  final PageController pageController;
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
              GestureDetector(
                onTap: () {
                  pageController.animateToPage(
                    1,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text(
                  'تعديل',
                  style: textTheme.bodyMedium!.copyWith(
                    color: AppColors.colorTextinactivestepitem,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.location_on_outlined, color: AppColors.textSecondary),
              Text(
                '${context.read<OrderEntity>().shippingAddress}',
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
