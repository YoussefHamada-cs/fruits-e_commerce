import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/custom_show_snack_bar.dart';
import 'package:fruits_hub/core/presentation/widgets/custom_button.dart';
import 'package:fruits_hub/features/checkout/domain/entites/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/cubits/order_cubit/orders_cubit.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_steps_page_view.dart';
import 'package:provider/provider.dart';

class CheckoutViewBody extends StatefulWidget {
  final ValueChanged<int>? onStepChanged;

  const CheckoutViewBody({super.key, this.onStepChanged});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<AutovalidateMode> valueListenable = ValueNotifier(
    AutovalidateMode.disabled,
  );
  late PageController pageController;
  int currentStep = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentStep = pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  String _getButtonText() {
    return currentStep == 2 ? 'الدفع عبر PayPal' : 'التالي';
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            CheckoutSteps(
              currentStepIndex: currentStep,
              pageController: pageController,
            ),
            const SizedBox(height: 24),

            CheckoutStepsPageView(
              controller: pageController,
              formKey: formKey,
              valueListenable: valueListenable,
            ),

            const SizedBox(height: 32),

            CustomButton(
              text: _getButtonText(),
              onPressed: () {
                if (currentStep == 0) {
                  _handleShippingSectionValidation(context);
                } else if (currentStep == 1) {
                  _handleAddressSectionValidation();
                } else {
                  var orderEntity = context.read<OrderEntity>();
                  context.read<OrdersCubit>().createOrder(orderEntity);
                }
              },
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  void _handleShippingSectionValidation(BuildContext context) {
    if (context.read<OrderEntity>().isPaymentCash != null) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      customShowSnackBar(context, 'الرجاء اختيار طريقة الدفع');
    }
  }

  void _handleAddressSectionValidation() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      setState(() {
        valueListenable.value = AutovalidateMode.always;
      });
    }
  }
}
