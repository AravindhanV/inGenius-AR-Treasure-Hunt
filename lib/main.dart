import 'package:flutter/material.dart';
import 'package:treasurehuntapp/pages/home.dart';
import 'package:treasurehuntapp/pages/levels.dart';
import 'package:treasurehuntapp/pages/login.dart';
import 'package:treasurehuntapp/pages/splash.dart';

void main() => runApp(HuntApp());

class HuntApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/login': (context) => LoginPage(),
        '/home' : (context) => HomePage(),
      },
    );
  }
}
