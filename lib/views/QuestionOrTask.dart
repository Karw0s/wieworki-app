import 'package:flutter/material.dart';

import 'QuestionScreen.dart';
import 'Categories.dart';
import 'TaskScreen.dart';

class QuestionOrTaskView extends StatelessWidget {
  final ScreenAppearance appearance;
  final CategoriesState parentSate;

  const QuestionOrTaskView({Key key, this.appearance, this.parentSate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            appearance.title,
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: appearance.color,
        ),
        body: Center(child: getButtons(context, width)));
  }

  getButtons(BuildContext context, double width) {
    var buttons = [
      MaterialButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => QuestionScreen(
                        color: appearance.color,
                        parentState: parentSate,
                      )));
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: BorderSide(color: appearance.color, width: 5)),
        height: 250,
        minWidth: 300,
        splashColor: appearance.color,
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
                  builder: (context) => TaskScreen(
                        color: appearance.color,
                        parentState: parentSate,
                      )));
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: BorderSide(color: appearance.color, width: 5)),
        height: 250,
        minWidth: 300,
        splashColor: appearance.color,
        child: Text(
          "Zadanie",
          style: TextStyle(fontSize: 40),
          textAlign: TextAlign.center,
        ),
        // color: Colors.indigoAccent,
      )
    ];

    if (width < 800) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buttons,
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buttons,
      );
    }
  }
}

class ScreenAppearance {
  final String title;
  final Color color;

  ScreenAppearance(this.title, this.color);
}
