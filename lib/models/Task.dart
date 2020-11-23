import 'package:wiewiorki_app/models/DialogContent.dart';

import 'Category.dart';

class Task {
  int id;
  String content;
  String imageName;
  Category category;
  DialogContent hint;
  DialogContent answer;

  Task(
      {this.id,
      this.content,
      this.hint,
      this.imageName,
      this.category,
      this.answer});

  Task.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        content = json["content"],
        hint =
            json["hint"] == null ? null : DialogContent.fromJson(json["hint"]),
        imageName = json["imageName"],
        category = getCategoryFromString(json["category"]),
        answer = json["answer"] == null
            ? null
            : DialogContent.fromJson(json["answer"]);
}
