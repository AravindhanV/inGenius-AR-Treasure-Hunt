import 'package:flutter/material.dart';
import 'package:treasurehuntapp/constants.dart';

class Page1 {
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

  List<Widget> getContainer(Function refresh,BuildContext cntxt) {
    List<Widget> containers = [
      Container(
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
                "Page 3.0",
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
      ),
      Container(
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
                "Page 3.1",
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
      ),
      Container(
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
                "Page 3.2",
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
      ),
    ];

    return [
      containers[Constants.cluelist[1][0]],
      containers[Constants.cluelist[1][1]],
      containers[Constants.cluelist[1][2]]
    ];
  }
}
