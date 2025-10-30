import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        child: Image.asset(
          'assets/images/profile_photo.png',
          height: 44,
          width: 44,
        ),
      ),
      title: Text(
        'صباح الخير!..',
        style: textTheme.bodyLarge!.copyWith(color: AppColors.textSecondary),
      ),
      subtitle: Text('احمد مصطفي', style: textTheme.displayMedium),
      trailing: SvgPicture.asset(
        'assets/images/notif.svg',
        width: 34,
        height: 34,
      ),
    );
  }
}
