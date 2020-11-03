import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Wiewórki Game"),
          ),
          body: Buttons(),
        ));
  }
}

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MaterialButton(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            color: Colors.deepOrangeAccent,
            minWidth: 300,
            height: 100,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QuestionOrTaskView(
                        appearance: new ScreenAppearance(
                            "Gromada", Colors.deepOrangeAccent),
                      )));
            },
            child: Text(
              "Kategoria 1\nGromada",
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ),
          MaterialButton(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QuestionOrTaskView(
                        appearance: new ScreenAppearance(
                            "Szczep", Colors.green),
                      )));
            },
            child: Text(
              "Kategoria 2\nSzczep",
              style: TextStyle(
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            color: Colors.green,
            minWidth: 300,
            height: 100,
          ),
          MaterialButton(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QuestionOrTaskView(
                        appearance: new ScreenAppearance(
                            "Hufiec", Colors.yellow),
                      )));
            },
            child: Text(
              "Kategoria 3\nHufiec",
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            color: Colors.yellow,
            minWidth: 300,
            height: 100,
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QuestionOrTaskView(
                        appearance: new ScreenAppearance(
                            "ZHP", Colors.indigoAccent),
                      )));
            },
            child: Text(
              "Kategoria 4\nZHP",
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            color: Colors.indigoAccent,
            minWidth: 300,
            height: 100,
          ),
        ],
      ),
    );
  }
}

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
                onPressed: () {},
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
                  Navigator.pop(context);
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

class Answer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Odpowiedz"),),
    );
  }
}

class ButtonDetails {
  final String text;
  final Color color;
  final Function;

  ButtonDetails(this.Function, this.text, this.color);
}

class ScreenAppearance {
  final String title;
  final Color color;

  ScreenAppearance(this.title, this.color);
}
