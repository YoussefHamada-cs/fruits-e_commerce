import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/presentation/widgets/custom_text_from_field.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:fruits_hub/features/checkout/domain/entites/order_entity.dart';
import 'package:provider/provider.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({super.key, required this.formKey, required this.valueListenable});
final GlobalKey<FormState> formKey ;
final ValueListenable<AutovalidateMode> valueListenable;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AutovalidateMode>(
      valueListenable:valueListenable,
      builder: (context, value, child) {
        return Form(
          key: formKey,
          autovalidateMode: value,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddress.name = value!;
                  },
                  hintText: AppStrings.fullName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.fullNameError;
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddress.email = value!;
                  },
                  hintText: AppStrings.email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.emailError;
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddress.address = value!;
                  },
                  hintText: AppStrings.address,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.addressError;
                    }
                    return null;
                  },
                ),
        
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddress.city = value!;
                  },
                  hintText: AppStrings.city,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.cityError;
                    }
                    return null;
                  },
                ),
        
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddress.addressDetails = value!;
                  },
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
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddress.phone = value!;
                  },
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
    );
  }
}
