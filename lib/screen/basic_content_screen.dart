import 'package:flutter/material.dart';
import 'package:flutter_canvas/model/custom_widget_item.dart';
import 'package:flutter_canvas/model/source_code.dart';
import 'package:flutter_canvas/screen/source_code_view_screen.dart';
import 'package:flutter_canvas/utils/utils.dart';
import 'package:flutter_canvas/widget/basic/arc.dart';
import 'package:flutter_canvas/widget/basic/circle.dart';
import 'package:flutter_canvas/widget/basic/circle_line.dart';
import 'package:flutter_canvas/widget/basic/line.dart';
import 'package:flutter_canvas/widget/basic/my_path.dart';
import 'package:flutter_canvas/widget/basic/my_path_01.dart';
import 'package:flutter_canvas/widget/basic/oval.dart';
import 'package:flutter_canvas/widget/basic/rectangle.dart';
import 'package:flutter_canvas/widget/basic/star.dart';
import 'package:flutter_canvas/widget/basic/triangle.dart';
import 'package:flutter_canvas/widget/utils/canvas_item_viewer.dart';

class BasicContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = [
      CustomWidgetItem(widget: Circle(), sourceCode: SourceCode(widgetSourceCodePath: _getWidgetPath("circle"), painterSourceCodePath: _getPainterPath("circle_painter"))),
      CustomWidgetItem(widget: Rectangle(), sourceCode: SourceCode(widgetSourceCodePath: _getWidgetPath("rectangle"), painterSourceCodePath: _getPainterPath("rectangle_painter"))),
      CustomWidgetItem(widget: Arc(), sourceCode: SourceCode(widgetSourceCodePath: _getWidgetPath("arc"), painterSourceCodePath: _getPainterPath("arc_painter"))),
      CustomWidgetItem(widget: Line(), sourceCode: SourceCode(widgetSourceCodePath: _getWidgetPath("line"), painterSourceCodePath: _getPainterPath("line_painter"))),
      CustomWidgetItem(widget: Oval(), sourceCode: SourceCode(widgetSourceCodePath: _getWidgetPath("oval"), painterSourceCodePath: _getPainterPath("oval_painter"))),
      CustomWidgetItem(widget: MyPath(), sourceCode: SourceCode(widgetSourceCodePath: _getWidgetPath("my_path"), painterSourceCodePath: _getPainterPath("my_path_painter"))),
      CustomWidgetItem(widget: MyPath01(), sourceCode: SourceCode(widgetSourceCodePath: _getWidgetPath("my_path_01"), painterSourceCodePath: _getPainterPath("my_path_01_painter"))),
      CustomWidgetItem(widget: Star(), sourceCode: SourceCode(widgetSourceCodePath: _getWidgetPath("star"), painterSourceCodePath: _getPainterPath("star_painter"))),
      CustomWidgetItem(widget: CircleLine(), sourceCode: SourceCode(widgetSourceCodePath: _getWidgetPath("circle_line"), painterSourceCodePath: _getPainterPath("circle_line_painter"))),
      CustomWidgetItem(widget: Triangle(), sourceCode: SourceCode(widgetSourceCodePath: _getWidgetPath("triangle"), painterSourceCodePath: _getPainterPath("triangle_painter"))),
    ];
    return CanvasItemViewer(items: items,);
  }
  String _getWidgetPath(String fileName){
    return "lib/widget/basic/$fileName.dart";
  }
  String _getPainterPath(String fileName){
    return "lib/painter/basic/$fileName.dart";
  }

}