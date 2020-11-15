import 'package:flutter/material.dart';

import 'Categories.dart';

class TaskScreen extends StatelessWidget {
  final Color color;
  final CategoriesState parentState;

  const TaskScreen({Key key, this.color, this.parentState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Zadanie",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: color,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(parentState.tasks[0].content)
          ],
        ),
      ),
    );
  }
}
