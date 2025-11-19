import 'package:flutter/material.dart';
import 'package:fruits_hub/core/presentation/main_views/custom_bottom_nav_bar.dart';
import 'package:go_router/go_router.dart';

class MainViews extends StatelessWidget {
  final StatefulNavigationShell shell;

  const MainViews({super.key, required this.shell});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: shell,  // <-- كل صفحة محفوظة هنا
        bottomNavigationBar: CustomBottomNavBar(shell: shell),
      ),
    );
  }
}
