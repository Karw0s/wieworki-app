import 'package:flutter/material.dart';

import 'QuestionOrTask.dart';

class CategoriesLarge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var buttonWidth = screenWidth / 2 - 50;
    var buttonHeight = screenHeight / 2 - 50;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
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
                  "Kategoria 1\nGromada",
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
                  "Kategoria 2\nSzczep",
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
                  "Kategoria 3\nHufiec",
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
                  "Kategoria 4\nZHP",
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
      // child: GridView.count(
      //   crossAxisCount: 2,
      //   crossAxisSpacing: 25,
      //   childAspectRatio: 2,
      //   // padding: ,
      //   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: [
      //     MaterialButton(
      //       shape:
      //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      //       color: Colors.deepOrangeAccent,
      //       minWidth: 300,
      //       // height: 100,
      //       onPressed: () {
      //         Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (context) => QuestionOrTaskView(
      //                   appearance: new ScreenAppearance(
      //                       "Gromada", Colors.deepOrangeAccent),
      //                 )));
      //       },
      //       child: Text(
      //         "Kategoria 1\nGromada",
      //         style: TextStyle(fontSize: 24),
      //         textAlign: TextAlign.center,
      //       ),
      //     ),
      //     MaterialButton(
      //       shape:
      //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      //       onPressed: () {
      //         Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (context) => QuestionOrTaskView(
      //                   appearance:
      //                   new ScreenAppearance("Szczep", Colors.green),
      //                 )));
      //       },
      //       child: Text(
      //         "Kategoria 2\nSzczep",
      //         style: TextStyle(
      //           fontSize: 24,
      //         ),
      //         textAlign: TextAlign.center,
      //       ),
      //       color: Colors.green,
      //       minWidth: 300,
      //       // height: 100,
      //     ),
      //     MaterialButton(
      //       shape:
      //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      //       onPressed: () {
      //         Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (context) => QuestionOrTaskView(
      //                   appearance:
      //                   new ScreenAppearance("Hufiec", Colors.yellow),
      //                 )));
      //       },
      //       child: Text(
      //         "Kategoria 3\nHufiec",
      //         style: TextStyle(fontSize: 24),
      //         textAlign: TextAlign.center,
      //       ),
      //       color: Colors.yellow,
      //       minWidth: 300,
      //       height: 100,
      //     ),
      //     MaterialButton(
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(18),
      //       ),
      //       onPressed: () {
      //         Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (context) => QuestionOrTaskView(
      //                   appearance: new ScreenAppearance(
      //                       "ZHP", Colors.indigoAccent),
      //                 )));
      //       },
      //       child: Text(
      //         "Kategoria 4\nZHP",
      //         style: TextStyle(fontSize: 24),
      //         textAlign: TextAlign.center,
      //       ),
      //       color: Colors.indigoAccent,
      //       minWidth: 300,
      //       height: 100,
      //     ),
      //   ],
      // ),
    );
  }
}
