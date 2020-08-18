import 'package:flutter/widgets.dart';
import 'package:flutter_canvas/painter/basic/arc_painter.dart';

class Arc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: CustomPaint(
        size: Size.infinite,
        painter: ArcPainter(),
      ),
    );
  }
}