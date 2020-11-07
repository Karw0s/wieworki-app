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
          children: [
            Text("Pytanie"),
            MaterialButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(color: color)),
              child: Text("Odpowiedź"),
            )
          ],
        ),
      ),
    );
  }
}
