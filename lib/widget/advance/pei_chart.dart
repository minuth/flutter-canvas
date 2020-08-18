import 'package:flutter/material.dart';
import 'package:flutter_canvas/painter/advance/pei_chart_painter.dart';

class PeiChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
        child: CustomPaint(
          size: Size.infinite,
          painter: PeiChartPainter(),
        ),
      ),
    );
  }
}
