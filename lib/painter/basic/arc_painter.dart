import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_canvas/utils/utils.dart';

class ArcPainter extends CustomPainter{
  final _paint = Paint()
  ..style = PaintingStyle.stroke
  ..strokeWidth = 5
  ..color = Utils.colorRandom();
  @override
  void paint(Canvas canvas, Size size) {
    final centerPoint = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width,size.height) / 2 * 0.95;
    //draw arc start from 0 degree and sweep 180 degree
    canvas.drawArc(Rect.fromCircle(center: centerPoint, radius: radius), 0, Utils.degreeToRadian(180), false, _paint);
  
  }
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
  
}