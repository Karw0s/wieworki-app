import 'package:flutter/material.dart';
import 'package:wiewiorki_app/models/Question.dart';

import 'QuestionOrTask.dart';

class Categories extends StatefulWidget {
  final Question question;

  Categories(this.question);

  @override
  CategoriesState createState() => CategoriesState(question);
}

class CategoriesState extends State<Categories> {
  Category currentCategory;
  Question question;

  CategoriesState(this.question);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var buttonMobileWidth = screenWidth - 50;
    var buttonMobileHeight = 125.0;
    var buttonBrowserWidth = screenWidth / 2 - 75;
    var buttonBrowserHeight = screenHeight / 2 - 75;

    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: screenWidth < 800
              ? mobileView(context, buttonMobileWidth, buttonMobileHeight)
              : browserView(context, buttonBrowserWidth, buttonBrowserHeight)),
    );
  }

  List<Widget> browserView(BuildContext context, double buttonBrowserWidth,
      double buttonBrowserHeight) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Wybierz kategorię",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32),
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          getGromadaButton(context, buttonBrowserWidth, buttonBrowserHeight),
          getSzczepButton(context, buttonBrowserWidth, buttonBrowserHeight)
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          getHufiecButton(context, buttonBrowserWidth, buttonBrowserHeight),
          getZHPButton(context, buttonBrowserWidth, buttonBrowserHeight),
        ],
      )
    ];
  }

  List<Widget> mobileView(BuildContext context, double buttonMobileWidth,
      double buttonMobileHeight) {
    return [
      Text(
        "Wybierz kategorię",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24),
      ),
      getGromadaButton(context, buttonMobileWidth, buttonMobileHeight),
      getSzczepButton(context, buttonMobileWidth, buttonMobileHeight),
      getHufiecButton(context, buttonMobileWidth, buttonMobileHeight),
      getZHPButton(context, buttonMobileWidth, buttonMobileHeight),
    ];
  }

  MaterialButton getZHPButton(
      BuildContext context, double buttonWidth, double buttonHeight) {
    var color = Colors.indigoAccent;
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      color: color,
      minWidth: buttonWidth,
      height: buttonHeight,
      onPressed: () {
        setState(() {
          currentCategory = Category.ZHP;
        });
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => QuestionOrTaskView(
                      appearance: new ScreenAppearance("ZHP", color),
                      parentSate: this,
                    )));
      },
      child: Text(
        "ZHP",
        style: TextStyle(fontSize: 24),
        textAlign: TextAlign.center,
      ),
    );
  }

  MaterialButton getHufiecButton(
      BuildContext context, double buttonWidth, double buttonHeight) {
    var color = Colors.yellow;
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      color: color,
      minWidth: buttonWidth,
      height: buttonHeight,
      onPressed: () {
        setState(() {
          currentCategory = Category.HUFIEC;
        });
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => QuestionOrTaskView(
                      appearance: new ScreenAppearance("Hufiec", color),
                      parentSate: this,
                    )));
      },
      child: Text(
        "Hufiec",
        style: TextStyle(fontSize: 24),
        textAlign: TextAlign.center,
      ),
    );
  }

  MaterialButton getSzczepButton(
      BuildContext context, double buttonWidth, double buttonHeight) {
    var color = Colors.green;
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      color: color,
      minWidth: buttonWidth,
      height: buttonHeight,
      onPressed: () {
        setState(() {
          currentCategory = Category.SZCZEP;
        });
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => QuestionOrTaskView(
                      appearance: new ScreenAppearance("Szczep", color),
                      parentSate: this,
                    )));
      },
      child: Text(
        "Szczep",
        style: TextStyle(
          fontSize: 24,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  MaterialButton getGromadaButton(
      BuildContext context, double buttonWidth, double buttonHeight) {
    var color = Colors.deepOrangeAccent;
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      color: color,
      minWidth: buttonWidth,
      height: buttonHeight,
      onPressed: () {
        setState(() {
          currentCategory = Category.GROMADA;
        });
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => QuestionOrTaskView(
                      appearance: new ScreenAppearance("Gromada", color),
                      parentSate: this,
                    )));
      },
      child: Text(
        "Gromada",
        style: TextStyle(fontSize: 24),
        textAlign: TextAlign.center,
      ),
    );
  }
}
