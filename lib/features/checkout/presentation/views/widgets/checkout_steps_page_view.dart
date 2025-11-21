import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/shipping_section.dart';


class CheckoutStepsPageView extends StatelessWidget {
  final PageController controller;
  final ValueChanged<int>? onStepChanged;

  const CheckoutStepsPageView({
    super.key,
    required this.controller,
    this.onStepChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: controller,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) => onStepChanged?.call(index),
        itemCount: getPages().length,
        itemBuilder: (context, index) => getPages()[index],
      ),
    );
  }

  List<Widget> getPages() {
    return [
      ShippingSection(),
      Center(child: Text("العنوان", style: TextStyle(fontSize: 20))),
      Center(child: Text("الدفع", style: TextStyle(fontSize: 20))),
      Center(child: Text("المراجعة", style: TextStyle(fontSize: 20))),
    ];
  }
}
