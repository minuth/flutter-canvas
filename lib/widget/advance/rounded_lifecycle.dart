import 'package:flutter/material.dart';
import 'package:flutter_canvas/painter/advance/rounded_lifecycle_painter.dart';

class RoundedLifeCycle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: CustomPaint(
        size: Size.infinite,
        painter: RoundedLifeCyclePainter(),
      ),
    );
  }
}