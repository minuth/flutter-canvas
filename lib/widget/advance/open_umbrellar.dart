import 'package:flutter/widgets.dart';
import 'package:flutter_canvas/painter/advance/open_umbrellar_painter.dart';

class OpenUmbrellar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: CustomPaint(
        size: Size.infinite,
        painter: OpenUmbrellarPainter(),
      ),
    );
  }
}