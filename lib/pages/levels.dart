import 'package:flutter/material.dart';

class Levels extends StatefulWidget {
  @override
  _LevelsState createState() => _LevelsState();
}

class _LevelsState extends State<Levels> {
  final PageController ctrl = PageController(viewportFraction: 0.8);

  int currentPage = 0;

  @override
  void initState() {
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
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: PageView.builder(
        controller: ctrl,
        itemCount: 5,
        itemBuilder: (context, int currentIdx) {
          bool active = currentIdx == currentPage;
          return _buildChapters(active);
        },
      ),
    );
  }

  _buildChapters(bool active) {
    final double blur = active ? 30 : 0;
    final double offset = active ? 20 : 0;
    final double all = active ? 100 : 150;
    final double allr = active ? 20 : 30;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOutQuart,
      margin: EdgeInsets.only(top: all, bottom: all, right: allr, left: allr),
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
    );
  }
}
