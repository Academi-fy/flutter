class UserEntitiy {
  late String id;
  late String firstName;
  late String lastName;
  late String? avatar;
  late String type;
  late List<dynamic>? classes;
  late List<dynamic>? extraCourses;
  late List<dynamic>? blackboards;

  UserEntitiy(
      {required this.id,
      required this.firstName,
      required this.lastName,
      this.avatar,
      required this.type,
      required this.classes,
      required this.extraCourses,
      required this.blackboards});
}
