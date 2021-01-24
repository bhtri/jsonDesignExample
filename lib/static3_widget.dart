import 'package:dynamic_widget/dynamic_widget/basic/dynamic_widget_json_exportor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Static3Widget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Static3WidgetState();
  }
}

class Static3WidgetState extends State<Static3Widget> {
  GlobalKey key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: DynamicWidgetJsonExportor(
          key: key,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                "This is the title of AppBar",
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 20.0,
                ),
              ),
              actions: [
                SizedBox(
                  width: 40.0,
                  height: 40.0,
                  child: RaisedButton(
                    onPressed: () {},
                    color: Colors.blue,
                    padding: const EdgeInsets.all(0),
                    child: Icon(
                      Icons.list,
                      size: 40.0,
                    ),
                  ),
                ),
              ],
            ),
            body: Text("This is body"),
          ),
        )),
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
