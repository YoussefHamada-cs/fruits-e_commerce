import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/address_communiction.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/order_summry.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24),
        Text('ملخص الدفع:', style: textTheme.bodyMedium),
        SizedBox(height: 16),
        OrderSummry(),

        SizedBox(height: 16),
        AddressCommuniction(),
      ],
    );
  }
}
