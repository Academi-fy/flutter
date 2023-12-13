class ChatDataModel {
  String? id;
  String? type;
  List<String>? targets;
  List<String>? courses;
  List<String>? clubs;
  String? name;
  String? avatar;
  List<String>? messages;

  ChatDataModel({
    this.id,
    this.type,
    this.targets,
    this.courses,
    this.clubs,
    this.name,
    this.avatar,
    this.messages,
  });

  // Factory method to create a Chat object from a Map
  factory ChatDataModel.fromJson(Map<String, dynamic> json) {
    return ChatDataModel(
      id: json['_id'],
      type: json['type'],
      targets: List<String>.from(json['targets'] ?? []),
      courses: List<String>.from(json['courses'] ?? []),
      clubs: List<String>.from(json['clubs'] ?? []),
      name: json['name'],
      avatar: json['avatar'],
      messages: List<String>.from(json['messages'] ?? []),
    );
  }

  static dynamic _parseProperty(dynamic data) {
    if (data is List) {
      List<dynamic> items = [];
      for (var item in data) {
        items.add(item);
      }

      return items;
    } else if (data is String || data is Object) {
      return data;
    } else {
      return null;
    }
  }

  // Convert the Chat object to a Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'targets': targets,
      'courses': courses,
      'clubs': clubs,
      'name': name,
      'avatar': avatar,
      'messages': messages,
    };
  }
}
