import 'package:first_app/Start.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:authentification/Start.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;
  int _currentIndex = 0;
  PageController _pageController;

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
        this.user = firebaseUser;
        this.isloggedin = true;
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
    this.checkAuthentification();
    this.getUser();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
 

  int units, wattage, hours;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //!isloggedin
      //     ? Center(child: CircularProgressIndicator())
      //     ://body

      // Container(
      //     child: !isloggedin
      //         ? CircularProgressIndicator()
      //         :

      appBar: AppBar(title: Text("Smart Bijli")),
      body: Container(
        child: !isloggedin
            ? Center(child: CircularProgressIndicator())
            : SizedBox.expand(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() => _currentIndex = index);
                  },
                  children: <Widget>[
                    Column(
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
                    Container(
                        child: RaisedButton(
                            padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                            onPressed: signOut,
                            child: Text('Signout',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                            color: Colors.purple[300],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ))),
                    Container(
                      color: Colors.green[100],
                      child: Column(children: <Widget>[
                        SizedBox(height: 50,),
                         Container(
                      child: TextFormField(
                          validator: (input) {
                            if (input.isEmpty) return 'Enter Readings';
                          },
                          decoration: InputDecoration(
                            labelText: 'Units',
                            prefixIcon: Icon(Icons.bolt)
                          ),
                          onSaved: (input) => units = int.parse(input)
                    )
                      
                      ),
                      SizedBox(height: 50,),
                    Container(
                      child: TextFormField(
                          validator: (input) {
                            if (input.isEmpty) return 'Enter Wattage of your device';
                          },
                          decoration: InputDecoration(
                            labelText: 'Wattage',
                            prefixIcon: Icon(Icons.device_hub),
                          ),
                          onSaved: (input) => wattage = int.parse(input)
                    )
                      
                      ),
                      SizedBox(height: 50,),
                      Container(
                      child: TextFormField(
                          validator: (input) {
                            if (input.isEmpty) return 'Enter Hours of Usage';
                          },
                          decoration: InputDecoration(
                            labelText: 'Hours',
                            prefixIcon: Icon(Icons.lock_clock)
                          ),
                          onSaved: (input) => hours = int.parse(input)
                    )

                    
                      
                      ),
                      SizedBox(height: 10,),
                      RaisedButton(
                      padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                      onPressed: (){
                         Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ToastNoContext(),
              ));
            },
            child: Text("Flutter Toast No Context"),
          ),
                          
    );


                      },
                      child: Text('Submit',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                      color: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    )



                      ],
                    ),
                    ),
                    Container(
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.yellow[600],
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
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
    );
  }
}
