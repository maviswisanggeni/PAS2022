import 'package:flutter/material.dart';

class IntroPage4 extends StatelessWidget {
  const IntroPage4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: Center(
        child: Text(
          'Intro Page 4',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
