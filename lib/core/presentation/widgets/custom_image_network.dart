
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CustomImageNetwork extends StatelessWidget {
  const CustomImageNetwork({
    super.key,
    required this.imageUrl ,
  });

  final String? imageUrl ;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: imageUrl != null && imageUrl!.isNotEmpty
          ? CachedNetworkImage(
           imageUrl:imageUrl!,
              height: 100,
            )
          :  Container(
                color: Colors.grey,
                height: 100,
                width: 100,
              ),
    );
  }
}
