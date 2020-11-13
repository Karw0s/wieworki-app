import 'package:flutter/material.dart';

import 'QuestionOrTask.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var buttonMobileWidth = screenWidth - 50;
    var buttonMobileHeight = 125.0;
    var buttonBrowserWidth = screenWidth / 2 - 75;
    var buttonBrowserHeight = screenHeight / 2 - 75;
    return screenWidth < 800 ? Center(
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
            minWidth: buttonMobileWidth,
            height: buttonMobileHeight,
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
            minWidth: buttonMobileWidth,
            height: buttonMobileHeight,
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
            minWidth: buttonMobileWidth,
            height: buttonMobileHeight,
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
            minWidth: buttonMobileWidth,
            height: buttonMobileHeight,
          ),
        ],
      ),
    ) : Center(
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
                minWidth: buttonBrowserWidth,
                height: buttonBrowserHeight,
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
                minWidth: buttonBrowserWidth,
                height: buttonBrowserHeight,
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
                minWidth: buttonBrowserWidth,
                height: buttonBrowserHeight,
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
                minWidth: buttonBrowserWidth,
                height: buttonBrowserHeight,
              ),
            ],
          )
        ],
      ),
    );
  }
}
