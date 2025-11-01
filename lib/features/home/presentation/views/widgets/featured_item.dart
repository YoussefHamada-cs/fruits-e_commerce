import 'package:flutter/material.dart';

import 'package:fruits_hub/features/home/presentation/views/widgets/featured_item_button.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/left_curve_clipper.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width - 32;
    return SizedBox(
      width: itemWidth,
      height: 158,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Image.asset(
              'assets/images/fruits.png',
              fit: BoxFit.fill,
              width: itemWidth * 0.7,
            ),
          ),
          ClipPath(
            clipper: LeftCurveClipper(curveDepth: 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green[500],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.5,

              child: Column(
                children: [
                  const SizedBox(height: 25),
                  Text(
                    'عرض العيد',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),

                  Text(
                    'خصم 20%',
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium!.copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  FeaturedItemButton(onPressed: () {}),
                  const SizedBox(height: 29),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
