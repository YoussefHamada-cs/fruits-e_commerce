import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_item.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 158,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: FeaturedItem(),
          );
        },
      ),
    );
  }
}
