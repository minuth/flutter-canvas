import 'package:flutter/widgets.dart';
import 'package:flutter_canvas/painter/basic/my_path_01_painter.dart';

class MyPath01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: CustomPaint(
        size: Size.infinite,
        painter: MyPath01Painter(),
      ),
    );
  }
}