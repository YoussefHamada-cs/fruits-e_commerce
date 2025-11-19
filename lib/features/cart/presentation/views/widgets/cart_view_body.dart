import 'package:flutter/material.dart';
import 'package:fruits_hub/core/presentation/widgets/custom_button.dart';
import 'package:fruits_hub/features/cart/presentation/views/widgets/cart_header.dart';
import 'package:fruits_hub/features/cart/presentation/views/widgets/cart_list_view.dart';
import 'package:fruits_hub/features/cart/presentation/views/widgets/custom_divider.dart';
import 'package:fruits_hub/core/presentation/widgets/custom_app_bar.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:go_router/go_router.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: customAppBar(
                      title: AppStrings.cart,
                      context,
                      onPressed: () {
                        context.pop();
                      },
                    ),
                  ),
                  CartHeader(),
                  SizedBox(height: 16),
                ],
              ),
            ),
            SliverToBoxAdapter(child: const CustomDivider()),
            SliverFillRemaining(child: CartListView()),
            SliverToBoxAdapter(child: const CustomDivider()),
          ],
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: MediaQuery.sizeOf(context).height * .07,
          child: CustomButton(text: ' الدفع  120 جنيه', onPressed: () {}),
        ),
      ],
    );
  }
}
