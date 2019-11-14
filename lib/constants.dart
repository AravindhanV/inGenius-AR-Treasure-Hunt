import 'package:firebase_database/firebase_database.dart';

class Constants {
  static String uid;
  static int level;
  static int seed;
  static int clue;
  static int flag;
  static List<List<String>> qrs = [
    [],
    [],
    [],
    ["DS LAB"],
  ];
  static List<List<int>> cluelist = [];
  static List<int> chapterlist;
  static DatabaseReference teamref =
      FirebaseDatabase.instance.reference().child('teams');
}
