import 'package:flutter/material.dart';
import 'package:flutter_canvas/painter/advance/galaxy_animation_painter.dart';

class GalaxtAnimation extends StatefulWidget {
  @override
  _GalaxtAnimationState createState() => _GalaxtAnimationState();
}

class _GalaxtAnimationState extends State<GalaxtAnimation> with SingleTickerProviderStateMixin{
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 3));
    _animationController.value = 1;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
          height: 300,
          child: Column(
            children: [
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) => Expanded(child: 
                  CustomPaint(
                    size: Size.infinite,
                    painter: GalaxyAnimationPainter(_animationController.value),
                  ),
                ),
              ),
              FlatButton.icon(onPressed: (){
                _animationController..reset()..forward();
              }, icon: Icon(Icons.sync, color: Colors.blue,), label: Text("Animation"),
              shape: RoundedRectangleBorder(side: BorderSide(),borderRadius: BorderRadius.circular(5)),)
            ],
      ),
    );
  }
}