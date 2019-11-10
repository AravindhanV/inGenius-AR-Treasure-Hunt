import 'package:flutter/material.dart';
import 'package:treasurehuntapp/widgets/Page/page1.dart';
import 'package:treasurehuntapp/widgets/Page/page2.dart';
import 'package:treasurehuntapp/widgets/Page/page3.dart';
import 'package:treasurehuntapp/widgets/Page/page4.dart';
import 'package:treasurehuntapp/widgets/Page/page5.dart';

class Pages extends StatelessWidget {
  int n;
  Pages(
    this.n,
  );
  final PageController ctrl = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          // scrollDirection: Axis.vertical,
          controller: ctrl,
          children: getPage(n)),
    );
  }

  List<Widget> getPage(int c) {
    List<Widget> page;
    switch (c + 1) {
      case 1:
        page = Page1().getContainer();
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
