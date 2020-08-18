import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_canvas/utils/utils.dart';

class CircleStartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centerPoint = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2 * 0.5;
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    final n = 5;
    final degreePerCirlce = 360 / n;

    for (var i = 0; i < n; i++) {
      final radian = Utils.degreeToRadian(i * degreePerCirlce);

      final endPoint =
          Offset(cos(radian) * radius, sin(radian) * radius) + centerPoint;

      paint.color = Color.fromRGBO(Random().nextInt(255), Random().nextInt(255),
          Random().nextInt(255), 1);

      canvas.drawCircle(
          endPoint,
          radius,
          paint
            ..color = Color.fromRGBO(Random().nextInt(255),
                Random().nextInt(255), Random().nextInt(255), 1));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
