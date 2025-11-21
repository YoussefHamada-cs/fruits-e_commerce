import 'package:flutter/material.dart';
import 'package:fruits_hub/core/presentation/widgets/custom_button.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_steps_page_view.dart';

class CheckoutViewBody extends StatefulWidget {
  final ValueChanged<int>? onStepChanged;

  const CheckoutViewBody({super.key, this.onStepChanged});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            CheckoutSteps(),
            CheckoutStepsPageView(
              controller: pageController,
              onStepChanged: widget.onStepChanged,
            ),
            CustomButton(
              text: 'التالي',
              onPressed: () {
                pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              },
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
