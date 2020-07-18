import 'package:flutter/material.dart';
import 'package:schaffen_login/consonents.dart';
import 'package:schaffen_login/ui/login_page.dart';
import 'package:schaffen_login/ui/sign_up_page.dart';
import 'package:schaffen_login/ui_components/login_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: kbackgroundDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 80.0, top: 60.0),
              child: Container(
                child: Image.asset('images/logo.png'),
              ),
            ),
            Column(
              children: <Widget>[
                //Can be found and edited in ui_components
                GestureDetector(
                  child: LoginButton('Log in'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return LoginPage();
                      },
                    ),);
                  },
                ),
                SizedBox(
                  height: 40.0,
                ),
                GestureDetector(
                  child: LoginButton('Sign Up'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return SignUpPage();
                      },
                    ),);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 130.0,
            ),
          ],
        ),
      ),
    );
  }
}
