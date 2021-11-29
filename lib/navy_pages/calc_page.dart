import 'package:first_app/navy_pages/grid_of_stats.dart';
import 'package:flutter/material.dart';
import 'package:first_app/values.dart';
import 'package:flutter/services.dart';

class calc_page extends StatefulWidget {
  calc_page({
    Key key,
  }) : super(key: key);

  @override
  State<calc_page> createState() => _calc_pageState();
}

// ignore: camel_case_types
class _calc_pageState extends State<calc_page> {
  final unitsController = TextEditingController();
  final wattageController = TextEditingController();
  final hoursController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Smart Bijli"),
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
                  child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly,
                ],
                controller: unitsController,
                decoration: const InputDecoration(
                  labelText: 'Units',
                  prefixIcon: Icon(Icons.bolt_sharp),
                ),
               
              )),
              const SizedBox(
                height: 50,
              ),
              Container(
                  child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly,
                ],
                controller: wattageController,
                decoration: const InputDecoration(
                  labelText: 'Wattage',
                  prefixIcon: Icon(Icons.electrical_services),
                ),
                // onSubmitted: (input) {
                //   setState(() {
                //     Values.wattage = double.parse(input);
                //   });
                // }
              )),
              const SizedBox(
                height: 50,
              ),
              Container(
                  child: TextFormField(
                controller: hoursController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                    labelText: 'Hours', prefixIcon: Icon(Icons.lock_clock)),
                // onSubmitted: (input) {
                //   setState(() {
                //     Values.hours = double.parse(input);
                //   });
                // }
              )),
              const SizedBox(
                height: 50,
              ),

              // new Text("\n $hours"),
              // new Text("\n $wattage"),
              // new Text("\n $units"),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                  elevation: 10,
                  child: Text("Submit"),
                  onPressed: () { // assign the values to the respective variables
                    Values.hours = double.parse(hoursController.text); // .text method is to used to extract the string value
                    Values.units = double.parse(unitsController.text); // that string value is later converted to double
                    Values.wattage = double.parse(wattageController.text);
                    //print(Values.hours);
                    Navigator.of(context).push(MaterialPageRoute( // to push the context of statistics page
                        builder: (context) => grid_of_stats()));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
