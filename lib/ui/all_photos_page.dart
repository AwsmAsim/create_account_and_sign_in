import 'package:flutter/material.dart';


class AllPhotosPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Container photosContainer(String imageLink1,String imageLink2,String imageLink3){
      return Container(
        child: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width/3,
              height: MediaQuery.of(context).size.width/3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('$imageLink1'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width/3,
              height: MediaQuery.of(context).size.width/3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('$imageLink2'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width/3,
              height: MediaQuery.of(context).size.width/3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('$imageLink3'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      child: ListView(
        children: <Widget>[
          photosContainer('images/instaNoProPic.png', 'images/instaNoProPic.png', 'images/instaNoProPic.png'),
        ],
      ),
    );
  }
}
