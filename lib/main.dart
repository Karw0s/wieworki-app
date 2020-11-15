import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wiewiorki_app/models/Task.dart';
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
  Future<List<Question>> questions;
  Future<List<Task>> tasks;

  @override
  void initState() {
    super.initState();
    questions = fetchQuestion();
    tasks = fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Wiewórki Game"),
            ),
            body: FutureBuilder(
                future: Future.wait([questions, tasks]),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? Categories(snapshot.data[0], snapshot.data[1])
                      : Center(child: CircularProgressIndicator());
                })));
  }
}

Future<List<Question>> fetchQuestion() async {
  final response =
      await http.get('https://wiewiorki-f1db5.firebaseio.com/questions.json');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final parsed = jsonDecode(response.body) as List;
    return parsed.map<Question>((json)=> Question.fromJson(json)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<List<Task>> fetchTasks() async {
  final response =
      await http.get('https://wiewiorki-f1db5.firebaseio.com/tasks.json');

  if (response.statusCode == 200) {
    final parsed = jsonDecode(response.body) as List;
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return parsed.map<Task>((json) => Task.fromJson(json)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
