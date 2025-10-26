import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';

class SignupButtonSection extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;

  const SignupButtonSection({
    super.key,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomButton(
        text: isLoading ? 'Creating...' : AppStrings.createNewAccount,
        onPressed: isLoading ? null : onPressed,
      ),
    );
  }
}
