import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/presentation/widgets/custom_image_network.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/features/cart/presentation/views/cubits/cart_cubit/cart_cubit.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final ProductEntity product;
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
          Positioned(
            top: 24,
            left: 0,
            right: 0,
            child: CustomImageNetwork(imageUrl: product.imageUrl),
          ),
          Positioned(
            right: 4,
            bottom: 36,
            child: Text(
              product.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            right: 4,
            bottom: 4,
            child: Row(
              children: [
                Text(
                  '${product.price} جنيه',
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
              ],
            ),
          ),
          Positioned(
            left: 4,
            bottom: 4,
            child: GestureDetector(
              onTap: () {
                context.read<CartCubit>().addProductItem(product);
              },
              child: SvgPicture.asset(
                AppImages.plusIcon,
                height: 30,
                width: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
