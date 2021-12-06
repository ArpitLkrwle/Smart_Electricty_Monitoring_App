   import 'dart:math';

import 'package:first_app/values.dart';

var summ;
  var maxx;
  List<double> _spendingsList = List.generate(7, (index) => 0);
  _generateWeeklyReport() {
    if (_spendingsList.isNotEmpty) {
      _spendingsList.clear();
      _spendingsList = List.generate(7, (index) => 0);
    }
    for (int i = 0; i < Values.SelectedDocs.length; i++) {
      _spendingsList[(Values.SelectedDocs[i]['Day'])] =
          double.parse((Values.SelectedDocs[i]['Units']));
    }
    //summ = _spendingsList.sum;
    maxx = _spendingsList.reduce(max) + 5;
  }