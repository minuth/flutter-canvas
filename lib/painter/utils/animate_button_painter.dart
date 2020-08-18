import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimateButtonPainter extends CustomPainter{
  final double animatedValue;
  final Color color = Colors.white;
  final painter = Paint();
  final Color animtionColor;
  final bool shouldClick;

  AnimateButtonPainter(this.animatedValue, this.animtionColor,this.shouldClick);
  @override
  void paint(Canvas canvas, Size size) {
      final rect = RRect.fromLTRBR(0, 0, size.width, size.height, Radius.circular(10));
      final path = Path()..addRRect(rect);
      final pathMetric = path.computeMetrics().first;

      canvas.drawRRect(rect, painter..color = color);
      canvas.drawPath(pathMetric.extractPath(0, pathMetric.length * animatedValue), painter..color = animtionColor.withOpacity(animatedValue));
  }
  
  @override
  bool shouldRepaint(AnimateButtonPainter oldDelegate) {
    return true;
  }
  
}