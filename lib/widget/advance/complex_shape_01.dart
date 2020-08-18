import 'package:flutter/widgets.dart';
import 'package:flutter_canvas/painter/advance/complex_shape_01_painter.dart';

class ComplexShape01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: CustomPaint(
        size: Size.infinite,
        painter: ComplexShape01Painter(),
      ),
    );
  }
}