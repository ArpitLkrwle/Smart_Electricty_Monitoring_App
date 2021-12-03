// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/values.dart';
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

String userId = Values.userId;

//CollectionReference users = FirebaseFirestore.instance.collection('userId');
Future<void> deleteuser(id) {
  return FirebaseFirestore.instance
      .collection(userId)
      .doc(id)
      .delete()
      .then((value) => print('User deleted'))
      .catchError((error) async => print('Failed to Delete user: $error'));
}

Card logss(String unitss, DateTime dst, String id) {
  double unitsss = double.parse(unitss);
  double billl = roundDouble(billing(unitsss), 2);

  String dt = DateFormat('yMMMMd').format(dst);
  return Card(
    color: Color.fromRGBO(0, 0, 0, 0.1),
    shadowColor: Colors.grey.withOpacity(0.5),

    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(dt, style: TextStyle(fontSize: 15)),
              Spacer(),
              IconButton(
                onPressed: () {
                  deleteuser(id);
                },
                icon: Icon(Icons.delete_outline),
                iconSize: 20,
              ),
            ],
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
                      Text("$unitsss"),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text("    Cost"),
                      Text(": \u{20B9} $billl "),
                    ],
                  ),
                ],
              ),
              Spacer(),
              CircularProgressIndicator(
                value: unitsss / 1000,
              ),
              // SizedBox(
              //   width: 20,
              // ),
            ],
          ),
        ],
      ),
    ),
    // decoration: grid_decoration(),
  );
}

double roundDouble(double billing, int i) {
  double mod = pow(10.0, i);
  return ((billing * mod).round().toDouble() / mod);
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
