import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_canvas/utils/utils.dart';

class SegmentedRingPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final centerPoint = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2 * 0.95;
    final strokeWidth = radius * 0.5;
    final paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = strokeWidth;
    final rect = Rect.fromCircle(center: centerPoint, radius: radius - (strokeWidth/2));
    final eachDegree = 360 / 3;
    for(var i = 0; i< 3; i++){
      paint..color = Utils.colorRandom();
      canvas.drawArc(rect, Utils.degreeToRadian((eachDegree * i) + 270), Utils.degreeToRadian(eachDegree - 2), false, paint);
    }
  }
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
  
}