import 'package:flutter/material.dart';
import 'package:todo_app/util/dialog_box.dart';

import '../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

// Text Controller
final _controller = TextEditingController();


// toDoList LIST
List toDoList = [
  ['Make Tutorial', false],
  ['Do Exercise', false],
];

// CheckBox Function
void checkBoxChanged(bool? value, int index){
  setState(() {
    toDoList[index][1]= !toDoList[index][1];
  });
  Navigator.of(context).pop();
}

// Save New Task
void saveNewTask(){
  setState(() {
    toDoList.add([_controller.text,false]);
    _controller.clear();
  });
}


// CreateNewTask Function
void createNewTask() {
  showDialog(
    context: context,
    builder: (context) {
      return DialogBox(
        controller:_controller,
        onSave: saveNewTask,
        onCancel: () => Navigator.of(context).pop(),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[300],
      appBar: AppBar(
        title: Text('TO DO'),
        centerTitle: true,
        backgroundColor: Colors.yellow),

        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),
          ),

      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(taskName: toDoList[index][0], 
          taskCompleted: toDoList[index][1], 
          onChanged: (value)=> checkBoxChanged(value, index),
          );
          },
      )

    );
  }
}