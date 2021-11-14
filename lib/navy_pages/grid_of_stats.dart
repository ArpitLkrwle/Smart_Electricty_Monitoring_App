import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_app/values.dart';

class grid_of_stats extends StatelessWidget {
  double bill;
  double cfp;
  double level;
  double cfp1;
  double applianceCost;
  double monthh;
  double yearr;

  billing() {
    double units = Values.units;
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

    cfp1 = (Values.wattage * Values.hours) / 1000 * 0.00031;
    applianceCost = (Values.wattage * Values.hours) / 1000 * level;
    monthh = applianceCost * 30;
    yearr = monthh * 12;
  }

  @override
  Widget build(BuildContext context) {
    billing();
    return Scaffold(
      appBar: AppBar(
        title: Text(" Your Application Ratings are... "),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
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
          padding: const EdgeInsets.only(top: 40.0),
          child: GridView.count(
            padding: const EdgeInsets.all(10),
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            crossAxisCount: 2,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: const [
                        Text("Electricity", style: TextStyle(fontSize: 25)),
                        Spacer(),
                        Icon(CupertinoIcons.book),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 0.5,
                    ),
                    const LinearProgressIndicator(
                      color: Colors.greenAccent,
                      value: 0.3,
                    ),
                    const SizedBox(
                      height: 35,
                    ),

                    Center(
                        child: Text(
                      '\u{20B9} $applianceCost',
                      style: const TextStyle(fontSize: 35),
                    )),
                    // SizedBox(
                    //   height: 30,
                    // ),
                  ],
                ),
                decoration: grid_decoration(),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: const [
                        Text("Monthly Cost", style: TextStyle(fontSize: 20)),
                        Spacer(),
                        Icon(CupertinoIcons.book),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 0.5,
                    ),
                    LinearProgressIndicator(
                      value: 0.7,
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      height: 35,
                    ),

                    Center(
                        child: Text(
                      '\u{20B9} $monthh',
                      style: TextStyle(fontSize: 35),
                    )),
                    // SizedBox(
                    //   height: 30,
                    // ),
                  ],
                ),
                decoration: grid_decoration(),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: const [
                        Text("Yearly Cost", style: TextStyle(fontSize: 20)),
                        Spacer(),
                        Icon(CupertinoIcons.book),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 0.5,
                    ),
                    LinearProgressIndicator(
                      value: 0.3,
                    ),
                    SizedBox(
                      height: 35,
                    ),

                    Center(
                        child: Text(
                      '\u{20B9} $yearr',
                      style: TextStyle(fontSize: 20),
                    )),
                    // SizedBox(
                    //   height: 30,
                    // ),
                  ],
                ),
                decoration: grid_decoration(),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: const [
                        Text("Carbon Emissions",
                            style: TextStyle(fontSize: 15)),
                        Spacer(),
                        Icon(CupertinoIcons.book),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 0.5,
                    ),
                    LinearProgressIndicator(
                      color: Colors.purple,
                      value: 0.6,
                    ),
                    SizedBox(
                      height: 35,
                    ),

                    Center(
                        child: Text(
                      '$cfp1 ',
                      style: TextStyle(fontSize: 35),
                    )),
                    // SizedBox(
                    //   height: 30,
                    // ),
                  ],
                ),
                decoration: grid_decoration(),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: const [
                        Text("Electricity", style: TextStyle(fontSize: 25)),
                        Spacer(),
                        Icon(CupertinoIcons.book),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 0.5,
                    ),
                    LinearProgressIndicator(
                      value: 0.3,
                    ),
                    SizedBox(
                      height: 35,
                    ),

                    Center(
                        child: Text(
                      '\u{20B9} 200',
                      style: TextStyle(fontSize: 35),
                    )),
                    // SizedBox(
                    //   height: 30,
                    // ),
                  ],
                ),
                decoration: grid_decoration(),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: const [
                        Text("Electricity", style: TextStyle(fontSize: 25)),
                        Spacer(),
                        Icon(CupertinoIcons.book),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 0.5,
                    ),
                    LinearProgressIndicator(
                      value: 0.3,
                    ),
                    SizedBox(
                      height: 35,
                    ),

                    Center(
                        child: Text(
                      '\u{20B9} 200',
                      style: TextStyle(fontSize: 35),
                    )),
                    // SizedBox(
                    //   height: 30,
                    // ),
                  ],
                ),
                decoration: grid_decoration(),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Text("$bill"),
                // color: Colors.teal[100],
                decoration: grid_decoration(),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    //LinearProgressIndicator(
                    //   value: 30,
                    // ),
                    SizedBox(
                      height: 15,
                    ),
                    Text("Electricty"),
                    SizedBox(
                      height: 30,
                    ),
                    Text("$bill"),
                    SizedBox(
                      height: 30,
                    ),
                    Icon(CupertinoIcons.book)
                  ],
                ),
                decoration: grid_decoration(),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Text('$applianceCost'),
                decoration: grid_decoration(),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Appliance Cost for 10 days'),
                decoration: grid_decoration(),
              ),
            ],
          ),
        ),
      ),
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
}
