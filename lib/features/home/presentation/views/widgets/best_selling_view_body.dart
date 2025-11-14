import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:fruits_hub/core/presentation/widgets/products_grid_view_bloc_builder.dart';

class BestSellingViewBody extends StatefulWidget {
  const BestSellingViewBody({super.key});

  @override
  State<BestSellingViewBody> createState() => _BestSellingViewBodyState();
}

class _BestSellingViewBodyState extends State<BestSellingViewBody> {
   @override
  void initState() {
    context.read<ProductsCubit>().getBestSellingroducts();
    super.initState();
  }
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
          ProductsGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
