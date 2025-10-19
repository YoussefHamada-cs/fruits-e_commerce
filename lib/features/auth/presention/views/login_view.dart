import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/auth/presention/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title:AppStrings.login,context),
      body: const LoginViewBody(),
    );
  }

 
}
