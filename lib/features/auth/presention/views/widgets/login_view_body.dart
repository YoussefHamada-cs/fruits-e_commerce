import 'package:flutter/material.dart';
import 'package:fruits_hub/features/auth/presention/views/widgets/login_form.dart';
import 'package:fruits_hub/features/auth/presention/views/widgets/social_login_section.dart';
import 'package:fruits_hub/features/auth/presention/views/widgets/dont_have_an_account.dart';
import 'package:fruits_hub/features/auth/presention/views/widgets/or_divider.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LoginForm(),
          const SizedBox(height: 16),
          DontHaveAnAccount(textTheme: textTheme),
          const SizedBox(height: 8),
          OrDivider(textTheme: textTheme),
          const SizedBox(height: 16),
          const SocialLoginSection(),
        ],
      ),
    );
  }
}
