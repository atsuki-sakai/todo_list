import 'package:flutter/material.dart';
import 'package:todoey_flutter/model/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function checkBoxCallBack;
  final Function onlongPresse;

  TaskTile({this.task, this.checkBoxCallBack, this.onlongPresse});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onlongPresse,
      title: Text(
        task.name,
        style: TextStyle(
            decoration: task.isDone ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: task.isDone,
        onChanged: checkBoxCallBack,
      ),
    );
  }
}
