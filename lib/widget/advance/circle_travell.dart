import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_canvas/painter/advance/circle_travell_painter.dart';

class CircleTravell extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CircleTravellState();
}

class _CircleTravellState extends State<CircleTravell> {
  int _rotateDegree = 0;
  Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        if (_rotateDegree < 360) {
          _rotateDegree++;
        } else {
          _rotateDegree = 0;
        }
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
    return Container(
      height: 300,
      child: CustomPaint(
        size: Size.infinite,
        painter: CircleTravellPainter(rotateDegree: _rotateDegree),
      ),
    );
  }
}
