import 'package:flutter/material.dart';
import 'package:flutter_canvas/main.dart';
import 'package:flutter_canvas/screen/advance_content_screen.dart';
import 'package:flutter_canvas/screen/basic_content_screen.dart';
import 'package:flutter_canvas/utils/constant.dart';
import 'package:flutter_canvas/widget/utils/animate_toggle_button.dart';
import 'package:url_launcher/url_launcher.dart';

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
  final iconPath = "";
  final _authorInfo = [
    {"$ICON_PATH/github.png",GITHUB_REPO},
    {"$ICON_PATH/youtube.png",YOUTUBE_CHHANEL},
    {"$ICON_PATH/linkedin.png",LINKEDIN},
    {"$ICON_PATH/facebook.png",FACEBOOK}
  ];
  final _thirdPartyLibs = [
    {"Code Viwer",DART_CODE_VIEWER},
    {"Share", SHARE},
    {"Url Launcher", URL_LAUNCHER}
  ];
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
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.info),onPressed: (){
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              scrollable: true,
              title: Text("Flutter Canvas"),
              content: Wrap(
                  children:[ 
                    Wrap(
                      children: List.generate(_authorInfo.length, (index) => 
                        ListTile(
                          leading: Image.asset(_authorInfo[index].first),
                          title: GestureDetector(
                                child: Text(_authorInfo[index].last, maxLines: 1,
                                style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),),
                                onTap: () {
                                  _launchURL(_authorInfo[index].last);
                                },
                          ),
                        )
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Text("Third Party Libary", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),),
                  ),
                  Wrap(
                      children: List.generate(_thirdPartyLibs.length, (index) => 
                        ListTile(
                          leading: Text(_thirdPartyLibs[index].first, style: TextStyle(fontWeight: FontWeight.bold),),
                          title: GestureDetector(
                                child: Text(_thirdPartyLibs[index].last, maxLines: 1,
                                style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),),
                                onTap: () {
                                  _launchURL(_authorInfo[index].last);
                                },
                          ),
                        )
                      ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }

  _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
}