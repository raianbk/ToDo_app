import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:myapp/pages/database.dart';
import 'package:myapp/pages/dialog_box.dart';
import 'package:myapp/pages/my_button.dart';

import 'my_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DataBase db = DataBase();

  final _myBox = Hive.box('myBox');

  final _controller = TextEditingController();
  @override
  void initState() {
    if(_myBox.get("todolist")==null){
      db.createInitialData();
    }else{
      db.loadData();
    }
    super.initState();
  }

  void checkBox(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  void addNewTask() {
    setState(() {
      if (!_controller.text.isEmpty) {
        db.toDoList.add([_controller.text, false]);
        _controller.clear();
      }
    });
        Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: addNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text(
          'TO-DO APP',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return MyList(
            onPressed: (context) => deleteTask(index),
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBox(value, index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.black45,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        shape: CircleBorder(),
      ),
    );
  }
}
