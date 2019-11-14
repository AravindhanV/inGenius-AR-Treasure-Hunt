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
        child: Stack(
          children: [
            Center(
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
                        padding: EdgeInsets.fromLTRB(190, 66, 20, 0),
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
                    height: 90,
                  ),
                  FlatButton(
                    child: Text(
                      'Play',
                      style: TextStyle(
                        fontFamily: 'panton',
                        fontSize: 28,
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
                        Constants.chapterlist = datasnapshot
                            .value['chapterlist']
                            .cast<int>()
                            .toList();
                        Map<dynamic, dynamic> cl =
                            datasnapshot.value['cluelist'];
                        Constants.cluelist = [];
                        cl.entries.forEach((f) {
                          Constants.cluelist.add(f.value.cast<int>().toList());
                        });
                        print(Constants.level);
                        print(Constants.chapterlist);
                        print(Constants.cluelist);
                        Navigator.pop(context);
                        if (Constants.level == -1) {
                          Navigator.pushNamed(context, '/intro');
                        } else {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Levels();
                          }));
                        }
                      });
                    },
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  FlatButton(
                    child: Text(
                      'Story',
                      style: TextStyle(
                        fontFamily: 'Panton',
                        fontSize: 28,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  FlatButton(
                    child: Text(
                      'Sponsors',
                      style: TextStyle(
                        fontFamily: 'Panton',
                        fontSize: 28,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/sponsors');
                    },
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  FlatButton(
                    child: Text(
                      'Quit',
                      style: TextStyle(
                        fontFamily: 'Panton',
                        fontSize: 28,
                      ),
                    ),
                    onPressed: () {
                      SystemChannels.platform
                          .invokeMethod('SystemNavigator.pop');
                    },
                  ),
                ],
              ),
            ),
            SafeArea(
              child: Container(
                alignment: Alignment.topRight,
                child: IconButton(
                  tooltip: "Logout",
                  padding: EdgeInsets.only(right: 10, top: 15),
                  icon: Icon(
                    Icons.exit_to_app,
                    color: Colors.black,
                    size: 35,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
