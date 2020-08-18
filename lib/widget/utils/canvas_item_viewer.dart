import 'package:flutter/material.dart';
import 'package:flutter_canvas/model/custom_widget_item.dart';
import 'package:flutter_canvas/screen/source_code_view_screen.dart';

class CanvasItemViewer extends StatelessWidget {
  final List<CustomWidgetItem> items;
  CanvasItemViewer({this.items});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(items.length, (index) => Card(
        elevation: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            items[index].widget,
            Padding(padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Expanded(child: Text(items[index].description, style: TextStyle(fontStyle: FontStyle.italic),)),
                GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(offset: Offset(2, 2),color: Colors.black.withOpacity(0.5))
                        ]
                      ),
                      child: Icon(Icons.code,size: 50),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_){
                        return SourceCodeViewScreen(items[index].sourceCode);
                      }));
                    },
                ),
              ],
            ))
          ],
        ),
      )),
    );
  }
}