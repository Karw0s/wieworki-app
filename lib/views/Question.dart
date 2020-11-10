import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final Color color;

  const Question({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pytanie",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: color,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: getButtonsLayout(context),
        ),
      ),
    );
  }

  getButtonsLayout(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    double buttonTextSize;
    double buttonWidth;
    double buttonHeight;
    if (screenWidth > 800) {
      buttonTextSize = 32;
      buttonWidth = 300;
      buttonHeight = 150;
    } else {
      buttonTextSize = 20;
      buttonWidth = 200;
      buttonHeight = 100;
    }

    var hintButton = MaterialButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Podpowiedź"),
                content: Text("Tekst podpowiedzi"),
                actions: [
                  FlatButton(
                      child: Text("Zamknij"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      })
                ],
              );
            });
      },
      minWidth: buttonWidth,
      height: buttonHeight,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(color: color, width: 5)),
      child: Text(
        "Podpowiedź",
        style: TextStyle(fontSize: buttonTextSize),
        textAlign: TextAlign.center,
      ),
    );
    var answerButton = MaterialButton(
      onPressed: () {},
      minWidth: buttonWidth,
      height: buttonHeight,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(color: color, width: 5)),
      child: Text(
        "Odpowiedź",
        style: TextStyle(fontSize: buttonTextSize),
        textAlign: TextAlign.center,
      ),
    );
    var backButton = MaterialButton(
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(color: Colors.red)),
      child: Text("Powrót"),
    );
    List<Widget> content = List();
    content.add(Text("Pytanie"));

    if (screenWidth < 800) {
      content.add(answerButton);
      content.add(hintButton);
      content.add(backButton);
    } else {
      content.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [hintButton, answerButton],
      ));
      content.add(backButton);
    }

    return content;
  }
}
