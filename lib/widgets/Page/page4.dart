import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:qrcode_reader/qrcode_reader.dart';
import 'package:treasurehuntapp/constants.dart';

class Page4 {
  Page4();
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
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 90, 50, 0),
                  child: Text(
                    "Location Clue",
                    style: tile,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 90, 50, 0),
                  child: Text(
                    """Sweat and play
Work these muscles
Then come find me
In the midst of your hustle 
""",
                    style: content,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SafeArea(
              child: Container(
                alignment: Alignment.topRight,
                child: IconButton(
                  padding: EdgeInsets.only(right: 10, top: 15),
                  iconSize: 40,
                  icon: Icon(
                    Icons.photo_camera,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    QRCodeReader()
                        .setAutoFocusIntervalInMs(200) // default 5000
                        .setForceAutoFocus(true) // default false
                        .setTorchEnabled(true) // default false
                        .setHandlePermissions(true) // default true
                        .setExecuteAfterPermissionGranted(true) // default true
                        .scan()
                        .then((String str) {
                      if (str == "RECEPTION") {
                        showDialog(
                            context: cntxt,
                            builder: (content) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                content: Text("Validating QR Code..."),
                              );
                            });
                        FirebaseDatabase.instance
                            .reference()
                            .child('teams/${Constants.uid}')
                            .update({'chapter': Constants.level + 1}).then((_) {
                              Navigator.pop(cntxt);
                          Constants.level++;
                          refresh();
                          Constants.flag = 1;
                        });
                      }
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ];

    return [
      containers[Constants.cluelist[4][0]],
    ];
  }
}
