import 'package:flutter/material.dart';

class DynamicWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic Widget"),
      ),
      body: Center(
        child: Text("This is a text message"),
      ),
    );
  }
}
