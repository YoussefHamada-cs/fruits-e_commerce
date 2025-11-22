import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/step_item.dart';
class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key, required this.currentStepIndex});

  final int currentStepIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps().length, (index) {
        return Expanded(
          child: StepItem(
            index: index,
            text: getSteps()[index],
            isActive: index <= currentStepIndex,
          ),
        );
      }),
    );
  }
}

List<String> getSteps() {
  return ['الشحن', 'العنوان', 'الدفع'];
}
