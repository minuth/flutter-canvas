import 'package:flutter/material.dart';

class SourceCode {
  final String widgetSourceCodePath;
  final String painterSourceCodePath;
  final String utilsSourceCodePath;

  SourceCode({@required this.widgetSourceCodePath, @required this.painterSourceCodePath,this.utilsSourceCodePath = "lib/utils/utils.dart"});
}