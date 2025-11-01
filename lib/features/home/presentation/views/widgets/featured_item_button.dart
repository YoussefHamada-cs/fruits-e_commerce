import 'package:flutter/material.dart';

class FeaturedItemButton extends StatelessWidget {
  const FeaturedItemButton({super.key, this.onPressed});
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: 116,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,

          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        child: Text('تسوق الآن', style: textTheme.bodyMedium),
      ),
    );
  }
}
