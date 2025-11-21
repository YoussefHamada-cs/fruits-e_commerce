import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/custom_show_snack_bar.dart';
import 'package:fruits_hub/features/cart/presentation/views/cubits/cart_cubit/cart_cubit.dart';

class CartCubitWrapper extends StatelessWidget {
  final Widget child;

  const CartCubitWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartCubit(),
      child: BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          if (state is CartAdded) {
            customShowSnackBar(context, 'تمت العمليه بنجاح');
          }
          if (state is CartRemoved) {
            customShowSnackBar(context, 'تمت حذف العنصر بنجاح');
          }
        },
        child: child,
      ),
    );
  }
}
