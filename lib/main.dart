import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wiewiorki_app/views/Categories.dart';
import 'package:http/http.dart' as http;

import 'models/Question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Question> questions;

  @override
  void initState() {
    super.initState();
    questions = fetchQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Wiewórki Game"),
            ),
            body: FutureBuilder(
                future: questions,
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? Categories(snapshot.data)
                      : Center(child: CircularProgressIndicator());
                })));
  }
}

Future<Question> fetchQuestion() async {
  final response =
      await http.get('https://wiewiorki-f1db5.firebaseio.com/0.json');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Question.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
