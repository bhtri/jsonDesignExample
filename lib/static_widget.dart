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

  @override
  Widget build(BuildContext context) {
    // implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Static Widget"),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              print("click");
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: DynamicWidgetJsonExportor(
              key: key,
              child: Center(
                child: Column(
                  children: [
                    Text("data"),
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.blue),
                    ),
                    Text(
                      "qwertyuiopsadfghjklxcvbnm,.dfghjkcdfvgbhnjdcfvgbhnj",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        print("click");
                      },
                      child: Text("button"),
                    )
                  ],
                ),
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              var exportor = key.currentWidget as DynamicWidgetJsonExportor;
              var exportJsonString = exportor.exportJsonString();

              // クリップボードにコピーする
              // https://qiita.com/sekitaka_1214/items/24f021605ef4961c746e
              final data = ClipboardData(text: exportJsonString);
              Clipboard.setData(data);
            },
            child: Text("export"),
          )
        ],
      ),
    );
  }
}
