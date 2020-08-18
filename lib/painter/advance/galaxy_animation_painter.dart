import 'package:flutter/widgets.dart';
import 'package:flutter_canvas/utils/utils.dart';

class GalaxyAnimationPainter extends CustomPainter {
  final double progress;
  GalaxyAnimationPainter(this.progress);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    final centerPoint = Offset(size.width / 2, size.height / 2);
    final radiusValue = 4.0;
    var startRadius = radiusValue;
    var startDegree = 0.0;

    var i = 0;
    var shouldDraw = true;
    final path = Path();
    while(shouldDraw){
      Offset additionalOffset = Offset(0, 0);
      if (i % 2 != 0) {
        additionalOffset += Offset(radiusValue, 0); // change center position by increase X by 7
      }
      final rect = Rect.fromCircle(
          radius: startRadius, center: centerPoint + additionalOffset);
      if(rect.top > 5){
        path.arcTo(rect, Utils.degreeToRadian(startDegree), Utils.degreeToRadian(180),false);
        startDegree += 180;
        startRadius += radiusValue;
        i++;
      }
      else{
        shouldDraw = false;
      }
      
    }
    final pathMetric = path.computeMetrics().first;
    canvas.drawPath(pathMetric.extractPath(0, pathMetric.length * progress), paint);
  }

  @override
  bool shouldRepaint(GalaxyAnimationPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
