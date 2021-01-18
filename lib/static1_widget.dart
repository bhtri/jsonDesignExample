import 'package:dynamic_widget/dynamic_widget/basic/dynamic_widget_json_exportor.dart';
import 'package:dynamic_widget/dynamic_widget/scrolling/listview_widget_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StaticLoginWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // implement createState
    return StaticLoginWidgetState();
  }
}

class StaticLoginWidgetState extends State<StaticLoginWidget> {
  GlobalKey key = GlobalKey();

  void click() {
    print("click");
  }

  @override
  Widget build(BuildContext context) {
    // implement build

    final containInfo1 = Container(
      margin: EdgeInsets.all(5),
      height: 200,
      child: Text(
        "ログイン情報を入力してください",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: Colors.cyan,
        ),
      ),
    );

    final containInfo2 = Container(
      margin: EdgeInsets.all(5),
      child: Text(
        "OpenCV Version ",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );

    final email = Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black12)),
        child: TextField(
          decoration: InputDecoration(
            icon: Icon(
              Icons.account_circle,
              size: 32,
            ),
            border: InputBorder.none,
            hintText: 'ユーザID',
          ),
        ));

    final password = Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black12)),
        child: TextField(
          obscureText: true,
          obscuringCharacter: "●",
          decoration: InputDecoration(
            icon: Icon(Icons.lock, size: 32),
            border: InputBorder.none,
            hintText: 'パスワード`',
            suffixIcon: IconButton(
              icon: Icon(Icons.visibility),
              onPressed: null,
            ),
          ),
        ));

    final loginButtion = Container(
      margin: EdgeInsets.all(15),
      child: Material(
        borderOnForeground: true,
        color: Colors.green,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: MaterialButton(
          minWidth: 200,
          child: Text(
            "Login",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () {},
        ),
      ),
    );

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
              body: Center(
                child: ListViewWidget(
                  ListViewParams(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                    ),
                    children: [
                      containInfo1,
                      containInfo2,
                      email,
                      password,
                      loginButtion,
                    ],
                  ),
                  context,
                ),
              ),
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
