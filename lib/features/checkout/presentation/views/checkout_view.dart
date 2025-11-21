import 'package:flutter/material.dart';
import 'package:fruits_hub/core/presentation/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'الشحن', onPressed: () {}),
      body: CheckoutViewBody(),
    );
  }
}
