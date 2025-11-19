import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/presentation/main_views/bottom_nav_model.dart';
import 'package:go_router/go_router.dart';

class InactiveBottomNavItem extends StatelessWidget {
  final BottomNavModel item;
  final int index;
  final StatefulNavigationShell shell;

  const InactiveBottomNavItem({
    super.key,
    required this.item,
    required this.index,
    required this.shell,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => shell.goBranch(index), 
      child: Container(
        color:  Colors.transparent,
        width: 60,
        child: SvgPicture.asset(item.iconPathInactive, width: 16, height: 16),
      ),
    );
  }
}
