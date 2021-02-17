import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/model/task.dart';
import 'package:todoey_flutter/model/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  final Function(String) addTaskCallBack;
  final TextEditingController _controller = TextEditingController();

  AddTaskScreen({this.addTaskCallBack});

  void pushTask(context, taskName) {
    if (taskName == '') return;
    Provider.of<TaskData>(context, listen: false).addTask(Task(name: taskName));
    _controller.clear();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              'Add Task',
              style: TextStyle(fontSize: 30.0, color: Colors.lightBlueAccent),
            ),
          ),
          TextField(
            controller: _controller,
            textAlign: TextAlign.center,
            autofocus: true,
            onChanged: (newText) {
              newTaskTitle = newText;
            },
            // ! KeyBoard上で完了ボタンを押した際もtaskを追加
            onEditingComplete: () {
              pushTask(context, newTaskTitle);
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.lightBlueAccent,
              onPrimary: Colors.black54,
            ),
            onPressed: () {
              pushTask(context, newTaskTitle);
            },
            child: Text(
              'Add',
              style: TextStyle(fontSize: 25.0, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
