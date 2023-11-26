class UserDataModel {
  late String id;
  late String firstName;
  late String lastName;
  late String avatar;
  late String type;
  late List<String> classes;
  late List<String> extraCourses;

  UserDataModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    required this.type,
    required this.classes,
    required this.extraCourses,
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
    };
  }
}
