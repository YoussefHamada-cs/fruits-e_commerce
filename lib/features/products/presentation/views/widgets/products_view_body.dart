import 'package:flutter/material.dart';
import 'package:fruits_hub/core/presentation/widgets/search_field.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [SliverToBoxAdapter(child: SearchField())],
    );
  }
}
