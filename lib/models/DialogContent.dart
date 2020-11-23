class DialogContent {
  DialogType type;
  String imageName;
  String content;

  DialogContent({this.type, this.imageName, this.content});

  DialogContent.fromJson(Map<String, dynamic> json)
      : type = getTypeFromString(json["type"]),
        content = json["content"],
        imageName = json["imageName"];
}

getTypeFromString(String t) {
  for (DialogType type in DialogType.values) {
    if (type.toString() == t) {
      return type;
    }
  }
  return null;
}

enum DialogType { SIMPLE, WITH_IMAGE }
