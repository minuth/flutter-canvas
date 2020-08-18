import 'package:flutter/material.dart';
import 'package:flutter_canvas/model/source_code.dart';

class CustomWidgetItem {
  final Widget widget;
  final SourceCode sourceCode;
  final String description;

  CustomWidgetItem({@required this.widget, @required this.sourceCode, this.description = ""});
}