import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/best_selling_grid_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruits_hub/core/presentation/widgets/search_field.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/header_best_selling.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 16),
                CustomHomeAppBar(),
                SizedBox(height: 16),
                SearchField(),
                SizedBox(height: 12),
                FeaturedListView(),
                SizedBox(height: 12),
                HeaderBestSelling(),
                SizedBox(height: 12),

                SizedBox(height: 16),
              ],
            ),
          ),
          BestSellingGridView(),
        ],
      ),
    );
  }
}
