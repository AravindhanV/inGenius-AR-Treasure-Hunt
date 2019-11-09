import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // SafeArea(
          // child:
          Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/bg1.png"),
          fit: BoxFit.fill,
        )),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 120,
            ),
            Stack(
              children: <Widget>[
                Text(
                  'Treasure Hunt',
                  style: TextStyle(
                    fontFamily: 'GreatVibes',
                    fontSize: 52,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(190, 56, 20, 0),
                  child: Text(
                    'Ingenius 2k19',
                    style: TextStyle(
                      fontFamily: 'GreatVibes',
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 150,
            ),
            FlatButton(
              child: Text(
                'Play',
                style: TextStyle(
                  fontFamily: 'Arizonia',
                  fontSize: 36,
                ),
              ),
              onPressed: () {},
            ),
            FlatButton(
              child: Text(
                'Quit',
                style: TextStyle(
                  fontFamily: 'Arizonia',
                  fontSize: 36,
                ),
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
      // ),
    );
  }
}
