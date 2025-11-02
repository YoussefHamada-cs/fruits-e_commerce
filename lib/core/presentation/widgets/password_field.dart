import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:fruits_hub/core/presentation/widgets/custom_text_from_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.passwordController,
    required this.onSavePassword,
  });

  final TextEditingController passwordController;
  final FormFieldSetter<String> onSavePassword;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      suffixIcon: IconButton(
        icon: Icon(
          obscureText ? Icons.visibility_off : Icons.visibility,
          color: AppColors.textSecondary,
        ),
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
      ),
      controller: widget.passwordController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      hintText: AppStrings.password,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppStrings.passwordError;
        }
        return null;
      },
      onSaved: widget.onSavePassword,
    );
  }
}
