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
    double backWidth;
    double backHeight;
    String text = """Lorem ipsum dolor sit amet augue quis lacus. Vivamus malesuada fames ac nunc hendrerit sed, venenatis pede. Etiam imperdiet, nisl nulla ipsum wisi, eu fermentum ultrices posuere dui. Aliquam fermentum molestie egestas, nulla ultricies vitae, consequat hendrerit. Donec urna sem pede bibendum porttitor. Maecenas facilisis congue. Nam purus. Aenean venenatis interdum, lacus. Vivamus arcu turpis at eros. Sed lobortis urna. Nulla nec urna quis massa. Integer aliquet lacinia dignissim. Etiam ullamcorper. Mauris metus. Cras sit amet neque. Phasellus ultrices, gravida varius nec, nibh. Quisque nunc. Suspendisse nec erat velit in quam tristique bibendum quis, varius quis, vestibulum lectus elit, pulvinar augue. Sed ornare, erat id ipsum. Vestibulum ante ipsum scelerisque porttitor auctor, sapien auctor est, ut congue risus commodo est lacus ipsum dolor sit amet neque. Integer ultrices posuere, nibh ac turpis libero, pharetra varius. In tempus euismod. Integer egestas, dui non leo. Aenean dui vitae wisi placerat fringilla, vulputate faucibus. Sed posuere cubilia Curae, Vestibulum lacinia erat. Pellentesque habitant morbi tristique libero nec augue varius dui. Pellentesque quam at libero. Cras vitae tellus. Donec consectetuer adipiscing dictum a, euismod.""";
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
}
