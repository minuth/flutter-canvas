import 'package:flutter/widgets.dart';
import 'package:flutter_canvas/utils/utils.dart';

class LinePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset(5,5), Offset(size.width * 0.95, size.height * 0.95), Paint()..strokeWidth = 5..color = Utils.colorRandom());
  }
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
  
}