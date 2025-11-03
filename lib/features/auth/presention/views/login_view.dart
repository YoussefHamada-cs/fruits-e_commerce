import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/router/app_routes.dart';
import 'package:fruits_hub/core/service/get_it_sevice.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:fruits_hub/core/presentation/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/auth/presention/cubits/login/login_cubit.dart';
import 'package:fruits_hub/features/auth/presention/views/widgets/login_view_body.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: AppStrings.login,
        context,
        onPressed: () {
          context.pushNamed(AppRoutes.signUp);
        },
      ),
      body: BlocProvider(
        create: (context) => LoginCubit(authRepo: getIt<AuthRepo>()),
        child: const LoginViewBody(),
      ),
    );
  }
}
