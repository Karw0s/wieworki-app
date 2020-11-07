import 'package:flutter/material.dart';

import 'Question.dart';
import 'Task.dart';

class QuestionOrTaskView extends StatelessWidget {
  final ScreenAppearance appearance;

  const QuestionOrTaskView({Key key, this.appearance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            appearance.title,
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: appearance.color,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Question(
                                color: appearance.color,
                              )));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    side: BorderSide(color: appearance.color, width: 5)),
                height: 250,
                minWidth: 300,
                child: Text(
                  "Pytanie",
                  style: TextStyle(fontSize: 40),
                  textAlign: TextAlign.center,
                ),
                // color: Colors.indigoAccent,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Task(
                                color: appearance.color,
                              )));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    side: BorderSide(color: appearance.color, width: 5)),
                height: 250,
                minWidth: 300,
                child: Text(
                  "Zadanie",
                  style: TextStyle(fontSize: 40),
                  textAlign: TextAlign.center,
                ),
                // color: Colors.indigoAccent,
              )
            ],
          ),
        ));
  }
}

class ScreenAppearance {
  final String title;
  final Color color;

  ScreenAppearance(this.title, this.color);
}
