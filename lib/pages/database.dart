import 'package:hive/hive.dart';

class DataBase {
  // reference hive
  final _myBox = Hive.box('myBox');

  //init todolist
  List toDoList = [];

  //run this when open app

  void createInitialData() {
    List toDoList = [
      ["Make the app", false],
      ["Delete the ", false],
    ];
  }

// load data from database
  void loadData() {
    toDoList = _myBox.get("todolist");
  }

  // update hive

  void updateDataBase() {
    _myBox.put("todolist", toDoList);
  }
}
