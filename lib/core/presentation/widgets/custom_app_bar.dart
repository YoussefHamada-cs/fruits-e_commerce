import 'package:flutter/material.dart';

AppBar customAppBar(context, {required String title,required void Function()? onPressed}) {
  final textTheme = Theme.of(context).textTheme;
  return AppBar(
    actions: [
      IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.arrow_forward_ios),
      ),
    ],
    centerTitle: true,
    title: Text(title, style: textTheme.titleMedium),
    leading: const SizedBox(),
  );
}
