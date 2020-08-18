import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_canvas/screen/home_screen.dart';

void main() {
  runApp(HomeScreen());
}

abstract class BaseScreen extends StatefulWidget {
  Widget getContent(BuildContext baseContext);
  @override
  State<StatefulWidget> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen>{
   @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Canvas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        child: widget.getContent(context),
      ),
    );
  }
}