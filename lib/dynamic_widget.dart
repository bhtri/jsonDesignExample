import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class DynamicWidget extends StatefulWidget {
  final url = 'https://bhtri.github.io/jsonDesignExample/html/my.json';

  @override
  State<StatefulWidget> createState() {
    // implement createState
    return _DynamicWidgetState();
  }
}

class _DynamicWidgetState extends State<DynamicWidget> {
  @override
  Widget build(BuildContext context) {
    // implement build
    return FutureBuilder(
      builder: (context, AsyncSnapshot<http.Response> snapshot) {
        if (snapshot.hasData) {
          JsonWidgetRegistry.instance.clearValues();
          var widgetJson = jsonDecode(snapshot.data.body);
          var widget = JsonWidgetData.fromDynamic(widgetJson);
          return widget.build(
            context: context,
          );
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
    return await http.get(widget.url);
  }
}
