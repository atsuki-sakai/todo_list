import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/model/task_data.dart';
import 'task_tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              task: task,
              checkBoxCallBack: (_) {
                taskData.toggleDone(task);
              },
              onlongPresse: () {
                taskData.removeTask(task);
              },
            );
          },
          itemCount: taskData.length(),
        );
      },
    );
  }
}
