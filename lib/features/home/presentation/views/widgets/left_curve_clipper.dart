import 'package:flutter/material.dart';

class LeftCurveClipper extends CustomClipper<Path> {
  final double curveDepth; // مقدار الانحناء

  LeftCurveClipper({ required this.curveDepth });

  @override
  Path getClip(Size size) {
    Path path = Path();

    // نبدأ من أعلى اليسار
    path.moveTo(curveDepth, 0);

    // نرسم القوس للخارج
    path.quadraticBezierTo(
      -curveDepth, // مدى بروز الانحناء (التحكم فيه هنا)
      size.height / 2,
      curveDepth,
      size.height,
    );

    // نكمل باقي المستطيل
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
