import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DynamicWidget extends StatelessWidget {
  final url = "https://bhtri.github.io/jsonDesignExample/html/my.json";

  @override
  Widget build(BuildContext context) {
    // implement build
    return FutureBuilder(
      builder: (context, AsyncSnapshot<http.Response> snapshot) {
        if (snapshot.hasData) {
          return DynamicWidgetBuilder.build(
              snapshot.data.body, context, DefaultClickListener());
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
      future: _getWidget(),
    );
  }

  Future<http.Response> _getWidget() async {
    return await http.get(url);
  }
}

class DefaultClickListener implements ClickListener {
  @override
  void onClicked(String event) {
    print("Receive click event: " + event);
  }
}
