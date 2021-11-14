import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class About extends StatefulWidget {
  const About({Key key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
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
          title: Text("About us"),
          foregroundColor: Colors.white,
          backgroundColor: Colors.yellow[600]),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(" About the Team"),
          Divider(
            thickness: 2,
          ),
          Container(
              child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      'https://img.icons8.com/external-vitaliy-gorbachev-flat-vitaly-gorbachev/58/000000/external-woman-back-to-school-vitaliy-gorbachev-flat-vitaly-gorbachev-2.png'),
                  backgroundColor: Colors.transparent,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Anagha Chaudhari"),
                  Text(" Project Guide"),
                ],
              ),
            ],
          )),
          Divider(
            thickness: 0.5,
          ),
          Container(
              child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      'https://img.icons8.com/external-vitaliy-gorbachev-flat-vitaly-gorbachev/58/000000/external-woman-back-to-school-vitaliy-gorbachev-flat-vitaly-gorbachev-2.png'),
                  backgroundColor: Colors.transparent,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sejal Ranglani"),
                  Text(" Roll no 223"),
                ],
              ),
            ],
          )),
          Divider(
            thickness: 0.5,
          ),
          Container(
              child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      'https://img.icons8.com/external-vitaliy-gorbachev-flat-vitaly-gorbachev/58/000000/external-woman-back-to-school-vitaliy-gorbachev-flat-vitaly-gorbachev-2.png'),
                  backgroundColor: Colors.transparent,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Pankhudi Dhongade"),
                  Text("  Roll no.214 "),
                ],
              ),
            ],
          )),
          Divider(
            thickness: 0.5,
          ),
          Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                        'https://img.icons8.com/external-vitaliy-gorbachev-lineal-color-vitaly-gorbachev/60/000000/external-man-avatars-vitaliy-gorbachev-lineal-color-vitaly-gorbachev-17.png'),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Arpit Lekurwale"),
                    Text(" Roll no 270"),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
          ),
          const Spacer(),
          RaisedButton(
              onPressed: signOut,
              child: const Text('sign out',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              )),
          const Spacer(),
          const Text(" Made at YCCE ⚙️"),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
