import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schaffen_login/ui/all_photos_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin{

    bool showPhotosPage=true;
  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Container(),
          title: Text('Usename',
          style: GoogleFonts.roboto(
              color: Colors.black,
          ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width/7,
                    backgroundImage: AssetImage('image/instaNoProPic.png'),
                  ),
                    Column(
                      children: <Widget>[
                        Text('50',
                        style: TextStyle(
                          fontSize: 25.0
                        ),),
                        Text('Posts'),
                      ],
                    ),
                  Column(
                    children: <Widget>[
                      Text('423',
                        style: TextStyle(
                            fontSize: 25.0
                        ),),
                      Text('followers'),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text('300',
                        style: TextStyle(
                            fontSize: 25.0
                        ),),
                      Text('following'),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Usename',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15.0,
                    ),),
                    Text('This is description.This is description.This is description.This is description.This is description.This is description.This is description.This is description.This is description.',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          child: Container(
                            width: MediaQuery.of(context).size.width/2,
                            height: 40.0,
                            decoration: BoxDecoration(
                              border: Border.all(color: showPhotosPage?Colors.blue:Colors.transparent),
                              color: Color(0xffEFEFEF),
                              image: DecorationImage(
                                image: AssetImage('images/instaTabLogo.png'),
                              ),
                            ),
                          ),
                          onTap: (){
                            setState(() {
                              showPhotosPage=true;
                            });
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            width: MediaQuery.of(context).size.width/2,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: Color(0xffEFEFEF),
                              border: Border.all(color: showPhotosPage?Colors.transparent:Colors.blue),
                              image: DecorationImage(
                                image: AssetImage('images/instaTabLogo2.png'),
                              ),
                            ),
                          ),
                          onTap: (){
                            setState(() {
                              showPhotosPage=false;
                            });
                          },
                        ),


                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width,
                      width: MediaQuery.of(context).size.width,
                      child: showPhotosPage?Container(
                        child: Flexible(
                            child: AllPhotosPage()),
                      ):
                      Container(
                        child: Flexible(child: AllPhotosPage()),
                      ),
                    ),
                  ],
                ),
              ),

              ],
            ),
          ),
        ),
    );
  }
}
