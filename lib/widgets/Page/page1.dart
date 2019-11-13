import 'package:flutter/material.dart';
import 'package:qrcode_reader/qrcode_reader.dart';
import 'package:treasurehuntapp/constants.dart';

class Page1 {
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
    return <Widget>[
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
            SafeArea(
              child: Container(
                alignment: Alignment.topRight,
                child: IconButton(
                  padding:
                      EdgeInsets.only(left: 16, right: 10, top: 5, bottom: 16),
                  iconSize: 40,
                  icon: Icon(
                    Icons.photo_camera,
                  ),
                  onPressed: Constants.clue > 0
                      ? () {
                          //Do nothing
                        }
                      : () {
                          QRCodeReader()
                              .setAutoFocusIntervalInMs(200) // default 5000
                              .setForceAutoFocus(true) // default false
                              .setTorchEnabled(true) // default false
                              .setHandlePermissions(true) // default true
                              .setExecuteAfterPermissionGranted(
                                  true) // default true
                              .scan()
                              .then((String str) {
                            if (str == Constants.qrs[Constants.n - 1]) {
                              Constants.clue = 1;
                              Constants.teamref
                                  .child(Constants.uid)
                                  .update({'clue': 1});
                              refresh();
                            }

                            // else {
                            //   if (str.isNotEmpty) {
                            //     showDialog(
                            //         context: cntxt,
                            //         builder: (cntxt) {
                            //           return AlertDialog(
                            //             content:
                            //                 Text("Wrong QR Code. Please Try Again"),
                            //             actions: <Widget>[
                            //               FlatButton(
                            //                 onPressed: () {
                            //                   Navigator.pop(cntxt);
                            //                 },
                            //                 child: Text("OK"),
                            //               )
                            //             ],
                            //           );
                            //         });
                            //   }
                            // }
                          });
                        },
                ),
              ),
            ),
            Opacity(
              opacity: Constants.clue >= 0 ? 1 : 0,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 90, 50, 0),
                    child: Text(
                      "Clue 1",
                      style: tile,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 90, 50, 0),
                    child: Text(
                      "You need thousands of me to form an image. Go to A not B ",
                      style: content,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("images/bg1.png"),
          ),
        ),
        child: Opacity(
          opacity: Constants.clue >= 1 ? 1 : 0,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 90, 50, 0),
                child: Text(
                  "Clue 2",
                  style: tile,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 90, 50, 0),
                child: Text(
                  "What is 1+1?",
                  style: content,
                ),
              ),
              TextField(),
              RaisedButton(
                onPressed: () {
                  showDialog(
                      context: cntxt,
                      builder: (cntxt) {
                        return AlertDialog(
                          content: TextField(),
                        );
                      });
                },
              ),
            ],
          ),
        ),
      ),
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("images/bg1.png"),
          ),
        ),
        child: Opacity(
          opacity: Constants.clue >= 2 ? 1 : 0,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 90, 50, 0),
                child: Text(
                  "Clue 3",
                  style: tile,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 90, 50, 0),
                child: Text(
                  "             You need \nthousands of me to form an image.\n         Go to A not B ",
                  style: content,
                ),
              )
            ],
          ),
        ),
      ),
    ];
  }
}
