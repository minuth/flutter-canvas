import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_canvas/utils/utils.dart';

class OpenUmbrellarPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final centerPoint = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2 * 0.95;
    final n = 8;
    final eachDegree = 360 / n;
    final paint = Paint()..style = PaintingStyle.fill;
    final path = Path();
    for (var i = 0; i < n; i++) {
      final startDegree = eachDegree * i;
      final startRadian = Utils.degreeToRadian(startDegree);
      final startPoint = Offset(cos(startRadian) * radius, sin(startRadian) * radius) + centerPoint;

      final middleDegree = startDegree + (eachDegree / 2);
      final middleRadian = Utils.degreeToRadian(middleDegree);
      final middlePoint = Offset(cos(middleRadian) * (radius* 0.85), sin(middleRadian) * (radius*0.85)) + centerPoint;

      final endDegree = eachDegree * (i+1);
      final endRadian = Utils.degreeToRadian(endDegree);
      final endPoint = Offset(cos(endRadian) * radius, sin(endRadian) * radius) + centerPoint;
      path.moveTo(centerPoint.dx, centerPoint.dy);
      path.lineTo(startPoint.dx, startPoint.dy);
      path.quadraticBezierTo(middlePoint.dx, middlePoint.dy, endPoint.dx, endPoint.dy);
    } 
    path.close();   
    for (var pathMetric in path.computeMetrics()) {
      paint.color = Utils.colorRandom();
      canvas.drawPath(pathMetric.extractPath(0, pathMetric.length), paint);
    }
  }
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
  
}