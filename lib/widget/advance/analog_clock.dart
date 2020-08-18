import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_canvas/painter/advance/analog_clock_painter.dart';

class AnalogClock extends StatefulWidget {
  @override
  _AnalogClockState createState() => _AnalogClockState();
}

class _AnalogClockState extends State<AnalogClock> {
  DateTime _time = DateTime.now();
  Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 100), (time) {
      setState(() {
        _time = DateTime.now();
      });
    });
  }
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(          
      height: 300,
      child: CustomPaint(
        painter: AnalogClockPainter(_time),
        size: Size.infinite,
      ),
    );
  }
}