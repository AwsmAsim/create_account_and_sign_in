import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextBoxWithLabel extends StatefulWidget {
   final String title,hintText;
   final bool obscureText,saveAttempted;
   final Function onChanged, validator;
  const TextBoxWithLabel(this.title,this.hintText,{this.obscureText=false,@required this.onChanged,@required this.validator,this.saveAttempted=false});
  @override
  _TextBoxWithLabelState createState() => _TextBoxWithLabelState();
}

class _TextBoxWithLabelState extends State<TextBoxWithLabel> {

  @override
  Widget build(BuildContext context) {

    String title=widget.title;
    String hintText=widget.hintText;
    bool obscureText=false;
    Function onChanged=widget.onChanged;

    return Container(
    child: Column(
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
      autovalidate: widget.saveAttempted,
    validator:widget.validator,
    obscureText: obscureText,
    decoration: InputDecoration(
      errorStyle: TextStyle(
        color: Colors.white,
      ),
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
    ),

    );
  }
}

class SmallTextBoxWithLabel extends StatefulWidget {
  final String title,hintText;
  final bool obscureText;
  final Function onChanged;

  const SmallTextBoxWithLabel(this.title,String this.hintText,{bool this.obscureText=false,@required Function this.onChanged});

  @override
  _SmallTextBoxWithLabelState createState() => _SmallTextBoxWithLabelState();
}

class _SmallTextBoxWithLabelState extends State<SmallTextBoxWithLabel> {
  @override
  Widget build(BuildContext context) {
    String title=widget.title;
    String hintText=widget.hintText;
    bool obscureText=false;
    Function onChanged=widget.onChanged;

    return Container(
      child: Column(
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
          TextField(
            obscureText: obscureText,
            maxLength: 2,
            maxLengthEnforced: true,
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
      ),

    );
  }
}
