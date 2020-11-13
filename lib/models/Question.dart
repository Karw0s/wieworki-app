import 'Answer.dart';

class Question {
  int number;
  String content;
  String hint;
  Answer answer;
  Category category;

  Question(this.number, this.content, this.hint, this.answer, this.category);

  Question.fromJson(Map<String, dynamic> json)
      : number = json["number"],
        content = json["content"],
        hint = json["hint"],
        answer = Answer.fromJson(json["answer"]),
        category = json["category"];
}

enum Category { GROMADA, SZCZEP, HUFIEC, ZHP }
