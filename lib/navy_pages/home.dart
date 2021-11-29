import 'package:first_app/widget/bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:authentification/Start.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class home extends StatelessWidget {
  home({
    Key key,
    @required this.user,
  }) : super(key: key);

  final User user;
  DateRangePickerController _dateRangePickerController =
      DateRangePickerController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Row(
              children: [
                Text("Smart Bijli"),
                Spacer(),
                Icon(Icons.lightbulb),
              ],
            ),
            foregroundColor: Colors.white,
            backgroundColor: Colors.yellow[600]),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.0),
                Image(
                  image: AssetImage("images/welcome.jpg"),
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 70.0),
                Text(
                  "Hello ${user.displayName} you are Logged in as ${user.email}",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Card(
                    margin: const EdgeInsets.fromLTRB(50, 150, 50, 150),
                    child: SfDateRangePicker(
                      selectionMode: DateRangePickerSelectionMode.range,
                      onSelectionChanged: _onselectionChanged,
                      showActionButtons: true,
                      controller: _dateRangePickerController,
                      onSubmit: (Object val) {
                        print(val);
                      },
                      onCancel: () {
                        _dateRangePickerController.selectedRange = null;
                      },
                    )
                    ),
                    const BarChartSample1(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onselectionChanged(
      DateRangePickerSelectionChangedArgs dateRangePickerSelectionChangedArgs) {
    print(dateRangePickerSelectionChangedArgs.value);
  }
}
