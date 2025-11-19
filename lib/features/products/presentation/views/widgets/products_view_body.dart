import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubits/products_cubit/products_cubit.dart';

import 'package:fruits_hub/core/presentation/widgets/products_grid_view_bloc_builder.dart';
import 'package:fruits_hub/core/presentation/widgets/search_field.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:fruits_hub/features/products/presentation/views/widgets/header_products_us.dart';
import 'package:fruits_hub/features/products/presentation/views/widgets/products_us_list_view_bloc_builder.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SearchField()),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverToBoxAdapter(
            child: HeaderProductsUs(title: AppStrings.products),
          ),
          ProductsUsListViewBlocBuilder(),
          SliverToBoxAdapter(child: SizedBox(height: 8)),
          SliverToBoxAdapter(
            child: HeaderProductsUs(
              title: '${context.read<ProductsCubit>().productsLength}نتاج',
            ),
          ),
          ProductsGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
