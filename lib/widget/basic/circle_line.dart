import 'package:flutter/widgets.dart';
import 'package:flutter_canvas/painter/basic/circle_line_painter.dart';

class CircleLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: CustomPaint(
        size: Size.infinite,
        painter: CircleLinePainter(),
      ),
    );
  }
}