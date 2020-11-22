import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wiewiorki_app/main.dart';
import 'package:wiewiorki_app/models/Question.dart';

import 'Categories.dart';
import 'CommonElements.dart';

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
            duration: Duration(seconds: 7),
          ),
        );
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
        // SingleChildScrollView(
        // child:
        // Stack(
        //   children: [
        Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: getButtonsLayout(context, question),
      ),
      // ),
      // ],
      // ),
    );
  }

  getButtonsLayout(BuildContext context, Question question) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    List<Widget> content = List();
    CommonButtonCreator commonButtons;

    if (screenWidth < 800) {
      commonButtons = SmallScreenButtons();
      content.add(getQuestionContent(
          question, commonButtons.getTextSize(), screenHeight));
      content.add(getHintButton(
          SmallScreenButtons.BUTTON_WIDTH,
          SmallScreenButtons.BUTTON_HEIGHT,
          SmallScreenButtons.BUTTON_TEXT_SIZE));
      content.add(commonButtons.getAnswerButton(
          context, widget.color, question.answer));
      content.add(commonButtons.getBackButton(context, widget.color));
    } else {
      commonButtons = BigScreenButtons();
      content.add(getQuestionContent(
          question, commonButtons.getTextSize(), screenHeight));
      content.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            getHintButton(
                BigScreenButtons.BUTTON_WIDTH,
                BigScreenButtons.BUTTON_HEIGHT,
                BigScreenButtons.BUTTON_TEXT_SIZE),
            commonButtons.getAnswerButton(
                context, widget.color, question.answer)
          ],
        ),
      );
      content.add(commonButtons.getBackButton(context, widget.color));
    }
    return content;
  }

  getQuestionContent(Question question, double textSize, double screenHeight) {
    if (question.imageName == null) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: Text(
          question.content,
          style: TextStyle(fontSize: textSize),
          textAlign: TextAlign.center,
        ),
      );
    } else {
      var _imageName = question.imageName;
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child: Text(
              question.content,
              style: TextStyle(fontSize: textSize),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: screenHeight / 2 - 50,
            child: CachedNetworkImage(
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              imageUrl:
                  MyApp.imageUrl + '$_imageName?alt=media',
              fit: BoxFit.scaleDown,
            ),
          ),
        ],
      );
    }
  }

  getHintButton(
      double buttonWidth, double buttonHeight, double buttonTextSize) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: MaterialButton(
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
      ),
    );
  }
}
