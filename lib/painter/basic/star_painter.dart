import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_canvas/utils/utils.dart';

class StarPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
      final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..color = Utils.colorRandom();
      final centerPoint = Offset(size.width / 2, size.height / 2);
      final radius = min(size.width, size.height) / 2 * 0.95;
      final n = 5;
      final eachDegree = 360 / n;
      final path = Path();
      int k = 0;
      for (var i = 0; i < n; i++) {
        final degree = (k*eachDegree) + 270; // start from degree 270
        final radian = Utils.degreeToRadian(degree);
        final drawPoint = Offset(cos(radian) * radius, sin(radian) * radius) + centerPoint;
        if(i == 0){
          path.moveTo(drawPoint.dx, drawPoint.dy);
        }
        else{
          path.lineTo(drawPoint.dx, drawPoint.dy);
        }
        k += 2;
      }
      path.close();
      canvas.drawPath(path,paint);
      
  }
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
  
}