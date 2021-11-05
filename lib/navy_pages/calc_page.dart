import 'package:first_app/navy_pages/grid_of_stats.dart';
import 'package:flutter/material.dart';
import 'package:first_app/values.dart';

class calc_page extends StatefulWidget {
  calc_page({
    Key key,
  }) : super(key: key);

  @override
  State<calc_page> createState() => _calc_pageState();
}

// ignore: camel_case_types
class _calc_pageState extends State<calc_page> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: Text("Smart Bijli"),
            foregroundColor: Colors.white,
            backgroundColor: Colors.yellow[600]),
            
      backgroundColor: Colors.blueGrey[50],
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
                          Values.units = double.parse(input);
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
                          Values.wattage = double.parse(input);
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
                          Values.hours = double.parse(input);
                        });
                      })),
              SizedBox(
                height: 20,
              ),

              // new Text("\n $hours"),
              // new Text("\n $wattage"),
              // new Text("\n $units"),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                  elevation: 10,
                  child: Text("Submit"),
                  onPressed: () {

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => grid_of_stats()));
                  })
            ],
          ),
        ),
      ),
    );
  }
}


