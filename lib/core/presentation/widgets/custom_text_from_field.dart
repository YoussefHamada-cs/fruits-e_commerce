import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
   this.controller,
    required this.hintText,
    required this.validator,
    this.onSaved,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.inputFormatters,
  });
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final String hintText;
  final String? Function(String?) validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          controller: controller,
          onSaved: onSaved,
          keyboardType: keyboardType,
          obscureText: obscureText,

          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: theme.textTheme.bodyLarge!.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            filled: true,
            fillColor: AppColors.backgroundTextField,
            border: buildBorder(),
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder(),
            errorBorder: errorBoder(),
            focusedErrorBorder: errorBoder(),
            suffixIcon: suffixIcon,
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          inputFormatters: inputFormatters,
        ),
      ),
    );
  }

  OutlineInputBorder errorBoder() {
    return OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: Colors.red),
          );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),

      borderSide: const BorderSide(
        width: 1,
        color: AppColors.borderTextFormField,
      ),
    );
  }
}
