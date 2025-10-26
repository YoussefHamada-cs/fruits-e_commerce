import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:fruits_hub/core/widgets/custom_text_from_field.dart';
import 'package:fruits_hub/core/widgets/password_field.dart';

class SignupTextFields extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final FormFieldSetter<String> onSaveName;
  final FormFieldSetter<String> onSaveEmail;
  final FormFieldSetter<String> onSavePassword;

  const SignupTextFields({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.onSaveName,
    required this.onSaveEmail,
    required this.onSavePassword,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: nameController,
          hintText: AppStrings.fullName,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppStrings.fullNameError;
            }
            return null;
          },
          onSaved: onSaveName,
        ),
        CustomTextFormField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          hintText: AppStrings.email,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppStrings.emailError;
            }
            return null;
          },
          onSaved: onSaveEmail,
        ),
        PasswordField(passwordController: passwordController, onSavePassword: onSavePassword),
      ],
    );
  }
}
