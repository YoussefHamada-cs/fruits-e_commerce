import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_hub/core/helper/get_dummy_product.dart';
import 'package:fruits_hub/core/presentation/widgets/custom_error_widget.dart';
import 'package:fruits_hub/features/products/presentation/views/widgets/products_us_list_view.dart';
import 'package:skeletonizer/skeletonizer.dart';
class ProductsUsListViewBlocBuilder extends StatelessWidget {
  const ProductsUsListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return SliverToBoxAdapter(child: ProductsUsListView(products: state.products));
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(child: CustomErrorWidget( text:state.errMessage ,));
        } else {
             return Skeletonizer.sliver(
            enabled: true,
            child:SliverToBoxAdapter(child: ProductsUsListView(products:getDummyProducts() )),
          );
        }
      },
    );
  }
}
