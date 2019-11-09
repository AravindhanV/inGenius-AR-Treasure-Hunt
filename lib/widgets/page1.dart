import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  Page1();
  TextStyle tile = TextStyle(
    fontFamily: 'Dancingscript',
    fontSize: 40,
    color: Colors.black,
  );
  TextStyle content = TextStyle(
    fontFamily: 'GreatVibes',
    fontSize: 30,
    color: Colors.black,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("images/bg1.png"),
        ),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 90, 50, 0),
            child: Text(
              "Location",
              style: tile,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 90, 50, 0),
            child: Text(
              "             You need \nthousands of me to form an image.\n         Go to A not B ",
              style: content,
            ),
          )
        ],
      ),
    );
  }
}
