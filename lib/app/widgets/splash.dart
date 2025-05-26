import 'package:flutter/material.dart';

void main() {
  runApp(SplashScreen());
}

class SplashScreen extends StatelessWidget {
  const SplashScreen ({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color (0xFF488DB4),
      body: Center(
        child: Container(
          width: 158,
          height: 131,
          child: Image.asset("assets/logo/logo-splash.png"),
        ),
      ),
    ),
    );  
  }
}