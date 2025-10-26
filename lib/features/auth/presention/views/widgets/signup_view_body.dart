import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/custom_show_snack_bar.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:fruits_hub/features/auth/presention/cubits/create_user/create_user_cubit.dart';
import 'package:fruits_hub/features/auth/presention/views/widgets/signup_form.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateUserCubit, CreateUserState>(
      listener: (context, state) {
        if (state is CreateUserSuccess) {
          Navigator.of(context).pop();
          customShowSnackBar(context, AppStrings.accountCreatedSuccessfully);
        } else if (state is CreateUserFailure) {
          customShowSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return SignupForm(isLoading: state is CreateUserLoading);
      },
    );
  }

}
