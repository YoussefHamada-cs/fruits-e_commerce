import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/custom_show_snack_bar.dart';
import 'package:fruits_hub/features/checkout/presentation/cubits/order_cubit/orders_cubit.dart';
import 'package:fruits_hub/core/presentation/widgets/custom_progress_hud.dart';
class OrderCubitBlocConsumer extends StatelessWidget {
  const OrderCubitBlocConsumer({super.key, required this.child});
final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit, OrdersState>(
      listener: (context, state) {
        if (state is OrdersSuccess) {
          customShowSnackBar(context, 'تمت الطلب بنجاح');
        }
        if (state is OrdersFailure) {
          customShowSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is OrdersLoading,
          child: child,
        );
      },
    );
  }
}