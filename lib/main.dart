import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'BMI App',
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new bmi();
  }
}

class bmi extends State<Home> {
  final _heightcontroller = new TextEditingController();
  final  _weightcontroller = new TextEditingController();
  final  _agecontroller = new TextEditingController();
  double result = 0.0;
  String result1 = "";

  void bmiresult() {
    setState(() {
      int height = int.parse(_heightcontroller.text);
      int weight = int.parse(_weightcontroller.text);
      int age = int.parse(_agecontroller.text);

      if ((_agecontroller.text.isNotEmpty || age > 0) &&
          (_weightcontroller.text.isNotEmpty || weight > 0) &&
          (_heightcontroller.text.isNotEmpty || height > 0)) {
        result = (weight / (height * height)) * 10000;
        if (result < 18.5) {
          result1 = "Underweight";
        } else if (result < 24.9) {
          result1 = "Normal";
        } else if (result < 29.9) {
          result1 = "Overweight";
        } else {
          result1 = "obese";
        }
      } else {
        result = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(3.0),
          children: <Widget>[
            Image.asset(
              "images/bmi.png",
              height: 130,
              width: 190,
            ),
            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _agecontroller,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: 'Age',
                        hintText: 'Enter your Age',
                        icon: new Icon(Icons.person)),
                  ),
                  new TextField(
                    controller: _heightcontroller,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Height",
                        hintText: "Enter Height in centimeter",
                        icon: new Icon(Icons.graphic_eq)),
                  ),
                  new TextField(
                    controller: _weightcontroller,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: 'Weight',
                        hintText: 'Enter weight in KG',
                        icon: new Icon(Icons.calendar_view_day)),
                  ),
                  Padding(padding: const EdgeInsets.all(10.0)),
                  new Container(
                    alignment: Alignment.center,
                    child: new RaisedButton(
                      onPressed: bmiresult,
                      color: Colors.pink,
                      child: new Text(
                        "Calculate",
                      ),
                      textColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.all(10.0)),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "BMI $result",
                  style: new TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                new Text(
                  "$result1",
                  style: new TextStyle(
                      color: Colors.pink,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.0),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
