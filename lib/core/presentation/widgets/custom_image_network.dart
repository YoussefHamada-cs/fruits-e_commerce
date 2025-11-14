
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
          ? Image.network(
              imageUrl!,
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
