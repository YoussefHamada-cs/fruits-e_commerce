import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/presentation/widgets/main_views/bottom_nav_model.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

class BottomNavItem extends StatelessWidget {
  final BottomNavModel item;
  final bool isSelected;
  final bool isMiddle;

  const BottomNavItem({
    super.key,
    required this.item,
    required this.isSelected,
    required this.isMiddle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.backgroundSecondary,
      ),
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: 15,
            backgroundColor: AppColors.green,
            child: SvgPicture.asset(item.iconPathActive, width: 16, height: 16),
          ),

          SizedBox(width: 4),
          Text(
            item.label,
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.green),
          ),
          SizedBox(width: 4),
        ],
      ),
    );
  }
}
