import 'package:flutter/material.dart';
import 'package:flutter_canvas/painter/basic/my_path_02_painter.dart';

class MyPath02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: CustomPaint(
        size: Size.infinite,
        painter: MyPath02Painter(),
      ),
    );
  }
}