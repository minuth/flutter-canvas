import 'package:flutter/material.dart';
import 'package:flutter_canvas/painter/advance/google_icon_painter.dart';

class GoogleIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: CustomPaint(
        size: Size.infinite,
        painter: GoogleIconPainter(),
      ),
    );
  }
}
