import 'package:flutter/widgets.dart';
import 'package:flutter_canvas/painter/basic/oval_painter.dart';

class Oval extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: CustomPaint(
        size: Size.infinite,
        painter: OvalPainter(),
      ),
    );
  }
}