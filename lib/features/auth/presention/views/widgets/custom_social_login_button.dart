import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSocialLoginButton extends StatelessWidget {
  const CustomSocialLoginButton({
    super.key,
    required this.text,
    required this.imagePath,
    required this.onPressed,
  });
  final String text;
  final String imagePath;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xFFDCDEDE), width: 1),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Row(
            children: [
              const Spacer(),
              Text(text, style: Theme.of(context).textTheme.bodyLarge),
              const Spacer(),
              SvgPicture.asset(imagePath),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }
}
