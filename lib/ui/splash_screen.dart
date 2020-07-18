import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schaffen_login/ui/login_screen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), (){moveToLoginScreen();});
  }

  void moveToLoginScreen(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LoginScreen();
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/splash_screen_image.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text('Welcome, Please stand by',
              style: GoogleFonts.roboto(
                color: Colors.white,
              ),),
              SpinKitThreeBounce(
                color: Colors.grey,
              ),
              SizedBox(
                height: 100,
              ),

            ],
          ),
        ),
      );

  }
}
