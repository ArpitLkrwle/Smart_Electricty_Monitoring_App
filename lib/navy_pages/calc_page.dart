import 'package:first_app/navy_pages/grid_of_stats.dart';
import 'package:flutter/material.dart';

class calc_page extends StatefulWidget {
  calc_page({
    Key key,
  }) : super(key: key);

  @override
  State<calc_page> createState() => _calc_pageState();
}



// ignore: camel_case_types
class _calc_pageState extends State<calc_page> {
  double hours1, wattage1, units1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              Container(
                  child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Units', prefixIcon: Icon(Icons.bolt)),
                      onSubmitted: (input) {
                        setState(() {
                          units1 = double.parse(input);
                        });
                      })),
              SizedBox(
                height: 50,
              ),
              Container(
                  child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Wattage',
                        prefixIcon: Icon(Icons.device_hub),
                      ),
                      onSubmitted: (input) {
                        setState(() {
                          wattage1 = double.parse(input);
                        });
                      })),
              SizedBox(
                height: 50,
              ),
              Container(
                  child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Hours',
                          prefixIcon: Icon(Icons.lock_clock)),
                      onSubmitted: (input) {
                        setState(() {
                          hours1 = double.parse(input);
                        });
                      })),
              SizedBox(
                height: 10,
              ),

              // new Text("\n $hours"),
              // new Text("\n $wattage"),
              // new Text("\n $units"),
              RaisedButton(
                  child: Text("Submit"),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => grid_of_stats(hours1:hours1,wattage1:wattage1,units1:units1)));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
