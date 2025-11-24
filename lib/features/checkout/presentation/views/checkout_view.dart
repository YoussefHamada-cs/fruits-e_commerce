import 'package:flutter/material.dart';
import 'package:fruits_hub/core/presentation/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/cart/domain/entites/cart_entity.dart';
import 'package:fruits_hub/features/checkout/domain/entites/order_entity.dart';
import 'package:fruits_hub/features/checkout/domain/entites/shipping_address_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.cartEntity});
  final CartEntity cartEntity;
  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        title: getSteps()[currentStep],
        onPressed: () {
          context.pop();
        },
      ),
      body: Provider.value(
        value: OrderEntity(
          cartEntity: widget.cartEntity,
          shippingAddress: ShippingAddressEntity(),
        ),
        child: CheckoutViewBody(
          onStepChanged: (index) {
            setState(() {
              currentStep = index;
            });
          },
        ),
      ),
    );
  }
}
