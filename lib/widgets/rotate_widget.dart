import 'dart:math' as math;

import 'package:flutter/material.dart';

class RotateWidget extends StatefulWidget {
  final Widget card;

  const RotateWidget({Key? key, required this.card}) : super(key: key);

  @override
  State<RotateWidget> createState() => _RotateWidgetState();
}

class _RotateWidgetState extends State<RotateWidget> {
  // double angle = Provider.of<RotateCardProvider>(context, listen: false).angle;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(math.pi * angle),
            alignment: Alignment.center,
            child: Align(
              alignment: Alignment.center,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..rotateY(math.pi),
                child: widget.card,
              ),
            ),
          )
        ],
      ),
    );
  }

}
