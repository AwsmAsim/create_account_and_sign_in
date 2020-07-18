import 'package:flutter/material.dart';
import 'package:schaffen_login/ui/splash_screen.dart';
void main() {
  runApp(myApp());
}
class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}

