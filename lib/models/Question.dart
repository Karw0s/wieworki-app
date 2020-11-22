import 'Answer.dart';
import 'Category.dart';

class Question {
  int id;
  String content;
  String hint;
  Answer answer;
  Category category;
  String imageName;

  Question({this.id, this.content, this.hint, this.answer, this.category, this.imageName});

  Question.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        content = json["content"],
        hint = json["hint"],
        category = getCategoryFromString(json["category"]),
        answer = Answer.fromJson(json["answer"]),
        imageName = json["imageName"];
}


