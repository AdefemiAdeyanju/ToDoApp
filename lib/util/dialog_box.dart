import 'package:flutter/material.dart';
import 'package:todo_app/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({
    super.key, 
    required this.controller,
    required this.onSave,
    required this.onCancel,
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          //User Input
          TextField(
            controller: controller ,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Add a new task'),
          ),

          // Buttons -> save + cancel
          Row(
            mainAxisAlignment:MainAxisAlignment.end ,
            children: [ 
            // Save Button
            MyButton(text: 'Save', onPressed: onSave),

            const SizedBox(width: 8),
            //Cancel Button
            MyButton(text: 'Cancel', onPressed: onCancel)

            ],)
        ]),
      ),
    );
  }
}