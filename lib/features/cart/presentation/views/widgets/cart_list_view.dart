import 'package:flutter/material.dart';
import 'package:fruits_hub/features/cart/presentation/views/widgets/cart_item.dart';
import 'package:fruits_hub/features/cart/presentation/views/widgets/custom_divider.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => CartItem(),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: false,
      separatorBuilder: (context, index) => CustomDivider(),
      itemCount: 10,
    );
  }
}
