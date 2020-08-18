import 'package:flutter/widgets.dart';
import 'package:flutter_canvas/painter/advance/complex_shape_painter.dart';

class ComplexShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: CustomPaint(
        size: Size.infinite,
        painter: ComplexShapePainter(),
      ),
    );
  }
}