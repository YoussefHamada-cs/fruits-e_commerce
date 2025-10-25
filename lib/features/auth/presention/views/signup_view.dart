import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/service/get_it_sevice.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/auth/presention/cubits/create_user/create_user_cubit.dart';
import 'package:fruits_hub/features/auth/presention/views/widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: AppStrings.signUp, context),
      body: BlocProvider(
        create: (context) => CreateUserCubit(
        getIt<AuthRepo>() 
        ),
        child: SignupViewBody(),
      )
    
    );
  }
}