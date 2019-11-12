import 'package:firebase_database/firebase_database.dart';

class Constants {
  static String uid;
  static int n;
  static int clue;
  static List<String> qrs = [
    "First",
    "This is the second answer",
  ];
  static DatabaseReference teamref = FirebaseDatabase.instance.reference().child('teams');
}
