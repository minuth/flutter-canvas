import 'package:flutter/material.dart';
import 'package:flutter_canvas/main.dart';
import 'package:flutter_canvas/screen/advance_content_screen.dart';
import 'package:flutter_canvas/screen/basic_content_screen.dart';
import 'package:flutter_canvas/widget/utils/animate_toggle_button.dart';

class HomeScreen extends BaseScreen {
  @override
  Widget getContent(BuildContext baseContext) => _HomeScreenContent();
}

class _HomeScreenContent extends StatefulWidget {
  @override
  _HomeScreenContentState createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<_HomeScreenContent> {
  final _screens = [BasicContentScreen(),AdvanceContentScreen()];
  var _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Stack(
           children: [
               Padding(
                padding: EdgeInsets.only(top: 50, left: 5),
                child: Text("Flutter Canvas".toUpperCase(),style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                ),

                Padding(
                padding: EdgeInsets.only(top: 52, left: 7),
                child: Text("Flutter Canvas".toUpperCase(),style: TextStyle(color: Colors.blueAccent.withOpacity(0.5), fontSize: 30, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                )
           ],
         ),
         Padding(padding: EdgeInsets.only(top: 10),child: Padding(padding: EdgeInsets.all(5),
         child: AnimateToggleButton(
          basicButtonOnClick: (){
           setState(() {
             _index = 0;
           });
         },advanceButtonOnClick: () {
           setState(() {
             _index = 1;
           });
         }))),
         Expanded(child: IndexedStack(
           children: _screens,
           index: _index,
         ))
       ]
      )
    );
  }
}