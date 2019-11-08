import 'package:flutter/material.dart';
import 'package:treasurehuntapp/pages/splash.dart';

void main() => runApp(HuntApp());

class HuntApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}