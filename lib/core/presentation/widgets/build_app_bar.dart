import 'package:flutter/material.dart';
import 'package:fruits_hub/core/presentation/widgets/notifiction_icon.dart';
import 'package:go_router/go_router.dart';

AppBar buildAppBar(BuildContext context, {required String title}) {
  final textTheme = Theme.of(context).textTheme;
  return AppBar(
    centerTitle: true,
    title: Text(title, style: textTheme.titleMedium),
    leading: IconButton(
      onPressed: () {
        context.pop();
      },
      icon: Icon(Icons.arrow_back_ios_new_rounded),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: NotifictionIcon(),
      ),
      SizedBox(width: 16),
    ],
  );
}

