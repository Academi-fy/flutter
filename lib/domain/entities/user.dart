class User {
  late String id;
  late String firstName;
  late String lastName;
  late String avatar;
  late String type;
  late List<String> classes;
  late List<String> extraCourses;
  late DateTime createdAt;
  late DateTime updatedAt;

  User({
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
}
