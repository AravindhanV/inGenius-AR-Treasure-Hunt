import 'package:flutter/material.dart';
import 'package:treasurehuntapp/widgets/JPage/jpage1.dart';
import 'package:treasurehuntapp/widgets/Page/page1.dart';
import 'package:treasurehuntapp/widgets/Page/page2.dart';
import 'package:treasurehuntapp/widgets/Page/page3.dart';
import 'package:treasurehuntapp/widgets/Page/page4.dart';
import 'package:treasurehuntapp/widgets/Page/page5.dart';

import '../constants.dart';

class Pages extends StatefulWidget {
  int n;
  Pages(
    this.n,
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
      key: key,
      body: PageView(
          // scrollDirection: Axis.vertical,
          controller: ctrl,
          children: getPage(widget.n, context)),
    );
  }

  void refreshPage() {
    setState(() {});
    ctrl.animateToPage(Constants.clue,
        curve: Curves.linear, duration: Duration(seconds: 1));
  }

  List<Widget> getPage(int c, BuildContext cntxt) {
    List<Widget> page;
    switch (c) {
      case 0:
        break;
      case 1:
        page = Constants.n > c
            ? JPage1().getContainer()
            : Page1().getContainer(this.refreshPage, cntxt);
        break;
      case 2:
        page = Page2().getContainer();
        break;
      case 3:
        page = Page3().getContainer();
        break;
      case 4:
        page = Page2().getContainer();
        break;
      case 5:
        page = Page2().getContainer();
        break;
      default:
        print("Wrong page");
    }
    return page;
  }
}
