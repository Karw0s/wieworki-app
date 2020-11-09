import 'package:flutter/material.dart';
import 'package:wiewiorki_app/views/Hint.dart';

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
    var screenHeight = MediaQuery.of(context).size.height;
    var buttonWidth = screenWidth / 2 - 75;
    var buttonHeight = screenHeight / 2 - 75;

    return [
      Text("Pytanie"),
      MaterialButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Hint(
                        text: "TEst",
                        color: color,
                      )));
        },
        minWidth: buttonWidth,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: BorderSide(color: color)),
        child: Text("Podpowiedź"),
      ),
      MaterialButton(
        onPressed: () {},
        minWidth: buttonWidth,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: BorderSide(color: color)),
        child: Text("Odpowiedź"),
      ),
      MaterialButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: BorderSide(color: Colors.red)),
        child: Text("Powrót"),
      )
    ];
  }
}
