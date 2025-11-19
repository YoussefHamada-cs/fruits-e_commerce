

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/presentation/main_views/active_bottom_nav_item.dart';
import 'package:fruits_hub/core/presentation/main_views/bottom_nav_model.dart';
import 'package:fruits_hub/core/presentation/main_views/inactive_bottom_nav_item.dart';
import 'package:go_router/go_router.dart';
class CustomBottomNavBar extends StatelessWidget {
  final StatefulNavigationShell shell;

  const CustomBottomNavBar({super.key, required this.shell});

  @override
  Widget build(BuildContext context) {
    final currentIndex = shell.currentIndex;
    final navItems = BottomNavList.items;

    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(navItems.length, (i) {
          final item = navItems[i];
          final isSelected = currentIndex == i;

          return isSelected
              ? GestureDetector(
                  onTap: () => shell.goBranch(i),
                  child: BottomNavItem(item: item, isSelected: true, isMiddle: false),
                )
              : InactiveBottomNavItem(
                  item: item,
                  index: i,
                  shell: shell,
                );
        }),
      ),
    );
  }
}
