import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps().length, (index) {
        return Expanded(child: StepItem(index: index+1, text: getSteps()[index], isActive: true,),);
      }),
    );
  }
}

List<String> getSteps() {
  
  
  return ['الشحن', 'العنوان', 'الدفع', 'المرجعه'];}
