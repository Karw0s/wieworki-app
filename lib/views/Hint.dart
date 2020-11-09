import 'package:flutter/material.dart';

class Hint extends StatelessWidget {
  final String text;
  final Color color;

  const Hint({Key key, this.color, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Podpowiedź",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: color,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(text)
          ],
        ),
      ),
    );
  }
}
