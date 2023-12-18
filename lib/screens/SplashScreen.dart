import 'dart:async';

import 'package:bmi_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return homePage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade300,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "BMI Calculator",
              style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: "Barlow"),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 70.0,
              ),
              child: Text(" ~By Maharshi",
                  style: TextStyle(
                      fontSize: 24, color: Colors.white, fontFamily: "roboto")),
            ),
            SizedBox(height: 21),
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage("assets/images/bmi_splash.png"),
            ),
          ],
        ),
      ),
    );
  }
}
