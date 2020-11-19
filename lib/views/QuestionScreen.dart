import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wiewiorki_app/models/Answer.dart';
import 'package:wiewiorki_app/models/Question.dart';

import 'Categories.dart';

class QuestionScreen extends StatefulWidget {
  final Color color;
  final CategoriesState parentState;

  const QuestionScreen({Key key, this.color, this.parentState})
      : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  Question question;
  bool isOutOfQuestions;

  @override
  void initState() {
    super.initState();
    isOutOfQuestions = false;
    question = drawQuestion(widget.parentState);
  }

  @override
  void deactivate() {
    widget.parentState.setState(() {
      if (isOutOfQuestions) {
        var list = widget.parentState.questions
            .where((e) => e.category == widget.parentState.currentCategory)
            .map((e) => e.id)
            .toList();
        widget.parentState.askedQuestions
            .removeWhere((id) => list.contains(id));
      }
      widget.parentState.askedQuestions.add(question.id);
    });
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    // print(parentState.questions.where((element) => element.category == parentState.currentCategory).toList());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Pytanie",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: widget.color,
        ),
        body: new QuestionScreenBody(
          outOfQuestions: isOutOfQuestions,
          question: question,
          color: widget.color,
        ));
  }

  Question drawQuestion(CategoriesState parentState) {
    var rnd = new Random();
    var questionsInCategory = parentState.questions
        .where((element) => element.category == parentState.currentCategory)
        .toList();
    var questionsAvailable = questionsInCategory
        .where((element) =>
            !widget.parentState.askedQuestions.contains(element.id))
        .toList();
    if (questionsAvailable.isEmpty) {
      isOutOfQuestions = true;
      print(isOutOfQuestions);
      questionsAvailable = questionsInCategory;
    }
    return questionsAvailable.elementAt(rnd.nextInt(questionsAvailable.length));
  }
}

class QuestionScreenBody extends StatefulWidget {
  final bool outOfQuestions;
  final Question question;
  final Color color;

  const QuestionScreenBody(
      {Key key, this.outOfQuestions, this.question, this.color})
      : super(key: key);

  @override
  _QuestionScreenBodyState createState() =>
      _QuestionScreenBodyState(outOfQuestions, question);
}

class _QuestionScreenBodyState extends State<QuestionScreenBody> {
  final bool outOfQuestions;
  final Question question;
  String _outOfQuestionsMessage =
      "Już znasz wszyskie pytania z tej kategorii. Pytania od tej pory będą się powtarzać!";

  _QuestionScreenBodyState(this.outOfQuestions, this.question);

  @override
  void initState() {
    if (outOfQuestions) {
      new Future<Null>.delayed(Duration.zero, () {
        Scaffold.of(context).showSnackBar(
          new SnackBar(
            content: new Text(_outOfQuestionsMessage),
            duration: Duration(seconds: 5),
          ),
        );
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: getButtonsLayout(context, question),
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
    List<Widget> content = List();

    if (screenWidth < 800) {
      buttonTextSize = 20;
      buttonWidth = 150;
      buttonHeight = 75;
      backWidth = 88.0;
      backHeight = 36;

      content.add(Text(
        question.content,
        style: TextStyle(fontSize: 36),
        textAlign: TextAlign.center,
      ));
      content.add(getAnswerButton(buttonWidth, buttonHeight, buttonTextSize));
      content.add(getHintButton(buttonWidth, buttonHeight, buttonTextSize));
      content.add(getBackButton(backWidth, backHeight, 32));
    } else {
      buttonTextSize = 26;
      buttonWidth = 200;
      buttonHeight = 100;
      backWidth = 100.0;
      backHeight = 75;

      content.add(Text(
        question.content,
        style: TextStyle(fontSize: 42),
        textAlign: TextAlign.center,
      ));
      content.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          getHintButton(buttonWidth, buttonHeight, buttonTextSize),
          getAnswerButton(buttonWidth, buttonHeight, buttonTextSize)
        ],
      ));
      content.add(getBackButton(backWidth, backHeight, 46));
    }
    return content;
  }

  getHintButton(
      double buttonWidth, double buttonHeight, double buttonTextSize) {
    return MaterialButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Podpowiedź"),
                content: Text(question.hint),
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
          side: BorderSide(color: widget.color, width: 5)),
      splashColor: widget.color,
      child: Text(
        "Podpowiedź",
        style: TextStyle(fontSize: buttonTextSize),
        textAlign: TextAlign.center,
      ),
    );
  }

  getAnswerButton(
      double buttonWidth, double buttonHeight, double buttonTextSize) {
    return MaterialButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Odpowiedź"),
                content: getDialogContent(widget.question.answer),
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
          side: BorderSide(color: widget.color, width: 5)),
      splashColor: widget.color,
      child: Text(
        "Odpowiedź",
        style: TextStyle(fontSize: buttonTextSize),
        textAlign: TextAlign.center,
      ),
    );
  }

  getDialogContent(Answer answer) {
    print(answer);
    var _imageName = answer.imageName;
    if (answer.imageName == null) {
      return Text(answer.content);
    } else {
      return Center(
        heightFactor: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(answer.content),
              ],
            ),
            Row(
              children: [Text("")],
            ),
            CachedNetworkImage(
              placeholder: (context, url) => CircularProgressIndicator(),
              imageUrl:
                  'https://firebasestorage.googleapis.com/v0/b/wiewiorki-f1db5.appspot.com/o/$_imageName?alt=media',
              fit: BoxFit.cover,
            )
          ],
        ),
      );
    }
  }

  getBackButton(double backWidth, double backHeight, double iconSize) {
    return MaterialButton(
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
      shape: CircleBorder(),
      child: Icon(
        Icons.home,
        color: Colors.white,
        size: iconSize,
      ),
      splashColor: Colors.red,
      color: widget.color,
      padding: EdgeInsets.all(16),
    );
  }
}
