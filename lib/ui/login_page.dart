import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profile_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final FirebaseAuth _auth=FirebaseAuth.instance;
  bool autovalidate=false;
  String email,password;

  void signIn(String em, String pass){
    _auth.signInWithEmailAndPassword(email: em, password: pass).then((value){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return ProfilePage();
      }),);

    }).catchError((error){
      showDialog(context: context,builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Wrong password or email"),
          content: new Text("Please make sure the email or password is right."),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },);
    });

  }

  Column logInField(String title,String hintText,{bool obscureText=false,bool autovalidate,@required Function onChanged}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title,
          style: GoogleFonts.openSans(
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        TextFormField(
          obscureText: obscureText,
          validator: (text){
            if(text.isEmpty)
              return 'This field is mandatory';
            else
              return null;
          },
          autovalidate: autovalidate,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.yellow,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/app_Background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
            ),
            Text('Log In',
            style: GoogleFonts.lobster(
              color: Colors.white,
              fontSize: 40.0,
             ),
            ),
            Container(

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: logInField('Enter email:', 'Enter email',
                autovalidate: autovalidate,
                onChanged: (text){
                  email=text;
                }
                ),
              ),
            ),
              Container(

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: logInField('Enter password:', 'Enter password',
                  autovalidate: autovalidate,
                  obscureText: true,
                  onChanged: (text){
                    password=text;
                  },
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              GestureDetector(
                child: Container(
                  height: 60,
                  width: 200,
                decoration: BoxDecoration(
                  color: Color(0xffE0201E),
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
                  child: Center(
                    child: Text('Log In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                    ),
                  ),
                ),
                onTap: (){
                  setState(() {
                    autovalidate=true;
                  });
                  signIn(email, password);

                },
              ),
              SizedBox(height: 50.0,)
            ],
          ),
        ),

      ),
    );
  }
}
