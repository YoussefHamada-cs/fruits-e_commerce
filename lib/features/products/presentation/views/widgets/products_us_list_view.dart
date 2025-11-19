import 'package:flutter/material.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/features/products/presentation/views/widgets/products_us_item.dart';

class ProductsUsListView extends StatelessWidget {
  const ProductsUsListView({super.key, required this.products});
final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 83,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: ProductsUsItem(product:products[index] ,),
          );
        },
      ),
    );
  }
}
