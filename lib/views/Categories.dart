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
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => QuestionOrTaskView(
                      appearance:
                          new ScreenAppearance("ZHP", Colors.indigoAccent),
                    )));
      },
      child: Text(
        "ZHP",
        style: TextStyle(fontSize: 24),
        textAlign: TextAlign.center,
      ),
      color: Colors.indigoAccent,
      minWidth: buttonWidth,
      height: buttonHeight,
    );
  }

  MaterialButton getHufiecButton(
      BuildContext context, double buttonWidth, double buttonHeight) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => QuestionOrTaskView(
                      appearance: new ScreenAppearance("Hufiec", Colors.yellow),
                    )));
      },
      child: Text(
        "Hufiec",
        style: TextStyle(fontSize: 24),
        textAlign: TextAlign.center,
      ),
      color: Colors.yellow,
      minWidth: buttonWidth,
      height: buttonHeight,
    );
  }

  MaterialButton getSzczepButton(
      BuildContext context, double buttonWidth, double buttonHeight) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => QuestionOrTaskView(
                      appearance: new ScreenAppearance("Szczep", Colors.green),
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
      minWidth: buttonWidth,
      height: buttonHeight,
    );
  }

  MaterialButton getGromadaButton(
      BuildContext context, double buttonWidth, double buttonHeight) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
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
        "Gromada",
        style: TextStyle(fontSize: 24),
        textAlign: TextAlign.center,
      ),
    );
  }
}
