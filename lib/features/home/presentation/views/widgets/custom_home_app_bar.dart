
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/hive_service.dart';
import 'package:fruits_hub/core/presentation/widgets/notifiction_icon.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';


class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
  
    
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        child: Image.asset(AppImages.profilePhoto, height: 44, width: 44),
      ),
      title: Text(
        'صباح الخير!..',
        style: textTheme.bodyLarge!.copyWith(color: AppColors.textSecondary),
      ),

      subtitle: Text(HiveService().getUser()?.name ?? '', style: textTheme.displayMedium),
      trailing: NotifictionIcon(),
    );
  }
}
