import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_canvas/utils/utils.dart';

class TrianglePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 5
    ..color = Utils.colorRandom();
    final centerPoint = Offset(size.width / 2, size.height / 2);
    final radius = min(centerPoint.dx, centerPoint.dy) * 0.95;
    final n = 3;
    final eachDegree = 360 / 3;
    final path = Path();
    for (var i = 0; i < n; i++) {
      final degree = (i*eachDegree) + 270; // start from 270 degree
      final radian = Utils.degreeToRadian(degree);
      final drawPoint = Offset(cos(radian) * radius, sin(radian) * radius) + centerPoint; // cos: X coordinate, sin: Y coordinate
      if(i == 0){
        path.moveTo(drawPoint.dx, drawPoint.dy);
      }
      else{
        path.lineTo(drawPoint.dx, drawPoint.dy);
      }
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
  
}