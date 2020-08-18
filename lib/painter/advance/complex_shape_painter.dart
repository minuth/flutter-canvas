import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_canvas/utils/utils.dart';

class ComplexShapePainter extends CustomPainter{

  final _paint = Paint()
  ..strokeWidth = 2;

  final _startDegree = 270.0;
  final _degreePerPoint = 360 / 10; // we draw 10 points around circle (360 degree)

  @override
  void paint(Canvas canvas, Size size) {
    final radius = (min(size.width, size.height) / 2) * 0.95;
    final radius1 = radius * 0.35;
    final startDegree1 = _startDegree - _degreePerPoint;

    final centerPoint = Offset(size.width / 2, size.height / 2);  
    final path = Path();
    final path1= Path();
    final path2 = Path();
    final path3 = Path();
    final path4 = Path();

    for (var i = 0; i < 10; i++) {
      final degree = (i * _degreePerPoint) + _startDegree;
      final radian = Utils.degreeToRadian(degree);
      final endPoint = Offset(cos(radian)* radius, sin(radian) * radius) + centerPoint;
      final endPoint2 = Offset(cos(radian)* radius1, sin(radian) * radius1) + centerPoint;

      final degree1 = (i * _degreePerPoint) + startDegree1;
      final radian1 = Utils.degreeToRadian(degree1);
      final endPoint1 = Offset(cos(radian1)* radius, sin(radian1) * radius) + centerPoint;

      canvas.drawCircle(endPoint, 3, _paint);
      canvas.drawLine(centerPoint, endPoint, _paint);
      if(i % 2 != 0){
        canvas.drawCircle(endPoint2, 3, Paint()..color = Colors.black45);
      }
      else{ 
        canvas.drawCircle(endPoint2, 4, _paint);
      }
      
      if(i == 0){
        path.moveTo(endPoint.dx, endPoint.dy);
        path1.moveTo(endPoint.dx, endPoint.dy);
        path2.moveTo(endPoint1.dx, endPoint1.dy);
        path3.moveTo(endPoint2.dx, endPoint2.dy);
        path4..moveTo(endPoint2.dx, endPoint2.dy);
      }
      else{
        path.lineTo(endPoint.dx, endPoint.dy);
        path3.lineTo(endPoint2.dx, endPoint2.dy);
        if(i % 2 == 0){
          path1.lineTo(endPoint.dx, endPoint.dy);
          path2.lineTo(endPoint1.dx, endPoint1.dy);
          path4.lineTo(endPoint2.dx, endPoint2.dy);
        }
        else{
          path4.lineTo(endPoint.dx, endPoint.dy);
        }

        
      }
      
    }
    path.close();
    path1.close();
    path2.close();
    path3.close();
    path4.close();
    canvas.drawCircle(centerPoint, 4, _paint);
    canvas.drawPath(path, _paint..style = PaintingStyle.stroke);
    canvas.drawPath(path1, _paint..style = PaintingStyle.stroke..color = Colors.black45);
    canvas.drawPath(path2, _paint);
    canvas.drawPath(path3, _paint);
    canvas.drawPath(path4, _paint);
  }
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
  
}