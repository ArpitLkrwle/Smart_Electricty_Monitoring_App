
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Logs extends StatefulWidget {
  const Logs({
    Key key,
  }) : super(key: key);

  @override
  State<Logs> createState() => _LogsState();
}

class _LogsState extends State<Logs> {
final FirebaseAuth _auth = FirebaseAuth.instance;

signOut() async {
    _auth.signOut();
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
            title: Text("Smart Bijli"),
            foregroundColor: Colors.white,
            backgroundColor: Colors.yellow[600]),

        body: Center(
          child: RaisedButton(
              padding:
                  const EdgeInsets.fromLTRB(30, 10, 30, 10),
              onPressed: signOut,
              child: const Text(
                  'Click her to get yourself Out',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold)),
              color: Colors.purple[200],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              )),
        ));
  }
}