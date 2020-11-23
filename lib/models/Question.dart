import 'DialogContent.dart';
import 'Category.dart';

class Question {
  int id;
  String content;
  String imageName;
  Category category;
  DialogContent hint;
  DialogContent answer;

  Question(
      {this.id,
      this.content,
      this.hint,
      this.answer,
      this.category,
      this.imageName});

  Question.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        content = json["content"],
        hint =
            json["hint"] == null ? null : DialogContent.fromJson(json["hint"]),
        category = getCategoryFromString(json["category"]),
        answer = json["hint"] == null
            ? null
            : DialogContent.fromJson(json["answer"]),
        imageName = json["imageName"];
}
