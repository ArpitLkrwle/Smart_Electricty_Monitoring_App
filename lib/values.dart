import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/navy_pages/home.dart';
import 'package:first_app/widget/logs_widget.dart';

import 'navy_pages/home.dart';
import 'navy_pages/home.dart';
//class to store values

// ignore_for_file: unused_element

class Values {
  static double units = 0, wattage = 0, hours = 0;

  var _readings;
  static DateTime selectedDatee;
  static String userId;
  static List SelectedDocs = [];
  // Values(this._selectedDatee);

  // Values.map(dynamic obj) {
  //   this._readings = obj['Readings'];
  //   this._selectedDatee = obj['Selected Date'];
  // }
  // String get readings => _readings;
  // DateTime get selectedDatee=> _selectedDatee;

}

// return StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection(userId).snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             print('Something went Wrong');
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           final List selectedDocs = [];
//           snapshot.data.docs.map((DocumentSnapshot document) {
//             Map b = document.data() as Map<String, dynamic>;
//             selectedDocs.add(b);
//             b['id'] = document.id;
//           }).toList();



List<DateTime> dst = [];
