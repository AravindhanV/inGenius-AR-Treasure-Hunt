import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:qrcode_reader/qrcode_reader.dart';
import 'package:treasurehuntapp/constants.dart';

class Page5 {
  static final _formKey = GlobalKey<FormState>();
  Page5();
  TextStyle tile = TextStyle(
    fontFamily: 'Dancingscript',
    fontSize: 40,
    color: Colors.black,
  );
  TextStyle content = TextStyle(
    fontFamily: 'GreatVibes',
    fontSize: 30,
    color: Colors.black,
  );

  final _answer = TextEditingController();

  List<Widget> getContainer(Function refresh, BuildContext cntxt) {
    List<Widget> containers = [
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("images/bg1.png"),
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 70, 50, 0),
              child: Text(
                "Finale",
                style: tile,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 60, 50, 0),
              child: Text(
                "Find the 5 letter word hidden in the journal pages to finish the game",
                style: content,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                onChanged: (x) {
                  Constants.ans = x;
                },
                decoration: InputDecoration(
                  labelText: "Answer",
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: RaisedButton(
                color: Colors.blueGrey[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text("Submit Answer"),
                onPressed: () {
                  if (Constants.ans.trim().toUpperCase() == "UNITY") {
                    showDialog(
                        context: cntxt,
                        builder: (cntxt) {
                          return AlertDialog(
                            content: Text("Loading..."),
                          );
                        });
                    FirebaseDatabase.instance
                        .reference()
                        .child('completed/${Constants.uid}')
                        .set(DateTime.now().toString())
                        .then((_) {
                      FirebaseDatabase.instance
                          .reference()
                          .child('teams/${Constants.uid}')
                          .update({'chapter': 6}).then((_) {
                        Navigator.pop(cntxt);
                        Navigator.pushReplacement(
                          cntxt,
                          MaterialPageRoute(
                            builder: (cntxt) {
                              return Scaffold(
                                body: Center(
                                  child: Text("You have finished the Hunt!"),
                                ),
                              );
                            },
                          ),
                        );
                      });
                    });
                  } else {
                    showDialog(
                      context: cntxt,
                      builder: (cntxt) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          content: Text("Wrong Answer"),
                        );
                      },
                    );
                    Future.delayed(
                      Duration(milliseconds: 400),
                    ).then((_) {
                      Navigator.pop(cntxt);
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    ];

    return [
      containers[0],
    ];
  }
}
