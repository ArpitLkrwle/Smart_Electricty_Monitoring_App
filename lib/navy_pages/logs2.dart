//page for no data

import 'package:first_app/values.dart';
import 'package:first_app/widget/logs_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Logs2 extends StatefulWidget {
  const Logs2({
    Key key,
  }) : super(key: key);

  @override
  State<Logs2> createState() => _LogsState2();
}

class _LogsState2 extends State<Logs2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Smart Bijli"),
          foregroundColor: Colors.white,
          backgroundColor: Colors.yellow[600]),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.bottomCenter,
          colors: [
            Colors.deepPurple,
            Colors.pink,
          ],
        )
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: GridView.count(
            childAspectRatio: 3,
            padding: const EdgeInsets.all(10),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 1,
            children: <Widget>[
              
                
                Center(child: Text(" No readings Received yet")),
              
            ],
          ),
        ),
      ),
    );
  }
}
