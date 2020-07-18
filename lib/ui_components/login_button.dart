import 'package:flutter/material.dart';
import 'package:schaffen_login/consonents.dart';

class LoginButton extends StatelessWidget {
  final String text;

  const LoginButton(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: 240.0,
      decoration: BoxDecoration(
        color: Color(0xff999999),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: Center(
        child: Text(text,
          style: kloginPageButtonFonts,
        ),
      ),
    );
  }
}
