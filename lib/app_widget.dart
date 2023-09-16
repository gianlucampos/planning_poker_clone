import 'package:flutter/material.dart';
import 'package:planning_poker_clone/home_page.dart';
import 'package:planning_poker_clone/models/layout_constrains.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(
        widget: const HomePage(),
      ),
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  final Widget widget;
  final LayoutConstraints mobile = LayoutConstraints.mobile();

  ResponsiveLayout({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (_isMobile(constraints)) {
          return Transform.scale(scale: .7, child: widget);
        }
        return widget;
      },
    );
  }

  bool _isMobile(BoxConstraints constraints) {
    return constraints.maxWidth <= mobile.width ||
        constraints.maxHeight <= mobile.height;
  }
}
