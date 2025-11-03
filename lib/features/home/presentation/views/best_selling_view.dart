import 'package:flutter/material.dart';

import 'package:fruits_hub/core/presentation/widgets/build_app_bar.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';

import 'package:fruits_hub/features/home/presentation/views/widgets/best_selling_view_body.dart';


class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: AppStrings.bestSelling),
      body: BestSellingViewBody(),
    );
  }

 

}
