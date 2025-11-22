import 'package:flutter/material.dart';
import 'package:fruits_hub/core/presentation/widgets/custom_text_from_field.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';

class AddressSection extends StatefulWidget {
  const AddressSection({super.key});

  @override
  State<AddressSection> createState() => _AddressSectionState();
}

class _AddressSectionState extends State<AddressSection> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextFormField(
              hintText: AppStrings.fullName,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.fullNameError;
                }
                return null;
              },
            ),
            CustomTextFormField(
              hintText: AppStrings.email,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.emailError;
                }
                return null;
              },
            ),
            CustomTextFormField(
              hintText: AppStrings.address,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.addressError;
                }
                return null;
              },
            ),

            CustomTextFormField(
              hintText: AppStrings.city,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.cityError;
                }
                return null;
              },
            ),

            CustomTextFormField(
              hintText: AppStrings.buildingNumber,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.buildingNumberError;
                }
                return null;
              },

              keyboardType: TextInputType.number,
            ),
            CustomTextFormField(
              hintText: AppStrings.phoneNumber,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.phoneNumberError;
                }
                return null;
              },
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}
