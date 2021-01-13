import 'package:dynamic_widget/dynamic_widget/basic/dynamic_widget_json_exportor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StaticWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // implement createState
    return StaticWidgetState();
  }
}

class StaticWidgetState extends State<StaticWidget> {
  GlobalKey key = GlobalKey();

  void click() {
    print("click");
  }

  @override
  Widget build(BuildContext context) {
    // implement build
    return Column(
      children: [
        Expanded(
          child: DynamicWidgetJsonExportor(
            key: key,
            child: Scaffold(
                appBar: AppBar(
                  title: Text("Static Widget"),
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
                body: Container(
                  child: Column(
                    children: [
                      Text("row1"),
                      Text("row2"),
                      Text("row3"),
                    ],
                  ),
                )),
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
