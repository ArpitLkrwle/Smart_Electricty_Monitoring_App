// ignore_for_file: deprecated_member_use, non_constant_identifier_names, file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/navy_pages/logs.dart';
import 'package:flutter/material.dart';
// import 'package:authentification/Start.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:intl/intl.dart';
import 'navy_pages/home.dart';
import 'navy_pages/calc_page.dart';
import 'navy_pages/about.dart';
import 'navy_pages/logs2.dart';
import 'values.dart';
import 'navy_pages/logs.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;
  int _currentIndex = 0;
  PageController _page_controller;
  final readingController = TextEditingController();
  var readings = '';
  final formKey = GlobalKey<FormState>();

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
    if (picked != null && readings != null) {
      setState(() async {
        selectedDate = picked;
        readings = readingController.text;
        addReadings();
      });
    }
  }

  final _dateController = TextEditingController();
  DateTime _pickedDate;

  void _startDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.parse("2020-01-01 00:00:01Z"),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      _pickedDate = value;
      _dateController.text = DateFormat.yMMMd().format(_pickedDate);
    });
  }

  void addReadings() async {
    if (!formKey.currentState.validate()) {
      return;
    }

    print("Value recevied");
    selectedDate = _pickedDate;
    readings = readingController.text;
    Values.units = double.parse(readings);
    lst.add(double.parse(readings));
    dst.add(selectedDate);
    Navigator.pop(context);
    setState(() {});
  }

  void _startAddNew(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => add_reading(context),
      isScrollControlled: true,
    );
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
                title: Text('History'),
                icon: Icon(Icons.book),
                inactiveColor: Colors.white,
                activeColor: Colors.blueGrey[900]),
            BottomNavyBarItem(
                title: Text('Appliance'),
                icon: Icon(Icons.star_border),
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
            _startAddNew(context);
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

  Widget add_reading(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        margin:const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            18,
          ),
        ),
        elevation: 8,
        child: Container(
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  decoration:const InputDecoration(
                    labelText: 'Reading',
                    prefixIcon: Icon(Icons.bolt),
                  ),
                  keyboardType: TextInputType.number,
                  controller: readingController,
                  onFieldSubmitted: (_) => _startDatePicker(),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Readings cannot be empty';
                    }
                    final units = double.tryParse(value);
                    if (units == null) {
                      return 'Please enter numbers only';
                    }
                    if (units <= 0) {
                      return 'units must be greater than 0';
                    }
                    if (units >= 1000000) {
                      return 'units must be less than 100,00,00';
                    }
                    return null;
                  },
                ),
                Container(
                  margin:const EdgeInsets.only(
                    top: 10,
                    bottom: 30,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          readOnly: true,
                          controller: _dateController,
                          decoration: const InputDecoration(
                            labelText: 'Date',
                            prefixIcon: Icon(Icons.calendar_today),
                          ),
                          enableInteractiveSelection: false,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please pick a date';
                            }
                            return null;
                          },
                        ),
                      ),
                      TextButton(
                        onPressed: _startDatePicker,
                        child: Text(
                          'Choose Date',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text("$selectedDate"),
                    const Spacer(),
                    FlatButton(
                      onPressed: addReadings,
                      child:const Text(
                        " Add Readings ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(" $readings"),

                //Text("The value of reading is $readings"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
