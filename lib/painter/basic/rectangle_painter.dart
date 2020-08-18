import 'package:flutter/widgets.dart';
import 'package:flutter_canvas/utils/utils.dart';

class RectanglePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
      final paint = Paint()
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..color = Utils.colorRandom();
      final centerPoint = Offset(size.width / 2, size.height / 2);
      final rect = Rect.fromCenter(center: centerPoint,width: size.width * 0.9 , height: size.height * 0.95);
      canvas.drawRect(rect, paint);
  }
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
  
}