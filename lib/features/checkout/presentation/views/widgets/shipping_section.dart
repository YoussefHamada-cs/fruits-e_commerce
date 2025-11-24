// features/checkout/presentation/views/widgets/shipping_section.dart

import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/domain/entites/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/shipping_item.dart';
import 'package:provider/provider.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection>
    with AutomaticKeepAliveClientMixin {
  int? selectedIndex;

  void _select(int index, bool isPaymentCash) {
    setState(() {
      if (selectedIndex == index) {
        // لو ضغط على نفس العنصر → نفك الاختيار
        selectedIndex = null;
        context.read<OrderEntity>().isPaymentCash = null;
      } else {
        // اختيار جديد
        selectedIndex = index;
        context.read<OrderEntity>().isPaymentCash = isPaymentCash;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final totalPrice = context
        .read<OrderEntity>()
        .cartEntity
        .calculateTotalPrice()
        .toInt();

    return Column(
      children: [
        const SizedBox(height: 27),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ShippingItem(
            title: 'الدفع عند الاستلام',
            subTitle: 'التسليم من المكان',
            price: totalPrice + 40,
            isSelected: selectedIndex == 0,
            onTap: () => _select(0, true),
          ),
        ),
        ShippingItem(
          title: 'طريقة الدفع الإلكتروني',
          subTitle: 'توصيل سريع وآمن',
          price: totalPrice,
          isSelected: selectedIndex == 1,
          onTap: () => _select(1, false),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
