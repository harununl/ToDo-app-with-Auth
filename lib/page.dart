import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_individual/ToDo.dart';
import 'package:flutter_individual/auth.dart';
import 'package:flutter_individual/dialogBox.dart';
import 'package:flutter_individual/home.dart';
import 'package:hive/hive.dart';
import 'main.dart';
import 'package:flutter_individual/login.dart';
import 'package:flutter_individual/signUp.dart';
import 'package:flutter_individual/ToDoItem.dart';
import 'package:flutter_individual/ToDo.dart';

class page extends StatefulWidget {
  const page({super.key});

  @override
  State<page> createState() => _pageState();
}

final _myBox = Hive.box('mybox');

final toDoController = TextEditingController();
final FirebaseAuth _auth = FirebaseAuth.instance;
ToDoDataBase db = ToDoDataBase();

int a = 0;

class _pageState extends State<page> {
  @override
  void initState() {
    db.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 75),
            child: Text(
              "To Do App",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.grey[800],
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              setState(() {
                _auth.signOut();
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Başarıyla çıkış yaptınız..')));

                Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const home(),
                  ),
                );
              });
            },
            child: Icon(Icons.exit_to_app),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createNewTask();
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.grey[800],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context, index) {
            return ToDoItem(
              taskName: db.todoList[index][0],
              taskCompleted: db.todoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              ondDelete: () => deleteItem(index),
            );
          },
        ),
      ),
    );
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: toDoController,
            onSaved: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
    toDoController.clear();
  }

  void saveNewTask() {
    setState(() {
      db.todoList.add([toDoController.text, false]);
    });
    Navigator.of(context).pop();
    toDoController.clear();
    db.updateData();
  }

  void deleteItem(int index) {
    setState(() {
      db.todoList.removeAt(index);
      print("object");
    });
    db.updateData();
  }
}
