import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("About us"),
          foregroundColor: Colors.white,
          backgroundColor: Colors.yellow[600]),
    );
  }
}