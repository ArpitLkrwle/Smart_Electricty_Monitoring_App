import 'package:flutter/material.dart';

class grid_of_stats extends StatelessWidget {
  double hours1, wattage1, units1;
  double bill;
  double cfp;
  double level;
  double cfp1;
  double appliance_cost;
  grid_of_stats({this.hours1, this.units1, this.wattage1});

  void billing() {
    double units = units1;
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
    cfp1 = units1 * 0.00031;
    appliance_cost = (wattage1 * hours1) / 1000 * level;
  }

  @override
  Widget build(BuildContext context) {
    billing();
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Padding(
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
              child: Text('$cfp1'),
              decoration: grid_decoration(),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Text('$appliance_cost'),
              decoration: grid_decoration(),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text('Appliance Cost for 10 days'),
              decoration: grid_decoration(),
            ),
          ],
        ),
        sizedbox
      ),
    );
  }

  BoxDecoration grid_decoration() {
    return BoxDecoration(
      color: Colors.grey[300],
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
