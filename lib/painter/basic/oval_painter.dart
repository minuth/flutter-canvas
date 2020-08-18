import 'package:flutter/widgets.dart';
import 'package:flutter_canvas/utils/utils.dart';

class OvalPainter extends CustomPainter{
  final _paint = Paint()
  ..strokeWidth = 5
  ..style = PaintingStyle.stroke
  ..color = Utils.colorRandom();
  @override
  void paint(Canvas canvas, Size size) {
    final centerPoint = Offset(size.width / 2, size.height / 2);
    canvas.drawOval(Rect.fromCenter(center: centerPoint,width: size.width * 0.95,height: size.height * 0.5), _paint);
  }
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
  
}