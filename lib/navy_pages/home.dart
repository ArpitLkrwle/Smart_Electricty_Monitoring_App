import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:authentification/Start.dart';

class home extends StatelessWidget {
  const home({
    Key key,
    @required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: Text("Smart Bijli"),
            foregroundColor: Colors.white,
            backgroundColor: Colors.yellow[600]),
            
      body: Column(
        children: [
          SizedBox(height: 20.0),
          Image(
            image: AssetImage("images/welcome.jpg"),
            fit: BoxFit.contain,
          ),
          SizedBox(height: 70.0),
          Text(
            "Hello ${user.displayName} you are Logged in as ${user.email}",
            style: TextStyle(
                fontSize: 20.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}