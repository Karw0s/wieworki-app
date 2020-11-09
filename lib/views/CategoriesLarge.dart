import 'package:flutter/material.dart';

import 'QuestionOrTask.dart';

class CategoriesLarge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var buttonWidth = screenWidth / 2 - 75;
    var buttonHeight = screenHeight / 2 - 75;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Wybierz kategorię",
                style: TextStyle(
                  fontSize: 32,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
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
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
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
                  "Szczep",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
                color: Colors.green,
                minWidth: buttonWidth,
                height: buttonHeight,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
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
          )
        ],
      ),
    );
  }
}
