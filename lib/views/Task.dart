import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  final Color color;

  const Task({Key key, this.color}) : super(key: key);

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