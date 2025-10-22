import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_from_field.dart';
import 'package:fruits_hub/features/auth/presention/views/widgets/already_have_an_account.dart';
import 'package:fruits_hub/features/auth/presention/views/widgets/terms_and_conditions.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomTextFormField(
            controller: TextEditingController(),
            hintText: AppStrings.fullName,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.fullNameError;
              }
              return null;
            },
          ),
          CustomTextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: TextEditingController(),
            hintText: AppStrings.email,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.emailError;
              }
              return null;
            },
          ),
          CustomTextFormField(
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: const Icon(
              Icons.visibility_off,
              color: AppColors.textSecondary,
            ),
            obscureText: true,
            controller: TextEditingController(),
            hintText: AppStrings.password,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.passwordError;
              }
              return null;
            },
          ),
          TermsAndConditions(textTheme: textTheme),
          const SizedBox(height: 30),
          Center(
            child: CustomButton(
              text: AppStrings.createNewAccount,
              onPressed: () {},
            ),
          ),
          const SizedBox(height: 26),
          AlreadyHaveAnAccount(textTheme: textTheme),
        ],
      ),
    );
  }
}
