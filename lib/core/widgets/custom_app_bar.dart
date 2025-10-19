 import 'package:flutter/material.dart';

AppBar customAppBar(context, {required String title}) {
  final textTheme = Theme.of(context).textTheme;
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_forward_ios),
        ),
      ],
      centerTitle: true,
      title: Text(title, style: textTheme.titleMedium),
    );
  }