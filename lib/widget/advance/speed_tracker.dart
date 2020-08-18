import 'package:flutter/material.dart';
import 'package:flutter_canvas/painter/advance/speed_tracker_painter.dart';

class SpeedTracker extends StatefulWidget {
  @override
  _SpeedTrackerState createState() => _SpeedTrackerState();
}

class _SpeedTrackerState extends State<SpeedTracker> {
  var _rangeValue = 1.0;
  @override
  Widget build(BuildContext context) {
    return Container(
          height: 300,
          child: Column(
          children: [
            Expanded(child: 
                CustomPaint(
                  size: Size.infinite,
                  painter: SpeedTrackerPainter(_rangeValue),
                ),
              ),
            Slider(value: _rangeValue,min: 0.0, max: 12.0, onChanged: (value) {
              setState(() {
                _rangeValue = value;
              });
            },)
          ],
      ),
    );
  }
}