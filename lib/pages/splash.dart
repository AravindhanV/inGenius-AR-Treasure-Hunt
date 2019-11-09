import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

enum AuthStatus {
  notSignedIn,
  signedIn,
}

class _SplashScreenState extends State<SplashScreen> {
  AuthStatus authStatus = AuthStatus.notSignedIn;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      isLoggedIn().then((userId) {
        authStatus =
            userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
        switch (authStatus) {
          case AuthStatus.notSignedIn:
            Navigator.pushReplacementNamed(context, '/login');
            break;
          case AuthStatus.signedIn:
            Navigator.pushReplacementNamed(context, '/home');
            break;
        }
        // Navigator.pushReplacementNasmed(context, '/qrcode');
      });
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/ingeniuslogo.png'),
              SizedBox(
                height: 25,
              ),
              Text(
                "AR Treasure Hunt",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> isLoggedIn() async {
    print(FirebaseAuth.instance);
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    print(FirebaseAuth.instance.currentUser());
    return user.uid;
  }
}
