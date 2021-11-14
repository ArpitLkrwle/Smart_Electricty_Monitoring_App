import 'package:first_app/values.dart';
import 'package:first_app/widget/logss.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Logs extends StatefulWidget {
  const Logs({
    Key key,
  }) : super(key: key);

  @override
  State<Logs> createState() => _LogsState();
}

class _LogsState extends State<Logs> {
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
              if (lst.isEmpty) ...{
                Text(" No readings Received yet"),
              } else
                for (int i = 0; i < lst.length; i++) ...[
                  logss(lst[i], dst[i]),
                ],
            ],
          ),
        ),
      ),
    );
  }
}
