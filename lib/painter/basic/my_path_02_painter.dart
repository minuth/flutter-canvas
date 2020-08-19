import 'package:flutter/widgets.dart';
import 'package:flutter_canvas/utils/utils.dart';

class MyPath02Painter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final centerPoint = Offset(size.width / 2, size.height / 2);
    final paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 5
    ..color = Utils.colorRandom();
    final rect = Rect.fromCenter(center: centerPoint, width: size.width * 0.9, height: size.height * 0.9);
    final path = Path()
    ..moveTo(rect.left, rect.bottom)
    ..quadraticBezierTo(rect.width , rect.height, rect.right, rect.top)
    ;
    print(rect.width);
    canvas.drawRect(rect, paint);
    paint.color = Utils.colorRandom();
    canvas.drawPath(path, paint);
    
  }
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
  
}