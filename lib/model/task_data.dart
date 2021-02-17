import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/model/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  // * 外部からプロパティにアクセスにアクセスできるのを防ぐ。
  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  bool isEmpty() {
    if (_tasks.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  int length() {
    return _tasks.length;
  }

  void addTask(task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(task) {
    if (task.isDone == false) return;
    _tasks.remove(task);
    notifyListeners();
  }

  void toggleDone(task) {
    task.isDone = !task.isDone;
    notifyListeners();
  }
}
