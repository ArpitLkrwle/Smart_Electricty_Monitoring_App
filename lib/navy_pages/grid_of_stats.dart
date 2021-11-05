import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_app/values.dart';
class grid_of_stats extends StatelessWidget {
  double bill;
  double cfp;
  double level;
  double cfp1;
  double applianceCost;


  void billing() {
    double units = Values.units;
    if (units <= 100) {
      level = 3.44;
    } else if (units <= 300) {
      level = 7.34;
    } else if (units <= 500) {
      level = 10.36;
    } else {
      level = 11.82;
    }
    bill = (units * level) + 100 + (1.38 * units) + (0.16 * units);
    cfp1 = units * 0.00031;
    applianceCost = (Values.wattage * Values.hours) / 1000 * level;
  }

  @override
  Widget build(BuildContext context) {
    billing();
    return Scaffold(
      appBar: AppBar(
        title: Text("So"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.bottomCenter,
          colors: [
            Colors.deepPurple,
            Colors.pink,
          ],
        )),
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: GridView.count(
            padding: const EdgeInsets.all(10),
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            crossAxisCount: 2,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8),
                child: Text("$bill"),
                // color: Colors.teal[100],
                decoration: grid_decoration(),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    //LinearProgressIndicator(
                    //   value: 30,
                    // ),
                    SizedBox(
                      height: 15,
                    ),
                    Text("Electricty"),
                    SizedBox(
                      height: 30,
                    ),
                    Text("$bill"),
                    SizedBox(
                      height: 30,
                    ),
                    Icon(CupertinoIcons.book)
                  ],
                ),
                decoration: grid_decoration(),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Text('$applianceCost'),
                decoration: grid_decoration(),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Appliance Cost for 10 days'),
                decoration: grid_decoration(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration grid_decoration() {
    return BoxDecoration(
      color: new Color.fromRGBO(0, 0, 0, 0.1),
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ],
    );
  }
}
