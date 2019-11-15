import 'package:flutter/material.dart';
import 'package:treasurehuntapp/constants.dart';
import 'package:treasurehuntapp/pages/pages.dart';
import 'package:treasurehuntapp/types/chapter.dart';

class Levels extends StatefulWidget {
  @override
  _LevelsState createState() => _LevelsState();
}

class _LevelsState extends State<Levels> {
  final PageController ctrl =
      PageController(initialPage: Constants.level, viewportFraction: 0.7);
  List<Chapter> chapters = [
    Chapter(0, "It's not about the treasure. It's about the hunt"),
    Chapter(1,"Work like a captain, play like a pirate"),
    Chapter(2, "A smooth hunt never made a skilled pirate"),
    Chapter(3, "Not all treasure is silver and gold"),
    Chapter(4, "Random Quote to get you excited"),
    Chapter(5, "There is more treasure in books than in all pirate's loot on the treasure island"),
  ];

  int currentPage = Constants.level;
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
    final double sides = active ? 10 : 30;

    final double opacityValue = active ? 1 : 0;

    return GestureDetector(
      onTap: idx <= Constants.level
          ? () {
              nextPage(Constants.chapterlist[idx]);
            }
          : denyAccess,
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
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                    // 'Chapter ${chapters[Constants.chapterlist[idx]].chno}',
                    'Chapter ${idx + 1}',
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
                  child: Text(chapters[idx].title,textAlign: TextAlign.center,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void refreshLevels() {
    setState(() {});
    if (Constants.flag == 1) {
      ctrl.animateToPage(
        Constants.level,
        duration: Duration(seconds: 1),
        curve: Curves.linear,
      );
      Constants.flag = 0;
    }
  }

  void nextPage(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return Pages(index, refreshLevels);
      }),
    ).then((x) {
      if (Constants.flag == 1) {
        ctrl.animateToPage(
          Constants.level,
          duration: Duration(milliseconds: 600),
          curve: Curves.linear,
        );
        Constants.flag = 0;
      }
    });
  }

  void denyAccess() {
    print(key.currentState);
    key.currentState.showSnackBar(SnackBar(
      duration: Duration(seconds: 1),
      backgroundColor: Colors.blueGrey[200],
      content: Text(
        "Chapter is Locked",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
    ));
  }
}
