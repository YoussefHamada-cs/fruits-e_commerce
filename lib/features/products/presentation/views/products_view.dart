import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_hub/core/presentation/widgets/notifiction_icon.dart';
import 'package:fruits_hub/core/repos/product_repo.dart';
import 'package:fruits_hub/core/service/get_it_sevice.dart';
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
      body: BlocProvider(
        create: (context) => ProductsCubit(getIt<ProductRepo>()),
        child: ProductsViewBody(),
      ),
    );
  }
}
