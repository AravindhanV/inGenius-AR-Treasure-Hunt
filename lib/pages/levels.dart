import 'package:flutter/material.dart';
import 'package:treasurehuntapp/types/chapter.dart';

class Levels extends StatefulWidget {
  int n;

  Levels(this.n);

  @override
  _LevelsState createState() => _LevelsState();
}

class _LevelsState extends State<Levels> {
  final PageController ctrl = PageController(viewportFraction: 0.7);
  List<Chapter> chapters = [
    Chapter(1, "First Title"),
    Chapter(2, "Second Title"),
    Chapter(3, "dsfsa Title"),
    Chapter(4, "dafss Title"),
    Chapter(5, "afds Title"),
  ];

  int currentPage = 0;
  final key = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    ctrl.addListener(() {
      int next = ctrl.page.round();
      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blueGrey[700],
        child: PageView.builder(
          controller: ctrl,
          itemCount: chapters.length,
          itemBuilder: (context, int currentIdx) {
            bool active = currentIdx == currentPage;
            return _buildChapters(active, currentIdx);
          },
        ),
      ),
    );
  }

  Widget _buildChapters(bool active, int idx) {
    final double blur = active ? 30 : 0;
    final double offset = active ? 20 : 0;
    final double all = active ? 125 : 175;
    final double ttextsize = active ? 45 : 33;
    final double ctextsize = active ? 30 : 18;
    final double sides = active ? 10 : 30;

    final double opacityValue = active ? 1 : 0;

    return GestureDetector(
      onTap: idx<widget.n ? nextPage : denyAccess,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        margin:
            EdgeInsets.only(top: all, bottom: all, right: sides, left: sides),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("images/bg1.png"),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black87,
                blurRadius: blur,
                offset: Offset(offset, offset),
              )
            ]),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 20, 20, 20),
              child: Opacity(
                opacity: active ? 1 : 0,
                child: AnimatedDefaultTextStyle(
                  style: active
                      ? TextStyle(
                          fontFamily: 'Dancingscript',
                          fontSize: 40,
                          color: Colors.black,
                        )
                      : TextStyle(
                          fontFamily: 'Dancingscript',
                          fontSize: 23,
                          color: Colors.black,
                        ),
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    'Chapter ${chapters[idx].chno}',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Opacity(
                opacity: opacityValue,
                child: AnimatedDefaultTextStyle(
                  style: active
                      ? TextStyle(
                          fontFamily: 'GreatVibes',
                          fontSize: 30,
                          color: Colors.black,
                        )
                      : TextStyle(
                          fontFamily: 'GreatVibes',
                          fontSize: 18,
                          color: Colors.black,
                        ),
                  duration: const Duration(milliseconds: 500),
                  child: Text(chapters[idx].title),
                  // "  No misery \never so beautiful \nthan the one this \n  mind creates"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void nextPage(){
    print("Going to Next Page");
  }

  void denyAccess(){
    key.currentState.showSnackBar(SnackBar(
      duration: Duration(seconds: 2),
      backgroundColor: Color(0xFF28A8E0),
      content: Text(
        "Chapter is Locked",
        style: TextStyle(color: Colors.black),
      ),
    ));
  }
}
