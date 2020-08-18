import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_canvas/utils/utils.dart';

class CircleProgressbarPainter extends CustomPainter{
  final double progress;

  CircleProgressbarPainter(this.progress);
  @override
  void paint(Canvas canvas, Size size) {
    final centerPoint = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width /2, size.height /2) * 0.95;

    final _paint = Paint()
    ..strokeWidth = 3
    ..style = PaintingStyle.stroke;

    canvas.drawCircle(centerPoint, radius, _paint);
    final path = Path()
    ..addArc(Rect.fromCircle(center: centerPoint,radius: radius), Utils.degreeToRadian(270), Utils.degreeToRadian(360 * progress));
    _paint..color = Colors.purple
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..strokeWidth = 8;
    canvas.drawPath(path, _paint);
    final pathMetric = path.computeMetrics().first;
    canvas.drawCircle(pathMetric.getTangentForOffset(pathMetric.length).position, 10, _paint..style = PaintingStyle.fill);

  }
  
  @override
  bool shouldRepaint(CircleProgressbarPainter oldDelegate) {
    return false;
  }
  
}