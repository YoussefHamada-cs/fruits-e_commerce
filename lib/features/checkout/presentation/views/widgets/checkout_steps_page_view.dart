import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/address_section.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/payment_section.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/shipping_section.dart';

class CheckoutStepsPageView extends StatelessWidget {
  final PageController controller;
final GlobalKey<FormState> formKey ;
final ValueListenable<AutovalidateMode> valueListenable;

  const CheckoutStepsPageView({super.key, required this.controller, required this.formKey, required this.valueListenable});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),

        children: [
          ShippingSection(),
          AddressSection(formKey: formKey, valueListenable: valueListenable,),
          const PaymentSection(),
        ],
      ),
    );
  }
}
