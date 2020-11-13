import 'package:flutter/material.dart';
import 'package:wiewiorki_app/views/Categories.dart';

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
      body: Categories(),
    ));
  }
}
