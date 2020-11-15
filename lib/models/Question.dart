import 'Answer.dart';

class Question {
  int id;
  String content;
  String hint;
  Answer answer;
  Category category;

  Question({this.id, this.content, this.hint, this.answer, this.category});

  Question.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        content = json["content"],
        hint = json["hint"],
        category = getCategoryFromString(json["category"]),
        answer = Answer.fromJson(json["answer"]);
}

getCategoryFromString(String c) {
  for(Category category in Category.values) {
    if (category.toString().split('.')[1].toUpperCase() == c) {
      return category;
    }
  }
  return null;
}

enum Category {
  GROMADA, SZCZEP, HUFIEC, ZHP
}
