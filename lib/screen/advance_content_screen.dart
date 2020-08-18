import 'package:flutter/material.dart';
import 'package:flutter_canvas/model/custom_widget_item.dart';
import 'package:flutter_canvas/model/source_code.dart';
import 'package:flutter_canvas/widget/advance/analog_clock.dart';
import 'package:flutter_canvas/widget/advance/circle_progressbar.dart';
import 'package:flutter_canvas/widget/advance/circle_star.dart';
import 'package:flutter_canvas/widget/advance/circle_travell.dart';
import 'package:flutter_canvas/widget/advance/complex_shape.dart';
import 'package:flutter_canvas/widget/advance/complex_shape_01.dart';
import 'package:flutter_canvas/widget/advance/complex_shape_01_selectable.dart';
import 'package:flutter_canvas/widget/advance/galaxy.dart';
import 'package:flutter_canvas/widget/advance/galaxy_animation.dart';
import 'package:flutter_canvas/widget/advance/google_icon.dart';
import 'package:flutter_canvas/widget/advance/open_umbrellar.dart';
import 'package:flutter_canvas/widget/advance/open_umbrellar_animation.dart';
import 'package:flutter_canvas/widget/advance/pei_chart.dart';
import 'package:flutter_canvas/widget/advance/segmented_ring.dart';
import 'package:flutter_canvas/widget/advance/speed_tracker.dart';
import 'package:flutter_canvas/widget/utils/canvas_item_viewer.dart';

class AdvanceContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = [
      CustomWidgetItem(widget: PeiChart(), sourceCode: SourceCode(widgetSourceCodePath: _getWidgetPath("pei_chart"), painterSourceCodePath: _getPainterPath("pei_chart_painter"))),
      CustomWidgetItem(widget: AnalogClock(), sourceCode: SourceCode(widgetSourceCodePath: _getWidgetPath("analog_clock"), painterSourceCodePath: _getPainterPath("analog_clock_painter"))),
      CustomWidgetItem(widget: GoogleIcon(), sourceCode: SourceCode(widgetSourceCodePath: _getWidgetPath("google_icon"), painterSourceCodePath: _getPainterPath("google_icon_painter"))),
      CustomWidgetItem(widget: CircleStar(), sourceCode: SourceCode(widgetSourceCodePath: _getWidgetPath("circle_star"), painterSourceCodePath: _getPainterPath("circle_star_painter"))),
      CustomWidgetItem(widget: CircleTravell(), sourceCode: SourceCode(widgetSourceCodePath: _getWidgetPath("circle_travell"), painterSourceCodePath: _getPainterPath("circle_travell_painter"))),
      CustomWidgetItem(widget: Galaxy(), sourceCode: SourceCode(widgetSourceCodePath: _getWidgetPath("galaxy"), painterSourceCodePath: _getPainterPath("galaxy_painter"))),
      CustomWidgetItem(widget: GalaxtAnimation(), sourceCode: SourceCode(widgetSourceCodePath: _getWidgetPath("galaxy_animation"), painterSourceCodePath: _getPainterPath("galaxy_animation_painter"))),
      CustomWidgetItem(widget: ComplexShape(), sourceCode: SourceCode(widgetSourceCodePath: _getWidgetPath("complex_shape"), painterSourceCodePath: _getPainterPath("complex_shape_painter"))),
      CustomWidgetItem(widget: ComplexShape01(), sourceCode: SourceCode(widgetSourceCodePath: _getWidgetPath("complex_shape_01"), painterSourceCodePath: _getPainterPath("complex_shape_01_painter"))),
      CustomWidgetItem(widget: ComplexShape01Selectable(), sourceCode: SourceCode(widgetSourceCodePath: _getWidgetPath("complex_shape_01_selectable"), painterSourceCodePath: _getPainterPath("complex_shape_01_selectable_painter")), description: "Hint: click on each items."),
      CustomWidgetItem(widget: CircleProgressbar(), sourceCode: SourceCode(widgetSourceCodePath: _getWidgetPath("circle_progressbar"), painterSourceCodePath: _getPainterPath("circle_progressbar_painter"))),
      CustomWidgetItem(widget: SpeedTracker(), sourceCode: SourceCode(widgetSourceCodePath: _getWidgetPath("speed_tracker"), painterSourceCodePath: _getPainterPath("speed_tracker_painter"))),
      CustomWidgetItem(widget: SegmentedRing(), sourceCode: SourceCode(widgetSourceCodePath: _getWidgetPath("segmented_ring"), painterSourceCodePath: _getPainterPath("segmented_ring_painter"))),
      CustomWidgetItem(widget: OpenUmbrellar(), sourceCode: SourceCode(widgetSourceCodePath: _getWidgetPath("open_umbrellar"), painterSourceCodePath: _getPainterPath("open_umbrellar_painter"))),
      CustomWidgetItem(widget: OpenUmbrellarAnimation(), sourceCode: SourceCode(widgetSourceCodePath: _getWidgetPath("open_umbrellar_animation"), painterSourceCodePath: _getPainterPath("open_umbrellar_animation_painter"))),
    ];
    return CanvasItemViewer(items: items);
  }

   String _getWidgetPath(String fileName){
    return "lib/widget/advance/$fileName.dart";
  }
  String _getPainterPath(String fileName){
    return "lib/painter/advance/$fileName.dart";
  }
}