// ignore_for_file: deprecated_member_use, non_constant_identifier_names, file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/navy_pages/logs.dart';
import 'package:flutter/material.dart';
// import 'package:authentification/Start.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'navy_pages/home.dart';
import 'navy_pages/calc_page.dart';
import 'navy_pages/about.dart';
import 'values.dart';

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

  DateTime selectedDate = Values.selectedDatee;

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavyBar(
          curve: Curves.easeIn,
          backgroundColor: Colors.yellow[600],
          selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(() => _currentIndex = index);
            _page_controller.jumpToPage(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                title: Text('Home'),
                icon: Icon(Icons.home),
                inactiveColor: Colors.white,
                activeColor: Colors.blueGrey[900]),
            BottomNavyBarItem(
                title: Text('Sign out'),
                icon: Icon(Icons.logout_sharp),
                inactiveColor: Colors.white,
                activeColor: Colors.blueGrey[900]),
            BottomNavyBarItem(
                title: Text('Stats'),
                icon: Icon(Icons.book),
                inactiveColor: Colors.white,
                activeColor: Colors.blueGrey[900]),
            BottomNavyBarItem(
                title: Text('Settings'),
                icon: Icon(Icons.settings),
                inactiveColor: Colors.white,
                activeColor: Colors.blueGrey[900]),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            add_reading(context);
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.green[300],
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
                        Logs(),
                        calc_page(),
                        const About(),
                      ],
                    ),
                  )));
  }


  Future<dynamic> add_reading(BuildContext context) {
    return showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0))),
              context: context,
              builder: (BuildContext bc) {
                return Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .40,
                    child: Column(children: <Widget>[
                      Text("Add Your Readings",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Your Readings',
                          ),
                        ),
                      ),
                      Text(
                        "${selectedDate.toLocal()}".split(' ')[0],
                        style: TextStyle(
                            fontSize: 55, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      RaisedButton(
                        onPressed: () => _selectDate(context),
                        child: Text(
                          'Select date',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        color: Colors.greenAccent,
                      ),
                    ]),
                  ),
                );
              });
  }
}
