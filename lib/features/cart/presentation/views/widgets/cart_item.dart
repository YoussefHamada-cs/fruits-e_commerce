import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/presentation/widgets/custom_image_network.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/features/cart/domain/entites/car_item_entity.dart';
import 'package:fruits_hub/features/cart/presentation/views/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/features/cart/presentation/views/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:fruits_hub/features/cart/presentation/views/widgets/action_buttons_remove_and_add.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (prev, current) {
        if (current is CartItemUpdated) {
          if (current.cartItemEntity == cartItemEntity) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Container(
                  width: 73,
                  height: 92,
                  color: AppColors.backgroundCard,
                  child: Center(
                    child: CustomImageNetwork(
                      imageUrl: cartItemEntity.productEntity.imageUrl,
                    ),
                  ),
                ),
                const SizedBox(width: 17),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartItemEntity.productEntity.name,
                      style: textTheme.displayMedium,
                    ),
                    SizedBox(height: 10),
                    Text(
                      '${cartItemEntity.calculateTotalWeight()}كيلو',
                      style: textTheme.bodyMedium!.copyWith(
                        color: AppColors.colorUnitPrice,
                      ),
                    ),
                    SizedBox(height: 15),
                    ActionButtonsRemoveAndAdd(cartItemEntity: cartItemEntity),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<CartCubit>().deleteCarItem(cartItemEntity);
                      },
                      child: SvgPicture.asset(AppImages.trash),
                    ),
                    SizedBox(height: 40),
                    Text(
                      '${cartItemEntity.calculateTotalPrice()} جنيه',
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
      },
    );
  }
}
