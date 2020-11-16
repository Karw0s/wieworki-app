import 'Category.dart';

class Task {
  int id;
  String content;
  String hint;
  Category category;

  Task({this.id, this.content, this.hint, this.category});

  Task.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        content = json["content"],
        hint = json["hint"],
        category = getCategoryFromString(json["category"]);
}
