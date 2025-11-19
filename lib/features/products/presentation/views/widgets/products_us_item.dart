import 'package:flutter/material.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/presentation/widgets/custom_image_network.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';


class ProductsUsItem extends StatelessWidget {
  const ProductsUsItem({super.key, required this.product});
 final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.backgroundCard,
          radius: 32,
          child: CustomImageNetwork( imageUrl: product.imageUrl,),
        ),
        Text(product.name),
      ],
    );
  }
}
