import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_canvas/utils/utils.dart';

class PeiChartPainter extends CustomPainter {
  Offset _centerPoint;
  @override
  void paint(Canvas canvas, Size size) {
    _centerPoint = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2 * 0.90;
    final paint = Paint()..color = Utils.colorRandom();
    ;
    final rect = Rect.fromCircle(center: _centerPoint, radius: radius);

    final chartValues = [100.4, 150, 50, 50, 60.45, 40];

    final totalValue = chartValues.reduce((a, b) => a + b);
    double currentDegree = 0;
    for (var value in chartValues) {
      final itemDegree = (value * 360) / totalValue;
      canvas.drawArc(
          rect,
          Utils.degreeToRadian(currentDegree),
          Utils.degreeToRadian(itemDegree),
          true,
          paint..color = Utils.colorRandom());

      final labelDegree = ((itemDegree) / 2) +
          currentDegree; // find the middle degree from start angel to end angel of arc to draw text value.

      _drawText(
          value.toString(),
          canvas,
          Offset.fromDirection(Utils.degreeToRadian(labelDegree), radius) +
              _centerPoint);

      currentDegree += itemDegree;
    }

  }

  void _drawText(String text, Canvas canvas, Offset position,
      {double fontSize = 10}) {
    final textStyle = TextStyle(
      color: Colors.black,
      fontSize: fontSize,
    );
    final textSpan = TextSpan(
      text: text,
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: Size.infinite.width,
    );
    if (position.dx < _centerPoint.dx && position.dy < _centerPoint.dy) {
      textPainter.paint(canvas,
          position - Offset(textPainter.size.width, textPainter.size.height));
    } else if (position.dy < _centerPoint.dy) {
      textPainter.paint(canvas, position - Offset(0, textPainter.size.height));
    } else if (position.dx < _centerPoint.dx) {
      textPainter.paint(canvas, position - Offset(textPainter.size.width, 0));
    } else {
      textPainter.paint(canvas, position);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
