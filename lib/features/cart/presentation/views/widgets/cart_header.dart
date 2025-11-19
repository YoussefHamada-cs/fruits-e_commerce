import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
class CartHeader extends StatelessWidget {
  const CartHeader({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: 40,
      width: double.infinity,
      color: Color(0xFFEBF9F1),
      child: Center(
        child: Text(
          'لديك 4 منتجات في سله التسوق',
          style: textTheme.bodyMedium!.copyWith(color: AppColors.green),
        ),
      ),
    );
  }
}
