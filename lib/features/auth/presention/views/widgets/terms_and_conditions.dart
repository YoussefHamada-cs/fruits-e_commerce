import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key, required this.textTheme});

  final TextTheme textTheme;

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Transform.scale(
            scale: 1.2,
            child: Checkbox(
              value: isChecked,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                });
              },
              activeColor: AppColors.green,
              checkColor: Colors.white,
            ),
          ),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: AppStrings.termsAndConditions,
                    style: widget.textTheme.bodyMedium!.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  TextSpan(
                    text: AppStrings.termsAndConditionsLink,
                    style: widget.textTheme.bodyMedium!.copyWith(
                      color: AppColors.green,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                      
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
