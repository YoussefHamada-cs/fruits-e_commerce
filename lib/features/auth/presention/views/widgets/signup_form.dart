import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/auth/presention/cubits/create_user/create_user_cubit.dart';
import 'package:fruits_hub/features/auth/presention/views/widgets/already_have_an_account.dart';
import 'package:fruits_hub/features/auth/presention/views/widgets/signup_text_fields.dart';
import 'package:fruits_hub/features/auth/presention/views/widgets/signup_button_section.dart';
import 'package:fruits_hub/features/auth/presention/views/widgets/terms_and_conditions.dart';

class SignupForm extends StatefulWidget {
  final bool isLoading;
  const SignupForm({super.key, required this.isLoading});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  late String name, email, password;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      context
          .read<CreateUserCubit>()
          .createUserWithEmailAndPassword(email, password, name);
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            SignupTextFields(
              nameController: nameController,
              emailController: emailController,
              passwordController: passwordController,
              onSaveName: (v) => name = v!,
              onSaveEmail: (v) => email = v!,
              onSavePassword: (v) => password = v!,
            ),
            TermsAndConditions(textTheme: textTheme),
            const SizedBox(height: 30),
            SignupButtonSection(
              isLoading: widget.isLoading,
              onPressed: () => _submit(context),
            ),
            const SizedBox(height: 26),
            AlreadyHaveAnAccount(textTheme: textTheme),
          ],
        ),
      ),
    );
  }
}
