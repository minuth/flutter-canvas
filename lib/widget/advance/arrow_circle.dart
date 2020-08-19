import 'package:flutter/material.dart';
import 'package:flutter_canvas/painter/advance/arrow_circle_painter.dart';

class ArrowCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: CustomPaint(
        size: Size.infinite,
        painter: ArrowCirclePainter(),
      ),
    );
  }
}