import 'package:flutter/material.dart';
import 'package:treasurehuntapp/widgets/logindialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final focus = FocusNode();
  final _username = TextEditingController();
  final _password = TextEditingController();
  final key = new GlobalKey<ScaffoldState>();
  DatabaseReference userref;

  Future<String> isLoggedIn() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user.uid;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseDatabase.instance.setPersistenceEnabled(true);
    userref = FirebaseDatabase.instance.reference().child('active');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 50, left: 30, right: 30),
                child: Image.asset('images/ingeniuslogo.png'),
              ),
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: TextField(
                          onSubmitted: (str) {
                            FocusScope.of(context).requestFocus(focus);
                          },
                          controller: _username,
                          decoration: InputDecoration(
                            hintText: "Username",
                          ),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: TextField(
                          focusNode: focus,
                          controller: _password,
                          decoration: InputDecoration(
                            hintText: "Password",
                          ),
                          obscureText: true,
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 35,
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 45, vertical: 15),
                          color: Color(0xFF28A8E0),
                          width: double.infinity,
                          child: Text(
                            "Login",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            child: LoginDialog(),
                          );
                          validateData();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showError(String str) {
    key.currentState.showSnackBar(SnackBar(
      duration: Duration(seconds: 2),
      backgroundColor: Color(0xFF28A8E0),
      content: Text(
        str,
        style: TextStyle(color: Colors.black),
      ),
    ));
  }

  void validateData() async {
    try {
      AuthResult result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _username.text + "@ingenius.com",
              password: _password.text);
      DataSnapshot snap;
      FirebaseUser user = result.user;
      userref = userref.child(user.uid);
      await userref.once().then((snapshot){
        snap = snapshot;
        print("Inside");
      });
      print("After");
      if(snap.value==null){
        userref.set(1);
        Navigator.of(context).pop();
      Navigator.pushReplacementNamed(context, '/home');
      }
      else {
        Navigator.of(context).pop();
        showError("Only 1 Active Session Allowed");
        return;
      }
    } on PlatformException catch (e) {
      Navigator.of(context).pop();
      if (e.code == "ERROR_USER_NOT_FOUND") {
        showError("User Not Found");
      } else if (e.code == "ERROR_INVALID_EMAIL") {
        showError("Invalid Email");
      } else if (e.code == "ERROR_WRONG_PASSWORD") {
        showError("Wrong Password");
      }
      // print("Invalid Email: ${e.code}");
    } catch (e) {
      print("Error: $e");
    }
  }
}
