import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  final Color color;

  const TaskScreen({Key key, this.color}) : super(key: key);

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
          children: [Text("Task lorem ipsum")],
        ),
      ),
    );
  }
}