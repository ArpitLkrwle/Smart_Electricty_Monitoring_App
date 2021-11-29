import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/homepage.dart';
import 'package:first_app/login_pages/login.dart';
import 'package:first_app/login_pages/sign_up.dart';
import 'package:first_app/login_pages/start.dart';
import 'package:first_app/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(App());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
        //debugShowCheckedModeBanner: false, //if this is off upar debug mode likh ke aayega
        theme: ThemeData(primarySwatch: Colors.blue),
        home: OnBoardingPage(),
        routes: <String, WidgetBuilder>{
          "Login": (BuildContext context) => login(),
          "SignUp": (BuildContext context) => SignUp(),
          "start": (BuildContext context) => Start(),
        });
  }
}
