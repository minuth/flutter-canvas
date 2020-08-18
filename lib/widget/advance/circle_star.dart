import 'package:flutter/material.dart';
import 'package:flutter_canvas/painter/advance/circle_star_painter.dart';

class CircleStar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
        child: CustomPaint(
          size: Size.infinite,
          painter: CircleStartPainter(),
        ),
      ),
    );
  }
}
