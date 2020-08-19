import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_canvas/utils/utils.dart';

class SunRisePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final centerPoint = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2 * 0.6;
    final n = 8;
    final eachDegree = 360 / n;
    final paint = Paint()
    ..color = Colors.yellow[600];

    canvas.drawCircle(centerPoint, radius, paint);

    paint
    ..strokeWidth = 5
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke;
    for (var i = 0; i < n; i++) {
      final degree = i * eachDegree;
      final radian = Utils.degreeToRadian(degree);
      final startPoint = Offset(cos(radian) * radius * 1.1, sin(radian) * radius * 1.1) + centerPoint;
      final endPoint = Offset(cos(radian) * radius * 1.4, sin(radian) * radius * 1.4) + centerPoint;
      canvas.drawLine(startPoint, endPoint, paint);
    }
  }
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
  
}