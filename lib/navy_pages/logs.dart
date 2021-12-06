// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/values.dart';
import 'package:first_app/widget/bar_chart.dart';
import 'package:first_app/widget/logs_widget.dart';
import 'package:first_app/widget/pie_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Logs extends StatefulWidget {
  const Logs({
    Key key,
  }) : super(key: key);

  @override
  State<Logs> createState() => _LogsState();
}

class _LogsState extends State<Logs> {
  String userId = Values.userId;
  bool _showBarChart = false;
  // final Stream<QuerySnapshot> readingStream =FirebaseFirestore.instance.collection('userId').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection(userId).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final List storedocs = [];
          snapshot.data.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storedocs.add(a);
            Values.SelectedDocs = storedocs;
            a['id'] = document.id;
          }).toList();
          var size = MediaQuery.of(context).size;

          return Scaffold(
            appBar: AppBar(
                title: Text("Smart Bijli"),
                foregroundColor: Colors.white,
                backgroundColor: Colors.yellow[600]),
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.bottomCenter,
                  colors: const [
                    Colors.deepPurple,
                    Colors.pink,
                  ],
                )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    spacing: 50,
                    children: <Widget>[
                      if (storedocs.isEmpty) ...{
                        Center(
                          child: Column(
                            children: [
                              Text(" No readings Received yet"),
                            ],
                          ),
                        )
                      } else ...{
                        Container(
                          height: 300,
                          width: double.infinity,
                          child: GestureDetector(
                            onHorizontalDragEnd: (details) {
                              int sensitivity = 8;
                              if (details.primaryVelocity > sensitivity ||
                                  details.primaryVelocity < -sensitivity) {
                                setState(() {
                                  _showBarChart = !_showBarChart;
                                });
                              }
                            },
                            child: _showBarChart
                                ? WeekPieChart()
                                : BarChartSample1(),
                          ),
                        ),

                        // SizedBox(
                        //   height: 20,
                        // ),
                        for (int i = 0; i < storedocs.length; i++) ...[
                          // if (storedocs[i]['UserId'] == userId) ...{

                          logss(
                              storedocs[i]['Units'],
                              storedocs[i]['Time'].toDate(),
                              storedocs[i]['id']),
                          //  }
                        ],
                      }
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
