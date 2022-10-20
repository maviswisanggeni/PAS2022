import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project_pas/utils/constant.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState() {
    super.initState();
    splashScreenStart();
  }

  splashScreenStart() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage()
          )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Styles.white,
              ),
              child: Center (
                  child: Image.asset("assets/images/logo-brown.png")
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Glow App",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Styles.white,
              ),
            )
          ],
        )
      )
    );
  }
}
