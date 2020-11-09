import 'package:flutter/material.dart';

import 'QuestionOrTask.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var buttonWidth = screenWidth - 50;
    var buttonHeight = 125.0;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Wybierz kategorię",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
          ),
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            color: Colors.deepOrangeAccent,
            minWidth: buttonWidth,
            height: buttonHeight,
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
              "Gromada",
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
                            appearance:
                                new ScreenAppearance("Szczep", Colors.green),
                          )));
            },
            child: Text(
              "Szczep",
              style: TextStyle(
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            color: Colors.green,
            minWidth: buttonWidth,
            height: buttonHeight,
          ),
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QuestionOrTaskView(
                            appearance:
                                new ScreenAppearance("Hufiec", Colors.yellow),
                          )));
            },
            child: Text(
              "Hufiec",
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            color: Colors.yellow,
            minWidth: buttonWidth,
            height: buttonHeight,
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
              "ZHP",
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            color: Colors.indigoAccent,
            minWidth: buttonWidth,
            height: buttonHeight,
          ),
        ],
      ),
    );
  }
}
