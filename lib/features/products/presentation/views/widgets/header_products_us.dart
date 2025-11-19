import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_images.dart';


class HeaderProductsUs extends StatelessWidget {
  const HeaderProductsUs({super.key, required this.title});
 final String title;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: textTheme.bodyLarge),
        
        SvgPicture.asset(AppImages.classification)  ,
        
      ],
    );
  }
}
