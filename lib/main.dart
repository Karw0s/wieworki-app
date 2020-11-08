import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wiewiorki_app/views/WidgetSwitcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Wiewórki Game"),
      ),
      body: WidgetSwitcher(),
    ));
  }
}

class ButtonDetails {
  final String text;
  final Color color;
  final Function;

  ButtonDetails(this.Function, this.text, this.color);
}
