import 'package:flutter/material.dart';
import 'package:flutter_canvas/utils/constant.dart';

class SourceCode {
  final String widgetSourceCodePath;
  final String painterSourceCodePath;
  final String utilsSourceCodePath;

  SourceCode({@required this.widgetSourceCodePath, @required this.painterSourceCodePath,this.utilsSourceCodePath = "lib/utils/utils.dart", }){
    
  }
  String getShareSourceCodeUrl(){
    String content = "Flutter Canvas\n\n Widget: ${_getUrl(widgetSourceCodePath)}\nPainter: ${_getUrl(painterSourceCodePath)}\nUtils: ${_getUrl(utilsSourceCodePath)}";
    return content;
  }
  String _getUrl(String path) => "$GITHUB_SOURCE_CODE_URL/$path";
}