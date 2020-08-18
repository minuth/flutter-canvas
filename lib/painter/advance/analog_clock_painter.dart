import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_canvas/utils/utils.dart';

class AnalogClockPainter extends CustomPainter {
  final DateTime time;
  final double _degreePersecond = 360 / 60;
  final double _degreePerHour = 360 / 12;
  final double _startDegree = 270; // 12:00:00 start at 90 degree in reality but in mobile screen compare to reality is 270 degree.
  
  final _bodyClockPaint = Paint()
  ..style = PaintingStyle.stroke
  ..strokeWidth = 5
  ..color = Colors.blue;

  final _secondLabelPaint = Paint()
  ..style = PaintingStyle.stroke
  ..strokeWidth = 2;

  final _secondHandPaint = Paint()
  ..style = PaintingStyle.stroke
  ..strokeWidth = 2
  ..color = Colors.red;

  final _minuteHandPaint = Paint()
  ..style = PaintingStyle.stroke
  ..strokeWidth = 3
  ..color = Colors.blueGrey;

  final _hourHandPaint = Paint()
  ..style = PaintingStyle.stroke
  ..strokeWidth = 5
  ..color = Colors.black45;

  final _whiteFillPaint = Paint()
  ..color = Colors.white;

  AnalogClockPainter(this.time);
  @override
  void paint(Canvas canvas, Size size) {
    final centerPoint = Offset(size.width/2, size.height/2);
    final radius = min(size.width, size.height) / 2 * 0.9;
    // draw clock body (circle)
    canvas.drawCircle(centerPoint, radius, _bodyClockPaint);

    //draw second label
    for (var i = 0; i < 60; i++) {
      final degree = (i * _degreePersecond) + _startDegree;
      final radian = Utils.degreeToRadian(degree);
      final endPoint = Offset(cos(radian) * (radius - 2.5), sin(radian) * (radius - 2.5)) + centerPoint; // endPoint added by centerPoint because our centerPoint NOT start with (0,0).
      if(i % 5 == 0){
        _secondLabelPaint.color = Colors.black87;
      }
      else{
        _secondLabelPaint.color = Colors.red[900];
      }
      canvas.drawLine(centerPoint, endPoint, _secondLabelPaint);
    }
    canvas.drawCircle(centerPoint, radius - 10, _whiteFillPaint);

    final secondDegree = (time.second * _degreePersecond) + _startDegree;
    final secondRadian = Utils.degreeToRadian(secondDegree);
    final secondRadius = radius - 12;
    final secondHandEndPoint = Offset(cos(secondRadian) * secondRadius , sin(secondRadian) * secondRadius) + centerPoint;

    final minuteDegree = (time.minute * _degreePersecond) + _startDegree;
    final minuteRadian = Utils.degreeToRadian(minuteDegree);
    final minuteRadius = radius - 20;
    final minuteHandEndPoint = Offset(cos(minuteRadian) * minuteRadius , sin(minuteRadian) * minuteRadius) + centerPoint;

    final hourDegree = (time.hour * _degreePerHour) + _startDegree;
    final hourRadian = Utils.degreeToRadian(hourDegree);
    final hourRadius = radius - 40;
    final hourHandEndPoint = Offset(cos(hourRadian) * hourRadius , sin(hourRadian) * hourRadius) + centerPoint;

    canvas.drawLine(centerPoint, secondHandEndPoint, _secondHandPaint);
    canvas.drawLine(centerPoint, minuteHandEndPoint, _minuteHandPaint);
    canvas.drawLine(centerPoint, hourHandEndPoint, _hourHandPaint);

    canvas.save(); //before we want to modify canvas like rotate, scale... we need to save prevoius canvas first to keep state of the prevoius canvas.
    canvas.translate(centerPoint.dx, centerPoint.dy);
    canvas.scale(time.second % 2 == 0? 1: 1.3);
    canvas.drawCircle(Offset(0, 0), 5, Paint()..color = Utils.colorRandom());
    canvas.restore(); // after modify canvas we need to restore it.

  }

  @override
  bool shouldRepaint(AnalogClockPainter oldDelegate) {
    return oldDelegate.time.second != time.second;
  }
}