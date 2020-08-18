import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_canvas/utils/utils.dart';

class MyPath01Painter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 5
    ..color = Utils.colorRandom();
    final centerPoint = Offset(size.width /2 , size.height /2 );
    final radius = (min(size.width, size.height) / 2) * 0.95; // radius = 95% of total radius
    final path = Path();
    final numberCorner = 8;
    final eachDegree = 360 / numberCorner;
    for (var i = 0; i < numberCorner; i++) {
      final degree = (i * eachDegree);
      final radian = Utils.degreeToRadian(degree);
      final drawPoint = Offset(cos(radian) * radius, sin(radian) * radius) + centerPoint;

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