import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:treasurehuntapp/pages/levels.dart';
import 'package:treasurehuntapp/pages/qrcode.dart';
import 'package:treasurehuntapp/widgets/homedialog.dart';

import '../constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatabaseReference levelref;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    levelref = FirebaseDatabase.instance.reference().child('teams');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/bg1.png"),
          fit: BoxFit.fill,
        )),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 120,
            ),
            Stack(
              children: <Widget>[
                Text(
                  'Treasure Hunt',
                  style: TextStyle(
                    fontFamily: 'GreatVibes',
                    fontSize: 52,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(190, 56, 20, 0),
                  child: Text(
                    'Ingenius 2k19',
                    style: TextStyle(
                      fontFamily: 'GreatVibes',
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 150,
            ),
            FlatButton(
              child: Text(
                'Play',
                style: TextStyle(
                  fontFamily: 'Arizonia',
                  fontSize: 36,
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  child: HomeDialog(),
                );
                levelref.child(Constants.uid).once().then((datasnapshot) {
                  Constants.level = datasnapshot.value['chapter'];
                  Constants.clue = datasnapshot.value['clue'];
                  // print("Data: ${datasnapshot.value}");
                  Constants.chapterlist =
                      datasnapshot.value['chapterlist'].cast<int>().toList();
                  Map<dynamic, dynamic> cl = datasnapshot.value['cluelist'];
                  Constants.cluelist = [];
                  cl.entries.forEach((f) {
                    Constants.cluelist.add(f.value.cast<int>().toList());
                  });
                  print(Constants.level);
                  print(Constants.chapterlist);
                  print(Constants.cluelist);
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Levels();
                  }));
                });
              },
            ),
            FlatButton(
              child: Text(
                'Logout',
                style: TextStyle(
                  fontFamily: 'Arizonia',
                  fontSize: 36,
                ),
              ),
              onPressed: () {
                FirebaseDatabase.instance
                    .reference()
                    .child('active/${Constants.uid}')
                    .remove()
                    .then((x) {
                  FirebaseAuth.instance.signOut().then(
                    (_) {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                  );
                });
              },
            ),
            FlatButton(
              child: Text(
                'Quit',
                style: TextStyle(
                  fontFamily: 'Arizonia',
                  fontSize: 36,
                ),
              ),
              onPressed: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
            ),
          ],
        ),
      ),
    );
  }
}
