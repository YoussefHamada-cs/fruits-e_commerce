import 'package:flutter/material.dart';
import 'package:fruits_hub/core/presentation/widgets/main_views/custom_bottom_nav_bar.dart';


class MainViews extends StatefulWidget {
  const MainViews({super.key, required this.child});

  final Widget child;

  @override
  State<MainViews> createState() => _MainPageState();
}

class _MainPageState extends State<MainViews> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(child: widget.child),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: const CustomBottomNavBar(),
            ),
          ],
        ),
      ),);
  }
}
