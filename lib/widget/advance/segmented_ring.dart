import 'package:flutter/material.dart';
import 'package:flutter_canvas/painter/advance/segmented_ring_painter.dart';

class SegmentedRing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: CustomPaint(
        size: Size.infinite,
        painter: SegmentedRingPainter(),
      ),
    );
  }
}