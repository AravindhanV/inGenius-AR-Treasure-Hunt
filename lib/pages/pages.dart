import 'package:flutter/material.dart';
import 'package:treasurehuntapp/widgets/page1.dart';
import 'package:treasurehuntapp/widgets/page2.dart';
import 'package:treasurehuntapp/widgets/page3.dart';
import 'package:treasurehuntapp/widgets/page4.dart';
import 'package:treasurehuntapp/widgets/page5.dart';

class Pages extends StatelessWidget {
  final PageController ctrl = PageController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PageView(
          // scrollDirection: Axis.vertical,
          controller: ctrl,
          children: [
            Page1(),
            Page2(),
            Page3(),
            Page4(),
            Page5(),
          ],
        ),
      ),
    );
  }
}
