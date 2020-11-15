import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wiewiorki_app/models/Question.dart';

import 'Categories.dart';

class QuestionScreen extends StatelessWidget {
  final Color color;
  final CategoriesState parentState;

  const QuestionScreen({Key key, this.color, this.parentState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(parentState.questions.where((element) => element.category == parentState.currentCategory).toList());

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
          children: getButtonsLayout(context, parentState.question),
        ),
      ),
    );
  }

  getButtonsLayout(BuildContext context, Question question) {
    var screenWidth = MediaQuery.of(context).size.width;
    double buttonTextSize;
    double buttonWidth;
    double buttonHeight;
    double backWidth;
    double backHeight;
    String text = question.content;
    if (screenWidth > 800) {
      buttonTextSize = 32;
      buttonWidth = 250;
      buttonHeight = 125;
      backWidth = 100.0;
      backHeight = 50;
    } else {
      buttonTextSize = 20;
      buttonWidth = 150;
      buttonHeight = 75;
      backWidth = 88.0;
      backHeight = 36;
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
      minWidth: backWidth,
      height: backHeight,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(color: Colors.red)),
      child: Text("Powrót"),
    );
    List<Widget> content = List();
    content.add(Text(text));

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

  Future<String> getFileData(String path) async {
    return await rootBundle.loadString(path);
  }
}
