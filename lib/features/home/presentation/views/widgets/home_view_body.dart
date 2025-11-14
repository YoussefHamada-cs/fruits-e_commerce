import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_hub/core/presentation/widgets/products_grid_view_bloc_builder.dart';

import 'package:fruits_hub/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruits_hub/core/presentation/widgets/search_field.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/header_best_selling.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
   @override
  void initState() {
    context.read<ProductsCubit>().getBestSellingroducts();
    super.initState();
  }
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
          ProductsGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
