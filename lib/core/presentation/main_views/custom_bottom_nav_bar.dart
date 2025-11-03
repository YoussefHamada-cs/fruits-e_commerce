// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/presentation/main_views/active_bottom_nav_item.dart';
import 'package:fruits_hub/core/presentation/main_views/bottom_nav_model.dart';
import 'package:fruits_hub/core/presentation/main_views/inactive_bottom_nav_item.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouterState.of(context).uri.path;
    final navItems = BottomNavList.items;
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: AppColors.backPrimary,
        boxShadow: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: navItems.map((item) {
          final isSelected = currentPath.startsWith(item.route);
          final isMiddle = navItems.indexOf(item) == navItems.length ~/ 2;

          return isSelected
              ? BottomNavItem(
                  item: item,
                  isSelected: isSelected,
                  isMiddle: isMiddle,
                )
              : InactiveBottomNavItem(item: item);
        }).toList(),
      ),
    );
  }
}
