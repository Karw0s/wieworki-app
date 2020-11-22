import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wiewiorki_app/main.dart';
import 'package:wiewiorki_app/models/Answer.dart';

class CommonButtonCreator {
  getAnswerButton(BuildContext context, Color color, Answer answer) {}

  getBackButton(BuildContext context, Color color) {}

  getTextSize() {}
}

class SmallScreenButtons implements CommonButtonCreator {
  static const double BUTTON_TEXT_SIZE = 20;
  static const double BUTTON_WIDTH = 150;
  static const double BUTTON_HEIGHT = 75;
  static const double BACK_BUTTON_WIDTH = 88.0;
  static const double BACK_BUTTON_HEIGHT = 36;
  static const double HOME_ICON_SIZE = 32;
  static const double TEXT_SIZE = 30;

  @override
  getAnswerButton(BuildContext context, Color color, Answer answer) {
    return createAnswerButton(
        BUTTON_WIDTH, BUTTON_HEIGHT, BUTTON_TEXT_SIZE, answer, color, context);
  }

  @override
  getBackButton(BuildContext context, Color color) {
    return createBackButton(
        BACK_BUTTON_WIDTH, BACK_BUTTON_HEIGHT, HOME_ICON_SIZE, color, context);
  }

  @override
  getTextSize() {
    return TEXT_SIZE;
  }
}

class BigScreenButtons implements CommonButtonCreator {
  static const double BUTTON_TEXT_SIZE = 26;
  static const double BUTTON_WIDTH = 200;
  static const double BUTTON_HEIGHT = 100;
  static const double BACK_BUTTON_WIDTH = 100.0;
  static const double BACK_BUTTON_HEIGHT = 75;
  static const double HOME_ICON_SIZE = 46;
  static const double TEXT_SIZE = 42;

  @override
  getAnswerButton(BuildContext context, Color color, Answer answer) {
    return createAnswerButton(
        BUTTON_WIDTH, BUTTON_HEIGHT, BUTTON_TEXT_SIZE, answer, color, context);
  }

  @override
  getBackButton(BuildContext context, Color color) {
    return createBackButton(
        BACK_BUTTON_WIDTH, BACK_BUTTON_HEIGHT, HOME_ICON_SIZE, color, context);
  }

  @override
  getTextSize() {
    return TEXT_SIZE;
  }
}

createAnswerButton(double buttonWidth, double buttonHeight,
    double buttonTextSize, Answer answer, Color color, BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(5),
    child: MaterialButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Odpowiedź"),
                content: getDialogContent(answer),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
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
      splashColor: color,
      child: Text(
        "Odpowiedź",
        style: TextStyle(fontSize: buttonTextSize),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

getDialogContent(Answer answer) {
  var _imageName = answer.imageName;
  if (answer.imageName == null) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Text(answer.content),
    );
  } else {
    return Center(
      heightFactor: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(7),
            child: Row(
              children: [
                Text(answer.content),
              ],
            ),
          ),
          CachedNetworkImage(
            placeholder: (context, url) => CircularProgressIndicator(),
            imageUrl:
                MyApp.imageUrl + '$_imageName?alt=media',
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}

createBackButton(double backWidth, double backHeight, double iconSize,
    Color color, BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(5),
    child: MaterialButton(
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
      color: color,
      padding: EdgeInsets.all(16),
    ),
  );
}
