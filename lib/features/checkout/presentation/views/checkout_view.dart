import 'package:flutter/material.dart';
import 'package:fruits_hub/core/presentation/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:go_router/go_router.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

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
      body: CheckoutViewBody(
        onStepChanged: (index) {
          setState(() {
            currentStep = index;
          });
        },
      ),
    );
  }
}
