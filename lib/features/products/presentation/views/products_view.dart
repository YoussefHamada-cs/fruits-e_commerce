import 'package:flutter/material.dart';
import 'package:fruits_hub/core/presentation/widgets/notifiction_icon.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:fruits_hub/features/products/presentation/views/widgets/products_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppStrings.products, style: textTheme.titleMedium),
        leading: SizedBox.shrink(),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: NotifictionIcon(),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: ProductsViewBody(),
    );
  }
}
