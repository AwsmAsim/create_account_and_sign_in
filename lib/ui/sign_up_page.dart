import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schaffen_login/consonents.dart';
import 'package:schaffen_login/ui/login_page.dart';
import 'package:schaffen_login/ui_components/text_box_with_label.dart';
import 'package:google_fonts/google_fonts.dart';
class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  Padding paddedTextBox(String label,String hintText,{Function onChanged,Function validator,bool obscureText=false,bool saveAttempted=false}){
    return Padding(
      padding: EdgeInsets.only(top:2.0,bottom: 10.0),
      child: TextBoxWithLabel(label,hintText,
        onChanged: onChanged,
        validator: validator,
        obscureText: obscureText,
        saveAttempted: saveAttempted,
      ),
    );
  }
  final FirebaseAuth _auth =FirebaseAuth.instance;
  String first_name,last_name,username,password,email,age,passwordConfirm;
  final formKey=GlobalKey<FormState>();
  bool attempted=false;

  void createUser(String email,String pass){
    _auth.createUserWithEmailAndPassword(email: email, password: pass).then(
            (authResult){

              showDialog(context: context,builder: (BuildContext context) {
                // return object of type Dialog
                return AlertDialog(
                  title: new Text("Account created"),
                  content: new Text("You will now have to login from the next screen"),
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
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return LoginPage();
              }),);
            },).catchError((error){
              print(error);
              if(error.code=='ERROR_INVALID_EMAIL')
                {
                  showDialog(context: context,builder: (BuildContext context) {
                    // return object of type Dialog
                    return AlertDialog(
                      title: new Text("Invalid email"),
                      content: new Text("Please type valid email"),
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
                }
              else if(error.code=='ERROR_EMAIL_ALREADY_IN_USE'){
                showDialog(context: context,builder: (BuildContext context) {
                  // return object of type Dialog
                  return AlertDialog(
                    title: new Text("Email already exists"),
                    content: new Text("Please type another email"),
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
              }
              else if(error.code=='ERROR_WEAK_PASSWORD')
                {
                  showDialog(context: context,builder: (BuildContext context) {
                    // return object of type Dialog
                    return AlertDialog(
                      title: new Text("Weak Password"),
                      content: new Text("Please enter password of atleast 8 charcters with numbers"),
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
                }

    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Form(
          key: formKey,
          child: Container(
            decoration: kbackgroundDecoration,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0,bottom: 20.0),
                    child: Text('Sign Up',
                      style: GoogleFonts.lobster(
                        color: Colors.white,
                        fontSize: 40.0,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                  ),
                  //paddedTextBox is TextBoxWithLabel along with padding
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        paddedTextBox('Enter Usename: ','Usename',
                          saveAttempted: attempted,
                          onChanged: (text){
                          setState(() {
                            username=text;
                          });
                          },
                            validator: (value){
                              if(value=='' || value==null){
                                return 'This field is mandetory.';
                              }
                              else return null;
                            },),
                        paddedTextBox('Enter Email: ','email',
                          saveAttempted: attempted,
                          onChanged: (text){
                            setState(() {
                              email=text;
                            });
                          },
                          validator: (value){
                            if(value=='' || value==null){
                              return 'This field is mandetory.';
                            }
                            else return null;
                          },),
                        paddedTextBox('Enter Password: ','password',
                          saveAttempted: attempted,
                          obscureText: true,
                          onChanged: (text){
                          password=text;
                          },
                            validator: (value){
                              if(value=='' || value==null){
                                return 'This field is mandetory.';
                              }
                              else return null;
                            },
                        ),
                        paddedTextBox('Re-enter Password: ','re-enter password',
                          saveAttempted: attempted,
                          obscureText: true,
                          onChanged: (text){
                          setState(() {
                            passwordConfirm=text;
                          });
                          },
                            validator: (value){
                              if(value=='' || value==null){
                                return 'This field is mandetory.';
                              }else if(value!=password){
                                return 'Password did not match.';
                              }
                              else return null;
                            },
                        ),

                        //Can be found in ui_components/text_box_with_label.dart

                        SizedBox(
                          height: 50.0,
                        ),
                        InkWell(
                          child: Container(
                            height: 60,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Color(0xffE0201E),
                              borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            ),
                            child: Center(
                              child: Text('Sign Up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          onTap: (){

                            if(formKey.currentState.validate()){
                              formKey.currentState.save();
                              setState(() {
                                attempted=true;
                              createUser(email, password);
                              });
                            }
                          },
                        ),

                        SizedBox(
                          height: 50.0,
                        ),
                      ],
                    ),
                  ),
                ],

              ),
            ),
          ),
        ),
      ),
    );
  }
}
