import 'package:hive_flutter/hive_flutter.dart';

class Database{
  List taskList = [];
//   reference box
  final _myBox = Hive.box('mybox');

  void createInitialData(){
    taskList = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];
  }

  void loadData(){
    taskList = _myBox.get("TODOLIST");
  }

  void updateData(){
    _myBox.put("TODOLIST", taskList);
  }
}