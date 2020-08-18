import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_canvas/painter/advance/complex_shape_01_selectable_painter.dart';

class ComplexShape01Selectable extends StatefulWidget {
  @override
  _ComplexShape01SelectableState createState() => _ComplexShape01SelectableState();
}

class _ComplexShape01SelectableState extends State<ComplexShape01Selectable> {
  Offset _selectedOffset ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: GestureDetector(
          onTapDown: (details) {
            setState(() {
              _selectedOffset = details.localPosition;
            });
          },
          child: CustomPaint(
          size: Size.infinite,
          painter: ComplexShape01SelectablePainter(_selectedOffset),),)
    );
  }
}