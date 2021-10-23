
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';


class home_page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
       AppBar(
         title: const Text('Home'),
         backgroundColor: Colors.redAccent,
         automaticallyImplyLeading: false,
         ),
      body: const Center(
          child: Text("This is the screen hiii after Introduction")),
    );
  }
}
