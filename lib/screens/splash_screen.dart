import 'dart:async';

import 'package:flutter/material.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.home,
              size: 100,
              color: Colors.blue,
            ),

            const Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),

            const Text(
              'Welcome Home',
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
              ),
            ),
          ]
        )
      )
    );
  }
}
