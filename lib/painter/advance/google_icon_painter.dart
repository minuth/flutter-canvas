import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_canvas/utils/utils.dart';

class GoogleIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centerPoint = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2 * 0.8;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.height * 0.18
      ..color = Colors.red;

    final path = Path()
      ..moveTo(centerPoint.dx, centerPoint.dy)
      ..relativeLineTo(radius, 0)
      ..arcTo(Rect.fromCircle(center: centerPoint, radius: radius), 0,
          Utils.degreeToRadian(320), false);

    final pathMertic = path.computeMetrics().first;
    final numberPart = 4;
    final eachPartLength = pathMertic.length / numberPart;

    for (var i = 1; i <= numberPart; i++) {
      canvas.drawPath(
          pathMertic.extractPath(eachPartLength * (i - 1), eachPartLength * i),
          paint
            ..color = Utils.colorRandom());
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
