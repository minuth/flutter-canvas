import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_canvas/painter/advance/circle_progressbar_painter.dart';

class CircleProgressbar extends StatefulWidget {
  @override
  _CircleProgressbarState createState() => _CircleProgressbarState();
}

class _CircleProgressbarState extends State<CircleProgressbar>{
  var _rangeValue = 0.5;
  @override
  Widget build(BuildContext context) {
    return Container(
          height: 300,
          child: Column(
          children: [
            Expanded(child: 
                CustomPaint(
                  size: Size.infinite,
                  painter: CircleProgressbarPainter(_rangeValue),
                ),
              ),
            Slider(value: _rangeValue, onChanged: (value) {
              setState(() {
                _rangeValue = value;
              });
            },)
          ],
      ),
    );
  }
}