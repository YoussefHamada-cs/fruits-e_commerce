import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/cart/presentation/views/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/features/cart/presentation/views/widgets/cart_header.dart';
import 'package:fruits_hub/features/cart/presentation/views/widgets/cart_list_view.dart';
import 'package:fruits_hub/features/cart/presentation/views/widgets/custom_cart_button.dart';
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
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                  ? const SizedBox()
                  : const CustomDivider(),
            ),
            SliverFillRemaining(child: CartListView(cartList:context.watch<CartCubit>().cartEntity.cartItems )),
          
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                  ? const SizedBox()
                  : const CustomDivider(),
            ),
          ],
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: MediaQuery.sizeOf(context).height * .07,
          // context.watch<CartCubit>().cartEntity.calculateTotalPrice() لما تضيف watch ازم تخلي ال widget لي واحده عشان watch بتعمل rebuild للصف كله او لي widget الي هي فيه كله 
          child: CustomCartButton(),
        ),
      ],
    );
  }
}
