import 'package:flutter/material.dart';
import 'package:flutter_canvas/painter/advance/sun_rise_painter.dart';

class SunRise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: CustomPaint(
        size: Size.infinite,
        painter: SunRisePainter(),
      ),
    );
  }
}