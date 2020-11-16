class Answer {
  AnswerType type;
  String imageName;
  String content;

  Answer({this.type, this.imageName, this.content});

  Answer.fromJson(Map<String, dynamic> json)
      : type = getTypeFromString(json["type"]),
        content = json["content"],
        imageName = json["imageName"];
}

getTypeFromString(String t) {
  for (AnswerType type in AnswerType.values) {
    if (type.toString() == t) {
      return type;
    }
  }
  return null;
}

enum AnswerType { SIMPLE, WITH_IMAGE }
