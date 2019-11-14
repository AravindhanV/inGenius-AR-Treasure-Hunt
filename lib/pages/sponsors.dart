import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SponsorsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0064a7),
          title: Center(child: Text('Sponsors')),
          elevation: 10,
          automaticallyImplyLeading: false, // hides leading widget
          // flexibleSpace: Text('Sponsors'),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color(0xFF28a8e0),
                  Color(0xFF1391ce),
                  Color(0xFF007abb),
                  Color(0xFF0064a7),
                  Color(0xFF004e92)
                ])),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 7,
                ),
                CardWidget('images/Logos/Sahaj_Software_Logo.png'),
                CardWidget('images/Logos/MSFT_Logo.png'),
                CardWidget('images/Logos/NTS_Logo.png'),
                CardWidget('images/Logos/DataIken_Logo.png'),
                CardWidget('images/Logos/Zoom_Logo.png'),
                CardWidget('images/Logos/Skillenza_Logo.png'),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ));
  }
}

class CardWidget extends StatelessWidget {
  final String imgPath;
  CardWidget(this.imgPath);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
      height: 220,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Image.asset(
            imgPath,
            fit: BoxFit.scaleDown,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 10,
        margin: EdgeInsets.fromLTRB(10, 3, 10, 3),
      ),
    );
  }
}
