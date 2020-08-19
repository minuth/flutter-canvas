
import 'package:dart_code_viewer/dart_code_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_canvas/main.dart';
import 'package:flutter_canvas/model/source_code.dart';
import 'package:share/share.dart';

class SourceCodeViewScreen extends BaseScreen {
  final SourceCode _sourceCode;
  SourceCodeViewScreen(this._sourceCode);
  @override
  Widget getContent(BuildContext baseContext) => _SourceCodeViewScreenContent(baseContext,this._sourceCode);
}

class _SourceCodeViewScreenContent extends StatefulWidget {
  final BuildContext baseContext;
  final SourceCode sourceCode;

  _SourceCodeViewScreenContent(this.baseContext,this.sourceCode);
  @override
  _SourceCodeViewScreenContentState createState() => _SourceCodeViewScreenContentState();
}

class _SourceCodeViewScreenContentState extends State<_SourceCodeViewScreenContent> {
  bool _widgetSelected = true;
  bool _painterSelected = false;
  bool _utilsSelected = false;
  bool _isDarkMode = true;

  var _tabIndex = 0;

  String _selectedSourceCodePath = "";
  var _codeViewModeSelected = [false, true];

  var _hintTitles = ["Widget: ", "Painter: ", "Utils: "];
  var _hintDescriptions = ["This class is required PAINTER class.","This class was used by WIDGET class.","This class was used by PAINTER class."];


  @override
  Widget build(BuildContext context) {
    if(_selectedSourceCodePath.isEmpty){
      _selectedSourceCodePath = widget.sourceCode.widgetSourceCodePath;
    }
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Padding(
        padding:
        EdgeInsets.only(top: 20, left: 5,right: 5, bottom: 5),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           GestureDetector(child: Icon(Icons.close, size: 50, color: Colors.white,
           ),
           onTap: () {
             Navigator.of(widget.baseContext).pop();
           },
           ),
           Row(
             children: [
               _tabButton("Widget", _widgetSelected, () { 
                   setSelectedTab(widgetSelected: true);
               }),
                _tabButton("Painter",_painterSelected, () { 
                 setSelectedTab(painterSelected: true);
               }),
                _tabButton("Utils",_utilsSelected, () { 
                 setSelectedTab(utilsSelected: true);
               })
             ],
           ),
           Padding(padding: EdgeInsets.only(top:5,bottom: 15),
            child: Row(
              children: [
                Text(_hintTitles[_tabIndex].toUpperCase(),style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 15,decorationStyle: TextDecorationStyle.double, decoration: TextDecoration.underline, decorationColor: Colors.white),),
                Text(_hintDescriptions[_tabIndex],style: TextStyle(color: Colors.white),)
              ],
            ),),
           ToggleButtons(children: [
            Icon(Icons.lightbulb,),
            Icon(Icons.nights_stay_sharp)
           ],
           constraints: BoxConstraints(minHeight: 25,minWidth: 40),
           borderRadius: BorderRadius.circular(5),
           isSelected: _codeViewModeSelected,
           onPressed: (index) {
             setState(() {
               switch (index) {
                 case 0: 
                 _codeViewModeSelected[0] = true;
                 _codeViewModeSelected[1] = false;
                 setState(() {
                   _isDarkMode = false;
                 });
                   break;
                 case 1:
                 _codeViewModeSelected[0] = false;
                 _codeViewModeSelected[1] = true;
                 setState(() {
                   _isDarkMode = true;
                 });
                   break;
               }
             });
           },
           selectedColor: Colors.white,
           selectedBorderColor: Colors.white,
           borderColor: Colors.black,
           ),
           Expanded(child: 
            FutureBuilder(
                initialData: widget.sourceCode.widgetSourceCodePath,
                future: rootBundle.loadString(_selectedSourceCodePath),
                builder: (context, snapshot) => Center(
                  child: Padding(padding: EdgeInsets.only(top: 5),
                    child: _isDarkMode? DartCodeViewer.darkAlt(snapshot.data): DartCodeViewer.lightAlt(snapshot.data),
                  ),
                ),
              )
           )
         ]
        ),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.share) ,onPressed: (){
        Share.share(widget.sourceCode.getShareSourceCodeUrl(), subject: "Flutter Canvas");
      }),
    );
  }

  Widget _tabButton(String title, bool isSelected, void onClick()){
      final textStyle = TextStyle(fontSize: isSelected? 20: 15, fontWeight: FontWeight.bold, color: isSelected?Colors.white: Colors.black, decoration: isSelected? TextDecoration.underline: TextDecoration.none);
      return Expanded(
        child: FlatButton(onPressed: (){
              onClick();
            }, 
            child: Text(title.toUpperCase(), style: textStyle,),
        ),);
  }

  void setSelectedTab({bool widgetSelected = false, bool painterSelected = false, bool utilsSelected = false}){
    setState(() {
      _widgetSelected = widgetSelected;
      _painterSelected = painterSelected;
      _utilsSelected = utilsSelected;
      if(widgetSelected){
        _selectedSourceCodePath = widget.sourceCode.widgetSourceCodePath;
        _tabIndex = 0;
      }
      else if(painterSelected){
        _selectedSourceCodePath = widget.sourceCode.painterSourceCodePath;
        _tabIndex = 1;
      }
      else{
        _selectedSourceCodePath = widget.sourceCode.utilsSourceCodePath;
        _tabIndex = 2;
      }
    });
  }
    
}
