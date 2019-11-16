import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:treasurehuntapp/constants.dart';
import 'package:treasurehuntapp/pages/levels.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
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
              child: Text("Let's Go!"),
              onPressed: _currentPage == pages.length - 1
                  ? () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              content: Row(
                                children: <Widget>[
                                  CircularProgressIndicator(),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25.0),
                                    child: Text("Loading Game..."),
                                  ),
                                ],
                              ),
                            );
                          });
                      FirebaseDatabase.instance
                          .reference()
                          .child('teams/${Constants.uid}')
                          .update({'chapter': 0}).then((_) {
                        Navigator.pop(context);
                        Constants.level = 0;
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return Levels();
                        }));
                      });
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
