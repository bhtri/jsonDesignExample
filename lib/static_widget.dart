import 'package:flutter/material.dart';

class StaticWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Static Widget"),
      ),
      body: Center(
        child: Text("This is a text message"),
      ),
    );
  }
}
