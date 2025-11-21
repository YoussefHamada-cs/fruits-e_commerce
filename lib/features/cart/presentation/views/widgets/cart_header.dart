import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/features/cart/presentation/views/cubits/cart_cubit/cart_cubit.dart';
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
          'لديك${context.watch<CartCubit>().cartEntity.cartItems.length} منتجات في سله التسوق',
          style: textTheme.bodyMedium!.copyWith(color: AppColors.green),
        ),
      ),
    );
  }
}
