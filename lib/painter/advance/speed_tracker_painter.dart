import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_canvas/utils/utils.dart';

class SpeedTrackerPainter extends CustomPainter{
  final double speedValue;
  SpeedTrackerPainter(this.speedValue);
  @override
  void paint(Canvas canvas, Size size) {
    final centerPoint = Offset(size.width /2, size.height / 2);
    final radius = min(size.width, size.height) /2 * 0.95;
    final mainStrokeWidth = radius * 0.1;
    final labelStrokeWidth = mainStrokeWidth / 2;
    final rect = Rect.fromCircle(center: centerPoint, radius: radius);
    final numberOfSpeedLabel = 12;
    final eachDegree = 180 / numberOfSpeedLabel; // max speed is 120, value between each speed is 10, so we will draw 12 speed labels (180 /12 mean 12 speed labels in 180 degree)

    final paint = Paint()
    ..strokeWidth = mainStrokeWidth
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..color = Colors.black;
    
    canvas.drawArc(rect, Utils.degreeToRadian(180), Utils.degreeToRadian(180), false, paint);
    paint..color = Colors.green;
    canvas.drawArc(rect, Utils.degreeToRadian(180), Utils.degreeToRadian(speedValue*eachDegree), false, paint);
    paint..color = Colors.green
    ..strokeWidth = labelStrokeWidth;
    for (var i = 0; i <= numberOfSpeedLabel; i++) {
      final degree = (eachDegree * i) + 180; // we draw start from degree 180, so we need to add 180 degree.
      final radian = Utils.degreeToRadian(degree);
      final startPoint = Offset(cos(radian) * (radius * 0.9), sin(radian) * (radius * 0.9)) + centerPoint; 
      final endPoint = Offset(cos(radian) * (radius - mainStrokeWidth), sin(radian) * (radius - mainStrokeWidth)) + centerPoint; // we draw canvas from center so we need to add centerPoint Offset to current Offset
      canvas.drawLine(startPoint, endPoint, paint);
    }

    final degree = speedValue*eachDegree + 180;
    final radian = Utils.degreeToRadian(degree);
    final endPoint = Offset(cos(radian) * radius * 0.8, sin(radian) * radius * 0.8) + centerPoint;
    canvas.drawLine(centerPoint, endPoint, paint);

    paint..style = PaintingStyle.fill;
    canvas.drawCircle(centerPoint, radius * 0.1, paint);

    final paragraph = Utils.generateParagraph("${(speedValue * 10).round()}/120",style: ui.TextStyle(color: Colors.black, fontSize: radius * 0.4, fontWeight: FontWeight.bold));
    canvas.drawParagraph(paragraph, centerPoint + Offset(-paragraph.maxIntrinsicWidth/2, 10));
  }
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
  
}