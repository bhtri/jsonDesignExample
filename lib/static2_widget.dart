import 'dart:math';
import 'dart:ui';

import 'package:dynamic_widget/dynamic_widget/basic/dynamic_widget_json_exportor.dart';
import 'package:dynamic_widget/dynamic_widget/scrolling/listview_widget_parser.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Static2Widget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // implement createState
    return Static2WidgetState();
  }
}

class Static2WidgetState extends State<Static2Widget> {
  GlobalKey key = GlobalKey();
  var items =
      List<String>.generate(20, (index) => "Item $index: ${WordPair.random()}");

  void click() {
    print("click");
  }

  List<Widget> _buildWidgetItem() {
    List<Widget> list = items.map((item) {
      int s = 15 + Random().nextInt(10);
      TextStyle ts = TextStyle();

      switch (items.indexOf(item) % 5) {
        case 0:
          ts = GoogleFonts.lato(
            textStyle: TextStyle(
              color: Colors.black26,
              fontSize: s * 1.0,
            ),
          );
          break;
        case 1:
          ts = GoogleFonts.abel(
            textStyle: TextStyle(
              color: Colors.blueAccent,
              fontSize: s * 1.0,
            ),
          );
          break;
        case 2:
          ts = GoogleFonts.ultra(
            textStyle: TextStyle(
              color: Colors.greenAccent,
              fontSize: s * 1.0,
            ),
          );
          break;
        case 3:
          ts = GoogleFonts.titilliumWeb(
            textStyle: TextStyle(
              color: Colors.pink,
              fontSize: s * 1.0,
            ),
          );
          break;
        case 4:
          ts = GoogleFonts.dmSerifDisplay(
            textStyle: TextStyle(
              color: Colors.cyan,
              fontSize: s * 1.0,
            ),
          );
          break;
        default:
      }

      return ListTile(
        title: Text(
          item,
          textAlign: TextAlign.center,
          style: ts,
        ),
      );
    }).toList();

    list.add(ListTile(
      title: RaisedButton(
        onPressed: () {
          var nextItems = List<String>.generate(20, (index) {
            var itemID = index + items.length;
            return "Item $itemID: ${WordPair.random()}";
          });
          setState(() {
            items.addAll(nextItems);
          });
        },
        child: Text("Load more"),
      ),
    ));

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: DynamicWidgetJsonExportor(
            key: key,
            child: Scaffold(
              appBar: AppBar(
                title: Text("List View"),
                centerTitle: true,
                backgroundColor: Colors.blue,
                actions: [
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: click,
                    child: Icon(
                      Icons.library_add,
                      size: 40.0,
                    ),
                  )
                ],
              ),
              body: ListViewWidget(
                  ListViewParams(
                    children: this._buildWidgetItem(),
                  ),
                  context),
            ),
          ),
        ),
        RaisedButton(
          child: Text("export"),
          onPressed: () {
            var exportor = key.currentWidget as DynamicWidgetJsonExportor;
            var exportJsonString = exportor.exportJsonString();

            final data = ClipboardData(text: exportJsonString);
            Clipboard.setData(data);
            print("copyed");
          },
        ),
      ],
    );
  }
}
