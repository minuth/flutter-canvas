import 'package:flutter/material.dart';
import 'package:flutter_canvas/painter/advance/open_umbrellar_animation_painter.dart';

class OpenUmbrellarAnimation extends StatefulWidget {
  @override
  _OpenUmbrellarAnimationState createState() => _OpenUmbrellarAnimationState();
}

class _OpenUmbrellarAnimationState extends State<OpenUmbrellarAnimation> with SingleTickerProviderStateMixin{
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animationController.value = 1.0;
    super.initState();
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
                    painter: OpenUmbrellarAnimationPainter(_animationController.value),
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