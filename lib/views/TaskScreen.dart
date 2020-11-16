import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wiewiorki_app/models/Task.dart';

import 'Categories.dart';

class TaskScreen extends StatefulWidget {
  final Color color;
  final CategoriesState parentState;

  const TaskScreen({Key key, this.color, this.parentState}) : super(key: key);

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  Task task;
  bool outOfTasks;

  @override
  void initState() {
    super.initState();
    outOfTasks = false;
    task = drawTask(widget.parentState.tasks);
  }

  @override
  void deactivate() {
    widget.parentState.setState(() {
      if (outOfTasks) {
        var list = widget.parentState.tasks
            .where((element) =>
                element.category == widget.parentState.currentCategory)
            .map((e) => e.id)
            .toList();

        widget.parentState.askedTasks.removeWhere((id) => list.contains(id));
      }
      widget.parentState.askedTasks.add(task.id);
    });
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Zadanie",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: widget.color,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: outOfTasks
              ? [
                  Text(
                    "Już znasz wszyskie zadania z tej kategorii. Wszyskie zadania w tej kategorii wracają do póli.",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  Text(task.content)
                ]
              : [Text(task.content)],
        ),
      ),
    );
  }

  Task drawTask(List<Task> tasks) {
    var rnd = new Random();
    var taskInCategory = tasks
        .where(
            (element) => element.category == widget.parentState.currentCategory)
        .toList();
    var tasksAvailable = taskInCategory
        .where((element) => !widget.parentState.askedTasks.contains(element.id))
        .toList();
    if (tasksAvailable.isEmpty) {
      outOfTasks = true;
      tasksAvailable = taskInCategory;
    }
    return tasksAvailable.elementAt(rnd.nextInt(tasksAvailable.length));
  }
}
