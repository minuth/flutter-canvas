import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_canvas/utils/utils.dart';

class CircleLinePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth =  5
    ..color = Utils.colorRandom();
    final centerPoint = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width,size.height) / 2 * 0.95;
    final n = 10;
    final eachDegree = 360 / n;

    canvas.drawCircle(centerPoint, radius, paint);
    paint.color = Utils.colorRandom();
    for (var i = 0; i < n; i++) {
      final degree = i*eachDegree;
      final radian = Utils.degreeToRadian(degree);
      final endPoint = Offset(cos(radian) * radius, sin(radian) * radius) + centerPoint;
      canvas.drawLine(centerPoint, endPoint, paint);
    }
    
  }
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
  
}