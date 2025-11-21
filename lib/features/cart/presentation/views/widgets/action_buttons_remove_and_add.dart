import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/features/cart/domain/entites/car_item_entity.dart';
import 'package:fruits_hub/features/cart/presentation/views/cubits/cart_item_cubit/cart_item_cubit.dart';

class ActionButtonsRemoveAndAdd extends StatelessWidget {
  const ActionButtonsRemoveAndAdd({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            cartItemEntity.increasQuantity();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
          child: CircleAvatar(
            radius: 14,

            backgroundColor: AppColors.green,
            child: Icon(Icons.add, color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            cartItemEntity.quanitty.toString(),
            style: textTheme.titleMedium,
          ),
        ),
        GestureDetector(
          onTap: () {
            cartItemEntity.decreasQuantity();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
          child: CircleAvatar(
            backgroundColor: AppColors.backgroundCard,
            radius: 14,
            child: Icon(Icons.remove, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
