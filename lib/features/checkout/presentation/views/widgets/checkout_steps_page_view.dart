import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/address_section.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/payment_section.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/shipping_section.dart';

class CheckoutStepsPageView extends StatelessWidget {
  final PageController controller;

  const CheckoutStepsPageView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),

        children: [
          ShippingSection(),
          const AddressSection(),
          const PaymentSection(),
        ],
      ),
    );
  }
}
