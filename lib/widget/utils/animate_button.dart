import 'package:flutter/material.dart';
import 'package:flutter_canvas/painter/utils/animate_button_painter.dart';
import 'package:flutter_canvas/utils/utils.dart';

class AnimateButton extends StatefulWidget {
  final double width;
  final double height;
  final String text;
  final void Function() onClick;
  final bool shouldClick;
  
  AnimateButton(this.width,this.height,this.text,this.shouldClick,{this.onClick});
  @override
  _AnimateButtonState createState() => _AnimateButtonState();
}

class _AnimateButtonState extends State<AnimateButton> with SingleTickerProviderStateMixin{
  AnimationController _animationController;

  Color _animationColor = Utils.colorRandom();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 400));
    _animationController.value = 1;
  }
  @override
  Widget build(BuildContext context) {
    if(!widget.shouldClick){
      _animationController.reverse();
    }
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => (
        GestureDetector(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.black54,offset: Offset(2, 2)),
                  ]
                ),
                width: widget.width,
                height: widget.height,
                child: CustomPaint(
                  size: Size.infinite,
                  painter: AnimateButtonPainter(_animationController.value,_animationColor,widget.shouldClick),
                ),
              ),
              Container(
                width: widget.width,
                height: widget.height,
                child: Center(child: Text(widget.text.toUpperCase(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),)),
              )
            ],
          ),
          onTap: () {
            if(!widget.shouldClick){
            _animationController..reset()..forward();
            widget.onClick();
            _animationColor = Utils.colorRandom(opacity: 0.5);
            }
          },
        )
       )
    );
  }
}