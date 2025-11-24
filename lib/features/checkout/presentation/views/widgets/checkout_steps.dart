import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/domain/entites/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/step_item.dart';
import 'package:provider/provider.dart';
import 'package:fruits_hub/core/helper/custom_show_snack_bar.dart';
class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({
    super.key,
    required this.currentStepIndex,
    required this.pageController,
  });

  final int currentStepIndex;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps().length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              if (context.read<OrderEntity>().isPaymentCash != null) {
  pageController.animateToPage(
    index,
    duration: const Duration(milliseconds: 300),
    curve: Curves.easeInOut,
  );
}else{
  customShowSnackBar(context, 'الرجاء اختيار طريقة الدفع');
}
            },
            child: StepItem(
              index: index,
              text: getSteps()[index],
              isActive: index <= currentStepIndex,
            ),
          ),
        );
      }),
    );
  }
}

List<String> getSteps() {
  return ['الشحن', 'العنوان', 'الدفع'];
}
