import 'package:wiewiorki_app/models/Answer.dart';

import 'Category.dart';

class Task {
  int id;
  String content;
  String hint;
  String imageName;
  Category category;
  Answer answer;

  Task({this.id, this.content, this.hint, this.imageName, this.category, this.answer});

  Task.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        content = json["content"],
        hint = json["hint"],
        imageName = json["imageName"],
        category = getCategoryFromString(json["category"]),
        answer = json["answer"] == null ? null : Answer.fromJson(json["answer"]);
}
