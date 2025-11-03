import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_images.dart';

class NotifictionIcon extends StatelessWidget {
  const NotifictionIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AppImages.notifIcon, width: 34, height: 34);
  }
}
