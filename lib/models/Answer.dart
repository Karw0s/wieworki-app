class Answer {
  AnswerType type;
  String imageName;
  String content;

  Answer(this.type, this.imageName, this.content);

  Answer.fromJson(Map<String, dynamic> json)
      : type = json["type"],
        content = json["content"],
        imageName = json["imageName"];
}

enum AnswerType { SIMPLE, WITH_IMAGE }
