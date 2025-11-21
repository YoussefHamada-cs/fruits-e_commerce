import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/shipping_item.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  bool isSelected = false;
  bool isSelected2 = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 27),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ShippingItem(
            title: 'الدفع عند الاستلام',
            subTitle: 'التسليم من المكان',
            price: 40,
            isSelected: isSelected,
            onTap: () {
              isSelected2 = false;
              isSelected = true;
              setState(() {});
            },
          ),
        ),
        ShippingItem(
          title: 'طريقه الدفع',
          subTitle: 'يرجي تحديد طريقه الدفع',
          price: 40,
          isSelected: isSelected2,
          onTap: () {
            isSelected = false;
            isSelected2 = true;
            setState(() {});
          },
        ),
      ],
    );
  }
}
