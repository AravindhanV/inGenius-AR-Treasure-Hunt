import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:treasurehuntapp/constants.dart';
import 'package:treasurehuntapp/pages/levels.dart';

class IntroStoryPage extends StatefulWidget {
  @override
  _IntroStoryPageState createState() => _IntroStoryPageState();
}

class _IntroStoryPageState extends State<IntroStoryPage> {
  int _currentPage = 0;
  List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = storyPages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            children: pages,
            onPageChanged: (n) {
              setState(() {
                _currentPage = n;
              });
            },
          ),
          Container(
            margin: EdgeInsets.only(bottom: 25),
            alignment: Alignment.bottomCenter,
            child: DotsIndicator(
              dotsCount: pages.length,
              position: _currentPage.toDouble(),
              decorator: DotsDecorator( 
                color: Colors.black,
                activeColor: Colors.blue,
              ),
            ),
          ),
          Positioned(
            child: RaisedButton(
              disabledColor: Colors.transparent,
              disabledTextColor: Colors.transparent,
              textColor: Colors.white,
              color: Color(0xFF1391ce),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              elevation: 20,
              child: Text("Done"),
              onPressed: _currentPage == pages.length - 1
                  ? () {
                    Navigator.pop(context);
                  }
                  : null,
            ),
            bottom: 17,
            right: 22,
          ),
        ],
      ),
    );
  }

  List<Widget> storyPages() {
    return <Widget>[
      Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('images/s1.png'),
          ),
        ),
      ),
      Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('images/s2.png'),
          ),
        ),
      ),
    ];
  }
}
