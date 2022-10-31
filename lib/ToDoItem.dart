import 'package:flutter/material.dart';
import 'package:flutter_individual/page.dart';
import 'ToDo.dart';

class ToDoItem extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  VoidCallback ondDelete;

  ToDoItem({
    Key? key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.ondDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Checkbox(
          value: taskCompleted,
          onChanged: onChanged,
        ),
        title: Text(
          taskName,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            decoration: taskCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: ondDelete,
          ),
        ),
      ),
    );
  }
}
