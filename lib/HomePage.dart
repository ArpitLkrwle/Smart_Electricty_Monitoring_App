// ignore_for_file: deprecated_member_use, non_constant_identifier_names, file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:authentification/Start.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'navy_pages/home.dart';
import 'navy_pages/calc_page.dart';
import 'navy_pages/grid_of_stats.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;
  int _currentIndex = 0;
  PageController _page_controller;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("start");
      }
    });
  }

  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        user = firebaseUser;
        isloggedin = true;
      });
    }
  }

  signOut() async {
    _auth.signOut();
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  @override
  void initState() {
    super.initState();
    checkAuthentification();
    getUser();
    _page_controller = PageController();
  }

  @override
  void dispose() {
    _page_controller.dispose();
    super.dispose();
  }

  int units, wattage, hours;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Smart Bijli")),
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: Colors.yellow[600],
          selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(() => _currentIndex = index);
            _page_controller.jumpToPage(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(title: Text('Home'), icon: Icon(Icons.home)),
            BottomNavyBarItem(
                title: Text('Sign out'), icon: Icon(Icons.logout_sharp)),
            BottomNavyBarItem(title: Text('Stats'), icon: Icon(Icons.book)),
            BottomNavyBarItem(
                title: Text('Settings'), icon: Icon(Icons.settings)),
          ],
        ),
        body: Container(
            child: !isloggedin
                ? Center(child: CircularProgressIndicator())
                : SizedBox.expand(
                    child: PageView(
                      controller: _page_controller,
                      onPageChanged: (index) {
                        setState(() => _currentIndex = index);
                      },
                      children: <Widget>[
                        home(user: user),
                        // ignore: avoid_unnecessary_containers
                        Container(
                            child: RaisedButton(
                                padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                                onPressed: signOut,
                                child: Text('Click her to get yourself Out',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold)),
                                color: Colors.purple[300],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ))),
                        calc_page(),
                        grid_of_stats(),
                      ],
                    ),
                  )));
  }
}
