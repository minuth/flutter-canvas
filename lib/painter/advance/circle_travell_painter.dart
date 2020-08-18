import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_canvas/utils/utils.dart';

class CircleTravellPainter extends CustomPainter {
  final int rotateDegree;

  final _paintRed = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 5
    ..color = Colors.red;

  CircleTravellPainter({this.rotateDegree});

  @override
  void paint(Canvas canvas, Size size) {
    final centerPoint = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2 * 0.7;
    final childRadius = radius * 0.25;
    canvas.drawCircle(centerPoint, radius, _paintRed);
   
    final circleItemNumber = 4;
    for (var i = 0; i < circleItemNumber; i++) {
      final radian =
          Utils.degreeToRadian((i * (360 / circleItemNumber)) + rotateDegree);
      final centerPointCircleItem = Offset(
              cos(radian) * (radius + childRadius),
              sin(radian) * (radius + childRadius)) +
          centerPoint;

      canvas.drawCircle(centerPointCircleItem, childRadius, Paint()..color = Utils.colorRandom());
    }
  }

  @override
  bool shouldRepaint(CircleTravellPainter oldDelegate) {
    return oldDelegate.rotateDegree != rotateDegree;
  }
}
