import 'package:flutter/widgets.dart';
import 'package:flutter_canvas/painter/basic/my_path_painter.dart';

class MyPath extends StatefulWidget {
  @override
  _MyPathState createState() => _MyPathState();
}

class _MyPathState extends State<MyPath> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: CustomPaint(
        size: Size.infinite,
        painter: MyPathPainter(),
      ),
    );
  }
}