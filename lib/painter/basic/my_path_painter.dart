import 'package:flutter/widgets.dart';
import 'package:flutter_canvas/utils/utils.dart';

class MyPathPainter extends CustomPainter{
  final _paint = Paint()
  ..style = PaintingStyle.stroke
  ..strokeWidth = 5
  ..color = Utils.colorRandom();
  @override
  void paint(Canvas canvas, Size size) {
    final centerPoint = Offset(size.width /2, size.height / 2);
    final path = Path()
    ..moveTo(centerPoint.dx, centerPoint.dy)
    ..lineTo(size.width * 0.95, size.height * 0.05)
    ..lineTo(size.width * 0.05, size.height * 0.05)
    ..lineTo(size.width * 0.95, size.height * 0.95)
    ..lineTo(size.width * 0.05, size.height * 0.95)
    ..close()
    ;

    canvas.drawPath(path, _paint);
  }
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
  
}