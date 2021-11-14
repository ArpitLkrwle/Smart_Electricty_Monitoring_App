import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

double billing(double units) {
  double level;
  double bill;
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
  return bill;
}

Container logss(double unitss, DateTime dst) {
  double unitsss = unitss;
  double billl = billing(unitsss);
  String dt = DateFormat('yMMMMd').format(dst);
  return Container(
    padding: const EdgeInsets.all(8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 5, 10, 1),
          child: Text('$dt', style: TextStyle(fontSize: 17)),
        ),
        Divider(
          thickness: 0.25,
          color: Colors.white,
        ),
        Row(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text("Reading : "),
                    Text(" $unitsss"),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text("     Cost  "),
                    Text("     : \u{20B9} $billl "),
                  ],
                ),
              ],
            ),
            Spacer(),
            CircularProgressIndicator(
              value: unitsss / 1000,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ],
    ),
    decoration: grid_decoration(),
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
