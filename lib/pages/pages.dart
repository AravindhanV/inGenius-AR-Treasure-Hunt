import 'package:flutter/material.dart';

class Pages extends StatelessWidget {
  final PageController ctrl = PageController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: PageView(
              // scrollDirection: Axis.vertical,
              controller: ctrl,
              children: [
            Container(color: Colors.green),
            Container(color: Colors.blue),
            Container(color: Colors.orange),
            Container(color: Colors.red)
          ])),
    );
  }
}
