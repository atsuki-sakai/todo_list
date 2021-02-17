import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/screens/taks_screen.dart';

import 'model/task_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (_) => TaskData(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
