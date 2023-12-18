import 'package:bmi_app/screens/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(bmiApp());
}

class bmiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'BMI Calculator',
        theme: ThemeData(primaryColor: Colors.purple),
        home: SplashScreen());
  }
}

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => homepageState();
}

class homepageState extends State<homePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();
  var result = "";
  // var bgColor = Colors.blueGrey[100];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xffcd9cf2),
            Color(0xfff6f3ff),
          ],
          begin: FractionalOffset(0.0, 0.1),
          end: FractionalOffset(1.0, 1.1),
        )),
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("BMI Calculator",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Barlow")),
                SizedBox(
                  height: 21,
                ),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text("Enter your Weight in KG"),
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text("Enter your height in feet"),
                    prefixIcon: Icon(Icons.height),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: inchController,
                  decoration: InputDecoration(
                    label: Text("Enter your height in inches"),
                    prefixIcon: Icon(Icons.height),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                ElevatedButton(
                    onPressed: () {
                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inch = inchController.text.toString();

                      if (wt != "" && ft != "" && inch != "") {
                        //bmi calculation
                        var iWt = int.parse(wt);
                        var iFt = int.parse(ft);
                        var iInch = int.parse(inch);

                        var tInch = (iFt * 12) + iInch;
                        var tCm = tInch * 2.54;
                        var tM = tCm / 100;

                        var bmi = iWt / (tM * tM);

                        var msg = "";

                        if (bmi > 25) {
                          msg = "You are overweight!!!";
                          // bgColor = Colors.orange.shade400;
                        } else if (bmi < 18) {
                          msg = "You are underweight!!!";
                          // bgColor = Colors.red.shade400;
                        } else {
                          msg = "You are healthy!!!";
                          // bgColor = Colors.green.shade400;
                        }

                        setState(() {
                          result = "$msg \n BMI is ${bmi.toStringAsFixed(2)}";
                        });
                      } else {
                        setState(() {
                          result = "Please enter all the values";
                        });
                      }
                      ;
                    },
                    child: Text("calculate")),
                SizedBox(
                  height: 11,
                ),
                Text(
                  "$result",
                  style: TextStyle(fontSize: 19),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
