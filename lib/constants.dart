import 'package:firebase_database/firebase_database.dart';

class Constants {
  static String uid;
  static int level;
  static int seed;
  static int clue;
  static List<String> qrs = [
    "First",
    "This is the second answer",
  ];
  static List<List<int>> cluelist = [];
  static List<int> chapterlist;
  static DatabaseReference teamref = FirebaseDatabase.instance.reference().child('teams');
}
