import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/custom_show_snack_bar.dart';
import 'package:fruits_hub/core/router/app_routes.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:fruits_hub/core/presentation/widgets/custom_button.dart';
import 'package:fruits_hub/core/presentation/widgets/custom_indictor.dart';
import 'package:fruits_hub/core/presentation/widgets/custom_text_from_field.dart';
import 'package:fruits_hub/core/presentation/widgets/password_field.dart';
import 'package:fruits_hub/features/auth/presention/cubits/login/login_cubit.dart';
import 'package:fruits_hub/features/auth/presention/views/widgets/forgot_password_button.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late String email, password;
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
    final textTheme = Theme.of(context).textTheme;

    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            onSaved: (value) => email = value!,
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            hintText: AppStrings.email,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.emailError;
              }
              return null;
            },
          ),
          PasswordField(
            passwordController: passwordController,
            onSavePassword: (value) => password = value!,
          ),
          ForgotPasswordButton(textTheme: textTheme),
          const SizedBox(height: 16),
          BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                 context.pushNamed(AppRoutes.home);
                customShowSnackBar(context, AppStrings.loginSuccess);
              } else if (state is LoginFailure) {
                customShowSnackBar(context, state.message);
              }
            },
            builder: (context, state) {
              if (state is LoginLoading) return const CustomIndicator();
              return CustomButton(
                text: AppStrings.login,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context
                        .read<LoginCubit>()
                        .loginWithEmailAndPassword(email, password);
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
