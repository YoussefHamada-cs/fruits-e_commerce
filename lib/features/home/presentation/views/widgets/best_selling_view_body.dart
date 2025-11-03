import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/best_selling_grid_view.dart';

class BestSellingViewBody extends StatelessWidget {
  const BestSellingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Text(AppStrings.bestSelling, style: textTheme.titleSmall),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          BestSellingGridView(),
        ],
      ),
    );
  }
}
