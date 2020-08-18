import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_canvas/utils/utils.dart';

class ComplexShape01SelectablePainter extends CustomPainter {
  Offset _selectedOffset;
  final _icons = [Icons.ac_unit, Icons.face, Icons.g_translate, Icons.baby_changing_station, Icons.nat_outlined, Icons.ac_unit_sharp, Icons.wallet_giftcard];
  
  ComplexShape01SelectablePainter(this._selectedOffset);

  @override
  void paint(Canvas canvas, Size size) {
    final centerPoint = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2 * 0.3;
    final n = 6;
    final eachDegree = 360 / n;
    if(_selectedOffset == null){
      _selectedOffset = centerPoint;
    }
     _drawItem(centerPoint,radius, canvas, 0);
    for (var i = 0; i < n; i++) {
      final radian = Utils.degreeToRadian((i*eachDegree)+270);
      final drawPoint = Offset(cos(radian) * (radius*2), sin(radian) * (radius*2)) + centerPoint;
      _drawItem(drawPoint,radius, canvas, i+1);
    }   
  }

  void _drawItem(Offset drawPoint,double radius, Canvas canvas, int index){
    final paint = Paint()
    ..strokeWidth = 1.5
    ..color = Utils.colorRandom();
    final path = Path();
    final n = 6;
    final eachDegree = 360 / n;
    for(var i =0; i<n; i++){
      final radian = Utils.degreeToRadian(i*eachDegree);
      final newDrawPoint = Offset(cos(radian) * radius, sin(radian) * radius) + drawPoint;
      if(i == 0){
        path.moveTo(newDrawPoint.dx, newDrawPoint.dy);
      }
      else{
        path.lineTo(newDrawPoint.dx, newDrawPoint.dy);
      }
    }
    final iconSize = radius * 1.2;
    path.close();
    if(path.contains(_selectedOffset)){
      canvas.drawPath(path, paint..style = PaintingStyle.fill);
      Utils.drawIcon(canvas, _icons[index], drawPoint - Offset(iconSize / 2, iconSize /2), size: iconSize);
    }
    else{
      canvas.drawPath(path, paint..style = PaintingStyle.stroke);
      Utils.drawIcon(canvas, _icons[index], drawPoint - Offset(iconSize / 2, iconSize /2), color: Colors.black, size: iconSize);
    }

  }
  
  @override
  bool shouldRepaint(ComplexShape01SelectablePainter oldDelegate) {
    return oldDelegate._selectedOffset != _selectedOffset;
  }
}