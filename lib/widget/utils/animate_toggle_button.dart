import 'package:flutter/material.dart';

import 'animate_button.dart';

class AnimateToggleButton extends StatefulWidget {
  final void Function() basicButtonOnClick;
  final void Function() advanceButtonOnClick;

  AnimateToggleButton({@required this.basicButtonOnClick, @required this.advanceButtonOnClick});
  @override
  _AnimateToggleButtonState createState() => _AnimateToggleButtonState();
}

class _AnimateToggleButtonState extends State<AnimateToggleButton> {
  bool _basicButtonShouldClick = true;
  bool _advanceButtonShouldClick = false;
  @override
  Widget build(BuildContext context) {
    return  Row( 
              children: [
                Expanded(child: Padding(padding: EdgeInsets.only(right: 2.5),child: AnimateButton(double.infinity, 40,"Basic",_basicButtonShouldClick, onClick: () {
                  if(!_basicButtonShouldClick){
                    setState(() {
                       _basicButtonShouldClick = true;
                      _advanceButtonShouldClick = false;
                    });
                    widget.basicButtonOnClick();
                  }
                },))),
                Expanded(child: Padding(padding: EdgeInsets.only(left: 2.5),child: AnimateButton(double.infinity, 40,"Advance",_advanceButtonShouldClick, onClick: (){
                  if(!_advanceButtonShouldClick){
                    setState(() {
                      _basicButtonShouldClick = false;
                      _advanceButtonShouldClick = true;
                    });
                    widget.advanceButtonOnClick();
                    }
                },))),
              ],
            );
  }
}