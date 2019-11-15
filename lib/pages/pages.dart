import 'package:flutter/material.dart';
import 'package:treasurehuntapp/widgets/JPage/jpage0.dart';
import 'package:treasurehuntapp/widgets/JPage/jpage1.dart';
import 'package:treasurehuntapp/widgets/JPage/jpage2.dart';
import 'package:treasurehuntapp/widgets/JPage/jpage3.dart';
import 'package:treasurehuntapp/widgets/JPage/jpage4.dart';
import 'package:treasurehuntapp/widgets/Page/page0.dart';
import 'package:treasurehuntapp/widgets/Page/page1.dart';
import 'package:treasurehuntapp/widgets/Page/page2.dart';
import 'package:treasurehuntapp/widgets/Page/page3.dart';
import 'package:treasurehuntapp/widgets/Page/page4.dart';
import 'package:treasurehuntapp/widgets/Page/page5.dart';

import '../constants.dart';

class Pages extends StatefulWidget {
  int n;
  Function refreshLevel;
  Pages(
    this.n,
    refreshLevel,
  );

  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  final PageController ctrl = PageController(initialPage: Constants.clue);
  final key = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: key,
      body: PageView(
        // scrollDirection: Axis.vertical,
        controller: ctrl,
        children: getPage(widget.n, context),
      ),
    );
  }

  void refreshPage() {
    setState(() {});
    ctrl.animateToPage(
      Constants.clue,
      curve: Curves.linear,
      duration: Duration(seconds: 1),
    );
  }

  List<Widget> getPage(int currentChapter, BuildContext cntxt) {
    List<Widget> page;
    switch (currentChapter) {
      case 0:
        page = Constants.chapterlist.indexOf(currentChapter) < Constants.level
            ? JPage0().getContainer()
            : Page0().getContainer(this.refreshPage, cntxt);
        break;
      case 1:
        page = Constants.chapterlist.indexOf(currentChapter) < Constants.level
            ? JPage1().getContainer()
            : Page1().getContainer(this.refreshPage, cntxt);
        break;
      case 2:
        page = Constants.chapterlist.indexOf(currentChapter) < Constants.level
            ? JPage2().getContainer()
            : Page2().getContainer(this.refreshPage, cntxt);
        break;
      case 3:
        page = Constants.chapterlist.indexOf(currentChapter) < Constants.level
            ? JPage3().getContainer()
            : Page3().getContainer(this.refreshPage, cntxt);
        break;
      case 4:
        page = Constants.chapterlist.indexOf(currentChapter) < Constants.level
            ? JPage4().getContainer()
            : Page4().getContainer(this.refreshPage, cntxt);
        break;
        case 5:
        page = Page5().getContainer(this.refreshPage, cntxt);
        break;
      default:
        print("Wrong page");
    }
    return page;
  }
}
