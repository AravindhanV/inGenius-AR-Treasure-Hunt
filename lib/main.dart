import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:treasurehuntapp/pages/home.dart';
import 'package:treasurehuntapp/pages/intro.dart';
import 'package:treasurehuntapp/pages/introstory.dart';
import 'package:treasurehuntapp/pages/login.dart';
import 'package:treasurehuntapp/pages/pages.dart';
import 'package:treasurehuntapp/pages/qrcode.dart';
import 'package:treasurehuntapp/pages/splash.dart';
import 'package:treasurehuntapp/pages/sponsors.dart';

void main() => SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
        .then((_) {
      runApp(HuntApp());
    });

class HuntApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(accentColor: Colors.blueGrey[200]),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/intro': (context) => IntroPage(),
        '/introstory': (context) => IntroStoryPage(),
        // '/levels': (context) => Levels(),
        //'/pages': (context) => Pages(),
        '/qrcode': (context) => Qrcode(),
        '/sponsors': (context) => SponsorsPage(),
      },
    );
  }
}
