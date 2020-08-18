import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_canvas/utils/utils.dart';

class CirclePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final finalSize = min(size.width, size.height);
    final paint = Paint()
    ..strokeWidth = 5
    ..style = PaintingStyle.stroke
    ..color = Utils.colorRandom();

    final centerPoint = Offset(size.width / 2, size.height/2);
    final radius = (finalSize / 2) * 0.95; // radius = 95% of total radius

    canvas.drawCircle(centerPoint, radius, paint);
}
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
  
}