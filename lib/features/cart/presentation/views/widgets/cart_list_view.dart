import 'package:flutter/material.dart';
import 'package:fruits_hub/features/cart/domain/entites/car_item_entity.dart';
import 'package:fruits_hub/features/cart/presentation/views/widgets/cart_item.dart';
import 'package:fruits_hub/features/cart/presentation/views/widgets/custom_divider.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key, required this.cartList});
  final List<CartItemEntity> cartList;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) =>
          CartItem(cartItemEntity: cartList[index]),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: false,
      separatorBuilder: (context, index) => CustomDivider(),
      itemCount: cartList.length,
    );
  }
}
