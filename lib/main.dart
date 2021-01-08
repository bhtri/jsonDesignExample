import 'package:flutter/material.dart';
import 'package:jsonDesignExample/dynamic_widget.dart';

import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  JsonWidgetRegistry.instance.registerFunctions({
    "noop": ({args, registry}) => () async {
          print("noop");
        },
    "click": ({args, registry}) => () {
          print("click");
        },
    "simplePrintMessage": ({args, registry}) => () {
          print("simplePrintMessage");
        },
    'materialCallback': ({args, registry}) => (Set<MaterialState> states) {
          print("materialCallback");
          const interactiveStates = <MaterialState>{
            MaterialState.pressed,
            MaterialState.focused,
          };
          if (states.any(interactiveStates.contains)) {
            return Colors.blue;
          }
          return Colors.red;
        },
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DynamicWidget(),
    );
  }
}
