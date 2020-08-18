import 'package:flutter/widgets.dart';
import 'package:flutter_canvas/painter/basic/triangle_painter.dart';

class Triangle extends StatefulWidget {
  @override
  _TriangleState createState() => _TriangleState();
}

class _TriangleState extends State<Triangle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: CustomPaint(
        size: Size.infinite,
        painter: TrianglePainter(),
      ),
    );
  }
}