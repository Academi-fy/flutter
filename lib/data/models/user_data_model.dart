class UserDataModel {
  late String id;
  late String firstName;
  late String lastName;
  late String avatar;
  late String type;
  late List<String> classes;
  late List<String> extraCourses;
  late DateTime createdAt;
  late DateTime updatedAt;

  UserDataModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    required this.type,
    required this.classes,
    required this.extraCourses,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      avatar: json['avatar'] as String,
      type: json['type'] as String,
      classes: (json['classes'] as List<dynamic>)
          .map<String>((e) => json[e] as String)
          .toList(),
      extraCourses: (json['extra_courses'] as List<dynamic>)
          .map<String>((e) => json[e] as String)
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'avatar': avatar,
      'type': type,
      'classes': classes.map((e) => e.toString()).toList(),
      'extra_courses': extraCourses.map((e) => e.toString()).toList(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
