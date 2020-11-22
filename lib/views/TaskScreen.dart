import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wiewiorki_app/main.dart';
import 'package:wiewiorki_app/models/Task.dart';

import 'Categories.dart';
import 'CommonElements.dart';

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
      body: new TaskScreenBody(
        task: task,
        outOfTasks: outOfTasks,
        color: widget.color,
      ),
      bottomNavigationBar: getFooter(),
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

class TaskScreenBody extends StatefulWidget {
  final bool outOfTasks;
  final Task task;
  final Color color;

  const TaskScreenBody({Key key, this.task, this.outOfTasks, this.color})
      : super(key: key);

  @override
  _TaskScreenBodyState createState() => _TaskScreenBodyState(task, outOfTasks);
}

class _TaskScreenBodyState extends State<TaskScreenBody> {
  final Task task;
  final bool outOfTasks;
  String _outOfTasksMessage =
      "Już znasz wszyskie zadania z tej kategorii. Od tej pory zadania będą się powtarzać.";

  _TaskScreenBodyState(this.task, this.outOfTasks);

  @override
  void initState() {
    if (outOfTasks) {
      new Future<Null>.delayed(Duration.zero, () {
        Scaffold.of(context).showSnackBar(
          new SnackBar(
            content: new Text(_outOfTasksMessage),
            duration: Duration(seconds: 7),
          ),
        );
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: getTaskLayout(context),
      ),
    );
  }

  getTaskLayout(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    if (screenWidth < 800) {
      return getScreenLayout(SmallScreenButtons(), screenHeight);
    } else {
      return getScreenLayout(BigScreenButtons(), screenHeight);
    }
  }

  getScreenLayout(CommonButtonCreator buttonCreator, double screenHeight) {
    List<Widget> content = List();
    content
        .add(getTaskContent(task, buttonCreator.getTextSize(), screenHeight));
    if (task.answer != null) {
      content.add(
          buttonCreator.getAnswerButton(context, widget.color, task.answer));
    }
    content.add(buttonCreator.getBackButton(context, widget.color));
    return content;
  }

  getTaskContent(Task task, double textSize, double screenHeight) {
    if (task.imageName == null) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: Text(
          task.content,
          style: TextStyle(fontSize: textSize),
          textAlign: TextAlign.center,
        ),
      );
    } else {
      var _imageName = task.imageName;
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child: Text(
              task.content,
              style: TextStyle(fontSize: textSize),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: screenHeight / 2 - 50,
            child: CachedNetworkImage(
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              imageUrl: MyApp.imageUrl + '$_imageName?alt=media',
              fit: BoxFit.scaleDown,
            ),
          ),
        ],
      );
    }
  }
}
