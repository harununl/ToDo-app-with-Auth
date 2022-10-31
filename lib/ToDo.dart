import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List todoList = [];
  final _myBox = Hive.box("mybox");

  void loadData() {
    todoList = _myBox.get("todolist");
  }

  void updateData() {
    _myBox.put("todolist", todoList);
  }
}
