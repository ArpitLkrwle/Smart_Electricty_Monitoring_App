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
  int hours, wattage, units;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[100],
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 50,
          ),
          Container(
              child: TextFormField(
                  validator: (input) {
                    if (input.isEmpty) return 'Enter Readings';
                  },
                  decoration: InputDecoration(
                      labelText: 'Units', prefixIcon: Icon(Icons.bolt)),
                  onSaved: (input) => units = int.parse(input)
                  )
                  ),
          SizedBox(
            height: 50,
          ),
          Container(
              child: TextFormField(
                  validator: (input) {
                    if (input.isEmpty) return 'Enter Wattage of your device';
                  },
                  decoration: InputDecoration(
                    labelText: 'Wattage',
                    prefixIcon: Icon(Icons.device_hub),
                  ),
                  onSaved: (input) => wattage = int.parse(input)
                  )
                  ),
          SizedBox(
            height: 50,
          ),
          Container(
              child: TextFormField(
                  validator: (input) {
                    if (input.isEmpty) return 'Enter Hours of Usage';
                  },
                  decoration: InputDecoration(
                      labelText: 'Hours', prefixIcon: Icon(Icons.lock_clock)),
                  onSaved: (input) => hours = int.parse(input)
                  )
                  ),

          SizedBox(
            height: 10,
          ),
          
          RaisedButton(
              padding: EdgeInsets.fromLTRB(70, 10, 70, 10), onPressed: () {}),
        ],
      ),
    );
  }
}
