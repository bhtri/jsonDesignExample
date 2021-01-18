import 'package:flutter/material.dart';
import 'package:jsonDesignExample/dynamic_widget.dart';
import 'package:jsonDesignExample/static1_widget.dart';
import 'package:jsonDesignExample/static2_widget.dart';

class MenuPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // implement createState
    return _MenuPageState();
  }
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    // implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("menu"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DynamicWidget(),
                  ),
                );
              },
              child: Text("Dynamic"),
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StaticLoginWidget(),
                  ),
                );
              },
              child: Text("Static 1: Login"),
              color: Colors.red,
              shape: StadiumBorder(),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Static2Widget(),
                  ),
                );
              },
              child: Text("Static 2: List"),
              color: Colors.red,
              shape: StadiumBorder(),
            ),
          ],
        ),
      ),
    );
  }
}
