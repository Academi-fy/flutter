import 'package:json_annotation/json_annotation.dart';

part 'user_data_model.g.dart';

@JsonSerializable()
class User {
  late String id;
  late String firstName;
  late String lastName;
  late String? avatar;
  late String type;
  late List<dynamic> classes; // Can contain Class objects or Class IDs
  late List<dynamic> extraCourses; // Can contain Course objects or Course IDs
  late List<dynamic>
      blackboards; // Can contain Blackboard objects or Blackboard IDs

  User(
    this.id,
    this.firstName,
    this.lastName,
    this.avatar,
    this.type,
    this.classes,
    this.extraCourses,
    this.blackboards,
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
